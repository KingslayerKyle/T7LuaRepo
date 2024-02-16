-- 92527e67a4d44fd26e57821c956e2c5c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.ChallengesCompletedWidgetTomb = InheritFrom( LUI.UIElement )
CoD.ChallengesCompletedWidgetTomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChallengesCompletedWidgetTomb )
	self.id = "ChallengesCompletedWidgetTomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 143 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 0, 345 )
	Backing:setTopBottom( false, false, -37, 72 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.64 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, false, -0.44, 345 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -72.5, -44.5 )
	FEButtonPanelShaderContainer:setRGB( 0, 0, 0 )
	FEButtonPanelShaderContainer:setAlpha( 0.8 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( true, false, 8, 338.11 )
	BackPanel:setTopBottom( false, false, -29.52, 64.52 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0.4 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, false, 0, 345 )
	HighlightFrame:setTopBottom( false, false, -37, 72 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -128, 133 )
	Title:setTopBottom( false, false, -70, -50 )
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
	
	local challenge1glow = CoD.onOffImage.new( menu, controller )
	challenge1glow:setLeftRight( true, false, 5, 89 )
	challenge1glow:setTopBottom( false, false, -27.5, 56.5 )
	challenge1glow.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_glow_small" ) )
	challenge1glow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_1", 1 )
			end
		}
	} )
	challenge1glow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_1" ), function ( model )
		menu:updateElementState( challenge1glow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_1"
		} )
	end )
	self:addElement( challenge1glow )
	self.challenge1glow = challenge1glow
	
	local challenge1icon = CoD.onOffImage.new( menu, controller )
	challenge1icon:setLeftRight( true, false, 5, 89 )
	challenge1icon:setTopBottom( false, false, -27.5, 56.5 )
	challenge1icon.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_kill" ) )
	challenge1icon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_1", 1 )
			end
		}
	} )
	challenge1icon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_1" ), function ( model )
		menu:updateElementState( challenge1icon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_1"
		} )
	end )
	self:addElement( challenge1icon )
	self.challenge1icon = challenge1icon
	
	local challenge2glow = CoD.onOffImage.new( menu, controller )
	challenge2glow:setLeftRight( true, false, 89, 173 )
	challenge2glow:setTopBottom( false, false, -27.5, 56.5 )
	challenge2glow.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_glow_small" ) )
	challenge2glow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_2", 1 )
			end
		}
	} )
	challenge2glow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_2" ), function ( model )
		menu:updateElementState( challenge2glow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_2"
		} )
	end )
	self:addElement( challenge2glow )
	self.challenge2glow = challenge2glow
	
	local challenge2icon = CoD.onOffImage.new( menu, controller )
	challenge2icon:setLeftRight( true, false, 89, 173 )
	challenge2icon:setTopBottom( false, false, -27.5, 56.5 )
	challenge2icon.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_level" ) )
	challenge2icon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_2", 1 )
			end
		}
	} )
	challenge2icon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_2" ), function ( model )
		menu:updateElementState( challenge2icon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_2"
		} )
	end )
	self:addElement( challenge2icon )
	self.challenge2icon = challenge2icon
	
	local challenge3glow = CoD.onOffImage.new( menu, controller )
	challenge3glow:setLeftRight( true, false, 172.5, 256.5 )
	challenge3glow:setTopBottom( false, false, -27.5, 56.5 )
	challenge3glow.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_glow_small" ) )
	challenge3glow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_3", 1 )
			end
		}
	} )
	challenge3glow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_3" ), function ( model )
		menu:updateElementState( challenge3glow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_3"
		} )
	end )
	self:addElement( challenge3glow )
	self.challenge3glow = challenge3glow
	
	local challenge3icon = CoD.onOffImage.new( menu, controller )
	challenge3icon:setLeftRight( true, false, 172.5, 256.5 )
	challenge3icon:setTopBottom( false, false, -27.5, 56.5 )
	challenge3icon.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_economy" ) )
	challenge3icon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_3", 1 )
			end
		}
	} )
	challenge3icon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_3" ), function ( model )
		menu:updateElementState( challenge3icon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_3"
		} )
	end )
	self:addElement( challenge3icon )
	self.challenge3icon = challenge3icon
	
	local challenge4glow = CoD.onOffImage.new( menu, controller )
	challenge4glow:setLeftRight( true, false, 256.5, 340.5 )
	challenge4glow:setTopBottom( false, false, -27.5, 56.5 )
	challenge4glow.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_glow_big" ) )
	challenge4glow:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueLessThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_4", 1 )
			end
		}
	} )
	challenge4glow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_4" ), function ( model )
		menu:updateElementState( challenge4glow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_4"
		} )
	end )
	self:addElement( challenge4glow )
	self.challenge4glow = challenge4glow
	
	local challenge4icon = CoD.onOffImage.new( menu, controller )
	challenge4icon:setLeftRight( true, false, 256.5, 340.5 )
	challenge4icon:setTopBottom( false, false, -27.5, 56.5 )
	challenge4icon.image:setImage( RegisterImage( "uie_t7_zm_hd_medal_team" ) )
	challenge4icon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.challenges.challenge_complete_4", 1 )
			end
		}
	} )
	challenge4icon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.challenges.challenge_complete_4" ), function ( model )
		menu:updateElementState( challenge4icon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.challenges.challenge_complete_4"
		} )
	end )
	self:addElement( challenge4icon )
	self.challenge4icon = challenge4icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )

				challenge1glow:completeAnimation()
				self.challenge1glow:setAlpha( 0 )
				self.clipFinished( challenge1glow, {} )

				challenge1icon:completeAnimation()
				self.challenge1icon:setAlpha( 0 )
				self.clipFinished( challenge1icon, {} )

				challenge2glow:completeAnimation()
				self.challenge2glow:setAlpha( 0 )
				self.clipFinished( challenge2glow, {} )

				challenge2icon:completeAnimation()
				self.challenge2icon:setAlpha( 0 )
				self.clipFinished( challenge2icon, {} )

				challenge3glow:completeAnimation()
				self.challenge3glow:setAlpha( 0 )
				self.clipFinished( challenge3glow, {} )

				challenge3icon:completeAnimation()
				self.challenge3icon:setAlpha( 0 )
				self.clipFinished( challenge3icon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.64 )
				self.clipFinished( Backing, {} )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0.8 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0.4 )
				self.clipFinished( BackPanel, {} )

				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 1 )
				self.clipFinished( HighlightFrame, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				challenge1glow:completeAnimation()
				self.challenge1glow:setAlpha( 1 )
				self.clipFinished( challenge1glow, {} )

				challenge1icon:completeAnimation()
				self.challenge1icon:setAlpha( 1 )
				self.clipFinished( challenge1icon, {} )

				challenge2glow:completeAnimation()
				self.challenge2glow:setAlpha( 1 )
				self.clipFinished( challenge2glow, {} )

				challenge2icon:completeAnimation()
				self.challenge2icon:setAlpha( 1 )
				self.clipFinished( challenge2icon, {} )

				challenge3glow:completeAnimation()
				self.challenge3glow:setAlpha( 1 )
				self.clipFinished( challenge3glow, {} )

				challenge3icon:completeAnimation()
				self.challenge3icon:setAlpha( 1 )
				self.clipFinished( challenge3icon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer:close()
		element.BackPanel:close()
		element.HighlightFrame:close()
		element.challenge1glow:close()
		element.challenge1icon:close()
		element.challenge2glow:close()
		element.challenge2icon:close()
		element.challenge3glow:close()
		element.challenge3icon:close()
		element.challenge4glow:close()
		element.challenge4icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
