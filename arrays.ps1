$array = "value 1", "value 2", "value 3"
$array[0]
$array

$array.GetType() # Object[]
$array[1] = "value 2 updated"

# Formal array creation syntax
$array = @("value 1", "value 2")

# Only way to create an empty array
$array = @()

$array.Count

# Load values into an array - numeric range notation
$array = 1..5

# check to see if array item exists
$array -contains "value 2"
$array -notcontains 3