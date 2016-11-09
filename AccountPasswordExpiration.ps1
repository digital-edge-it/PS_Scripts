Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} –Properties “DisplayName” | ft DisplayName
