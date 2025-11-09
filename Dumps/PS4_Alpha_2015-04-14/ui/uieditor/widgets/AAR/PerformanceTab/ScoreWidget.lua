require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetNumbers" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
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
	self:setLeftRight( true, false, 0, 281 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 5.11, -5.89 )
	FEButtonPanel0:setTopBottom( true, true, 36.48, -6.48 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local ScoreLabel = LUI.UIText.new()
	ScoreLabel:setLeftRight( true, true, 0, 0 )
	ScoreLabel:setTopBottom( true, false, 0, 20 )
	ScoreLabel:setRGB( 0.88, 0.89, 0.91 )
	ScoreLabel:setAlpha( 0 )
	ScoreLabel:setText( Engine.Localize( "MPUI_SCORE_CAPS" ) )
	ScoreLabel:setTTF( "fonts/Entovo.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( true, true, 0, 0 )
	Score:setTopBottom( false, false, -7.05, 43.5 )
	Score:setRGB( 1, 1, 1 )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Score:setShaderVector( 0, 0.2, 0, 0, 0 )
	Score:setShaderVector( 1, 0, 0, 0, 0 )
	Score:setShaderVector( 2, 0, 0, 0, 0 )
	Score:setShaderVector( 3, 0, 0, 0, 0 )
	Score:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	Score.Numbers:setRGB( 0.95, 0.91, 0.11 )
	Score.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score )
	self.Score = Score
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -1.77, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 30, 0 )
	cacButtonBoxLrgInactiveStroke0:setRGB( 1, 1, 1 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 0, 88 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, -4, 22 )
	StartMenuIdentitySubTitle0:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0.SubTitle:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Score:completeAnimation()
				Score.Numbers:completeAnimation()
				self.Score.Numbers:setRGB( 0.59, 0.64, 0.74 )
				self.clipFinished( Score, {} )
			end
		},
		Best = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Score:completeAnimation()
				Score.Numbers:completeAnimation()
				self.Score.Numbers:setRGB( 0.95, 0.91, 0.11 )
				self.clipFinished( Score, {} )
			end
		}
	}
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.Score:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.StartMenuIdentitySubTitle0:close()
		CoD.ScoreWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

