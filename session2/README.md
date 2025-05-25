# Session 2: Python for Teachers

## Using Python to automate grading

* [Zip Grades to Jupiter Grades](zip_to_jupiter.py)
* GitHub Classroom to Jupiter
* [CS50 Submit50 to Jupiter](submit50_to_jupiter.py)
* [Python Script to download student work](download_student_work.py)
* [Automate opening each downloaded web project](open_student_websites.py) 

## Pattern matching with Regex > CSV

By using [patterns.py](patterns.py) and [patterns_student_info.json](patterns_student_info.json) with the file tree below, we can use Regex patterns to give completion grades, all in a tidy CSV format. 

It helps to then spot check individual student work to check functionality, or even use compare50 (next session) to check plagiarism.

<details>

<summary>Sample file tree</summary>

```
├── github-classroom
│   ├── cs101-2027
│   │   └── web-design-03-12-2025-08-19-37
│   │       ├── student1234
│   │       │   └── 01-basics
│   │       │       ├── index.html
│   │       │       └── style.css
│   │       ├── student5678
│   │       │   └── 01-basics
│   │       │       ├── index.html
│   │       │       └── style.css
│   │       └── student9012
│   │           └── 01-basics
│   │               ├── index.html
│   │               └── style.css
│   └── cs102-2026
│       └── p5js-04-03-2025-09-14-06
│           ├── studentA
│           │   └── shapes
│           │       ├── index.html
│           │       └── sketch.js
│           ├── studentB
│           │   └── shapes
│           │       ├── index.html
│           │       └── sketch.js
│           └── studentC
│               └── shapes
│                   ├── index.html
│                   └── sketch.js
└── patterns
    ├── cs101info.json
    ├── cs102info.json
    └── patterns.py
```



</details>



## Scraping FCC > CSV > HTML dashboard

* coming soon!

## HW

If you don't already know your way around the terminal / command line, it would be helpful to learn a bit before Session 3. The more, the merrier! [[click here](../README.md#suggested-hw-before-session-3-terminal-basics)]


## Back

[Back to HOME](../README.md)
