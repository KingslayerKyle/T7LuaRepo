require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordWinnersCircleStat = InheritFrom( LUI.UIElement )
CoD.CombatRecordWinnersCircleStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordWinnersCircleStat )
	self.id = "CombatRecordWinnersCircleStat"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 82 )
	self:setTopBottom( 0, 0, 0, 153 )
	
	local RibbonImage = LUI.UIImage.new()
	RibbonImage:setLeftRight( 0.5, 0.5, -32, 32 )
	RibbonImage:setTopBottom( 0, 0, 9, 96 )
	RibbonImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RibbonImage )
	self.RibbonImage = RibbonImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 1, 1, -48, 0 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 0, 0, 105 )
	StartMenuframenoBG00:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( 0.5, 0.5, -32, 32 )
	StatValue:setTopBottom( 1, 1, -39, -9 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "888" ) )
	StatValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

