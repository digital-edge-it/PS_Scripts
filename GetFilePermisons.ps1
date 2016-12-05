$OutFile = "C:\Permissions.csv"
$Header = "File Path,IdentityReference,AccessControlType,IsInherited,InheritanceFlags,PropagationFlags,FileSystemRights"
Del $OutFile
Add-Content -Value $Header -Path $OutFile 

$RootPath = "G:\Survey"

$Files = dir $RootPath -recurse | where {$_.psiscontainer -eq $false}

foreach ($File in $Files){
	$ACLs = get-acl $File.fullname | ForEach-Object { $_.Access  }
	Foreach ($ACL in $ACLs){
	$OutInfo = $File.Fullname + "," + $ACL.IdentityReference  + "," + $ACL.AccessControlType + "," + $ACL.IsInherited + "," + $ACL.InheritanceFlags + "," + $ACL.PropagationFlags + "," + $ACL.FileSystemRights
	Add-Content -Value $OutInfo -Path $OutFile
	}}
