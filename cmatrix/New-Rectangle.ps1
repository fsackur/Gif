function New-Rectangle {
    param(
        [int]$left,
        [int]$top,
        [int]$right,
        [int]$bottom
    )
   
    $rect = new-object System.Management.Automation.Host.Rectangle
    $rect.left= $left
    $rect.top = $top
    $rect.right =$right
    $rect.bottom = $bottom
   
    $rect
}
