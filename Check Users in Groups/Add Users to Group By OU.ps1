$users = Get-ADUser -filter *  -SearchBase "OU=Users,OU=Garner,OU=KMHA,DC=kmha,DC=com" | select -exp SamAccountName


$members = Get-ADGroupMember -Identity "Fortinet_Access" -Recursive | Select -ExpandProperty SamAccountName
$members2 = Get-ADGroupMember -Identity "KMHA Portal Access" -Recursive | Select -ExpandProperty SamAccountName


ForEach ($user in $users) {
    If ($members -contains $user -or $members2 -contains $user) {
            Continue
    } 
    Else {
        If ($(get-aduser $user).enabled -eq $true) {
            Add-ADGroupMember -Identity Fortinet_Access -Members $user
            #Write-Host "$user"
        }
    }

}