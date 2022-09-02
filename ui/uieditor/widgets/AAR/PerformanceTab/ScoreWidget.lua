-- 194cb7036107632fd67a046d1130320f
-- This hash is used for caching, delete to decompile the file again

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
	ScoreLabel:setTTF( "fonts/escom.ttf" )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScoreLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local Score = CoD.KillcamWidgetNumbers.new( menu, controller )
	Score:setLeftRight( true, true, 0, 0 )
	Score:setTopBottom( false, false, -7, 43 )
	Score.Numbers:setRGB( 0.95, 0.91, 0.11 )
	Score.Numbers:setText( Engine.Localize( "2150" ) )
	self:addElement( Score )
	self.Score = Score
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -1.77, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 30, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 0, 89 )
	StartMenuIdentitySubTitle0:setTopBottom( true, false, -4, 22 )
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
				self.Score.Numbers:setRGB( 0.8, 0.8, 0.8 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.Score:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.StartMenuIdentitySubTitle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

