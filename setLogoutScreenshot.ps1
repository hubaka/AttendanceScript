#######################################################################################################
# get date and time and set the target time after 9hours 15 minutes
#######################################################################################################
$dt = Get-Date 
$hr = $dt.Hour
$min = $dt.Minute
Write-Host "Date and time $hr $min"
$cdt = $dt.AddHours(9)
$cdt = $cdt.AddMinutes(15)
$hr = $cdt.Hour
$min = $cdt.Minute
Write-Host "Date and time $hr $min"
$val = New-TimeSpan -Hour $hr -Minute $min
Write-Host "time $val"

$jobname = "logscreenshot"
$script =  "C:\Users\akathire\Documents\pIm\work\Attendance\projectHrLogOut.cmd"
 
#######################################################################################################
# creates new scheduled task and register this task with task schedular
#######################################################################################################
#$action = New-ScheduledTaskAction –Execute "$pshome\powershell.exe" -Argument  "$script; quit"
#$trigger = New-ScheduledTaskTrigger -Once -At $cdt
#$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -DontStopOnIdleEnd
#Register-ScheduledTask -TaskName $jobname -Action $action -Trigger $trigger -Settings $settings
schtasks /Create /SC ONCE /TR $script /RU "VNET\akathire" /ST $val /TN "logoutScreenshot" /IT