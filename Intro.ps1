# Get all systems commands
Get-Commnand

# Get a command that contains a word
Get-Command -verb 'get'
Get-Command -noun 'service'

# More info on a command
Get-Help Get-Command
Get-Help Get-Command -examples
Get-Help Get-Command -detailed
Get-Help Get-Command -full

# Set aliases from a file (CSV file)
export-alias PATH_TO_FILE ALIAS_NAMEE
import-alias PATH_TO_FILE

## Pipelining - combine CmdLets for greter flexibility
Get-Childitem | where-object { $_.Length -gt 5000kb }
Get-Childitem | where-object { $_.Length -eq 1gb } 

# Break commands over several lines for readability. 
# N.B. Pipe must be last char on line
Get-Childitem | 
    where-object { $_.Length -lt 50mb } | 
    Sort-Object Length
    Format-Table -Property Name, Length -AutoSize

# To only retrieve certain properties from an object
Get-Childitem | Select-Object Name, Length

# Clear screen
Clear-Host