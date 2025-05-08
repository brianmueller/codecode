# Session 1: Modern Hacks

## Icebreaker

* Name (pronouns optional)
* Where/what you teach
* What is one small tool, shortcut, or hack (tech or non-tech) that has saved your sanity as a teacher?

### Norms

* Reach out with questions
* Don’t be a hog. Don’t be a log.
* Collaborate collegially
* Take breaks as needed

---

## Keyboard Shortcuts

[tiny.cc/keyboardshortcuts](https://docs.google.com/document/d/10drl87oaEtmT6E2NQidNY3pKWYNXieEh7Kj-oZ7pDcA/preview?tab=t.0)

* These can help you with the next tool!

## BetterTouchTool

* [Download](https://folivora.ai/)
* 45 day free trial
* $ license is worth it!

_Windows Alternative: [AutoHotkey](https://www.autohotkey.com/)_

#### Ideas

* Automate **full credit** on Google Classroom [demo]
  * Click first category
  * Keyboard shortcut trigger script (i.e. <kbd>⌃⌥⌘</kbd>+<kbd>5</kbd>)
  * <kbd>TAB</kbd> x3
  * <KBD>SPACE</kbd>
  * (repeat)
  * You can have multiple versions of these scripts, i.e.
    * <kbd>⌃⌥⌘</kbd>+<kbd>4</kbd> for 4 rows
    * <kbd>⌃⌥⌘</kbd>+<kbd>5</kbd> for 5 rows

![](img/btt-rubric5.png)

* Reformatting Google Slides
* Pasting commonly-used text, i.e. emojis, symbols (`⌘`), `System.out.println();`, etc
* Triggering AppleScripts

## AppleScripts

* coming soon!

## Regex

_NOTE: this will be particularly useful in Session 2_

Regex = "regular expressions". It's a way of matching patterns in a string.

#### Resources

* Lessons: [RegexOne](https://regexone.com/)
* Sandbox: [RegExr](https://regexr.com/)

Regex can be used in Google Sheets formulas! [[learn how](https://www.benlcollins.com/spreadsheets/google-sheets-regex-formulas/)]

## Google Sheets 

### Templates

* [Calendar Template](https://docs.google.com/spreadsheets/d/1bw77ykRaJm5NNImGmGsotg28sbVLZLiW1bNV65BH7do/edit?usp=drive_link)
* [Roster Template](https://docs.google.com/spreadsheets/d/1itw40tzvjnpKQy63nqT2hwHJQ2WTSvcJu1lYdo8kYLo/edit?usp=drive_link)

### Formulas

* coming soon!

### String manipulation

* coming soon!

### Apps Script

* Dynamically import Github contributors
  * [Example](https://docs.google.com/spreadsheets/d/1gAyxJ_fvVPwsP2jXve9UKN9sNwh9w1iJXfj2RXrqDw4/edit?gid=0#gid=0)
  * Assuming column `A` has the repo URL...
  * Column B: `=A2&"/graphs/contributors"`
    * This is helpful for when the script doesn't work and you need to manually get the usernames
  * Column C: `=importgithubcontributors(A2)`
  * Script for `importgithubcontributors()`:

```js
function importGithubContributors(repo) {
  const slug = repo.substring(19)
  // console.log(slug)

  const apiUrl = "https://api.github.com/repos/" + slug + "/contributors"
  // console.log(apiUrl)

  const res = UrlFetchApp.fetch(apiUrl)
  const dataAsText = res.getContentText()
  
  const data = JSON.parse(dataAsText)
  // console.log(data)

  const results = []
  for(let i = 0; i < data.length; i++){
    results.push(data[i]["login"])
  }
  console.log(results)
  return results.join(", ")
}
```

## HW

If you don't already know some Python, it would be helpful to learn a bit before Session 2. The more, the merrier! [[click here](../README.md#suggested-hw-before-session-2-python-basics)]

## Back

[Back to HOME](../README.md)