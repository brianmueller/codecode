# Project STEM hide left window pane
document.querySelector('#main').style.margin = 0;
document.querySelector('#wrapper').style.margin = 0;
document.querySelector('#header').style.display = 'none';
document.querySelector('#content').style.padding = 0;
document.querySelector('#o-tr-sideline').style.display = 'none';

# rotate (selected/green) Jupiter seats
document.querySelectorAll('.seat').forEach(function(student){student.style.transform = "rotate(-90deg)";})

# p5play remove unauth
document.querySelector("body > div").style.display = 'none';
document.querySelector("body").style.overflow = 'scroll';

# Google Classroom sidebar width
document.querySelector('.lBRpOc').style.width = "25em";

# search for text (find)
# use -i to make case-insensitive
grep -r 'text' *
grep -r 'while(' *
grep -r --exclude-dir=.git 'new Player' *
grep -r '4.5' *
grep -ri 'checkend' *

# get current repo name
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); echo $repo


########## ALIASES ##########
# open/edit .bash_profile
nano ~/.bash_profile
# paste, save


# use `lc` to rename all folders to lowercase
sudo apt install rename
alias lc="rename -f 'y/A-Z/a-z/' *"

# use `ll` as a shortcut for `ls -al` to list vertically, including hidden files/folders
alias ll="ls -al"

# use `count` to list the number of directories/files
find . -mindepth 1 -maxdepth 1 -type d | wc -l
alias count="find . -mindepth 1 -maxdepth 1 -type d | wc -l"

# gp "my message"
gp() {
	git add .
	git commit -m "$1"
	git push
}





########## PRINT FILE CONTENTS ##########

# SIMPLE print file
file=Fraction.java;for student in *; do echo $student; bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

file=commands.txt;for student in *; do echo $student; bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done


# NOTE:
# If importing using Google Classroom (directory: assignment-timestamp)
	echo .../$repo-$student (directory: assignment)
# If manually cloning (directory: assignment)
	echo .../$fullrepo-$student



