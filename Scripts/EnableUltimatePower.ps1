$ultimateExists = 0
$ultimateExists = powercfg /list | findstr "Ultimate Performance"

if ( $ultimateExists ) {
    $ultimateArray = $ultimateExists -split " "
    $ultimateGUID = $ultimateArray[3]

    echo "Ultimate Power Plan found skipping creation..."
}

else {
    $ultimateArray = $ultimateExists -split " "
    $ultimateGUID = $ultimateArray[3]

    echo "Ultimate Power Plan not found creation..."
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
}

$ultimateExists = 0
$ultimateExists = powercfg /list | findstr "Ultimate Performance"

if ( $ultimateExists ) {
    $ultimateArray = $ultimateExists -split " "
    $ultimateGUID = $ultimateArray[3]
    echo "Setting powerplan to Ultimate"
    powercfg /setactive $ultimateGUID
}
