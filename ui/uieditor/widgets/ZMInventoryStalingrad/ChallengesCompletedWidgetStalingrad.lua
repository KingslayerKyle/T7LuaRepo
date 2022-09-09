-- 7c6b336d5e0bb8ae02dc3b530db7a6f8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.ChallengeStateWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.ChallengesCompletedWidgetStalingrad = InheritFrom( LUI.UIElement )
CoD.ChallengesCompletedWidgetStalingrad.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChallengesCompletedWidgetStalingrad )
	self.id = "ChallengesCompletedWidgetStalingrad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 158 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, true, -256, 5 )
	Backing:setTopBottom( true, false, 37, 146 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.64 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, false, 0.56, 261.56 )
	FEButtonPanelShaderContainer:setTopBottom( true, false, 1.5, 29.5 )
	FEButtonPanelShaderContainer:setRGB( 0, 0, 0 )
	FEButtonPanelShaderContainer:setAlpha( 0.8 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( false, false, -120, 126.11 )
	BackPanel:setTopBottom( true, false, 43.48, 137.52 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0.4 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local ChallengeStateWidget1 = CoD.ChallengeStateWidget.new( menu, controller )
	ChallengeStateWidget1:setLeftRight( false, false, -39.5, 44.5 )
	ChallengeStateWidget1:setTopBottom( false, true, -104.5, -19.5 )
	ChallengeStateWidget1.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_01_outline" ) )
	ChallengeStateWidget1.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_01_new" ) )
	ChallengeStateWidget1.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_01" ) )
	ChallengeStateWidget1:mergeStateConditions( {
		{
			stateName = "TrialIncomplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge1state", 0 )
			end
		},
		{
			stateName = "TrialCompleteRewardUnclaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge1state", 1 )
			end
		},
		{
			stateName = "TrialCompleteRewardClaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge1state", 2 )
			end
		}
	} )
	ChallengeStateWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.challenge1state" ), function ( model )
		menu:updateElementState( ChallengeStateWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.challenge1state"
		} )
	end )
	self:addElement( ChallengeStateWidget1 )
	self.ChallengeStateWidget1 = ChallengeStateWidget1
	
	local ChallengeStateWidget2 = CoD.ChallengeStateWidget.new( menu, controller )
	ChallengeStateWidget2:setLeftRight( false, false, -121, -36 )
	ChallengeStateWidget2:setTopBottom( false, true, -104.5, -19.5 )
	ChallengeStateWidget2.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_02_outline" ) )
	ChallengeStateWidget2.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_02_new" ) )
	ChallengeStateWidget2.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_02" ) )
	ChallengeStateWidget2:mergeStateConditions( {
		{
			stateName = "TrialIncomplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge2state", 0 )
			end
		},
		{
			stateName = "TrialCompleteRewardUnclaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge2state", 1 )
			end
		},
		{
			stateName = "TrialCompleteRewardClaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge2state", 2 )
			end
		}
	} )
	ChallengeStateWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.challenge2state" ), function ( model )
		menu:updateElementState( ChallengeStateWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.challenge2state"
		} )
	end )
	self:addElement( ChallengeStateWidget2 )
	self.ChallengeStateWidget2 = ChallengeStateWidget2
	
	local ChallengeStateWidget3 = CoD.ChallengeStateWidget.new( menu, controller )
	ChallengeStateWidget3:setLeftRight( false, false, 42, 126 )
	ChallengeStateWidget3:setTopBottom( false, true, -104.5, -19.5 )
	ChallengeStateWidget3.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_03_outilne" ) )
	ChallengeStateWidget3.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_03_new" ) )
	ChallengeStateWidget3.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc3_tomb_challenge_medals_03" ) )
	ChallengeStateWidget3:mergeStateConditions( {
		{
			stateName = "TrialIncomplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge3state", 0 )
			end
		},
		{
			stateName = "TrialCompleteRewardUnclaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge3state", 1 )
			end
		},
		{
			stateName = "TrialCompleteRewardClaimed",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "trialWidget.challenge3state", 2 )
			end
		}
	} )
	ChallengeStateWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.challenge3state" ), function ( model )
		menu:updateElementState( ChallengeStateWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.challenge3state"
		} )
	end )
	self:addElement( ChallengeStateWidget3 )
	self.ChallengeStateWidget3 = ChallengeStateWidget3
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( false, true, -256, 5 )
	HighlightFrame:setTopBottom( true, false, 37, 146 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -128, 133 )
	Title:setTopBottom( true, false, 4, 24 )
	Title:setText( Engine.Localize( "ZM_STALINGRAD_TRIALS_COMPLETED" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.08, 0, 0, 0 )
	Title:setShaderVector( 1, 0, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )

				ChallengeStateWidget1:completeAnimation()
				self.ChallengeStateWidget1:setAlpha( 0 )
				self.clipFinished( ChallengeStateWidget1, {} )

				ChallengeStateWidget2:completeAnimation()
				self.ChallengeStateWidget2:setAlpha( 0 )
				self.clipFinished( ChallengeStateWidget2, {} )

				ChallengeStateWidget3:completeAnimation()
				self.ChallengeStateWidget3:setAlpha( 0 )
				self.clipFinished( ChallengeStateWidget3, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.64 )
				self.clipFinished( Backing, {} )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0.8 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0.4 )
				self.clipFinished( BackPanel, {} )

				ChallengeStateWidget1:completeAnimation()
				self.ChallengeStateWidget1:setAlpha( 1 )
				self.clipFinished( ChallengeStateWidget1, {} )

				ChallengeStateWidget2:completeAnimation()
				self.ChallengeStateWidget2:setAlpha( 1 )
				self.clipFinished( ChallengeStateWidget2, {} )

				ChallengeStateWidget3:completeAnimation()
				self.ChallengeStateWidget3:setAlpha( 1 )
				self.clipFinished( ChallengeStateWidget3, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 1 )
				self.clipFinished( HighlightFrame, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer:close()
		element.BackPanel:close()
		element.ChallengeStateWidget1:close()
		element.ChallengeStateWidget2:close()
		element.ChallengeStateWidget3:close()
		element.HighlightFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
