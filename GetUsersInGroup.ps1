param (
    [string]$groupName
)

# Check if the group name is provided
if (-not $groupName) {
    Write-Host "Please provide the group name." -ForegroundColor Yellow
    exit
}

# Get users in the specified group
try {
    $users = Get-ADGroupMember -Identity $groupName | Where-Object { $_.objectClass -eq 'user' }
    
    if ($users) {
        Write-Host "Users in group '$groupName':" -ForegroundColor Green
        foreach ($user in $users) {
            Write-Host $user.Name
        }
    } else {
        Write-Host "No users found in group '$groupName'." -ForegroundColor Yellow
    }
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
