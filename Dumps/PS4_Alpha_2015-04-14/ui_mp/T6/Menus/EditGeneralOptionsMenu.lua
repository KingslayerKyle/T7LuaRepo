require( "ui_mp.T6.GameOptions" )

LUI.createMenu.EditGeneralOptions = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "EditGeneralOptions" )
	local background = LUI.UIImage.new( {
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
	background:setPriority( -100 )
	self:addElement( background )
	self:addTitle( Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ) )
	for index, setting in ipairs( CoD.GameOptions.GeneralSettings ) do
		self:addGametypeSetting( controller, setting )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return self
end

