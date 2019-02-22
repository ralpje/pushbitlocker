$BLV = Get-BitLockerVolume -MountPoint "C:" | Select-Object *
$BackupPasswords = $BLV.KeyProtector | Where-Object {$_.KeyProtectorType -eq ‘RecoveryPassword’}
foreach ($BackupPassword in $BackupPasswords) {
BackupToAAD-BitLockerKeyProtector -MountPoint "C:" -KeyProtectorId $BackupPassword.KeyProtectorId -ErrorAction SilentlyContinue
}
