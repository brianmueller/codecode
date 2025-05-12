repeat
	tell application "AppleScript Utility"
		activate
	end tell
	set rowNum to (text returned of (display dialog "What is the student row number?" default answer "")) - 1
	#-1 for progress reports roster
	set grade to text returned of (display dialog "What is their grade?" default answer "") as text
	
	tell application "Google Chrome"
		activate
	end tell
	delay 0.1
	tell application "System Events"
		repeat 34 times
			key code 126 #up
		end repeat
		repeat rowNum - 1 times
			key code 125 #down
			delay 0.01
		end repeat
		keystroke grade
	end tell
	tell application "System Events"
		activate
	end tell
	(*	
	tell application "Script Editor"
		activate
	end tell
	*)
end repeat
-- key code 123 -- left
-- key code 124 -- right
-- key code 125 -- down
-- key code 126 -- up

(*
multi line comment
*)