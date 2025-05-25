#!/usr/pyenv/shims/python
# usage:  ./puller.py -b <branch_slug> -u <github_username> -p <github_password>
#
# This script clones a specific branch from each student's GitHub repository
# (as listed in a CSV file) into a dated folder for assignment collection.

import sys
import optparse
import pexpect
import subprocess
import time
import os
from datetime import date

def get_projects():
    # Ensure the base directory for student work exists
    if not os.path.isdir("/Users/margarettanzosh/Desktop/skedula_upload/2025/studentwork/"):
        print("Make a directory called 'studentwork' in your workspace.")
        return

    # Set up command-line options for branch, username, and password
    parser = optparse.OptionParser()
    parser.add_option('-b', '--branch', dest='branch', help="assignment slug (branch name)")
    parser.add_option('-u', '--username', dest='username', help="github username (not used if using SSH)")
    parser.add_option('-p', '--password', dest='password', help='github password (not used if using SSH)')

    (options, args) = parser.parse_args()

    # Prompt for branch if not provided as an argument
    if options.branch is None:
        options.branch = input("Assignment Slug: ")

    # Prompt for a folder name and append today's date for uniqueness
    foldername = input("Folder Name: ") + "_" + str(date.today())

    # Load student names and GitHub usernames from the CSV file
    try:
        file = open("CS Students 2024-25.csv", "r")
    except:
        print("No file names.txt")
        return

    # Create the assignment folder for this collection
    subprocess.call("mkdir /Users/margarettanzosh/Desktop/skedula_upload/2025/studentwork/" + foldername, shell=True)

    people = file.readlines()

    # Iterate over each student (skip header)
    for person in people[1:]:
        person = person.rstrip()
        try:
            # Unpack CSV columns into variables
            (StudentId, LastName, FirstName, GradeLevel, CourseTitle, CourseCode, SectionId, GitHub) = person.split(",")
        except ValueError:
            print(f"Malformed line: {person}")
            continue

        # Construct the GitHub repository URL for the student
        githuburl = f"https://github.com/me50/{GitHub}.git"

        # Determine the period based on section
        section = int(SectionId)
        if section == 1:
            pd = 2
        elif section == 2:
            pd = 4  

        # Format the destination folder name for the student
        studentname = f"{LastName}, {FirstName}-Pd {pd}"
        destinationurl = f"/Users/margarettanzosh/Desktop/skedula_upload/2025/studentwork/{foldername}/{studentname}"

        # Clone the specified branch of the student's repository into their folder
        command = ["git", "clone", "-b", options.branch, githuburl, destinationurl]
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # Print the result of the clone operation
        if result.returncode != 0:
            print(f"Error cloning repository for {studentname}: {result.stderr.decode()}")
        else:
            print(f"Successfully cloned {githuburl} to {destinationurl}")

get_projects()