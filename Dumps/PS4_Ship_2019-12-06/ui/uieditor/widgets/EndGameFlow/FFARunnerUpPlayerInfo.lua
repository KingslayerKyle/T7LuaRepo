require( "ui.uieditor.widgets.EndGameFlow.FFASideArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer_ExposedValues" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.HUD.Outcome.FFA_TextLabels" )

CoD.FFARunnerUpPlayerInfo = InheritFrom( LUI.UIElement )
CoD.FFARunnerUpPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FFARunnerUpPlayerInfo )
	self.id = "FFARunnerUpPlayerInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 567 )
	self:setTopBottom( true, false, 0, 94 )
	self.anyChildUsesUpdateState = true
	
	local FFASideArrow0 = CoD.FFASideArrow.new( menu, controller )
	FFASideArrow0:setLeftRight( false, true, -109, 22.33 )
	FFASideArrow0:setTopBottom( true, true, 0, 0 )
	FFASideArrow0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FFASideArrow0 )
	self.FFASideArrow0 = FFASideArrow0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer_ExposedValues.new( menu, controller )
	LeftPanel:setLeftRight( true, true, -65.95, -108 )
	LeftPanel:setTopBottom( true, true, 0, -1 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 0, 0.02, 0.1, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 1, 10, 10, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setupNineSliceShader( 10, 10 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Score0 = LUI.UITightText.new()
	Score0:setLeftRight( true, false, 466.07, 537 )
	Score0:setTopBottom( true, false, 28.25, 73.25 )
	Score0:setAlpha( 0 )
	Score0:setText( Engine.Localize( "30" ) )
	Score0:setTTF( "fonts/default.ttf" )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( true, false, 56, 145 )
	Emblem:setTopBottom( true, false, 8.5, 85 )
	Emblem:setAlpha( 0 )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local TempEmblem = LUI.UIImage.new()
	TempEmblem:setLeftRight( true, false, 34.11, 142.89 )
	TempEmblem:setTopBottom( true, false, 0, 93 )
	TempEmblem:setAlpha( 0 )
	TempEmblem:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( TempEmblem )
	self.TempEmblem = TempEmblem
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( false, true, -113, 7 )
	Score:setTopBottom( false, false, -26, 28 )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score:setShaderVector( 1, 0, 0, 0, 0 )
	Score:setShaderVector( 2, 0, 0, 0, 0 )
	Score:setShaderVector( 3, 0, 0, 0, 0 )
	Score:setShaderVector( 4, 0, 0.02, 0, 0 )
	Score.Numbers:setText( Engine.Localize( "XX" ) )
	self:addElement( Score )
	self.Score = Score
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, -7.32, 142.89 )
	emblem:setTopBottom( true, false, 1, 93 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local RibbonImageInvert = LUI.UIImage.new()
	RibbonImageInvert:setLeftRight( true, false, -64.95, -8.95 )
	RibbonImageInvert:setTopBottom( true, false, 0, 42 )
	RibbonImageInvert:setRGB( 0.6, 0.6, 0.6 )
	RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	RibbonImageInvert:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( RibbonImageInvert )
	self.RibbonImageInvert = RibbonImageInvert
	
	local Ribbon = LUI.UIImage.new()
	Ribbon:setLeftRight( true, false, -64.95, -8.95 )
	Ribbon:setTopBottom( true, false, 0, 42 )
	Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	Ribbon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Ribbon )
	self.Ribbon = Ribbon
	
	local FFAGamerTag = CoD.FFA_TextLabels.new( menu, controller )
	FFAGamerTag:setLeftRight( true, false, 152, 377 )
	FFAGamerTag:setTopBottom( true, false, 24, 52 )
	FFAGamerTag.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	self:addElement( FFAGamerTag )
	self.FFAGamerTag = FFAGamerTag
	
	local FFAClanTag = CoD.FFA_TextLabels.new( menu, controller )
	FFAClanTag:setLeftRight( true, false, 152, 212 )
	FFAClanTag:setTopBottom( true, false, 53, 78 )
	FFAClanTag.itemName:setText( Engine.Localize( "3ARC" ) )
	self:addElement( FFAClanTag )
	self.FFAClanTag = FFAClanTag
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FFASideArrow0:close()
		element.LeftPanel:close()
		element.Score:close()
		element.FFAGamerTag:close()
		element.FFAClanTag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

