# Git aliases for PowerShell (similar to zsh git aliases)
# Save this as setup-git-aliases.ps1 and run it with PowerShell

# First check if PowerShell profile exists, if not create it
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
    Write-Host "Created PowerShell profile at $PROFILE" -ForegroundColor Green
}

# Helper functions that will be added to the profile
$gitCurrentBranchFunction = @'

function git_current_branch {
    $branch = git symbolic-ref --short HEAD 2> $null
    if ($LASTEXITCODE -ne 0) {
        $branch = git rev-parse --short HEAD 2> $null
    }
    echo $branch
}

function git_main_branch {
    $ref = git symbolic-ref refs/remotes/origin/HEAD 2> $null
    if ($ref -match "refs/remotes/origin/(.*)") {
        return $matches[1]
    } else {
        # Default to 'main' or check for 'master'
        $branches = git branch --list main master
        if ($branches -match "main") {
            return "main"
        } elseif ($branches -match "master") {
            return "master"
        } else {
            return "main" # Default fallback
        }
    }
}

function git_develop_branch {
    $branches = git branch --list develop dev
    if ($branches -match "develop") {
        return "develop"
    } elseif ($branches -match "dev") {
        return "dev"
    } else {
        return "develop" # Default fallback
    }
}

'@

# Create the aliases content to append to profile
$gitAliases = @'
# Git Aliases
function g { git $args }
function ga { git add $args }
function gaa { git add --all $args }
function gam { git am $args }
function gama { git am --abort $args }
function gamc { git am --continue $args }
function gams { git am --skip $args }
function gamscp { git am --show-current-patch $args }
function gap { git apply $args }
function gapa { git add --patch $args }
function gapt { git apply --3way $args }
function gau { git add --update $args }
function gav { git add --verbose $args }
function gb { git branch $args }
function gbD { git branch --delete --force $args }
function gba { git branch --all $args }
function gbd { git branch --delete $args }
function gbg { $env:LANG = "C"; git branch -vv | Select-String ": gone\]" }
function gbgD { 
    $env:LANG = "C"
    git branch --no-color -vv | 
    Select-String ": gone\]" | 
    ForEach-Object { 
        $_.ToString().Substring(2).Split(' ')[0] 
    } | 
    ForEach-Object { 
        git branch -D $_ 
    }
}
function gbgd { 
    $env:LANG = "C"
    git branch --no-color -vv | 
    Select-String ": gone\]" | 
    ForEach-Object { 
        $_.ToString().Substring(2).Split(' ')[0] 
    } | 
    ForEach-Object { 
        git branch -d $_ 
    }
}
function gbl { git blame -w $args }
function gbm { git branch --move $args }
function gbnm { git branch --no-merged $args }
function gbr { git branch --remote $args }
function gbs { git bisect $args }
function gbsb { git bisect bad $args }
function gbsg { git bisect good $args }
function gbsn { git bisect new $args }
function gbso { git bisect old $args }
function gbsr { git bisect reset $args }
function gbss { git bisect start $args }
function gc { git commit --verbose $args }
function gc! { git commit --verbose --amend $args }
function gcB { git checkout -B $args }
function gca { git commit --verbose --all $args }
function gca! { git commit --verbose --all --amend $args }
function gcam { git commit --all --message $args }
function gcan! { git commit --verbose --all --no-edit --amend $args }
function gcann! { git commit --verbose --all --date=now --no-edit --amend $args }
function gcans! { git commit --verbose --all --signoff --no-edit --amend $args }
function gcas { git commit --all --signoff $args }
function gcasm { git commit --all --signoff --message $args }
function gcb { git checkout -b $args }
function gcd { git checkout $(git_develop_branch) $args }
function gcf { git config --list $args }
function gcl { git clone --recurse-submodules $args }
function gclean { git clean --interactive -d $args }
function gclf { git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules $args }
function gcm { git checkout $(git_main_branch) $args }
function gcmsg { git commit --message $args }
function gcn { git commit --verbose --no-edit $args }
function gcn! { git commit --verbose --no-edit --amend $args }
function gco { git checkout $args }
function gcor { git checkout --recurse-submodules $args }
function gcount { git shortlog --summary --numbered $args }
function gcp { git cherry-pick $args }
function gcpa { git cherry-pick --abort $args }
function gcpc { git cherry-pick --continue $args }
function gcs { git commit --gpg-sign $args }
function gcsm { git commit --signoff --message $args }
function gcss { git commit --gpg-sign --signoff $args }
function gcssm { git commit --gpg-sign --signoff --message $args }
function gd { git diff $args }
function gdca { git diff --cached $args }
function gdcw { git diff --cached --word-diff $args }
function gds { git diff --staged $args }
function gdt { git diff-tree --no-commit-id --name-only -r $args }
function gdw { git diff --word-diff $args }
function gf { git fetch $args }
function gfa { git fetch --all --tags --prune --jobs=10 $args }
function gfg { git ls-files | Select-String $args }
function gfo { git fetch origin $args }
function gg { git gui citool $args }
function gga { git gui citool --amend $args }
function ggpull { git pull origin "$(git_current_branch)" $args }
function ggpur { ggu $args }
function ggpush { git push origin "$(git_current_branch)" $args }
function ggsup { git branch --set-upstream-to=origin/$(git_current_branch) $args }
function ghh { git help $args }
function gignore { git update-index --assume-unchanged $args }
function gignored { git ls-files -v | Select-String "^[a-z]" }
function gl { git pull $args }
function glg { git log --stat $args }
function glgg { git log --graph $args }
function glgga { git log --graph --decorate --all $args }
function glgm { git log --graph --max-count=10 $args }
function glgp { git log --stat --patch $args }
function glo { git log --oneline --decorate $args }
function glod { git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ad) %C(bold blue)<%an>%C(reset)" $args }
function glods { git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ad) %C(bold blue)<%an>%C(reset)" --date=short $args }
function glog { git log --oneline --decorate --graph $args }
function gloga { git log --oneline --decorate --graph --all $args }
function glol { git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ar) %C(bold blue)<%an>%C(reset)" $args }
function glola { git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ar) %C(bold blue)<%an>%C(reset)" --all $args }
function glols { git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ar) %C(bold blue)<%an>%C(reset)" --stat $args }
function gm { git merge $args }
function gma { git merge --abort $args }
function gmc { git merge --continue $args }
function gmff { git merge --ff-only $args }
function gmom { git merge origin/$(git_main_branch) $args }
function gms { git merge --squash $args }
function gmtl { git mergetool --no-prompt $args }
function gmtlvim { git mergetool --no-prompt --tool=vimdiff $args }
function gmum { git merge upstream/$(git_main_branch) $args }
function gp { git push $args }
function gpd { git push --dry-run $args }
function gpf { git push --force-with-lease --force-if-includes $args }
function gpf! { git push --force $args }
function gpoat { git push origin --all; git push origin --tags $args }
function gpod { git push origin --delete $args }
function gpr { git pull --rebase $args }
function gpra { git pull --rebase --autostash $args }
function gprav { git pull --rebase --autostash -v $args }
function gpristine { git reset --hard; git clean --force -dfx $args }
function gprom { git pull --rebase origin $(git_main_branch) $args }
function gpromi { git pull --rebase=interactive origin $(git_main_branch) $args }
function gprum { git pull --rebase upstream $(git_main_branch) $args }
function gprumi { git pull --rebase=interactive upstream $(git_main_branch) $args }
function gprv { git pull --rebase -v $args }
function gpsup { git push --set-upstream origin $(git_current_branch) $args }
function gpsupf { git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes $args }
function gpu { git push upstream $args }
function gpv { git push --verbose $args }
function gr { git remote $args }
function gra { git remote add $args }
function grb { git rebase $args }
function grba { git rebase --abort $args }
function grbc { git rebase --continue $args }
function grbd { git rebase $(git_develop_branch) $args }
function grbi { git rebase --interactive $args }
function grbm { git rebase $(git_main_branch) $args }
function grbo { git rebase --onto $args }
function grbom { git rebase origin/$(git_main_branch) $args }
function grbs { git rebase --skip $args }
function grbum { git rebase upstream/$(git_main_branch) $args }
function grep { grep --color $args }
function grev { git revert $args }
function greva { git revert --abort $args }
function grevc { git revert --continue $args }
function grf { git reflog $args }
function grh { git reset $args }
function grhh { git reset --hard $args }
function grhk { git reset --keep $args }
function grhs { git reset --soft $args }
function grm { git rm $args }
function grmc { git rm --cached $args }
function grmv { git remote rename $args }
function groh { git reset origin/$(git_current_branch) --hard $args }
function grrm { git remote remove $args }
function grs { git restore $args }
function grset { git remote set-url $args }
function grss { git restore --source $args }
function grst { git restore --staged $args }
function grt { 
    $toplevel = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -ne 0) {
        Set-Location "."
    } else {
        Set-Location $toplevel
    }
}
function gru { git reset -- $args }
function grup { git remote update $args }
function grv { git remote --verbose $args }
function gsb { git status --short --branch $args }
function gsd { git svn dcommit $args }
function gsh { git show $args }
function gsi { git submodule init $args }
function gsps { git show --pretty=short --show-signature $args }
function gsr { git svn rebase $args }
function gss { git status --short $args }
function gst { git status $args }
function gsta { git stash push $args }
function gstaa { git stash apply $args }
function gstall { git stash --all $args }
function gstc { git stash clear $args }
function gstd { git stash drop $args }
function gstl { git stash list $args }
function gstp { git stash pop $args }
function gsts { git stash show --patch $args }
function gstu { git stash push --include-untracked $args }
function gsu { git submodule update $args }
function gsw { git switch $args }
function gswc { git switch --create $args }
function gswd { git switch $(git_develop_branch) $args }
function gswm { git switch $(git_main_branch) $args }
function gta { git tag --annotate $args }
function gtl { param($pattern="*"); git tag --sort=-v:refname -n --list "$pattern*" }
function gts { git tag --sign $args }
function gtv { git tag | Sort-Object -Property {[version]$_} }
function gunignore { git update-index --no-assume-unchanged $args }
function gunwip { 
    $wip = git rev-list --max-count=1 --format="%s" HEAD | Select-String "\--wip--"
    if ($wip) { git reset HEAD~1 }
}
function gwch { git whatchanged -p --abbrev-commit --pretty=medium $args }
function gwip { 
    git add -A
    git ls-files --deleted -z | ForEach-Object { if ($_) { git rm $_ } }
    git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]" $args 
}
function gwipe { git reset --hard; git clean --force -df $args }
function gwt { git worktree $args }
function gwta { git worktree add $args }
function gwtls { git worktree list $args }
function gwtmv { git worktree move $args }
function gwtrm { git worktree remove $args }

