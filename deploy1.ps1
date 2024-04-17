# For Azure global regions

dateYMD=$(date +%Y%m%dT%H%M%S%NZ)
NAME="alz-MGDeployment-${dateYMD}"
LOCATION="eastus"
TEMPLATEFILE="infra-as-code/bicep/modules/managementGroups/managementGroups.bicep"
PARAMETERS="@infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.all.json"

az deployment tenant create --name test --location eastus --template-file "infra-as-code/bicep/modules/managementGroups/managementGroups.bicep" --parameters "infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.all.json"

az deployment tenant create --name test --location eastus --template-file "infra-as-code/bicep/modules/managementGroups/managementGroups.bicep" --parameters "infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.all.json"

$rootManagementGroupId=(az account management-group show --name "/" --query id -o tsv)
$rootManagementGroupId

# Assign the Owner role to the user at the tenant root group
az role assignment create --assignee "290a625e-ce53-45e2-a126-d2ee81631d69" --role "Owner" --scope "$rootManagementGroupId"

az role assignment create --assignee "290a625e-ce53-45e2-a126-d2ee81631d69" --role Owner --scope /providers/Microsoft.Management/managementGroups/0c48f254-2041-4d9d-b5af-a5b155475b0e

az role assignment list --scope /providers/Microsoft.Management/managementGroups/0c48f254-2041-4d9d-b5af-a5b155475b0e

az deployment tenant what-if --name deploy --location westeurope --template-file .\managementGroups.bicep --parameters  .\parameters\managementGroups.parameters.all.json
