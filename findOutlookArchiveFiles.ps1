# search for OST or PST files on all local drives
$driveListAll = Get-PSDrive ;
$driveListToCheck = $driveListAll | Where-Object {$_.Name -match '^[(?!)a-z]$'}
$driveListToCheck | ForEach-Object {
    Write-Output ("Start search on disk {0}" -f $_.Root)
    ls $_.Root "*.?st" -File -Recurse -ErrorAction SilentlyContinue | Where-Object {$_ -match '.(ost|pst)$' } | Select-Object Name, FullName
    Write-Output ("Finished search on disk {0}" -f $_.Root)
    }