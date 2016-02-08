#! /bin/bash
# McMatt

# Export cert
echo "-----BEGIN CERTIFICATE-----
MIIDwjCCAqqgAwIBAgIQfdzTKHx3651Ic/HvEh1rGTANBgkqhkiG9w0BAQUFADBp
MRMwEQYKCZImiZPyLGQBGRYDY29tMRYwFAYKCZImiZPyLGQBGRYGaGJndXNhMRYw
FAYKCZImiZPyLGQBGRYGcHJvZGFkMSIwIAYDVQQDExlwcm9kYWQtUFJELURPTS1D
QVMtMDAxLUNBMB4XDTE0MDYyNjE5MzIzOFoXDTE5MDYyNjE5NDIzNlowaTETMBEG
CgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBmhiZ3VzYTEWMBQGCgmS
JomT8ixkARkWBnByb2RhZDEiMCAGA1UEAxMZcHJvZGFkLVBSRC1ET00tQ0FTLTAw
MS1DQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKf6Xgyw86Z/sftw
TSO7Czj2dSvBWDfP9QlDqjnJyzS+tjY6klW1foEY7C7X8eDC6wnOAd2zP0DvFRC4
oYsvz94wVVgPzfDhmO9WT4vVsGKWF3G8dCMtWl7gChfb7DIJoriz8lg1TXYjqMLn
P2MPF2LCmSteobq0wARE4+Ru/HSoUpEYAMbBNwoZiFZLbm35Q4AXFEpsPzm7gTYr
QjAielURI/hGyuxF25wNSbXvbl2O5v3NPF1UlDBkdwQUMDbgO7sLgNppM2MDx1Xy
n4BFJC0AK80zw86948JY3D8nCeCLv0kCGG6WnzZm6hB0nJs/ZC9vf+f0a1dpgnla
hso1qgMCAwEAAaNmMGQwEwYJKwYBBAGCNxQCBAYeBABDAEEwCwYDVR0PBAQDAgGG
MA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFDudIDLSJJSrJgSUBwgQI4tuUmV4
MBAGCSsGAQQBgjcVAQQDAgEAMA0GCSqGSIb3DQEBBQUAA4IBAQCiX0QTuuM3xLjq
Me0Y9ZCQZvbBsjkmux6s9ZBGW9wyBIfTUE5pib4yA/od121yZKUN1/ccFXJ0JtEl
M6TBXphRxcmjXMNuK1qVlRIk3E6UhVbSw2Z9lrkRINOdk1RFhh/KeTy8/eDVuJB6
mAWIOvYp9EyjRPQd0/eMQXWZWmEeuabzAmx9+jYrin4s8oEl7++lyj+vE4cdof+G
dcdjtonA0jenznWizdq6++RR8EHi05CbavH2G+DYpo6BDdS5IwSEYESerpgER0Dc
epNFx1CE/hqWZdKMO7REladUZYpVPeD7aaUKZ2XZJ97oJy/VwxjLY28QyHozVTcp
2TRHqXJ8
-----END CERTIFICATE-----" > /Users/Shared/prodad-PRD-DOM-CAS-001-CA.pem

# Get current logged in user
user=`ls -l /dev/console | awk '/ / { print $3 }'`

# Variables
ini=/Users/$user/Library/Application\ Support/Firefox/profiles.ini
firefoxdir=/Users/$user/Library/Application\ Support/Firefox
cert=/Users/Shared/prodad-PRD-DOM-CAS-001-CA.pem
nickname="prodad-PRD-DOM-CAS-001-CA"
certutil=/usr/local/bin/certutil
trustargs='CT,C,C'

# Get default Firefox profile name
profile=$(cat "$ini" | grep Path | grep -i Default | sed s/Path=//)

# Install certificate
$certutil -A -n $nickname -t $trustargs -i $cert -d "$firefoxdir"/$profile

# Remove cert
rm $cert

