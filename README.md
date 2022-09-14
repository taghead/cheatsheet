# cheatsheet

## Add network drive
```powershell
$shareip = "192.168.1.200"
$username = "username"
$password = "password"

$networkDrives = @(
    [PSCustomObject]@{ letter = 'D:'; path = 'data' }
    [PSCustomObject]@{ letter = 'F:'; path = 'path\to\files' }
)

cmdkey /delete:"$shareip"
cmdkey /add:"$shareip" /user:"$username" /pass:"$password"


$networkDrives.foreach{net use "$($PSItem.letter)" "\\$shareip\$($PSItem.path)" /persistent:yes }
```

## Get printer ip

```powershell
powershell -c "foreach ($printer in Get-Printer) { $printer | select name, location, portname | sort Name -u | ConvertTo-Json }"
```

## Migrate printers

![image](https://user-images.githubusercontent.com/13403032/187929198-185baa71-4423-4ca8-991a-6dda85c54d0f.png)

![image](https://user-images.githubusercontent.com/13403032/187929261-e08bbfcb-ca91-4c77-9b3b-62ddf1eb9aec.png)
