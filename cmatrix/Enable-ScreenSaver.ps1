function Enable-ScreenSaver {
   
    if (-not $_ssdisabled) {
        write-warning "Screensaver is not disabled."
        return
    }
   
    $global:_ssdisabled = $false    
}
