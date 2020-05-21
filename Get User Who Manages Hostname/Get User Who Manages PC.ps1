$hostname = ""

Get-ADComputer -Identity $hostname -Properties ManagedBy | ForEach { Get-ADUser -Identity $_.ManagedBy  | Select-Object -ExpandProperty SamAccountName }