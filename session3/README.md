# Session 3: Terminal Tricks

## Icebreaker

* Name (pronouns optional)
* "If you could train an AI to do just one part of your job as a teacher, what would it be—and would you trust it?"

### Norms

* Reach out with questions
* Don’t be a hog. Don’t be a log.
* Collaborate collegially
* Take breaks as needed
* Use AI to help you understand/modify/create code!
  * [ChatGPT](https://chatgpt.com/)
  * [Claude AI](https://claude.ai/)
  * [Github Copilot](https://github.com/features/copilot)

---

Before digging into some terminal tricks, it can be helpful to know how to move your away around the command line. If you haven't already tried the HW and/or feel totally lost, start [here](../README.md#suggested-hw-before-session-3-terminal-basics).

| Command | Explanation | Example |
| -- | -- | -- |
| `ls` | list the files/folders in the current directory | `ls`
| `cd` | "change directory" into a subdirectory or up one level to the parent directory (`..`) | `cd subdir` or `cd ..`
| `mkdir` | make a new subdirectory in the current directory | `mkdir subdir`
| `touch` | make a new file in the current directory | `touch grades.csv`
| rm -rf | delete something, including all its subdirectories and their contents | `rm -rf subdir` or `rm -rf *` to delete ALL subdirectories (be careful!!!)

## Github Classroom

Most of the tricks below are particularly helpful for grading code collected via Github Classroom. You can download students' code using:
* [Github Classroom CLI](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/using-github-classroom-with-github-cli#clone-a-students-assignment-repository)
* [Github Classroom Assistant (Legacy)](https://github.com/github-education-resources/classroom-assistant/releases)
  * For Mac OS, download the darwin zip package.
  * For Windows, download the .exe package.
  * For Linux, download the .deb package.


## Snippets

* Several useful snippets at [snippets.sh](snippets.sh)
* Recommended usage:
  * Leave the file open in your favorite text editor.
  * Copy/paste as needed!

## Making Github Classroom projects public in an easy "gallery walk"

* End result [here](https://brianmueller.github.io/codecode/session3/project-gallery/)
* How-to: use the [project-gallery](project-gallery) folder


## Compare50

* [Detect similarity in student submitted code](https://cs50.readthedocs.io/projects/compare50/en/latest/)
* Example at [compare50-example](compare50-example)
  * GUI of results [here](https://brianmueller.github.io/codecode/session3/compare50-example/results/index.html)
* Command used: `compare50 submissions/*`

```
Done! Visit file:///path/to/folder/results/index.html in a web browser to see the results.
```

## cs50.dev
* Free online version of Visual Code Studio
* No need to use [CS50 Curriculum](https://ap.cs50.school) just need a GitHub account
* Can use with C, Python, HTML, CSS, JavaScript, Java, SQL and others
* Tools like check50, submit50, style50, debug50 installed
* No need to for students to learn git commands
* Student code is automatically backed up on github
* Includes AI Duck to give students hints on how to get started, debug, etc.

[Mueller instructions for students](http://hstatsep.github.io/code50)

## Check50
* Create custom checks for text based programming
* Student can check for correctness before submitting
* Same check is used with autograding using submit50
* [Running check50](https://cs50.readthedocs.io/projects/check50/en/latest/check50_user/)
* [Writing your own auto checks](https://cs50.readthedocs.io/projects/check50/en/latest/check_writer/)
* [Check for CS50 cash.py](https://github.com/cs50/problems/blob/2025/x/sentimental/cash/__init__.py)
* [My own check for letters.py](https://github.com/cs50nestm/checks/tree/2025/letters)

## Style50
* Can give student feedback on styling code
* Embedded in cs50.dev codespace
* Can automatically reformat code for easier reading

## Submit50
* Command line tool for students to submit work
* [Documentation](https://cs50.readthedocs.io/submit50/)
* [Setting up classes to view and grade student work](https://www.youtube.com/watch?v=cEINS4-X82A)

## CS50 Educators Workshop
* For more about the CS50 Curriculum and Tools
* [Check out the remote CS50 Educators Workshop](http://cs50.ly/workshop) 

## Back

[Back to HOME](../README.md)
