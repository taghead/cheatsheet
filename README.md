# Disable Sleep

```powershell
powercfg.exe -x -monitor-timeout-ac 0
powercfg.exe -x -monitor-timeout-dc 0
powercfg.exe -x -disk-timeout-ac 0
powercfg.exe -x -disk-timeout-dc 0
powercfg.exe -x -standby-timeout-ac 0
powercfg.exe -x -standby-timeout-dc 0
powercfg.exe -x -hibernate-timeout-ac 0
powercfg.exe -x -hibernate-timeout-dc 0
```

# cheatsheet
## Change UAC Level
```powershell
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
```

## Choco
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation

$args = "-y --acceptlicense --log-file=C:\choco_log.txt"
$apps = "7zip.install","javaruntime"

ForEach( $PSitem in $apps ){
    choco install $PSitem $args
}
```

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
