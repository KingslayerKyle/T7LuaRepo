CoD.GameSettings_GameModeName = InheritFrom( LUI.UIElement )
CoD.GameSettings_GameModeName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_GameModeName )
	self.id = "GameSettings_GameModeName"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 38 )
	
	local GameModeTextBox = LUI.UIText.new()
	GameModeTextBox:setLeftRight( true, false, 23.5, 489 )
	GameModeTextBox:setTopBottom( true, false, 2, 36 )
	GameModeTextBox:setText( Engine.Localize( LocalizedGameType( "Domination" ) ) )
	GameModeTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameModeTextBox )
	self.GameModeTextBox = GameModeTextBox
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 0, 489 )
	Image00:setTopBottom( true, false, 0, 38 )
	Image00:setRGB( 0.5, 0.5, 0.5 )
	Image00:setAlpha( 0.25 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

