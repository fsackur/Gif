#Join-Path $PSScriptRoot 'cmatrix' | Get-ChildItem -Filter '*.ps1' | ForEach-Object {. $_.FullName}

$FrameData = Import-PowerShellDataFile (Join-Path $PSScriptRoot 'GifFrames.psd1')
$FrameHeight = $FrameData.FrameHeight
$Frames = $FrameData.Frames


$Index = 0
while ($true)
{
    [console]::Clear()
    [console]::SetCursorPosition(0, $CursorOffset)

    $BufferFrames[$Index] | ForEach {$Host.UI.RawUI.SetBufferContents($_.Item1, $_.Item2)}

    if ($Index -eq $BufferFrames.Count) {$Index = 0}

    Start-Sleep -Milliseconds 60
}