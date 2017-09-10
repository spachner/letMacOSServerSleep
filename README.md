# let MacOS Server Sleep again
MacOS Server inhibits automatically sleep the Mac. Get around this limitation and save energy.

This script check periodically if it makes sense to let your Mac sleep. When your Mac is allowed to get waken by external access and your router is enabled to do so, too, there should be no limitation using your Mac Server but saves energy. I personally use only the Mac Server contacts servered by CardDAV for my Android smartphone. Works fine!

When one the the following is true sleep is inhibit:
* Screen is on (so someone is currently using the Mac)
* EyeTV is active, which is one of
  * recording
  * exporting
  * compacting
  * playback
* Spotify is playing
* Timemachine is running
    
