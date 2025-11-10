require( "ui_mp.T6.GameOptions" )

LUI.createMenu.EditGeneralOptions = function ( f1_arg0 )
	local f1_local0 = CoD.GameOptionsMenu.New( f1_arg0, "EditGeneralOptions" )
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
	f1_local0:addTitle( Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ) )
	for f1_local5, f1_local6 in ipairs( CoD.GameOptions.GeneralSettings ) do
		f1_local0:addGametypeSetting( f1_arg0, f1_local6 )
	end
	if not f1_local0.buttonList:restoreState() then
		f1_local0.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return f1_local0
end

