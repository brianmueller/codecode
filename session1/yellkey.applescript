tell application "Google Chrome"
	-- Step 1: Get the URL from the clipboard
	set clipboardURL to the clipboard
	
	-- Step 2: Open a new window and go to yellkey.com
	set yellKeyWindow to make new window
	set URL of active tab of yellKeyWindow to "https://www.yellkey.com"
	
	-- Wait for Yellkey page to load
	delay 2
	
	-- Step 3: Paste the URL from the clipboard into the input box
	execute active tab of yellKeyWindow javascript "document.querySelector('input#url').value = '" & clipboardURL & "';"
	
	-- Step 4: Select the "24 Hours" option from the dropdown menu
	execute active tab of yellKeyWindow javascript "document.querySelector('select#time').value = '1440';"
	
	-- Step 5: Submit the form
	execute active tab of yellKeyWindow javascript "document.querySelector('form').submit();"
	
	-- Wait for the page to load and the key to be generated
	delay 1
	
	-- Step 6: Extract the href value (the key) from the selector and remove the leading '/'
	set yellKey to execute active tab of yellKeyWindow javascript "document.querySelector('body > div:nth-child(1) > div.jumbotron > h2:nth-child(6) > a').getAttribute('href').substring(1);"
	
	-- Step 7: Put the Yellkey on the clipboard
	set the clipboard to yellKey
	
	-- Step 8: Notify the user with the generated Yellkey
	-- display dialog "Yellkey: " & yellKey buttons {"OK"} default button "OK"
	
	-- Step 9: Close the yellkey window and return to the original window
	-- close yellKeyWindow
	-- set index of window 1 to 1
end tell
