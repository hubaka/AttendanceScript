############################################################################
#       minize all windows
############################################################################
$code = @" 
		[DllImport("user32.dll")] 
		public static extern bool BlockInput(bool fBlockIt); 
"@
$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru

function Disable-UserInput($seconds) { 
############################################################################
#       block user mouse and keyboard input
############################################################################
$userInput::BlockInput($true) 
############################################################################
#       minize all windows
############################################################################
$shell = New-Object -ComObject "Shell.Application"
$shell.minimizeall()
############################################################################
#       conencts to wifi network 7B7D55635
############################################################################
netsh wlan connect name=7B7D55635
############################################################################
#       wait for some seconds
############################################################################
Start-Sleep $seconds 
############################################################################
#       Unblock user mouse and keyboard input
############################################################################
$userInput::BlockInput($false) 
}
Disable-UserInput -seconds 5 | Out-Null
