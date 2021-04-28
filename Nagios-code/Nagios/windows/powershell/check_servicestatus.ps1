$service = "apache"
$one=Get-Service $service | select-object Status | select-string Stopped
$val=$one.Length
if ($val -ge 1)
{
C:\Python\Python38-32\python.exe C:\Users\servicestatus.py
	Write-Output "service $service is stoped"
	exit 3
}
else
{
	Write-Output 	"service $service is Runing"
	exit 0
	
}