# Deprecated aliases - shown with warnings and redirected to new commands
function gup { 
    Write-Warning "[PowerShell] 'gup' is deprecated, using 'gpr' instead."
    gpr $args 
}
function gupa { 
    Write-Warning "[PowerShell] 'gupa' is deprecated, using 'gpra' instead."
    gpra $args 
}
function gupav { 
    Write-Warning "[PowerShell] 'gupav' is deprecated, using 'gprav' instead."
    gprav $args 
}
function gupom { 
    Write-Warning "[PowerShell] 'gupom' is deprecated, using 'gprom' instead."
    gprom $args 
}
function gupomi { 
    Write-Warning "[PowerShell] 'gupomi' is deprecated, using 'gpromi' instead."
    gpromi $args 
}
function gupv { 
    Write-Warning "[PowerShell] 'gupv' is deprecated, using 'gprv' instead."
    gprv $args 
}
'@

# Function to safely append content to profile without duplicating
function Add-ContentToProfileIfNotExists {
    param (
        [string]$Content,
        [string]$Marker
    )
    
    $profileContent = Get-Content -Path $PROFILE -Raw -ErrorAction SilentlyContinue
    
    # Check if the marker already exists in the profile
    if ($profileContent -and $profileContent.Contains($Marker)) {
        Write-Host "The $Marker section already exists in your PowerShell profile." -ForegroundColor Yellow
        return
    }
    
    # Add content with marker
    $contentWithMarker = "`n# $Marker`n$Content`n# End of $Marker`n"
    Add-Content -Path $PROFILE -Value $contentWithMarker
    Write-Host "Added $Marker to your PowerShell profile." -ForegroundColor Green
}

