#######################################################################################################
# starts this process from administrator console
#######################################################################################################
$user = "VNET\l-akathire" 
$pwd1 = "Admin!987654321"
$pwd = ConvertTo-SecureString $pwd1 -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential $user, $pwd
$args = "C:\Users\akathire\Documents\pIm\work\Attendance\setLogoutScreenshot.ps1"
Start-Process powershell.exe -Credential $Credential -ArgumentList ("-file $args")