# Intro into Powershell - Topics covered

## Introduction
Basic usage of common commands

## Providers
Some examples of providers

## Variables and Cmdlets
Types [Based on .NET](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/built-in-types-table)

    short 
    float
    decimal
    single
    bool
    byte
    etc.

### Built in variables
    -$false             FALSE
    -$true              TRUE
    -$NULL              
    -$pwd               Current working directory
    -$Home              Home directory
    -$host              Information about a machine
    -$PID               Process ID
    -$PSVersionTable    Information about the current version of Powershell
    -$_                 Current object (see e.g. usage in Intro.ps1)

### Comparisons
    -eq                 Equals
    -ne                 Not equal to
    -ge                 Greater than or equal to
    -gt                 Greater than
    -lt                 Less than

    -Like               Similar to wildcard pattern matching
    -NotLike            Not Like
    -Match              RegEx match
    -NoMatch            Non-matches based on RegEx


## Strings
Usage and methods

## Arrays
Usage and syntax

## Hash Tables
Usage and syntax

## Programming
    -Branching
    -Looping
    -Script blocks
    -Variable scope
 
## Further Programming
    -Functions
