CoD.FE_FeaturedCardsContainerControllerIndicator = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedCardsContainerControllerIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FE_FeaturedCardsContainerControllerIndicator )
	self.id = "FE_FeaturedCardsContainerControllerIndicator"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 12 )
	self:setTopBottom( 0, 0, 0, 12 )
	
	local dot = LUI.UIImage.new()
	dot:setLeftRight( 0, 0, 1, 10 )
	dot:setTopBottom( 0, 0, 4, 7 )
	dot:setRGB( 0.53, 0.53, 0.53 )
	dot:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( dot )
	self.dot = dot
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( 0, 0, 3, 9 )
	GlowOrangeOver:setTopBottom( 0, 0, -2, 13 )
	GlowOrangeOver:setRGB( 0.25, 0.25, 0.25 )
	GlowOrangeOver:setAlpha( 0.6 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.resetProperties = function ()
		dot:completeAnimation()
		GlowOrangeOver:completeAnimation()
		dot:setRGB( 0.53, 0.53, 0.53 )
		dot:setAlpha( 1 )
		dot:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
		GlowOrangeOver:setRGB( 0.25, 0.25, 0.25 )
		GlowOrangeOver:setAlpha( 0.6 )
		GlowOrangeOver:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				dot:completeAnimation()
				self.dot:setAlpha( 0.5 )
				self.clipFinished( dot, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				dot:completeAnimation()
				self.dot:setRGB( 1, 0.71, 0.36 )
				self.dot:setAlpha( 0.7 )
				self.dot:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
				self.clipFinished( dot, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 1, 0.31, 0 )
				self.GlowOrangeOver:setAlpha( 1 )
				self.GlowOrangeOver:setScale( 1.2 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToSelfModelValue( element, controller, "FeaturedCardsRoot.CardSequence", "sequence" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.CardSequence" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.CardSequence"
		} )
	end )
	self:linkToElementModel( self, "sequence", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "sequence"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

