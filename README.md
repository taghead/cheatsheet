# cheatsheet

powershell -c "foreach ($printer in Get-Printer) { $printer | select name, location, portname | sort Name -u | ConvertTo-Json }"
