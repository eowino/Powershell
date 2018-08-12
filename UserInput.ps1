$user = Read-Host "What's the name of Github user?: "
$repo = Read-Host "What's the name of the repo?: "
$result = "https://github.com/$user/$repo"
Write-Host $result