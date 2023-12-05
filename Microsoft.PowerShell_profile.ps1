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

function py {
    & "$($HOME)\AppData\Local\Programs\Python\Python39\python.exe"
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