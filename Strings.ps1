# Strings - support single, double, and mixed quotes
# Can also double quote
"The person said ""Hello World"""

# Escape sequences using backtick
# backspace `b
"Hello W `borld"

# newline `n
"Hello `nWorld"

# tabs `t
"Hello`tWorld"

# Large block of text 'Here String'
$hereStr = @"
    First bit of text
    Second bit of text
    Other bit of text
            
            Final text
"@

# String interpolation
# N.B. doesn't work with single quotes
Set-Location C:\PS
$items = (Get-ChildItem).Count
$loc = Get-Location
"There are $items items in the $loc folder."

# To display the variable, escape it with a backtick
"There are `$items items in the `$loc folder."

# Expressions
"There are $((Get-ChildItem).Count) items in the $(Get-Location) folder."

# String formatting
"We have {0} eggs in the fridge." -f $items
"We have {0} eggs in the {1}." -f $items, $loc
"The price of pen is £1. Buying two will cost you £{0}." -f (1 * 2)

# Wildcards
"Elephant" -like "Elep*"
"Elephant" -like "apple*"
"Elephant" -like "?lephant" # question marks for single chars
"Elephant" -like "Eleph*[r-u]" # ends in a char beteween r and u

# RegEx
"123-322-4510" -match "[1-3]{3}-[0-9]{3}-[0-9]{4}"