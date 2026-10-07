param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPrivateIp
)

Write-Host "Testing connectivity to $TargetPrivateIp" -ForegroundColor Cyan

Write-Host "`nTesting ICMP..." -ForegroundColor Yellow

$pingResult = Test-Connection `
    -ComputerName $TargetPrivateIp `
    -Count 2 `
    -Quiet

if ($pingResult) {
    Write-Host "ICMP connectivity: PASS" -ForegroundColor Green
}
else {
    Write-Host "ICMP connectivity: FAIL" -ForegroundColor Red
}

Write-Host "`nTesting SSH port 22..." -ForegroundColor Yellow

$sshResult = Test-NetConnection `
    -ComputerName $TargetPrivateIp `
    -Port 22 `
    -InformationLevel Quiet

if ($sshResult) {
    Write-Host "TCP 22 connectivity: PASS" -ForegroundColor Green
}
else {
    Write-Host "TCP 22 connectivity: FAIL" -ForegroundColor Red
}

Write-Host "`nTesting HTTP port 80..." -ForegroundColor Yellow

$httpResult = Test-NetConnection `
    -ComputerName $TargetPrivateIp `
    -Port 80 `
    -InformationLevel Quiet

if ($httpResult) {
    Write-Host "TCP 80 connectivity: PASS" -ForegroundColor Green
}
else {
    Write-Host "TCP 80 connectivity: FAIL" -ForegroundColor Red
}