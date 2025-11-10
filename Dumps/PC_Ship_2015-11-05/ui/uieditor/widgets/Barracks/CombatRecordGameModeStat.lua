require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordGameModeStat = InheritFrom( LUI.UIElement )
CoD.CombatRecordGameModeStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordGameModeStat )
	self.id = "CombatRecordGameModeStat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 166 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local WinsColorImage = LUI.UIImage.new()
	WinsColorImage:setLeftRight( false, true, -164, -153 )
	WinsColorImage:setTopBottom( true, false, 2, 29.5 )
	WinsColorImage:setRGB( 0.95, 0.91, 0.11 )
	self:addElement( WinsColorImage )
	self.WinsColorImage = WinsColorImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, 96, 166 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 32 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 0, 101 )
	StartMenuframenoBG00:setTopBottom( true, false, 0, 32 )
	StartMenuframenoBG00:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local WinsLabel = LUI.UIText.new()
	WinsLabel:setLeftRight( false, true, -145, -70 )
	WinsLabel:setTopBottom( true, false, 5.75, 25.75 )
	WinsLabel:setText( Engine.Localize( "MENU_WINS" ) )
	WinsLabel:setTTF( "fonts/default.ttf" )
	WinsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WinsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinsLabel )
	self.WinsLabel = WinsLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, 18, 76 )
	StatValue:setTopBottom( false, false, -11, 9 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "888" ) )
	StatValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

