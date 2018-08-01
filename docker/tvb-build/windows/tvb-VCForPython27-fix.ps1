# Download the Microsoft Visual C++ 9.0 which is required.from http://aka.ms/vcpython27.
Invoke-WebRequest -Uri https://download.microsoft.com/download/7/9/6/796EF2E4-801B-4FC4-AB28-B59FBF6D907B/VCForPython27.msi -OutFile c:\windows\temp\VCForPython27.msi -UseBasicParsing
# Get the current date and time for wrinting log fle
# with is a good practice for installing .msi package.
$DataStamp = get-date -Format yyyyMMddTHHmmss
# our logfile.
$logFile = '{0}-{1}.log' -f "c:\windows\temp\VCForPython27.msi",$DataStamp
# The commands for installing .msi file on powershell.
# msiexec Provides the means to install, modify, and perform operations 
# on Windows Installer from the command line.
# Some msiexec ArgumentList means
# i - Status messages.
# qn - No UI(User interface)
# L- Writes logging information into a logfile at the specified existing path
# v - Verbose output.
$MSIArguments = @(
    "/i"
    ('"{0}"' -f "c:\windows\temp\VCForPython27.msi")
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
)
# Install our downloaded VCForPython27.ms fix.
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 