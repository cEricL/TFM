# search for OST or PST files on all local drives
# click Start, search for PowerShell ISE and launch it
# copy the following lines and paste into the blue field in PowerShell ISE
# After pasting, hit "Enter" on the keyboard to run the script
# output will include a file name and path if any are found
# make a note of any results for further research to determine whether this is the location for missing email
$driveListAll = Get-PSDrive ;
$driveListToCheck = $driveListAll | Where-Object {$_.Name -match '^[(?!)a-z]$'}
$driveListToCheck | ForEach-Object {
    Write-Output ("Start search on disk {0}" -f $_.Root)
    ls $_.Root "*.?st" -File -Recurse -ErrorAction SilentlyContinue | Where-Object {$_ -match '.(ost|pst)$' } | Select-Object Name, FullName
    Write-Output ("Finished search on disk {0}" -f $_.Root)
    }