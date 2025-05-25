import csv
import datetime
import datefinder

def calc_grades():
    # Prompt for the submit50 download file
    submit50_file = input("Submit50 Download File Name: ")
    if ".csv" not in submit50_file:
        submit50_file += ".csv"
    filepath = "/Users/margarettanzosh/Downloads/" + submit50_file

    # Read all submissions into a list of dicts
    with open(filepath, "r") as file:
        reader = csv.DictReader(file)
        scores = list(reader)

    # Optionally skip grading for style
    grade_style = input("Skip Style: ").strip().upper() != "Y"

    # Get late penalty date
    late_penalty_input = input("Late penalty date: ")
    late_penalty_dates = list(datefinder.find_dates(late_penalty_input))
    late_penalty_date = late_penalty_dates[0] if late_penalty_dates else None

    # Load student info from roster
    file_name = "CS Students 2024-25.csv"
    students = {}
    with open(file_name, newline='') as csvfile:
        data = csv.DictReader(csvfile)
        for row in data:
            section = int(row["SectionId"])
            pd = 2 if section == 1 else 4
            students[row["GitHub"]] = [row["LastName"], row["FirstName"], row["StudentId"], pd]

    # Calculate grades for each submission
    for entry in scores:
        github_user = entry.get("github_username")
        if not github_user:
            continue

        # Check for valid score fields
        try:
            correct = float(entry.get("checks_passed") or 0)
            possible = float(entry.get("checks_run") or 0)
            style = float(entry.get("style50_score") or 0)
        except (ValueError, TypeError):
            continue

        if possible == 0:
            continue

        # Parse submission date
        submission_date_str = entry.get("timestamp") or ""
        submission_dates = list(datefinder.find_dates(submission_date_str[:16]))
        submission_date = submission_dates[0] if submission_dates else None

        # Ten percent late penalty if late
        late = 1.0
        late_comment = ""
        if late_penalty_date and submission_date and submission_date > late_penalty_date:
            late = 0.9
            late_comment = "Late"

        # Calculate score
        if grade_style:
            score = (75 * (correct / possible) + 25 * style) * late
        else:
            score = 100 * (correct / possible) * late

        # Update student record if higher score or first score
        if github_user in students:
            if len(students[github_user]) == 4:
                students[github_user].append(round(score))
                students[github_user].append(late_comment)
            else:
                last_score = students[github_user][4]
                if score > last_score:
                    students[github_user][4] = round(score)
                    students[github_user][5] = late_comment
        else:
            print(f"No Score For: {github_user}")

    # Prepare output file for Jupiter upload
    skedula_file = input("Jupiter Upload File Name: ")
    if ".csv" not in skedula_file:
        skedula_file += ".csv"

    assignment = input("Assignment Name: ")
    due_date = "(" + input("Due Date: ") + ")"
    possible = input("Out of how many points: ")

    with open(skedula_file, "w", newline='') as file:
        writer = csv.writer(file)

        # Write Jupiter import instructions
        writer.writerow(["This file should be opened in a spreadsheet application."])
        writer.writerow(["To import back into Jupiter, save this file as CSV (comma delimited)."])
        writer.writerow(["You may edit scores and add assignment columns, but do not change anything else."])

        # Write grades for each period
        for i in [2, 4]:
            writer.writerow([])
            writer.writerow([])
            class_info = f"COMPUTER SCIENCE 2 OF 2 ({i})"
            writer.writerow(["Class:", class_info])
            writer.writerow(["Assignment:", assignment, ""])
            writer.writerow(["Date:", due_date, ""])
            writer.writerow(["Possible:", possible, ""])
            writer.writerow(["", "Score:", "Comment:"])

            for student in students:
                row = students[student]
                if row[3] == i:
                    # Ensure score and comment fields exist
                    if len(row) < 5:
                        row.append("")
                        row.append("")
                    writer.writerow([f"{row[0]}, {row[1]} ({row[2]})", row[4], row[5]])


if __name__ == "__main__":
    calc_grades()