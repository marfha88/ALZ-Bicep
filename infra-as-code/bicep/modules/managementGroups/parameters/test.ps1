# Get the root management group name
$rootManagementGroupName=(az account management-group show --name "/" --query name -o tsv)

# List role assignments for the assignee at the tenant root group
az role assignment list --assignee "21d522b4-c50e-4b99-977a-61e56a12d568" --scope "/providers/Microsoft.Management/managementGroups/$rootManagementGroupName"
az role assignment list --assignee "21d522b4-c50e-4b99-977a-61e56a12d568" --scope "/providers/Microsoft.Management/managementGroups/Tenant Root Group"
