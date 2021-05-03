$val=(Get-Service -Name tomcat9 | select-object status | select-string Stopped).Length

 if($val -ge 1)
 {
 Write-Output "httpd is running"
 }
 else
 {
 Write-Output "httpd is not running"
 }
