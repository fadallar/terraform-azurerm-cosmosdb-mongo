# Capabilities to Set 

EnableMongoRoleBasedAccessControl

# RBAC 

Need to create users  with different RBAC



# OUTPUTS

Need to ouput the connection string 


Containers  can be configured for dedicated or shared throughput
Need add template for Database creation


----------------------------------------------------

MongoDB 
API Version



Deploy private endpoints
NSG Not supported
Disable Public Network Access
Firewall rules should be defined on your Azure Cosmos DB accounts to prevent traffic from unauthorized sources
    - Compliant : Public access disabled
    - Compliant : Public access enabled + IP Rule (which is not permit any) + TAG

Azure AD Authentication Required for Data Plane Access  - Only Supported for the NO-SQL Version
Local Authentication Methods for Data Plane Access


Cosmos DB can use primary/secondary keys (shared secrets) to control access to data. Integration of these secrets into Key Vault is not supported directly by Cosmos DB, but custom client code that uses shared secrets can use Key Vault if desired.

Sensitive Data Discovery and Classification:     
    Microsoft Purview data classification only supported the Azure Cosmos DB Core (SQL) API.

Use Microsoft Defender for Azure Cosmos DB to detect data exfiltration attempts.

Cosmos DB supports data encryption in transit with TLS v1.2 or greater and this cannot be disabled. 

Enable data at rest encryption by default

Enable threat detection capabilities
Enable logging for security investigation

Service Native Backup Capability    ( does not support Azure Backup)