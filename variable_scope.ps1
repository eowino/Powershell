# Variable scope

# The Get/Set-Variable supports a scope param
# 0 is the current scope, 1 is it's parent, 2 grandpa and so on
# We can see both copies of $var using scope
$var = 20
& {
    $var = 3;
    Write-Host "Inside block: $var"
    Write-Host "Parent: " (Get-Variable var -valueOnly -scope 1)
}
Write-Host "Outside block: $var"

# You can specify variable scope
$global:var = 21
& { $global:var = 25 }
Write-Host "Outside block: $global:var"

$private:otherVar = 9
& { Write-Host $otherVar } # will be null 
Write-Host "Outside block: $private:otherVar"

# catch null variables
$private:otherVar = 9
& { 
    if ($otherVar -eq $null) {
        Write-Host "Can't access `$otherVar, its null"
    } 
Write-Host "Outside block: $private:otherVar"
