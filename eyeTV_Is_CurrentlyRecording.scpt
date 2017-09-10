

--eyeTV_Is_CurrentlyRecording
#returns true if EyeTV is currently recording
#returns false if EyeTV is not currrently recording
on eyeTV_Is_CurrentlyRecording()
	tell application "EyeTV"
		set eyeTV_is_Recording to is_recording
		
		if eyeTV_is_Recording is true then
			return true
		else
			return false
		end if
		
	end tell
end eyeTV_Is_CurrentlyRecording

eyeTV_Is_CurrentlyRecording()