# Add helper functions and aliases to profile
Add-ContentToProfileIfNotExists -Content $gitCurrentBranchFunction -Marker "Git Helper Functions"
Add-ContentToProfileIfNotExists -Content $gitAliases -Marker "Git Aliases"

Write-Host "`nGit aliases have been added to your PowerShell profile at: $PROFILE" -ForegroundColor Cyan
Write-Host "To start using the aliases, restart your PowerShell session or run:" -ForegroundColor Cyan
Write-Host ". `$PROFILE" -ForegroundColor Yellow

# Optional: Run the profile to make aliases available immediately
$response = Read-Host "Do you want to load the aliases in the current session? (Y/N)"
if ($response -eq "Y" -or $response -eq "y") {
    try {
        . $PROFILE
        Write-Host "Aliases loaded successfully!" -ForegroundColor Green
    } catch {
        Write-Host "Error loading profile: $_" -ForegroundColor Red
        Write-Host "You may need to restart PowerShell to use the aliases." -ForegroundColor Yellow
    }
}

# Display some example commands
Write-Host "`nExample git alias commands you can now use:" -ForegroundColor Cyan
Write-Host "  gst         - git status" -ForegroundColor White
Write-Host "  gco <branch> - git checkout <branch>" -ForegroundColor White
Write-Host "  gaa         - git add --all" -ForegroundColor White
Write-Host "  gcmsg 'msg' - git commit --message 'msg'" -ForegroundColor White
Write-Host "  gp          - git push" -ForegroundColor White
Write-Host "  gl          - git pull" -ForegroundColor White
