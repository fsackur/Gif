function New-Column {
    param($x)
   
    # return a new module that represents the column of letters and its state
    # we also pass in a reference to the main screensaver module to be able to
    # access our console framebuffer functions.
   
    new-module -ascustomobject -name "col_$x" -script {
        param(
            [int]$startx,
            [PSModuleInfo]$parentModule
         )
       
        $script:xpos = $startx
        $script:ylimit = $host.ui.rawui.WindowSize.Height
 
        [int]$script:head = 1
        [int]$script:fade = 0
		$randomLengthVariation = (1 + (get-random -min -30 -max 50)/100)
        [int]$script:fadelen = [math]::Abs($ylimit / 3 * $randomLengthVariation)
       
        $script:fadelen += (get-random -min 0 -max $fadelen)
       
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
               
        Export-ModuleMember -function Step
       
    } -args $x, $executioncontext.sessionstate.module
}
