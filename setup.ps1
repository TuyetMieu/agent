$roles = "human","planner","builder-small","builder-large","specialist",
         "reviewer","security","gemini-reviewer","capture",
         "visual-qa","visual-final","scout","curator"
foreach ($r in $roles) {
  New-Item -ItemType Directory -Force ".team/inbox/$r/done" | Out-Null
}
$dirs = ".team/decisions",".team/logs",".team/shots",
        "references/seed","references/candidates","references/auto",
        "references/rejected",".claude/agents","src"
foreach ($d in $dirs) { New-Item -ItemType Directory -Force $d | Out-Null }
if (-not (Test-Path "CLAUDE.md")) {
  [IO.File]::WriteAllText("$PWD/CLAUDE.md",
    "Read and follow .team/PROTOCOL.md before doing anything.`n")
}
if (-not (Test-Path "GEMINI.md")) { Copy-Item "CLAUDE.md" "GEMINI.md" }
Write-Host "Setup done."