function Write-FrameBuffer {
    param($maxColumns)
 
    # do we need a new column?
    if ($columns.count -lt $maxcolumns) {
       
        # incur staggering of columns with get-random
        # by only adding a new one 50% of the time
        if ((get-random -min 0 -max 10) -lt 5) {
           
            # search for a column not current animating
            do {
                $x = get-random -min 0 -max ($winsize.width - 1)
            } while ($columns.containskey($x))
           
            $columns.add($x, (new-column $x))
           
        }
    }
   
    $script:framenum++
}
