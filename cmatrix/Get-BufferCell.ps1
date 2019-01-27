function Get-BufferCell {
    param([int]$x, [int]$y)
   
    $rect = new-rectangle $x $y $x $y
   
    [System.Management.Automation.Host.buffercell[,]]$cells = $host.ui.RawUI.GetBufferContents($rect)    
   
    $cells[0,0]
}
