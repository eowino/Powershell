$hash = @{
    "construct" = "Hash tables";
    "seperated_with" = "semi-colon";
    "usage" = "key value pairs";
}

# display all values
$hash

# get a value
$hash["construct"]
# or
$hash."construct"

# may use variables as keys
$use = "usage"
$hash.$use      # using a variable as a prop
$hash.$($use)   # evaluating as an expression
$hash.$("U" + "sage")

# add a value to hash table
$hash["test"] = "new value"
# remove value
$hash.Remove("test")

# check for key existence
$hash.Contains("test")
# or
$hash.Keys - contains "test"

# check for value existence
$hash.ContainsValue("test")
# or
$hash.Values - contains "new value"

# List keys & values
$hash.Keys
$hash.Values 