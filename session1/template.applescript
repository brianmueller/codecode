(*
keystroke "return" using option down
keystroke "ep" using {control down, command down} #navigate to link
key code 36 #return
key code 48 #tab
key code 123 #left
key code 124 #right
key code 125 #down
key code 126 #up

use & to concatenate

repeat 1 times
		delay 0.01
	end repeat

set varName to text returned of (display dialog "What is...?" default answer "") as text

*)

tell application "Google Chrome"
	activate
end tell

tell application "System Events"
	delay 0.2
end tell


