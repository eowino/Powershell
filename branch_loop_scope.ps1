# If, ElseIf, and Else
$num = 5 

If ($num -gt 0) {
"$num gt zero"
} ElseIf ($num -lt 0) {
"$num is negative"
} Else {
"$num is zero"
}

# Switch statement
# will match both 5 and "5". 
# Powershell will convert the String to an Integer then do the comparison
switch ($num) {
    4 { "Is 4" }
    5 { "Is 5" }
    "5" { "Is also 5" }
    Default { "No idea" }
}

# Will only match 5
switch ($num) {
    4 { "Is 4" }
    5 { "Is 5"; break }
    "5" { "Is also 5" }
    Default { "No idea" }
}

# works with collections
switch (4,11,22) {
    4 { "Is 4" }
    11 { "Is 11" }
    "5" { "Is also 5" }
    Default { "No idea" }
}

# case insensitive by default
# Use -casesensitive switch for otherwise i.e. 
# switch -casesensitive ("Switch") ...
switch ("Switch") {
    "switch" { "lowercase" }
    "Switch" { "mixed case" }
    "SWITCH" { "uppercase" }
    Default { "No idea" }
}

# support for wildcards
switch -Wildcard ("Switch") {
    "swit*" { "*" }
    "???tch" { "???" }
    "SWITC?" { "?" }
    Default { "No idea" }
}

# While loop
# won't execute if condition is true
$a = 4
while ($a -le 5) {
    "$a"
    $a = $a + 1
}

# Do while loop
do {
    $a
    $a++
} while ($a -le 5)

# Do until - used to make checking positive
do {
    $a
    $a++
} until ($a -le 5)


# For loop
for ($f = 0; $f -le 5; $f++) {
    "`$f = $f"
}

# Iteration over collections
$arr = 3, 32, 4, 5
for ($i = 0; $i -lt $arr.Length; $i++) {
    "`$array[$i]=" + $array[$i]
}

# foreach woks on collections
foreach ($item in $arr) {
    "`$item = $item"
}

foreach ($file in Get-ChildItem) {
    if ($file.Name -like "*.ps1") {
        $file.Name
        # use break to exit out foreach loop
        # use continue to move onto next iteration
    }
}

# Use loop labels to break to a certain loop
:itemloop foreach ($item in 1..4) {
    "`$item = $item"
    foreach ($otherItem in 4..7) {
        "`$otherItem = $otherItem"
        break itemloop
    }
}