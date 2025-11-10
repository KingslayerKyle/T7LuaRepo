require( "ui_mp.T6.GameOptions" )

LUI.createMenu.EditModeSpecificOptions = function ( f1_arg0 )
	local f1_local0 = CoD.GameOptionsMenu.New( f1_arg0, "EditModeSpecificOptions" )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:setPriority( -100 )
	f1_local0:addElement( self )
	local f1_local2 = Dvar.ui_gametype:get()
	f1_local0:addTitle( Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f1_local2, "name_ref_caps" ) ) ) )
	for f1_local6, f1_local7 in ipairs( CoD.GameOptions.SubLevelGametypeSettings[f1_local2] ) do
		f1_local0:addGametypeSetting( f1_arg0, f1_local7 )
	end
	if not f1_local0.buttonList:restoreState() then
		f1_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return f1_local0
end

