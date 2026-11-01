$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Windows.Forms
$picker = New-Object System.Windows.Forms.OpenFileDialog
$picker.Title = 'Select all 15 WhatsApp house photos (Ctrl+A in their folder)'
$picker.Filter = 'House photos (*.jpg;*.jpeg;*.png)|*.jpg;*.jpeg;*.png'
$picker.Multiselect = $true
if ($picker.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) { exit }
$projectRoot = Split-Path -Parent $PSScriptRoot
$photoDir = Join-Path $projectRoot 'assets\houses'
$expected = @(
 'WhatsApp Image 2026-11-01 at 8.21.52 PM',
 'WhatsApp Image 2026-11-01 at 8.21.53 PM',
 'WhatsApp Image 2026-11-01 at 8.21.53 PM (1)',
 'WhatsApp Image 2026-11-01 at 8.21.53 PM (2)',
 'WhatsApp Image 2026-11-01 at 8.21.54 PM',
 'WhatsApp Image 2026-11-01 at 8.21.54 PM (1)',
 'WhatsApp Image 2026-11-01 at 8.21.54 PM (2)',
 'WhatsApp Image 2026-11-01 at 8.17.54 PM',
 'WhatsApp Image 2026-11-01 at 8.17.54 PM (1)',
 'WhatsApp Image 2026-11-01 at 8.17.54 PM (2)',
 'WhatsApp Image 2026-11-01 at 8.17.54 PM (3)',
 'WhatsApp Image 2026-11-01 at 8.17.54 PM (4)',
 'WhatsApp Image 2026-11-01 at 8.18.45 PM',
 'WhatsApp Image 2026-11-01 at 8.19.39 PM (1)',
 'WhatsApp Image 2026-11-01 at 8.19.39 PM'
)
$selected = @{}
foreach ($filePath in $picker.FileNames) { $selected[[IO.Path]::GetFileNameWithoutExtension($filePath)] = $filePath }
$missing = @($expected | Where-Object { -not $selected.ContainsKey($_) })
if ($missing.Count -gt 0) { Write-Host 'No website changes made. Select all 15 photos with their original filenames. Missing:'; $missing | ForEach-Object { Write-Host $_ }; exit 1 }
New-Item -ItemType Directory -Path $photoDir -Force | Out-Null
for ($photoIndex = 0; $photoIndex -lt $expected.Count; $photoIndex++) {
 $sourcePath = $selected[$expected[$photoIndex]]
 $destinationPath = Join-Path $photoDir ('home-{0:00}.jpg' -f ($photoIndex + 1))
 Copy-Item -LiteralPath $sourcePath -Destination $destinationPath -Force
}
Push-Location $projectRoot
try {
 & node (Join-Path $PSScriptRoot 'use-photos.cjs')
 if ($LASTEXITCODE -ne 0) { throw 'Could not update photo references.' }
 & node (Join-Path $PSScriptRoot 'build.cjs')
 if ($LASTEXITCODE -ne 0) { throw 'Build failed.' }
 Write-Host 'All 15 photos added. Refresh your browser with Ctrl+F5. Your project is ready for Vercel.'
} finally { Pop-Location }
