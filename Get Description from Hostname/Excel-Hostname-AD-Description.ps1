
$computers = ""

ForEach ($hostname in $computers) {

    try {
    $description = Get-ADComputer $hostname -Properties Description | select -ExpandProperty description
    }
    catch {
    $description = "No description"
    }
    if ( $description -eq $null) {
        echo "No description"
        }
    else {
        echo "$description"
        }

    }
