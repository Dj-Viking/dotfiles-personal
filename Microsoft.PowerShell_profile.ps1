[System.Console]::OutputEncoding = [System.Text.Encoding]::ASCII

function sourceprofile { $(. $profile) }
function gitstatus { git status }
function gitadd { git add -A }
function gotoled { Set-Location "$($HOME)\projects\LED-Art-matrix" }
function gotoprojects { Set-Location "$($HOME)\projects" }
function openvscode { code . }
function openvs { devenv . }
function vstudio { Set-Location "$($HOME)\source\repos\" }
function touch {
    
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]
        $name
    )
    New-Item -Name $name -ItemType File -Path ".\"
}

function videos { Set-Location "$($HOME)\Videos" }
function openvideo {

    $videos = Get-ChildItem $home\videos;

    Write-Host -ForegroundColor Green "[INFO]: Current Videos"
    $videos | ForEach-Object {
        Write-Host -ForegroundColor Green "[INFO]: $($_.Name)";
    }


    Write-Host "";
    $filename = Read-Host "enter a partial filename that would match one of the choices";
    $filetoopen = $null;

    :vids for ($i = 0; $i -lt $videos.Length; $i++) {
        if ($videos[$i].Name -cmatch $filename) {
            $filetoopen = $videos[$i].FullName;
            break vids;
        }
    }

    & "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" $filetoopen;
}
function a2022 { Set-Location "$($HOME)\projects\aoc-2022" } 
function a2015 { Set-Location "$($HOME)\projects\aoc-2015" }
function a2023 { Set-Location "$($HOME)\projects\aoc-2023" }

function Get-FileRecurse {
    [OutputType([System.Void])]
    param(
        [string]
        $path,

        [string]
        $filename
    )

    Get-ChildItem -Path $path -Recurse | Where-Object {
        $_.FullName -match $filename
    } | ForEach-Object {
        Write-Host $_.FullName -ForegroundColor Green;
    }
}

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

    & "C:\Program Files\Git\bin\bash.exe" $ScriptFilePath $(if ($ArgumentList -ne "") { $ArgumentList });
}

function py {
    & "$($HOME)\AppData\Local\Programs\Python\Python39\python.exe"
}

# Boost_INCLUDE_DIR = C:/Program Files/vcpkg/installed/x64-windows/include" -DCMAKE_MAKE_PROGRAM:FILEPATH=C:/Program
function myvcpkg {
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]
        $command,

        [Parameter(Position = 1)]
        $switches = $(if ("install" -ne $command) {"--triplet"} else {""}),

        [Parameter(position = 2)]

        $switch = $(if ("install" -ne $command) {"x64-windows"} else {""}),
        [Parameter(Mandatory, Position = 3)]
        $ArgumentList
    )
    # for now usage is like this "<package name> <another package>".Split(" ") | ForEach-Object { vcpkg -command install -switches "--triplet" -switch "x64-windows" -ArgumentList "$($_)" }
    # to install each package individually
    Write-Host "[INFO]: running vcpkg from profile function" -ForegroundColor Cyan;

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
Set-Alias find    -Value Get-FileRecurse

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

Write-Host "[INFO]: `$PROFILE loaded" -ForegroundColor Cyan;