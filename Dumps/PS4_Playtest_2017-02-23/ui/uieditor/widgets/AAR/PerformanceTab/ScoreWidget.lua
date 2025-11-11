require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.ScoreWidget = InheritFrom( LUI.UIElement )
CoD.ScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreWidget )
	self.id = "ScoreWidget"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 421 )
	self:setTopBottom( 0, 0, 0, 159 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 7, -9 )
	FEButtonPanel0:setTopBottom( 0, 1, 54, -10 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( 0, 1, 0, 0 )
	ScoreLabel:setTopBottom( 0, 0, 0, 30 )
	ScoreLabel:setRGB( 0.88, 0.89, 0.91 )
	ScoreLabel:setAlpha( 0 )
	ScoreLabel:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreLabel:setTTF( "fonts/escom.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( 0, 1, 0, 0 )
	Score:setTopBottom( 0.5, 0.5, -10, 65 )
	Score.Numbers:setRGB( 0.95, 0.91, 0.11 )
	Score.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score )
	self.Score = Score
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 44, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 0, 134 )
	StartMenuIdentitySubTitle0:setTopBottom( 0, 0, -6, 33 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.resetProperties = function ()
		Score:completeAnimation()
		Score.Numbers:setRGB( 0.95, 0.91, 0.11 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Score:completeAnimation()
				Score.Numbers:completeAnimation()
				self.Score.Numbers:setRGB( 0.8, 0.8, 0.8 )
				self.clipFinished( Score, {} )
			end
		},
		Best = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.Score:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.StartMenuIdentitySubTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

