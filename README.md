# cheatsheet

## 

$shareip = 192.168.1.200
$sharepaths = "path\to","path\too"
$username = "username"
$password = "password"

cmdkey /delete:"$shareip"
cmdkey /add:"$shareip" /user:"$username" /pass:"$password"

foreach ( $path in $sharepaths ) {
  net use D: "\\$shareip\$path" /persistent:yes
}


## Get printer ip

powershell -c "foreach ($printer in Get-Printer) { $printer | select name, location, portname | sort Name -u | ConvertTo-Json }"

## Migrate printers

![image](https://user-images.githubusercontent.com/13403032/187929198-185baa71-4423-4ca8-991a-6dda85c54d0f.png)

![image](https://user-images.githubusercontent.com/13403032/187929261-e08bbfcb-ca91-4c77-9b3b-62ddf1eb9aec.png)
