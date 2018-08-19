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