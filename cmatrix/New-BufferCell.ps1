function New-BufferCell {
    param(
        [string]$Character,
        [consolecolor]$ForeGroundColor = $(get-buffercell 0 0).foregroundcolor,
        [consolecolor]$BackGroundColor = $(get-buffercell 0 0).backgroundcolor,
        [System.Management.Automation.Host.BufferCellType]$BufferCellType = "Complete"
    )
   
    $cell = new-object System.Management.Automation.Host.BufferCell
    $cell.Character = $Character
    $cell.ForegroundColor = $foregroundcolor
    $cell.BackgroundColor = $backgroundcolor
    $cell.BufferCellType = $buffercelltype
   
    $cell
}
