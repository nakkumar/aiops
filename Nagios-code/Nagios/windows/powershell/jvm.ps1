$test = Get-Process Java | select-object CPU | out-file -filepath C:\jvm_data.txt
$total = Get-Content "C:\jvm_data.txt" | Select-Object -Index 3
Write-Output "$total"

if($total -le 30){
   Write-Output("ok - Usage of $total Bytes Services in OK State")

   exit 0
} elseif($total -ge 31 -and $total -le 60){

   Write-Output("WARNING - Usage of $total Bytes Services in WARNING State")

   exit 1
}
 elseif($total -ge 61 ){

   Write-Output("CRITICAL - Usage of $total Bytes Services in CRITICAL State")
    C:\Python\Python38-32\python.exe C:\Users\jvm.py
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total Bytes Services in UNKNOWN State")
   exit 3
}