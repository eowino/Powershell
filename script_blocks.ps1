# script blocks (code inside curly braces)

# doesn't do anything
# multiple commands seperated with a semi-colon
{ Clear-Host; "Words here" }

# can be saved to a variable
$block = { Clear-Host; "Words here" }

# to actually execute a script block - prepend with &
& $block
# or 
& { Clear-Host; "Words here" }

$value = {1 + 1}
1 + (&$value)
1 + &$value # this fails - must be wrapped in parens

# passing paremeters to script blocks: Method 1
# useful when you have a variable number of $args - can loop through them
$query = {
    $question = $args[0]
    $answer = $args[1]

    Write-Host "Question: $question"
    Write-Host "Answer: $answer"
}
&$query "What comes after 2?" "3"

# Method 2
$query = {
    param ($question, $answer)
    Write-Host "Question: $question"
    Write-Host "Answer: $answer"
}
&$query "What comes after 2?" "3"

# can be invoked with params in any order
&$query -answer "3" -question "What comes after 2?"

# shortcut param names - use enough chars to make it unique
&$query -a "3" -q "What comes after 2?"

# Optional args
$query = {
    param ($question, $answer = "No answer for this question")
    Write-Host "Question: $question"
    Write-Host "Answer: $answer"
}
&$query "Pregunta?"

# enfore explicit types
$sum = {
    param ([int] $x, [int] $y)
    return $x + $y
}
&$sum 4 9 
&$sum 4 "b" #throws error

# Pipeline enabling a block
$filterPS1files = {
    # pipeline enable a block using "process"
    process {
        if ($_.Name -like "*.ps1") {
            return $_.Name
        }
    }
}

Get-ChildItem | &$filterPS1files

# combine pipelines with params
$filterPS1files = {
    param($header)
    begin { $retval = $header + ": `r`n" }
    process {
        if ($_.Name -like "*.ps1") {
            $retval = $retval + "`t" + $_.Name + "`r`n"
        }
    }
    end { return $retval }
}

Get-ChildItem | &$filterPS1files "List of Powershell files:"
Get-ChildItem | &$filterPS1files "Powershell files:"
