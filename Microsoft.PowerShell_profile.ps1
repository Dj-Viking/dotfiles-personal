[System.Console]::OutputEncoding = [System.Text.Encoding]::ASCII

function sourceprofile { $(. $profile) }
function gitstatus { git status }
function gitadd { git add -A }
function gotoled { Set-Location "$($HOME)\projects\LED-Art-matrix" }
function gotoprojects { Set-Location "$($HOME)\projects" }
function openvscode { code . }

Set-Alias s    -Value gitstatus
Set-Alias a    -Value gitadd
Set-Alias led  -Value gotoled
Set-Alias proj -Value gotoprojects
Set-Alias c    -Value openvscode

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
function prompt {
    Write-Host "$(Get-Location) " -ForegroundColor Cyan -NoNewline
    Write-BranchName
    Write-Host ("PS > ") -NoNewLine -ForegroundColor Green
    return " "
}