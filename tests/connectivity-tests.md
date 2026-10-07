# Azure VNet Connectivity Tests

## Objective

Validate private network connectivity between the Dev and Prod VNets through Azure VNet Peering.

## Architecture

Dev VNet:

- Address Space: 10.10.0.0/16
- Subnet: 10.10.1.0/24

Prod VNet:

- Address Space: 10.20.0.0/16
- Subnet: 10.20.1.0/24

Connectivity:

Dev VNet <-> VNet Peering <-> Prod VNet



## Test 1 - VNet Peering State

### Objective

Verify that the VNet peering relationship is established successfully.

### Expected Result

Both peering relationships should show:

`Connected`



## Test 2 - Private IP Connectivity

### Objective

Verify communication between the Dev VM and Prod VM using private IP addresses.

### Source

Dev VM

### Destination

Prod VM private IP

### Expected Result

Connectivity should be successful when the required security rules allow the traffic.


## Test 3 - SSH Connectivity

### Objective

Verify TCP connectivity to port 22.

### Command


Test-NetConnection <PROD_PRIVATE_IP> -Port 22
Expected Result
TcpTestSucceeded : True

### Test 4 - HTTP Connectivity
Objective
Verify TCP connectivity to port 80.
### Command
Test-NetConnection <PROD_PRIVATE_IP> -Port 80

Expected Result
TcpTestSucceeded : True

### Test 5 - NSG Restriction

Objective
Verify that Network Security Groups can restrict traffic even when VNet Peering exists.

Scenario
Deny the required traffic using an NSG rule.

Expected Result
The connection should fail.

### Test 6 - NSG Allow Rule

Objective
Verify that an explicit NSG allow rule permits the required traffic.

Scenario
Allow the required TCP port.

Expected Result
The connection should succeed.
### Test 7 - Private IP Validation

Objective
Verify that communication occurs using private IP addresses rather than public IP addresses.
Expected Result
Dev VM should communicate with the Prod VM using the Prod VNet private address.

### Test 8 - Peering Removal Test

Objective
Verify that removing VNet Peering removes direct VNet-to-VNet connectivity.
Scenario
Remove the peering relationship using Terraform.
Expected Result
Direct private connectivity between the VNets should no longer be available.

### Test 9 - Peering Restoration

Objective
Verify that restoring the VNet Peering restores private connectivity.
Scenario
Recreate the peering relationship using Terraform.
Expected Result
Private connectivity should be restored.

### Test Summary

Test	Description	Expected Result
1	Peering State	Connected
2	Private IP Connectivity	Pass
3	SSH Port 22	Pass
4	HTTP Port 80	Pass
5	NSG Restriction	Blocked
6	NSG Allow Rule	Allowed
7	Private IP Validation	Pass
8	Peering Removal	Connectivity blocked
9	Peering Restoration	Connectivity restored



