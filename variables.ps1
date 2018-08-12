 # variable assignment
$a = 'Apple'

# print value
$a

# The above is simply syntactic sugar for
Write-Host $a

# Show the type
$a.GetType()

# variables are mutable
$a = 2
$a.GetType()

# can enforce static type
[System.Int32] $num = 21
$num
$num.GetType()

$num = "re-assign attempt: won't work"

# Shorcuts for .NET types
[int] $otherNum = 1
[string] $myStr = "string variable"

# methods on objects
"apple".ToUpper()
"This is another sentence".Contains("another")

# Comparisons
"31" -eq 31 # true
31 -eq "31" # true

# Whatever is on the right will be converted to the data type on the left
31 -eq "031" # True - string convered to an int
"033" -eq 33 # False - int is converted to a string

#Cmdlets

# Variable assignment - long version of $var = 1
New-Variable -Name var -Value 1

# Display variable and its value - long version of $var
Get-Variable var -valueonly

# To see all variables - user defined and otherwise
Get-Variable

# Re-assign variables - long version of $var = 34
Set-Variable -Name var -Value 34

# Clear contents of variable - same as $var = $null
Clear-Variable -Name var

# Delete variable - will throw an error if you try to remove or clear it
# If you try to access it using $var, a new var will be created
Remove-Variable -Name var
Get-Variable var # produces an error
