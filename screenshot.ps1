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
#       wait for some seconds
############################################################################
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing
# Gather Screen resolution information
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
Start-Sleep $seconds 
#############################################################################
# Capturing a screenshot
#############################################################################
#$File = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")            
#New-Item -itemType Directory -Path C:\Users\akathire\Documents\pIm\work\rough\script\screenshot\ -Name ($File + ".bmp")
$File = "C:\Users\akathire\Documents\pIm\work\Attendance\track\$(get-date -f dd-MM-yyyy-hh-mm-ss).bmp"
#$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width
$Height = $Screen.Height
$Left = $Screen.Left
$Top = $Screen.Top
# Create bitmap using the top-left and bottom-right bounds
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height
# Create Graphics object
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)
# Capture screen
$graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
# Save to file
$bitmap.Save($File) 
Write-Output "Screenshot saved to:"
Write-Output $File
#############################################################################
############################################################################
#       Unblock user mouse and keyboard input
############################################################################
$userInput::BlockInput($false) 
}
Disable-UserInput -seconds 2 | Out-Null
