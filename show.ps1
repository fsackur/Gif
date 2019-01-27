#Join-Path $PSScriptRoot 'cmatrix' | Get-ChildItem -Filter '*.ps1' | ForEach-Object {. $_.FullName}

$FrameData = Import-PowerShellDataFile (Join-Path $PSScriptRoot 'GifFrames.psd1')
$FrameHeight = $FrameData.FrameHeight
$Frames = $FrameData.Frames


$Index = 0
while ($true)
{
    $CursorOffset = [Math]::Max(0, ([Console]::WindowHeight - $FrameHeight))

    [console]::Clear()
    [console]::SetCursorPosition(0, $CursorOffset)
    [console]::Write($Frames[$Index++])
    if ($Index -eq $Frames.Count) {$Index = 0}

    Start-Sleep -Milliseconds 60
}