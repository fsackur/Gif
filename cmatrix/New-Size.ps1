function New-Size {
    param([int]$width, [int]$height)
   
    new-object System.Management.Automation.Host.Size $width,$height
}
