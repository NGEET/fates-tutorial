# Bash to Powershell Cheat Sheet

This cheat sheet was generated per a request from LBL CBORG.

### File and Directory Operations

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `ls`                      | `Get-ChildItem` or `dir`          |
| `ls -l`                   | `Get-ChildItem -Format-List`      |
| `ls -a`                   | `Get-ChildItem -Force`            |
| `cd`                      | `Set-Location` or `cd`            |
| `pwd`                     | `Get-Location` or `pwd`           |
| `mkdir`                   | `New-Item -Type Directory` or `md`|
| `rmdir`                   | `Remove-Item -Recurse`            |
| `rm`                      | `Remove-Item`                     |
| `cp`                      | `Copy-Item`                       |
| `mv`                      | `Move-Item`                       |
| `touch`                   | `New-Item -Type File`             |

### File Content Manipulation

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `cat`                     | `Get-Content` or `type`           |
| `more`                    | `more`                            |
| `less`                    | `less`                            |
| `head`                    | `Get-Content -TotalCount <n>`     |
| `tail`                    | `Get-Content -Tail <n>`           |
| `grep`                    | `Select-String`                   |
| `find`                    | `Get-ChildItem -Recurse`          |
| `chmod`                   | `Set-Acl`                         |
| `chown`                   | `Set-Acl`                         |

### Process Management

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `ps`                      | `Get-Process`                     |
| `kill`                    | `Stop-Process`                    |
| `top`                     | `Get-Process`                     |
| `bg`                      | `Start-Job`                       |
| `fg`                      | `Receive-Job`                     |

### Networking

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `ifconfig`                | `Get-NetIPAddress`                |
| `ping`                    | `Test-Connection`                 |
| `netstat`                 | `Get-NetTCPConnection`            |
| `curl`                    | `Invoke-WebRequest`               |
| `wget`                    | `Invoke-WebRequest`               |

### Text Processing

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `echo`                    | `Write-Output` or `echo`          |
| `sed`                     | `-replace` operator               |
| `awk`                     | `Select-String`                   |
| `sort`                    | `Sort-Object`                     |
| `uniq`                    | `Get-Unique`                      |

### Miscellaneous

| **Bash Command**          | **PowerShell Equivalent**         |
|---------------------------|-----------------------------------|
| `date`                    | `Get-Date`                        |
| `whoami`                  | `whoami`                          |
| `sudo`                    | `Start-Process -Verb RunAs`       |
| `chmod`                   | `Set-Acl`                         |
| `chown`                   | `Set-Acl`                         |

### Note:
- PowerShell commands often come with additional options and parameters that can be explored using the `Get-Help` cmdlet.
- For more complex tasks, you might need to combine multiple PowerShell cmdlets using the pipeline (`|`).

This cheat sheet should help you translate common Bash commands to their PowerShell equivalents. If you have any specific commands or tasks in mind, feel free to ask!


