$url = 'http://192.168.2.25/demo.php'
$timeTaken = Measure-Command -Expression {
  $site = Invoke-WebRequest -Uri $url
}

$milliseconds = $timeTaken.TotalMilliseconds

$milliseconds1 = [Math]::Round($milliseconds, 1)

if (($milliseconds1 -ge 100))
{
Write-Output("WARNING web-response $milliseconds1 ")
#C:\Python\Python38-32\python.exe C:\Users\webresponse.py
exit 2
}
else
{
Write-Output("OK web-response $milliseconds1")
exit 0
}