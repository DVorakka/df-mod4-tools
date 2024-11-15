# Path to the rainbow table file
$rainbowTablePath = "C:\Myproject\df-mod4-tools\rainbow_table.txt"

# Provided SHA-256 hashes to look up
$hashesToCrack = @(
    "9e89895d350e5fdac013006b2acb067f8516149cdf7e952b021ff0326718ab70", # Erik's Code
    "af95a5393589cace29a63eead5328f1647a8bc62b5ef18b023c574484a877ced", # Logan's Code
    "30fc150e7c8b42dd86b1bb6e67ee256be8230969bb37cc111749e87af383ae82"  # Cody's Code
)

# Read the rainbow table into a dictionary
$rainbowTable = @{}
Get-Content $rainbowTablePath | ForEach-Object {
    $line = $_
    $parts = $line -split ": "
    if ($parts.Length -eq 2) {
        $rainbowTable[$parts[1]] = $parts[0]
    }
}

# Search for each provided hash in the rainbow table and print the passcode
foreach ($hash in $hashesToCrack) {
    if ($rainbowTable.ContainsKey($hash)) {
        $passcode = $rainbowTable[$hash]
        Write-Host "Hash: $hash => Passcode: $passcode"
    } else {
        Write-Host "Hash: $hash not found in the rainbow table."
    }
}
