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