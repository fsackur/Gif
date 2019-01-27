function Step {
           
            # reached the bottom yet?
            if ($head -lt $ylimit) {
 
                & $parentModule Set-BufferCell $xpos $head (
                    & $parentModule New-BufferCell -Character `
                        ([char](get-random -min 65 -max 122)) -Fore white) > $null
               
                & $parentModule Set-BufferCell $xpos ($head - 1) (
                    & $parentModule New-BufferCell -Character `
                        ([char](get-random -min 65 -max 122)) -Fore green) > $null
               
                $script:head++
            }

             # time to start rendering the darker green "tail?"
            if ($head -gt $fadelen) {

                & $parentModule Set-BufferCell $xpos $fade (
                    & $parentModule New-BufferCell -Character `
                        ([char](get-random -min 65 -max 122)) -Fore darkgreen) > $null

                # tail end
                $tail = $fade-1
                if ($tail -lt $ylimit) {
                    & $parentModule Set-BufferCell $xpos ($fade-1) (
                        & $parentModule New-BufferCell -Character `
                        ([char](get-random -min 65 -max 122)) -Fore black) > $null
                    }

                $script:fade++
            }


            # are we done animating?
            if ($fade -lt $ylimit) {
                return $true
            }

            # remove last row from tail end
            if (($fade - 1) -lt $ylimit) {
                & $parentModule Set-BufferCell $xpos ($fade - 1) (
                    & $parentModule New-BufferCell -Character `
                    ([char]' ') -Fore black) > $null
            }
                       
            $false            
        }
