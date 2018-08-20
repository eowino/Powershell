# Function - script blocks with a name

function Hello($value) {
    Write-Host "Hello $value!"
}
Hello "world"

# Rather than using Set-Variable with -scope, pass by ref
# N.B. the var will be turned into an object
# You must then use .Value
function Set-MyVar([ref] $param) {
    $param.Value = "test"
}

$var = 1
"var before: $var"
Set-MyVar ([ref] $var) # must add [ref] to invoke
"var after: $var"

# Filters - used to filter out files
filter Show-TxtFiles {
    $fileName = $_.name
    if ($fileName -like "*.txt") {
        return $_
    }
}
Get-ChildItem | Show-TxtFiles

# Output a pipeline with a function
Get-ChildItem | Select-Object "Name"

function Get-ChildName() {
    Write-Output (Get-ChildItem | Select-Object "Name")
}

Get-ChildName | Where-Object { $_.Name -like "*.ps1" }

# Supporting -verbose and -debug options
# $DebugPreference      Default is SilentlyContinue, change to continue
# $VerbosePreference    Default is SilentlyContinue, change to continue

function Get-ChildName() {
    param([switch]$verbose, [switch]$debug)

    if ($verbose.IsPresent) {
        $VerbosePreference = "Continue"
    } else {
        $VerbosePreference = "SilentlyContinue"
    }

    if ($debug.IsPresent) {
        $DebugPreference = "Continue"
    } else {
        $DebugPreference = "SilentlyContinue"
    }

    Write-Verbose "Current working location is $(Get-Location)"
    Write-Output (Get-ChildItem | Select-Object "Name")
    Write-Debug "Ok I've selected some."
}

Get-ChildItem
Get-ChildItem -verbose
Get-ChildItem -debug
Get-ChildItem -verbose -debug