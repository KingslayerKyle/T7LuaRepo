require( "ui.uieditor.widgets.GameSettings.GameSettings_textboxBG" )

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
	self:setLeftRight( 0, 0, 0, 733 )
	self:setTopBottom( 0, 0, 0, 57 )
	
	local GameSettingstextboxBG = CoD.GameSettings_textboxBG.new( menu, controller )
	GameSettingstextboxBG:setLeftRight( 0, 1, 0, 0 )
	GameSettingstextboxBG:setTopBottom( 0, 1, 0, 0 )
	self:addElement( GameSettingstextboxBG )
	self.GameSettingstextboxBG = GameSettingstextboxBG
	
	local GameModeTextBox = LUI.UIText.new()
	GameModeTextBox:setLeftRight( 0, 0, 18, 716 )
	GameModeTextBox:setTopBottom( 0, 0, 9, 48 )
	GameModeTextBox:setText( LocalizedGameType( "Domination" ) )
	GameModeTextBox:setTTF( "fonts/escom.ttf" )
	GameModeTextBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	GameModeTextBox:setShaderVector( 0, 0.08, 0, 0, 0 )
	GameModeTextBox:setShaderVector( 1, 0, 0, 0, 0 )
	GameModeTextBox:setShaderVector( 2, 1, 0, 0, 0 )
	GameModeTextBox:setLetterSpacing( 1 )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameModeTextBox )
	self.GameModeTextBox = GameModeTextBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingstextboxBG:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

