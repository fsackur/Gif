function New-Coordinate {
    param([int]$x, [int]$y)
   
    new-object System.Management.Automation.Host.Coordinates $x, $y
}
