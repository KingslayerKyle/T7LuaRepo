-- dbee905aa06dd025a2096789cd27eca9
-- This hash is used for caching, delete to decompile the file again

CoD.ApothiconGatewormScoreboardBackground_Genesis = InheritFrom( LUI.UIElement )
CoD.ApothiconGatewormScoreboardBackground_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ApothiconGatewormScoreboardBackground_Genesis )
	self.id = "ApothiconGatewormScoreboardBackground_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 135 )
	
	local BaseGatewormOverlay = LUI.UIImage.new()
	BaseGatewormOverlay:setLeftRight( true, false, 2, 106 )
	BaseGatewormOverlay:setTopBottom( true, false, 30.52, 134.52 )
	BaseGatewormOverlay:setImage( RegisterImage( "uie_t7_base_dlc4_gateworm" ) )
	self:addElement( BaseGatewormOverlay )
	self.BaseGatewormOverlay = BaseGatewormOverlay
	
	local TextApothicon = LUI.UIText.new()
	TextApothicon:setLeftRight( false, false, -53.75, 53.75 )
	TextApothicon:setTopBottom( false, true, -134.52, -120.5 )
	TextApothicon:setRGB( 0.27, 0.25, 0.23 )
	TextApothicon:setText( Engine.Localize( "ZM_GENESIS_APOTHICONEGG" ) )
	TextApothicon:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextApothicon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextApothicon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextApothicon )
	self.TextApothicon = TextApothicon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BaseGatewormOverlay:completeAnimation()
				self.BaseGatewormOverlay:setAlpha( 0 )
				self.clipFinished( BaseGatewormOverlay, {} )

				TextApothicon:completeAnimation()
				self.TextApothicon:setAlpha( 0 )
				self.TextApothicon:setText( Engine.Localize( "ZM_GENESIS_APOTHICONEGG" ) )
				self.clipFinished( TextApothicon, {} )
			end
		},
		GateWorm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BaseGatewormOverlay:completeAnimation()
				self.BaseGatewormOverlay:setAlpha( 1 )
				self.clipFinished( BaseGatewormOverlay, {} )

				TextApothicon:completeAnimation()
				self.TextApothicon:setAlpha( 1 )
				self.TextApothicon:setText( Engine.Localize( "ZM_GENESIS_GATEWORM" ) )
				self.clipFinished( TextApothicon, {} )
			end
		},
		ApothiconEgg = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BaseGatewormOverlay:completeAnimation()
				self.BaseGatewormOverlay:setAlpha( 0 )
				self.clipFinished( BaseGatewormOverlay, {} )

				TextApothicon:completeAnimation()
				self.TextApothicon:setAlpha( 1 )
				self.TextApothicon:setText( Engine.Localize( "ZM_GENESIS_APOTHICONEGG" ) )
				self.clipFinished( TextApothicon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "GateWorm",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "player_gate_worm" )
			end
		},
		{
			stateName = "ApothiconEgg",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "player_apothicon_egg" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_gate_worm" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_gate_worm"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_apothicon_egg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_apothicon_egg"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

