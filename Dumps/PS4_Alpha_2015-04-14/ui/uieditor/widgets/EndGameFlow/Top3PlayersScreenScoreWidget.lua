require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnLine" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )

CoD.Top3PlayersScreenScoreWidget = InheritFrom( LUI.UIElement )
CoD.Top3PlayersScreenScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Top3PlayersScreenScoreWidget )
	self.id = "Top3PlayersScreenScoreWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 107 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 1, 267 )
	LeftPanel:setTopBottom( true, false, -3, 105 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local PlayerCard = CoD.PlayerCard.new( menu, controller )
	PlayerCard:setLeftRight( true, false, 0, 276 )
	PlayerCard:setTopBottom( true, false, 36, 95 )
	PlayerCard:setRGB( 1, 1, 1 )
	PlayerCard.GamerTag.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	PlayerCard.ClanTag.itemName:setText( Engine.Localize( "[TREY}" ) )
	PlayerCard.TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	PlayerCard.Rank:setText( Engine.Localize( "55" ) )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( true, false, 0, 276 )
	Score0:setTopBottom( true, false, 0, 36 )
	Score0:setRGB( 1, 1, 1 )
	Score0:setAlpha( 0 )
	Score0:setText( Engine.Localize( "2140" ) )
	Score0:setTTF( "fonts/default.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local RibbonImageInvert = LUI.UIImage.new()
	RibbonImageInvert:setLeftRight( true, false, 46, 102 )
	RibbonImageInvert:setTopBottom( true, false, -4, 38 )
	RibbonImageInvert:setRGB( 0.6, 0.6, 0.6 )
	RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	RibbonImageInvert:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( RibbonImageInvert )
	self.RibbonImageInvert = RibbonImageInvert
	
	local RibbonImage = LUI.UIImage.new()
	RibbonImage:setLeftRight( true, false, 46, 102 )
	RibbonImage:setTopBottom( true, false, -4, 38 )
	RibbonImage:setRGB( 1, 1, 1 )
	RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon1" ) )
	RibbonImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RibbonImage )
	self.RibbonImage = RibbonImage
	
	local LeftPanelLnT0 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT0:setLeftRight( true, false, -3, 271 )
	LeftPanelLnT0:setTopBottom( true, false, -12, -4 )
	LeftPanelLnT0:setRGB( 0, 0, 0 )
	LeftPanelLnT0:setAlpha( 0.2 )
	self:addElement( LeftPanelLnT0 )
	self.LeftPanelLnT0 = LeftPanelLnT0
	
	local LeftPanelLnT00 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT00:setLeftRight( true, false, -3, 271 )
	LeftPanelLnT00:setTopBottom( true, false, 107, 115 )
	LeftPanelLnT00:setRGB( 0, 0, 0 )
	LeftPanelLnT00:setAlpha( 0.2 )
	LeftPanelLnT00:setXRot( 180 )
	self:addElement( LeftPanelLnT00 )
	self.LeftPanelLnT00 = LeftPanelLnT00
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( false, false, -57.5, 73 )
	Score:setTopBottom( false, false, -52.5, -12.5 )
	Score:setRGB( 1, 1, 1 )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score:setShaderVector( 1, 0, 0, 0, 0 )
	Score:setShaderVector( 2, 0, 0, 0, 0 )
	Score:setShaderVector( 3, 0, 0, 0, 0 )
	Score:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	Score.Numbers:setRGB( 0.59, 0.64, 0.74 )
	Score.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score )
	self.Score = Score
	
	self.close = function ( self )
		self.LeftPanel:close()
		self.PlayerCard:close()
		self.LeftPanelLnT0:close()
		self.LeftPanelLnT00:close()
		self.Score:close()
		CoD.Top3PlayersScreenScoreWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

