[System.Console]::OutputEncoding = [System.Text.Encoding]::ASCII

function sourceprofile { $(. $profile) }
function gitstatus { git status }
function gitadd { git add -A }
function gotoled { Set-Location "$($HOME)\projects\LED-Art-matrix" }
function gotoprojects { Set-Location "$($HOME)\projects" }
function openvscode { code . }
function openvs { devenv . }
function vstudio { Set-Location "$($HOME)\source\repos\" }

function a2022 { Set-Location "$($HOME)\projects\aoc-2022" } 
function a2015 { Set-Location "$($HOME)\projects\aoc-2015" }
function a2023 { Set-Location "$($HOME)\projects\aoc-2023" }

function mybash {
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]
        $ScriptFilePath,

        [Parameter(Position = 1)]
        [string]
        $ArgumentList = ""
    )

    Write-Host "[INFO]: running shell script '$ScriptFilePath' with these arguments '$ArgumentList'" -ForegroundColor Green;

    & "C:\Program Files\Git\bin\bash.exe" $ScriptFilePath $(if ($ArgumentList -ne "") { "$ArgumentList" });
}

function py {
    & "$($HOME)\AppData\Local\Programs\Python\Python39\python.exe"
}

function myvcpkg {
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]
        $command,

        [Parameter(Mandatory, Position = 1)]
        $switches,

        [Parameter(Mandatory, position = 2)]
        $switch,
        # arg list can only be one item at the time for a moment
        [Parameter(Mandatory, Position = 3)]
        $ArgumentList
    )

    # for now usage is like this "<package name> <another package>".Split(" ") | ForEach-Object { vcpkg -command install -switches "--triplet" -switch "x64-windows" -ArgumentList "$($_)" }
    # to install each package individually
    
    Write-Host "[INFO]: running vcpkg from profile function" -ForegroundColor Cyan;

    # after vcpkg is installed then move it to "C:\Program Files"
    & "C:\Program Files\vcpkg\vcpkg.exe" $command $switches $switch $ArgumentList;
}

Set-Alias s       -Value gitstatus
Set-Alias a       -Value gitadd
Set-Alias led     -Value gotoled
Set-Alias proj    -Value gotoprojects
Set-Alias c       -Value openvscode
Set-Alias vs      -Value vstudio
Set-Alias python  -Value py
Set-Alias aoc2022 -Value a2022
Set-Alias aoc2015 -Value a2015
Set-Alias aoc2023 -Value a2023
Set-Alias sh      -Value mybash
Set-Alias vcpkg   -Value myvcpkg

function Write-BranchName {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($null -eq $branch) {
            Write-Host "(not a git repository)"
            return
        }

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA

            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor Green
        }
        else {
            # we're on an actual branch, so print it
            
            Write-Host " ($branch)" -ForegroundColor Yellow
        }
    }
    catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor Magenta
    }
}

function Write-MyLocation {
    [System.Management.Automation.PathInfo]$cwd = Get-Location;
    [System.String]$path = $cwd.Path;

    if ($($path.Split("\", [System.StringSplitOptions]::RemoveEmptyEntries).Length -eq 3 -and $($path.Contains("Users")))) {
        return "~";
    }
    else {
        $newpath = $path.Split("\", [System.StringSplitOptions]::RemoveEmptyEntries)[-1]; # last node of path
        return $newpath;
    }
}

function prompt {
    Write-Host "$(Write-MyLocation) " -ForegroundColor Cyan -NoNewline
    Write-BranchName
    Write-Host ("PS > ") -NoNewLine -ForegroundColor Green
    return " "
}