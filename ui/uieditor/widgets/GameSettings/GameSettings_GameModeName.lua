-- f246a7f4ee762c5a6b802032b8034994
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 38 )
	
	local GameSettingstextboxBG = CoD.GameSettings_textboxBG.new( menu, controller )
	GameSettingstextboxBG:setLeftRight( true, true, 0, 0 )
	GameSettingstextboxBG:setTopBottom( true, true, 0, 0 )
	self:addElement( GameSettingstextboxBG )
	self.GameSettingstextboxBG = GameSettingstextboxBG
	
	local GameModeTextBox = LUI.UIText.new()
	GameModeTextBox:setLeftRight( true, false, 11.75, 477.25 )
	GameModeTextBox:setTopBottom( true, false, 6, 32 )
	GameModeTextBox:setText( Engine.Localize( LocalizedGameType( "Domination" ) ) )
	GameModeTextBox:setTTF( "fonts/escom.ttf" )
	GameModeTextBox:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	GameModeTextBox:setShaderVector( 0, 0.08, 0, 0, 0 )
	GameModeTextBox:setShaderVector( 1, 0, 0, 0, 0 )
	GameModeTextBox:setShaderVector( 2, 1, 0, 0, 0 )
	GameModeTextBox:setLetterSpacing( 1 )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameModeTextBox )
	self.GameModeTextBox = GameModeTextBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingstextboxBG:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

