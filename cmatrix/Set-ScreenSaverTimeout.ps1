function Set-ScreenSaverTimeout {
    [cmdletbinding(defaultparametersetname="int")]
    param(
        [parameter(position=0, mandatory=$true, parametersetname="int")]
        [int]$Seconds,
       
        [parameter(position=0, mandatory=$true, parametersetname="timespan")]
        [Timespan]$Timespan
    )
   
    if ($pscmdlet.parametersetname -eq "int") {
        $timespan = new-timespan -seconds $Seconds
    }
   
    if ($timespan.totalseconds -lt 1) {
        throw "Timeout must be greater than 0 seconds."
    }
   
    $global:_sstimeout = $timespan.totalseconds
}
