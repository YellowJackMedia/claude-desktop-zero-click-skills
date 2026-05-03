param(
  [string]$SourceRoot = $PSScriptRoot,
  [string]$Destination = "$env:USERPROFILE\.claude\skills"
)

$ErrorActionPreference = 'Stop'

$skillRoot = Join-Path $SourceRoot 'skills'
if (-not (Test-Path $skillRoot)) {
  throw "Skills folder not found: $skillRoot"
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null

Get-ChildItem -Path $skillRoot -Directory | ForEach-Object {
  $target = Join-Path $Destination $_.Name
  if (Test-Path $target) {
    Remove-Item -Recurse -Force $target
  }
  Copy-Item -Recurse -Force $_.FullName $target
  Write-Host "Installed $($_.Name) -> $target"
}

Write-Host "Done. Restart Claude Desktop."