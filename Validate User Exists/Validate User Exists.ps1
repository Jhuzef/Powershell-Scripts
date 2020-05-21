Import-Module ActiveDirectory
Import-Csv "C:\Users\jgonzales\OneDrive - Konica Minolta\Desktop\users.csv" |

ForEach-Object {
 $samAccountName = $_."samAccountName"
 Try{
    If (Get-ADUser -Identity $samAccountName) {
    echo "$samAccountName exists."
    }
  }
Catch{
    echo "$samAccountName does not exist. <----------";
    }
}