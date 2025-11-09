require( "ui_mp.T6.GameOptions" )

LUI.createMenu.EditModeSpecificOptions = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "EditModeSpecificOptions" )
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
	local gametype = Dvar.ui_gametype:get()
	local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	self:addTitle( Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( gametypeName ) ) )
	local subLevelSettings = CoD.GameOptions.SubLevelGametypeSettings[gametype]
	for index, setting in ipairs( subLevelSettings ) do
		self:addGametypeSetting( controller, setting )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return self
end

