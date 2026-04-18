# Create symbolic links for prompt files in the current directory

# Choose the developer role file (options: csharp.md, react.md, csharp-react.md)
$developerRoleFileName = "csharp.md"
$developerRolePath = "C:\dev\ZZZPrompt\prompts\base\role\$developerRoleFileName"

# Define source files and target link names
$sourceFiles = @(
    @{ Source = "C:\dev\ZZZPrompt\prompts\base\architecture.md"; Target = "architecture.md" },
    @{ Source = "C:\dev\ZZZPrompt\prompts\base\behaviour.md"; Target = "behaviour.md" },
    @{ Source = "C:\dev\ZZZPrompt\prompts\base\subagents\codebase-analyzer-agent.md"; Target = "codebase-analyzer-agent.md" },
    @{ Source = "C:\dev\ZZZPrompt\prompts\base\subagents\code-review-agent.md"; Target = "code-review-agent.md" },
    @{ Source = $developerRolePath; Target = "development-role.md" },
    @{ Source = "C:\dev\ZZZPrompt\prompts\base\subagents\task-planner-agent.md"; Target = "task-planner-agent.md" }
)

# Create symbolic links in current directory
foreach ($entry in $sourceFiles) {
    $sourceFile = $entry.Source
    $targetName = $entry.Target
    if (Test-Path $sourceFile) {
        $targetPath = Join-Path $PWD $targetName
        
        # Remove existing symlink or file if it exists
        if (Test-Path $targetPath) {
            Write-Host "Removing existing file: $targetName" -ForegroundColor Yellow
            Remove-Item $targetPath -Force
        }
        
        # Create symbolic link
        try {
            New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourceFile -Force | Out-Null
            Write-Host "Created symlink: $targetName -> $sourceFile" -ForegroundColor Green
        }
        catch {
            Write-Host "Error creating symlink for $targetName : $_" -ForegroundColor Red
        }
    }
    else {
        Write-Host "Source file not found: $sourceFile" -ForegroundColor Red
    }
}

Write-Host "`nSymbolic links created successfully!" -ForegroundColor Cyan
