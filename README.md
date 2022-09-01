# cheatsheet

Get-Printer | select Name, PortName |sort Name -u | ConvertTo-Json

$PRINTERS = Get-Printer
foreach ($i in $PRINTERS){ $NAME = $i.name; $PORTNAME = $i.portname; echo "$NAME is using $PORTNAME" }
