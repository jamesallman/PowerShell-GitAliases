# PowerShell-Git-Aliases

PowerShell implementation of zsh-style Git aliases for Windows users. Complete collection of Git shortcuts that streamline common Git operations in PowerShell.

## Overview

This repository contains a PowerShell script (`Install-GitAliases.ps1`) that configures your PowerShell profile with Git aliases similar to those available in zsh/oh-my-zsh. If you're familiar with Git aliases in zsh and want the same functionality in PowerShell, this script sets up everything for you with a single command.

## Features

- 150+ Git aliases ported from zsh
- Helper functions for branch detection
- Proper PowerShell syntax and parameter handling
- Easy installation process
- Familiar commands for users switching between zsh and PowerShell

## Prerequisites

- Windows with PowerShell 5.1+ or PowerShell Core 6.0+
- Git for Windows installed and available in PATH

## Installation

1. Clone or download this repository
2. Open PowerShell
3. Navigate to the repository folder
4. Run the script:

```powershell
.\Install-GitAliases.ps1
```

The script will:
- Check if your PowerShell profile exists and create it if needed
- Add the Git aliases and helper functions to your profile
- Offer to load the aliases in the current session
- Show example commands to get you started

## Common Aliases

Here are some of the most commonly used Git aliases included:

| Alias | Git Command |
|-------|------------|
| g | git |
| ga | git add |
| gaa | git add --all |
| gst | git status |
| gco | git checkout |
| gcb | git checkout -b |
| gcm | git checkout main |
| gcd | git checkout develop |
| gl | git pull |
| gp | git push |
| gpsup | git push --set-upstream origin $(git_current_branch) |
| gcmsg | git commit --message |
| gd | git diff |
| gf | git fetch |
| gfa | git fetch --all --tags --prune |
| glog | git log --oneline --decorate --graph |
| grh | git reset |
| grhh | git reset --hard |

For a complete list of all aliases with descriptions, see the [CHEATSHEET.md](CHEATSHEET.md).

## Customization

You can modify your PowerShell profile directly to add, remove, or customize any of the Git aliases:

```powershell
notepad $PROFILE
```

## Troubleshooting

### Execution Policy

If you encounter execution policy errors:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Reloading Profile

To reload your profile after making changes:

```powershell
. $PROFILE
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The oh-my-zsh project for the original Git aliases
- The PowerShell community for best practices and guidance
