function Start-ScreenSaver {
   
    # feel free to tweak maxcolumns and frame delay
    # currently 20 columns with 30ms wait
   
    Start-CMatrix -max 20 -frame 30
}
