function Show-FrameBuffer {
    param($frame)
   
    $completed=@()
   
    # loop through each active column and animate a single step/frame
    foreach ($entry in $columns.getenumerator()) {
       
        $column = $entry.value
   
        # if column has finished animating, add to the "remove" pile
        if (-not $column.step()) {            
            $completed += $entry.key
        }
    }
   
    # cannot remove from collection while enumerating, so do it here
    foreach ($key in $completed) {
        $columns.remove($key)
    }    
}
