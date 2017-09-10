# letMacOSServerSleep
MacOS Server inhibits automatically sleep the mac. Get around this limitation and save energy

This script check periodically if it makes sense to let your Mac sleep. When your Mac is allow to get waken by external access and your router is enabled to do so, too there should be no limitation using your Mac Server but saves energy. I personally use onle the Mac Server contacts serverd by CardDAV for my Android smartphone.  

When one the the following is true sleep is inhibit:
    o screen is on (so someone is currently using the Mac)
    o EyeTV is active, which is one of
        o recording
        o exporting
        o compacting
        o playback
    o Spotify is playing
    o Timemachine is running
    
