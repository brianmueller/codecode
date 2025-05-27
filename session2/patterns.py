# ONE-TIME SETUP:
    # Create rubrics
    # Create order file (student names in order)
    # Update `base_path`
    
# ONGOING USE:
    # Update settings > SELECT cohort, order file, repo, rubric
    # run `python3 patterns.py`
    # open grades.csv in Excel > copy/paste to gSheet


##########################################


import glob
import os
import pprint
import math
import re
import csv
import json

##### COLORS #####

PURPLE = '\033[95m'
BLUE = '\033[94m'
CYAN = '\033[96m'
GREEN = '\033[92m'
YELLOW = '\033[93m'
RED = '\033[91m'
ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'


##### RUBRICS #####

# Leave this here, just copy/paste it
template_rubric = [
	{
		"slug": 'folder/file.html', # customize this
		"patterns": ['pattern1', 'pattern2']
	},
]

# Examples
html_rubric = [
	{
		"slug": '01-basics/index.html',
		"patterns": ['h1', 'p']
	},
]

css_rubric = [
	{
		"slug": '01-basics/style.css',
		"patterns": ['font-family', 'background-color']
	},
]

p5js_rubric = [
	{
		"slug": 'shapes/script.js',
		"patterns": ['rect', 'ellipse']
	},
]



##### SETTINGS #####

# Uncomment one cohort, one order file, one repo, one rubric

### CS101 ###
cohort = 'cs101-2027'
order_file = 'cs101info.json'

repo = 'web-design'
rubric = html_rubric
# rubric = css_rubric


### CS102 ###
# cohort = 'cs102-2026' # SEP11
# order_file = 'cs102info.json'

# repo = 'p5js'
# rubric = p5js_rubric




##### PROGRAM #####

submissions = False
# submissions = True  # Set to True if using compare50 / student repos are nested in `submissions`
base_path = f'../github-classroom/{cohort}/' # path to the cohort folder

# Find the top-level repo folder (with timestamp)
# This assumes the repo folder starts with the repo name followed by a dash and timestamp (i.e. `repo-YYYYMMDD`)
repo_folders = glob.glob(os.path.join(base_path, f"{repo}-*"))
if not repo_folders:
    raise FileNotFoundError(f"No folder found starting with '{repo}-' in {base_path}")

# Use the first match
repo_base = repo_folders[0]

# Optionally go into the 'submissions' folder
BASE_DIR = os.path.join(repo_base, "submissions") if submissions else repo_base

# Confirm folder exists
if not os.path.isdir(BASE_DIR):
    raise FileNotFoundError(f"Expected folder not found: {BASE_DIR}")

OUTPUT_FILE = "grades.csv"

# Load student order from JSON file
try:
    with open(order_file, 'r', encoding='utf-8') as f:
        student_order = json.load(f).get("students", [])
except (FileNotFoundError, json.JSONDecodeError):
    print(f"Warning: {order_file} not found or invalid. Defaulting to alphabetical order.")
    student_order = []

# Get list of students from directory
students_in_repo = {s for s in os.listdir(BASE_DIR) if os.path.isdir(os.path.join(BASE_DIR, s))}

# Ensure every student in the JSON file appears in the CSV, even if missing from the repo
students = student_order if student_order else sorted(students_in_repo)

# Write results to a CSV file
with open(OUTPUT_FILE, 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    
    # Header row
    column_headers = ["Student"] + [assignment["slug"] for assignment in rubric] + ["Overall", "Out of 10"]
    writer.writerow(column_headers)

    for student in students:
        if student not in students_in_repo:
            # Student not found in repo → Write "ERROR" in all columns
            error_row = [student] + ["ERROR"] * (len(rubric) + 2)
            writer.writerow(error_row)
            continue  # Skip processing

        student_path = os.path.join(BASE_DIR, student)
        scores = [student]  # Start row with student name
        numeric_scores = []

        for assignment in rubric:
            file_path = os.path.join(student_path, assignment["slug"])

            if not os.path.exists(file_path):
                scores.append("0")  # File missing → score 0
                numeric_scores.append(0)
                continue

            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()

            total_patterns = len(assignment["patterns"])
            match_count = sum(bool(re.search(pattern, content)) for pattern in assignment["patterns"])
            score = (match_count / total_patterns) * 10 if total_patterns else 0

            scores.append(f"{score:.2f}")
            numeric_scores.append(score)

        # Calculate the average and add extra columns
        if numeric_scores:
            avg_score = sum(numeric_scores) / len(numeric_scores)
            avg_percentage = f"{round(avg_score * 10)}%"
            
            # Round to nearest tenth and remove trailing .0 if it's a whole number
            avg_out_of_10 = round(avg_score, 1)
            avg_out_of_10 = int(avg_out_of_10) if avg_out_of_10.is_integer() else avg_out_of_10
        else:
            avg_percentage = "0%"
            avg_out_of_10 = 0

        scores.append(avg_percentage)
        scores.append(avg_out_of_10)

        # Write row to CSV
        writer.writerow(scores)

print(f"Grades saved to {OUTPUT_FILE}. Open it in Google Sheets.")