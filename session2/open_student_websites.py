import os
import webbrowser
import http.server
import socketserver
import threading

class CustomTCPServer(socketserver.TCPServer):
    allow_reuse_address = True  # Allow immediate reuse of the address

class QuietHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        pass  # Suppress all log messages

def start_http_server(directory, port):
    """
    Start a simple HTTP server in a separate daemon thread, serving the given directory.
    """
    handler = lambda *args, **kwargs: QuietHTTPRequestHandler(*args, directory=directory, **kwargs)
    httpd = CustomTCPServer(("", port), handler)
    thread = threading.Thread(target=httpd.serve_forever, daemon=True)
    thread.start()
    return httpd, thread

def execute_index_html(directory, start_port=8000):
    """
    Recursively traverse the given directory, and for each folder containing an index.html,
    start an HTTP server, open the site in the browser, and prompt the user to review.
    """
    port = start_port
    for root, dirs, files in os.walk(directory):
        if 'index.html' in files:
            # Extract student name and period from the directory name
            student_dir = os.path.basename(root)
            print(f"\nReviewing: {student_dir}")
            # Start the HTTP server for this student's project
            start_http_server(root, port)
            # Open the student's index.html in the default web browser
            webbrowser.open(f'http://localhost:{port}/index.html')
            # Prompt the user to close the browser tab and continue
            input("Close browser tab, then press Enter.")
            port += 1  # Use a new port for the next project


if __name__ == "__main__":    # Prompt for the parent directory containing all student project folders
    directory = input("Enter the directory path: ")
    execute_index_html(directory)