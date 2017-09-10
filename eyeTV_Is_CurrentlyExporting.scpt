
--eyeTV_Is_CurrentlyExporting
#returns true if EyeTV is currently exporting
#returns false if EyeTV is not currrently exporting
on eyeTV_Is_CurrentlyExporting()
	tell application "EyeTV"
		set eyeTV_is_Exporting to is_exporting

		if eyeTV_is_Exporting is true then
			return true
		else
			return false
		end if

	end tell
end eyeTV_Is_CurrentlyExporting

eyeTV_Is_CurrentlyExporting()
