# project-gallery

## Yearly steps
* `mkdir archive/202X` (last year)
* `mv projects/* archive/202X`
* Navigate to `path/to/github-classroom/`...`/p5project`
* `cp -r * path/to/this/repo/projects/`
* Navigate back to: `path/to/this/repo/projects`
* Remove remotes and disable git: `for student in *; do cd $student; echo $student; git remote rm origin; rm -rf .git; cd ..; echo; done`
* Update URLs in `index.html` (see comments)

(code.html is probably going to give a local CORS error; should work fine when deployed)

* Make repo public, enable gh pages, push
* Viewable at `URL/to/this/repo/
* After exploration/grading, make private