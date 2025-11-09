require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnLine" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )

CoD.Top3PlayersScreenScoreWidget3 = InheritFrom( LUI.UIElement )
CoD.Top3PlayersScreenScoreWidget3.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Top3PlayersScreenScoreWidget3 )
	self.id = "Top3PlayersScreenScoreWidget3"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 107 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 0, 310 )
	LeftPanel:setTopBottom( true, false, -1, 107 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, false, 0, 310 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, false, -1, 107 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, false, 0, 310 )
	VSpanel:setTopBottom( true, false, -1, 107 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.5 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local PlayerCard = CoD.PlayerCard.new( menu, controller )
	PlayerCard:setLeftRight( true, false, 3, 300 )
	PlayerCard:setTopBottom( true, false, 46, 106 )
	PlayerCard.Image00001:setAlpha( 0 )
	PlayerCard.Image2:setAlpha( 0 )
	PlayerCard:linkToElementModel( self, nil, false, function ( model )
		PlayerCard:setModel( model, controller )
	end )
	PlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			PlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( true, false, 24, 300 )
	Score0:setTopBottom( true, false, 5, 41 )
	Score0:setAlpha( 0 )
	Score0:setTTF( "fonts/default.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score0:linkToElementModel( self, "score", true, function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			Score0:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	local RibbonImageInvert = LUI.UIImage.new()
	RibbonImageInvert:setLeftRight( true, false, 47, 103 )
	RibbonImageInvert:setTopBottom( true, false, -2, 40 )
	RibbonImageInvert:setRGB( 0.6, 0.6, 0.6 )
	RibbonImageInvert:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	RibbonImageInvert:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( RibbonImageInvert )
	self.RibbonImageInvert = RibbonImageInvert
	
	local RibbonImage = LUI.UIImage.new()
	RibbonImage:setLeftRight( true, false, 47, 103 )
	RibbonImage:setTopBottom( true, false, -2, 40 )
	RibbonImage:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_ribbon3" ) )
	RibbonImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RibbonImage )
	self.RibbonImage = RibbonImage
	
	local LeftPanelLnT0 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT0:setLeftRight( true, false, -4, 316 )
	LeftPanelLnT0:setTopBottom( true, false, -10, -2 )
	LeftPanelLnT0:setRGB( 0, 0, 0 )
	LeftPanelLnT0:setAlpha( 0.2 )
	self:addElement( LeftPanelLnT0 )
	self.LeftPanelLnT0 = LeftPanelLnT0
	
	local LeftPanelLnT00 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT00:setLeftRight( true, false, -4, 316 )
	LeftPanelLnT00:setTopBottom( true, false, 109, 117 )
	LeftPanelLnT00:setRGB( 0, 0, 0 )
	LeftPanelLnT00:setAlpha( 0.2 )
	LeftPanelLnT00:setXRot( 180 )
	self:addElement( LeftPanelLnT00 )
	self.LeftPanelLnT00 = LeftPanelLnT00
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( false, false, -53, 77 )
	Score:setTopBottom( false, false, -54, -14 )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score:setShaderVector( 1, 0, 0, 0, 0 )
	Score:setShaderVector( 2, 0, 0, 0, 0 )
	Score:setShaderVector( 3, 0, 0, 0, 0 )
	Score:setShaderVector( 4, 0, 0, 0, 0 )
	Score:linkToElementModel( self, "score", true, function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			Score.Numbers:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel:close()
		element.PlayerCard:close()
		element.LeftPanelLnT0:close()
		element.LeftPanelLnT00:close()
		element.Score:close()
		element.Score0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

