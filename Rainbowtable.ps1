# Define the file path to save the rainbow table
$outputFile = "C:\Myproject\df-mod4-tools\rainbow_table.txt"

# Open the file for writing
$outputFileStream = New-Object System.IO.StreamWriter($outputFile, $false)

# Loop through the 6-digit passcodes starting with 700000 to 799999
for ($i = 700000; $i -lt 800000; $i++) {
    # Convert the passcode to a string
    $passcode = $i.ToString()

    # Compute the SHA-256 hash of the passcode
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($passcode)
    $hash = $sha256.ComputeHash($bytes)
    $hashString = [BitConverter]::ToString($hash) -replace "-", ""

    # Write the passcode and hash to the file
    $outputFileStream.WriteLine("${passcode}: $hashString")
}

# Close the file after writing
$outputFileStream.Close()


