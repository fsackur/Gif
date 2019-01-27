function Register-Timer {
 
    # prevent prompt from reregistering if explicit disable
    if ($_ssdisabled) {
        return
    }
   
    if (-not (Test-Path variable:global:_ssjob)) {
       
        # register our counter job
        $global:_ssjob = Register-ObjectEvent $_sstimer elapsed -action {
           
            $global:_sscount++;
            $global:_sssrcid = $event.sourceidentifier
               
            # hit timeout yet?
            if ($_sscount -eq $_sstimeout) {
               
                # disable this event (prevent choppiness)
                Unregister-Event -sourceidentifier $_sssrcid
                Remove-Variable _ssjob -scope Global
                           
                sleep -seconds 1
                     
                # start ss
                Start-ScreenSaver
            }
 
        }
    }
}
