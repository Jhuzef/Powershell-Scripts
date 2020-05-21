$OU = "OU=Computers, OU=Wayne, OU=KMHA, DC=KMHA, DC=com"

$computers = Get-ADComputer -Filter * -SearchBase $OU

ForEach ($computer in $computers) {

    $ipAddresses = Resolve-DnsName $computer.name | ForEach-Object {echo $_.ipAddress}

    ForEach ( $ipAddress in $ipAddresses ) {

        $checkIfTrue = Resolve-DnsName $ipAddress -ErrorAction ignore | ForEach-Object {if ("$($computer.name).kmha.com" -eq $_.NameHost) {return $true} else {return $false}} 

        if ($checkIfTrue -eq $false) {
            "$($computer.name) is invalid." | Out-File -FilePath .\InvalidHosts.txt -Append 
            continue
        }
    } 
}