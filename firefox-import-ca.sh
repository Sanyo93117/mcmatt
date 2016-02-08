#! /bin/bash
# McMatt

# Name you want to export cert as
cert=/usr/local/bin/example.certname.pem

# Export cert (must be PEM)
echo "-----BEGIN CERTIFICATE-----
MIIEczCCA1ugAwIBAgIBADANBgkqhkiG9w0BAQQFAD
EzARBgNVBAgTClNvbWUtU3RhdGUxFDASBgNVBAoTC0
VQQLEy5DbGFzcyAxIFB1YmxpYyBQcmltYXJ5IENlcn
aXR5MRQwEgYDVQQDEwtCZXN0IENBIEx0ZDAeFw0wMD
MDQxOTUwMTZaMIGHMQswCQYDVQQGEwJHQjETMBEGA1
MBIGA1UEChMLQmVzdCBDQSBMdGQxNzA1BgNVBAsTLk
aW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFD
THRkMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCg
vBjM9OiJjRazXBZ1BjP5CE/Wm/Rr500PRK+Lh9x5eJ
ak2m1g7oruI3dY3VHqIxFTz0Ta1d+NAjwnLe4nOb7/
8n104o/5p8HAsZPdzbFMIyNjJzBM2o5y5A13wiLitE
kVHiIyCuaF4wj571pSzkv6sv+4IDMbT/XpCo8L6wTa
rvZ8RQM1tlKdoMHg2qxraAV++HNBYmNWs0duEdjUbJ
OfljiQIDAQABo4HnMIHkMB0GA1UdDgQWBBQ8urMCRL
tAYDVR0jBIGsMIGpgBQ8urMCRLYYMHUKU5AkIp9NJH
A1UEBhMCR0IxEzARBgNVBAgTClNvbWUtU3RhdGUxFD
THRkMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQcm
b24gQXV0aG9yaXR5MRQwEgYDVQQDEwtCZXN0IENBIE
AQH/MA0GCSqGSIb3DQEBBAUAA4IBAQC1uYBcsSncwA
xQUE/C0pWWm6gDkwd5D0DSMDJRqV/weoZ4wC6B73f5
XcoOwLdSaGmJYslLKZB3ZIDEp0wYTGhgteb6JFiTtn
BMAV7Gzdc4VspS6ljrAhbiiawdBiQlQmsBeFz9JkF4
It8una2gY4l2O//on88r5IWJlm1L0oA8e4fR2yrBHX
7vQMfXdGsRrXNGRGnX+vWDZ3/zWI0joDtCkNnqEpVn
-----END CERTIFICATE-----" > $cert

# Get current logged in user
user=`ls -l /dev/console | awk '/ / { print $3 }'`

# Variables
ini=/Users/$user/Library/Application\ Support/Firefox/profiles.ini
firefoxdir=/Users/$user/Library/Application\ Support/Firefox
xcertutil=/usr/local/bin/certutil
trustargs='CT,C,C'

# Get default Firefox profile name
profile=$(cat "$ini" | grep Path | grep -i Default | sed s/Path=//)

# Install certificate
$certutil -A -n $nickname -t $trustargs -i $cert -d "$firefoxdir"/$profile

# Remove cert
rm $cert

