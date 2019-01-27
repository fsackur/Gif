function Start-CMatrix {
    param(
        [int]$maxcolumns = 8,
        [int]$frameWait = 100
    )
 
    $script:winsize = $host.ui.rawui.WindowSize
    $script:columns = @{} # key: xpos; value; column
    $script:framenum = 0
       
    $prevbg = $host.ui.rawui.BackgroundColor
    $host.ui.rawui.BackgroundColor = "black"
    cls
   
    $done = $false        
   
    while (-not $done) {
 
        Write-FrameBuffer -maxcolumns $maxcolumns
 
        Show-FrameBuffer
       
        sleep -milli $frameWait
       
        $done = $host.ui.rawui.KeyAvailable        
    }
   
    $host.ui.rawui.BackgroundColor = $prevbg
    cls
}
