function Set-BufferCell {
    [outputtype([System.Management.Automation.Host.buffercell])]
    param(
        [int]$x,
        [int]$y,
        [System.Management.Automation.Host.buffercell]$cell
    )
   
    $rect = new-rectangle $x $y $x $y
       
    # return previous
    get-buffercell $x $y
 
    # use "fill" overload with single cell rect    
    $host.ui.rawui.SetBufferContents($rect, $cell)
}
