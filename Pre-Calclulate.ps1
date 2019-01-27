$Foreground = [Console]::ForegroundColor
$Background = [Console]::BackgroundColor

$BufferCell = [System.Management.Automation.Host.BufferCell]::new(
    [char]' ',
    $Foreground,
    $Background,
    [System.Management.Automation.Host.BufferCellType]::Complete
)
$CellsByChar = [System.Collections.Generic.Dictionary[char, System.Management.Automation.Host.BufferCell]]::new()
$CellsByChar.Add(
    [char]' ',
    $BufferCell
)

$BufferFrames = [
    System.Collections.Generic.List[
        System.Collections.Generic.List[
            System.Tuple[
                System.Management.Automation.Host.Rectangle,
                System.Management.Automation.Host.BufferCell
            ]
        ]
    ]]::new($Frames.Count)

$Frames.ForEach({

    $BufferFrame = [System.Collections.Generic.List[System.Tuple[
                System.Management.Automation.Host.Rectangle,
                System.Management.Automation.Host.BufferCell
            ]]]::new()
    $BufferFrames.Add($BufferFrame)

    $Lines = $Frames -split [regex]::Escape([Environment]::NewLine)
    $y = 0

    $Lines.ForEach({

        $Chars = [char[]]$_
        $PreviousChar = $Chars[0]

        $Startx = 0
        $Endx = 0

        $Chars = [char[]]$_

        Write-Debug "Current line (length $($_.Length)): '$_'"
        $Chars.ForEach({

            if ($_ -ne $PreviousChar)
            {
                $Endx--
                Write-Debug "$Startx-$Endx, $y-$y is char '$PreviousChar'"

                $Rectangle = [System.Management.Automation.Host.Rectangle]::new($Startx, $y, $Endx, $y)

                if (-not $CellsByChar.TryGetValue($PreviousChar, [ref]$BufferCell))
                {
                    $BufferCell = [System.Management.Automation.Host.BufferCell]::new(
                        $PreviousChar,
                        $Foreground,
                        $Background,
                        [System.Management.Automation.Host.BufferCellType]::Complete
                    )
                    $CellsByChar.Add($PreviousChar, $BufferCell)
                }
                $BufferFrame.Add([System.Tuple[
                    System.Management.Automation.Host.Rectangle,
                    System.Management.Automation.Host.BufferCell
                ]]::new($Rectangle, $BufferCell))

                $Endx++
                $Startx = $Endx
                $PreviousChar = $_
            }

            $Endx++
        })

        $y++
    })
})

