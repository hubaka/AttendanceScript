add-type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("Y")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Schtasks /Delete /TN "logoutScreenshot"

#Write-Output "Hello world!!!"
#Write-Host "Press any key to continue ..."

#$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")