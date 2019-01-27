function Disable-ScreenSaver {
 
    if ((Test-Path variable:global:_ssjob)) {
 
        $global:_ssdisabled = $true
        Unregister-Event -SourceIdentifier $_sssrcid        
        Remove-Variable _ssjob -Scope global        
 
    } else {
        write-warning "Screen saver is not enabled."
    }
}
