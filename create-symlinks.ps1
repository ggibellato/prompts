# Create symbolic links for prompt files in the current directory

# Define source files
$sourceFiles = @(
    "C:\dev\ZZZPrompt\prompts\base\architecture.md",
    "C:\dev\ZZZPrompt\prompts\base\behaviour.md",
    "C:\dev\ZZZPrompt\prompts\base\subagents\codebase-analyzer-agent.md",
    "C:\dev\ZZZPrompt\prompts\base\subagents\code-review-agent.md",
    "C:\dev\ZZZPrompt\prompts\base\role\csharp.md",
    "C:\dev\ZZZPrompt\prompts\base\subagents\task-planner-agent.md"
)

# Create symbolic links in current directory
foreach ($sourceFile in $sourceFiles) {
    if (Test-Path $sourceFile) {
        $fileName = Split-Path -Leaf $sourceFile
        $targetPath = Join-Path $PWD $fileName
        
        # Remove existing symlink or file if it exists
        if (Test-Path $targetPath) {
            Write-Host "Removing existing file: $fileName" -ForegroundColor Yellow
            Remove-Item $targetPath -Force
        }
        
        # Create symbolic link
        try {
            New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourceFile -Force | Out-Null
            Write-Host "Created symlink: $fileName -> $sourceFile" -ForegroundColor Green
        }
        catch {
            Write-Host "Error creating symlink for $fileName : $_" -ForegroundColor Red
        }
    }
    else {
        Write-Host "Source file not found: $sourceFile" -ForegroundColor Red
    }
}

Write-Host "`nSymbolic links created successfully!" -ForegroundColor Cyan
