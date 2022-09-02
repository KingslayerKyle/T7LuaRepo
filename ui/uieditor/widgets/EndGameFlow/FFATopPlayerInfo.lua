-- 869e02acbc77def4aeab007be8272b4c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.FFASideArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer_ExposedValues" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.HUD.Outcome.FFA_TextLabels" )

CoD.FFATopPlayerInfo = InheritFrom( LUI.UIElement )
CoD.FFATopPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FFATopPlayerInfo )
	self.id = "FFATopPlayerInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 692 )
	self:setTopBottom( true, false, 0, 143 )
	self.anyChildUsesUpdateState = true
	
	local FFASideArrow0 = CoD.FFASideArrow.new( menu, controller )
	FFASideArrow0:setLeftRight( true, false, 508, 721 )
	FFASideArrow0:setTopBottom( true, false, -1, 143 )
	FFASideArrow0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FFASideArrow0 )
	self.FFASideArrow0 = FFASideArrow0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer_ExposedValues.new( menu, controller )
	LeftPanel:setLeftRight( true, false, -118.84, 509 )
	LeftPanel:setTopBottom( true, false, 0, 142 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 0, 0.02, 0.1, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 1, 10, 10, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setupNineSliceShader( 10, 10 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local RibbonSolid = LUI.UIImage.new()
	RibbonSolid:setLeftRight( true, false, -118.84, -54.84 )
	RibbonSolid:setTopBottom( true, false, -1, 47 )
	RibbonSolid:setRGB( 0.64, 0.64, 0.64 )
	RibbonSolid:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	RibbonSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( RibbonSolid )
	self.RibbonSolid = RibbonSolid
	
	local Ribbon = LUI.UIImage.new()
	Ribbon:setLeftRight( true, false, -118.84, -54.84 )
	Ribbon:setTopBottom( true, false, -1, 47 )
	Ribbon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	Ribbon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Ribbon )
	self.Ribbon = Ribbon
	
	local Score0 = LUI.UITightText.new()
	Score0:setLeftRight( true, false, 548.07, 620.5 )
	Score0:setTopBottom( true, false, 40.25, 88.25 )
	Score0:setAlpha( 0 )
	Score0:setText( Engine.Localize( "30" ) )
	Score0:setTTF( "fonts/default.ttf" )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local TempEmblem = LUI.UIImage.new()
	TempEmblem:setLeftRight( true, false, 65, 193 )
	TempEmblem:setTopBottom( true, false, 7.25, 135.25 )
	TempEmblem:setAlpha( 0 )
	TempEmblem:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( TempEmblem )
	self.TempEmblem = TempEmblem
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( false, false, 153, 357 )
	Score:setTopBottom( false, false, -46.38, 47.88 )
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
	emblem:setLeftRight( true, false, -56.84, 175 )
	emblem:setTopBottom( true, false, 0, 142 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local FFAGamerTag = CoD.FFA_TextLabels.new( menu, controller )
	FFAGamerTag:setLeftRight( true, false, 186, 428 )
	FFAGamerTag:setTopBottom( true, false, 36, 63 )
	FFAGamerTag.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	self:addElement( FFAGamerTag )
	self.FFAGamerTag = FFAGamerTag
	
	local FFAClanTag = CoD.FFA_TextLabels.new( menu, controller )
	FFAClanTag:setLeftRight( true, false, 186, 245 )
	FFAClanTag:setTopBottom( true, false, 64, 90 )
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