# print README.md
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/README.md --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print index.html
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/index.html --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print index.html from manual clone (multi-line)
org=hstatsep-students
file=index.html
repo=${PWD##*/}
for student in *
do
	echo $student
	echo http://github.com/$org/$repo-$student
	bat $student/$file --theme=ansi --paging=never
	printf "\n\n\n********************************\n\n"
done

# print style.css
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/style.css --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print script.js
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/script.js --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print plan.md
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/plan.md --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print prep/plan.md
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/prep/plan.md --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print writeup
file=01-basic-wd/css-writeup.md;for student in *; do echo $student; bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

########## END PRINT FILE CONTENTS ##########






# delete .git files
for student in *; do rm -rf $student/.git; done

# open index.html
file=index.html; for student in *; do echo $student; open $student/$file; done

# list files
for student in *; do echo $student; ls $student; printf "\n\n\n********************************\n\n"; done

# print file no syntax highlighting
for student in *; do echo $student; cat $student/commands.txt; printf "\n\n\n********************************\n\n"; done

# print number of commits in repo
for student in *; do echo $student; cd $student; git rev-list --all --count; cd ..; printf "\n\n\n********************************\n\n"; done

# print commits 
for student in *; do echo $student; cd $student; git log; cd ..; printf "\n\n\n********************************\n\n"; done

# print timestamp of latest commit (file can be blank)
file=; for student in *; do echo $student; cd $student; git log -1 --format=%cd $file; cd ..; printf "\n\n\n********************************\n\n"; done
# 01-javascript/arrays-writeup.md
# 01-basic-wd/html-writeup.md

# print repo names sorted by commit timestamp
output=""; file=; for student in *; do cd $student; last_commit_date=$(git log -1 --format=%ci $file); output="$output$last_commit_date $student\n"; cd ..; done; echo -e "$output" | sort

# compare scripts
compare50 * -x "*" -i "script.js"
compare50 projects/* -d index.html
compare50 * -x "*" -i "runner_Player.java"
compare50 * -x "*" -i "Player.java"

# install github classroom CLI into cs50.dev
sudo apt install gh
# wait
gh auth login
# select Github.com
gh extension install github/gh-classroom
# now can use the `gh classroom clone` command from the assignment page (WAS NOT SUCCESSFUL)


# compare shabr (within current year)
# put all submissions in `submissions` folder
# put copy of example in `example` folder
compare50 submissions/*/index.html -d example

# compare shabr (from wd-20XX)
compare50 shabr-03-21-2024-11-17-38/* -x "*" -i "index.html" -d example

# compare50 all p5js hw
# put all submissions in `submissions` folder
# put copy of templateFile.html in top folder
compare50 submissions/*/*/*-hw.html -x submissions/templateFile.html

# compare50 pong
compare50 submissions/*/04-pong/pong-remix.html -d pong.html


# list prep folder (to find wireframes)
for student in *; do echo $student; ls $student/prep; printf "\n\n\n********************************\n\n"; done

# rename files to folders, place file in folder
for student in *; do mkdir ${student%%.java}; mv $student ${student%%.java}; done
for student in *; do echo ${student%%.java}; done

# rename files to common name
for student in *; do cd $student; mv * GameWheel.java; cd ..; done

# make file for each student
for student in *; do cd $student; touch numstatsarray.java; cd ..; done

# print file.java
for student in *; do echo $student; bat $student/Game.java --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# move last initial to front
for student in *; do namelength=${#student}; mv $student ${student:namelength-5:1}${student:0:namelength-5}${student:namelength-4:4}; done;
# ${student:namelength-5:1} // last initial
# ${student:0:namelength-5} // first name
# ${student:namelength-4:4} // last 4




########## TRUE/FALSE pattern matching ##########

patterns=("querySelector" "innerHTML\s=\|innerHTML=" "innerHTML\s+=\|innerHTML+="); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; bat $student/script.js --theme=ansi --paging=never; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -n $pattern $student/script.js; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done

# bootstrap-grid-practice (not using)
file=index.html;patterns=("container" "row" "col"); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; bat $student/$file --theme=ansi --paging=never; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -n $pattern $student/$file; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done

# bootstrap-components-practice (readme and index; though most grading is doing through: open index.html)
fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; bat $student/README.md --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; bat $student/index.html --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# SHABR
# NOTE: since it's a lot to scroll through, look at the line numbers as you scroll, and look for when they reset (as an easy way to find the patterns)
file=index.html;patterns=("container" "row" "col"); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; bat $student/$file --theme=ansi --paging=never; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -n $pattern $student/$file; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done

# JSproject
file=script.js;patterns=("//" "\[" "function" "return" "if" "function\s+\w+\s*\(\s*[^\s,)][^)]*\)"); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; bat $student/$file --theme=ansi --paging=never; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -E -n $pattern $student/$file; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done

# JSproject, don't print file
file=script.js;patterns=("//" "\[" "function" "return" "if" "function\s+\w+\s*\(\s*[^\s,)][^)]*\)"); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -E -n $pattern $student/$file; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done

# open p5js
file=01-basics/zoog.html; for student in *; do echo $student; open $student/$file; done
file=02-movement/variables-hw.html; for student in *; do echo $student; open $student/$file; done
file=02-movement/mousexy-hw.html; for student in *; do echo $student; open $student/$file; done
file=02-movement/events-hw.html; for student in *; do echo $student; open $student/$file; done
file=02-movement/random-hw.html; for student in *; do echo $student; open $student/$file; done
file=02-movement/interactivity.html; for student in *; do echo $student; open $student/$file; done

file=04-pong/pong-remix.html; for student in *; do echo $student; open $student/$file; done

# print p5js
file=02-movement/variables-hw.html;for student in *; do echo $student; bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done


# open all p5js HW of ONE student
find . -type f -name '*-hw.html' -exec open {} \;

########## CLONING GITHUB REPOS ##########



# make assignment folder and clone repos
org=hstatsep-students
repo=hello-world
students=(
githubUsername1
githubUsername2
githubUsername3
)
mkdir $repo
cd $repo
for student in "${students[@]}"
do 
	echo cloning $student
	git clone git@github.com:$org/$repo-$student $student
	echo ""
done

# ^even works for groups, even when there are blank lines between names^

# clone using Github CLI
gh classroom clone student-repos
gh classroom clone student-repos -a 488542 --per-page 20 --page 1

# print git remotes
for student in *; do cd $student; echo $student; git remote -v; cd ..; echo; done

# remove git remotes
for student in *; do cd $student; echo $student; git remote rm origin; cd ..; echo; done

# disable git
for student in *; do cd $student; echo $student; rm -rf .git; cd ..; echo; done

# [1] update git remote to remove temporary tokens
for student in *; do cd $student; echo $student; git remote set-url origin $(git remote -v | head -n 1  | grep -o 'github\.com.*git' | awk '{print "https://"$1}'); cd ..; echo; done

# [2] update git remote from HTTP to SSH
for student in *; do cd $student; echo $student;
REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`;
USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\1#p'`;
REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\2#p'`;
NEW_URL="git@github.com:$USER/$REPO.git";
git remote set-url origin $NEW_URL;
cd ..; echo; done;

# [1] and [2]
for student in *; do cd $student; echo $student; git remote set-url origin $(git remote -v | head -n 1  | grep -o 'github\.com.*git' | awk '{print "https://"$1}'); cd ..; echo; done; for student in *; do cd $student; echo $student;
REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`;
USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\1#p'`;
REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\2#p'`;
NEW_URL="git@github.com:$USER/$REPO.git";
git remote set-url origin $NEW_URL;
cd ..; echo; done;

# don't currently use
# git remote set-url origin git@github.com:username/repo.git

# [3] go into each repo and pull it
for student in *; do cd $student; echo $student; git pull; cd ..; echo; done



# restore all (for when I make changes)
for student in *; do cd $student; echo $student; git restore .; cd ..; echo; done





########## END CLONING GITHUB REPOS ##########







########## DOM-LESSONS ##########

# make sure to update year in file path below (i.e. 2025)

file=03-creating/03-hw.html;fullrepo=${PWD##*/}; fullrepolength=${#fullrepo}; repolength="$(($fullrepolength-20))"; repo=$(echo $fullrepo | cut -c1-$repolength); for student in *; do echo $student; echo http://github.com/hstatsep-students/$repo-$student; echo file:///Users/brian_1/Documents/github-classroom/js-2026/$fullrepo/$student/$file;bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

########## END DOM-LESSONS ##########




########## PROJECT EXPLORATION ##########

# Pong Remix
GITHUB make repo: p5js-projects-20XX
# in js-20XX
git clone
touch index.html
mkdir projects
# in p5js-XX...
for student in *; do echo $student; cd $student; cp -r 04-pong ~/Dropbox/code/hstatsep-js/p5js-projects/projects/$student; cd ..; done


########## END PROJECT EXPLORATION ##########



########## SANDBOX ##########

for student in *; do echo $student; cd $student; git status; cd ..; done

file=01-basics/01-hw.html;patterns=("querySelector" "innerHTML\s=\|innerHTML=" "innerHTML\s+=\|innerHTML+="); for student in *; do echo -e '\033[1;30m'$student'\033[0m'; printf "\n"; bat $student/$file --theme=ansi --paging=never; printf "\n"; for pattern in ${patterns[@]}; do echo -e '\033[0;33m'$pattern'\033[0m'; if grep -n $pattern $student/$file; then echo -e '\033[1;32mTRUE\033[0m'; else echo -e '\033[1;31mFALSE\033[0m'; fi; printf "\n"; done; printf "\n\n\n********************************\n\n"; done


# COMMENTS
<<comment
There is nothing attached here. Make sure you press "Add" > "Link" and attach the correct URL.
comment



file=05-loops/coin-flipping/script.js;for student in *; do echo $student; bat $student/$file --theme=ansi --paging=never; printf "\n\n\n********************************\n\n"; done

# print student names who attempted/created file
file=05-loops/coin-flipping/script.js;for student in *; do if test -f $student/$file; then echo $student;fi;done

# ERRORS

# EADDR in use (in cs50.dev)
sudo apt install lsof
lsof -i tcp:8080
kill -9 PID

# STEPS to share
How to fix “port in use” error
1. Enter `sudo apt install lsof`
2. Enter `lsof -i tcp:8080`
3. Identify the PID from the previous command. You’ll need to enter it in the next command:
4. Enter `kill -9 PID` but use the number from step 3 instead of `PID`



# install command to see file tree
sudo apt-get install tree




########## OTHER ##########

# skills
<<comment
collaboration, communication, problem decomposition, logical reasoning, debugging, how to learn, how to google, how to read, time management, growth mindset, embracing failure, leadership, organization, attention to detail, consideration, creativity
comment

# FP Freedom Project Presentation feedback
# 11
<<comment
PROCESS: How will you show off the code you wrote for 2+ JS concepts (conditional/function/loop/array).
// GENERAL
HOOK: how will you draw us in?
PRODUCT: how exactly will you show us what you made?
PROCESS: what juicy code snippets could you show us? Any challenges? How did you learn your tool?
CONCLUSION: how will you summarize? Specific takeaways?
comment

<<comment
02-movement/variables-hw.html
	width
	height
02-movement/mousexy-hw.html
	mouseX
	mouseY
02-movement/events-hw.html
	function mouse___() OR function key___()
02-movement/random-hw.html
	random

03-application/conditionals-hw.html
	if
	key OR keyCode
03-application/functions-hw.html
	define/call your own function OR complete one of the other classworks
03-application/loops-hw.html
	for OR while
03-application/arrays-hw.html
	array
comment



########## TALKING POINTS / JUPTER MSG ##########

# Late to clas
<<comment
Hi this is X. I am your student's computer science teacher. I am messaging you because your student has been late to class multiple times recently. Please encourage them to move quickly through the hallways so that they can get to class on time. Thank you!
comment

# Phone use in class
<<comment
Hi this is X. I am your student's computer science teacher. I am messaging you because your student has been using their phone in class. Please encourage them to keep their phone in their bag so that they can stay focused. Thank you!
comment

# Head down in class
<<comment
Hi this is X. I am your student's computer science teacher. I am messaging you because your student has been in a pattern of having their head down in class and/or sleeping. Please encourage them to go to sleep earlier so that they can stay awake in class. Thank you!
comment

# Late/Missing work
<<comment
Hi this is X. I am your student's computer science teacher. I am messaging you because several of your student's assignments are either missing or late. Please encourage them to turn in work on time so that they don't fall behind in class. Thank you!
comment

# MP switch
# Late/Missing work
<<comment
Hi this is X. I am your student's computer science teacher. I am messaging you because several of your student's assignments were either missing or late for marking period 1. Please encourage them to turn in work on time in marking period 2 so that they don't fall behind in class. Thank you!
comment
