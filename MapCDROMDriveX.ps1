# Get Available CD/DVD Drive - Drive Type 5
$DvdDrv = Get-WmiObject -Class Win32_Volume -Filter "DriveType=5"
 
# Check if CD/DVD Drive is Available
if ($DvdDrv -ne $null)
{
 
# Get Current Drive Letter for CD/DVD Drive
$DvdDrvLetter = $DvdDrv | Select-Object -ExpandProperty DriveLetter
Write-Output "Current CD/DVD Drive Letter is $DvdDrvLetter"
 
# Confirm New Drive Letter is NOT used
if (-not (Test-Path -Path X:))
{
 
# Change CD/DVD Drive Letter
$DvdDrv | Set-WmiInstance -Arguments @{DriveLetter="X:"}
Write-Output "Updated CD/DVD Drive Letter as X:"
}
else
{
Write-Output "Error: Drive Letter X: Already In Use"
}
}
else
{
Write-Output "Error: No CD/DVD Drive Available !!"
}
