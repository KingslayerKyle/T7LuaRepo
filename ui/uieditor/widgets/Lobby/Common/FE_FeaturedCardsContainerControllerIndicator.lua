-- 93a9ddc29de06a90f4ace9c1f57f6034
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local dot = LUI.UIImage.new()
	dot:setLeftRight( true, false, 1, 7 )
	dot:setTopBottom( true, false, 3, 5 )
	dot:setRGB( 0.53, 0.53, 0.53 )
	dot:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( dot )
	self.dot = dot
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 2, 6 )
	GlowOrangeOver:setTopBottom( true, false, -0.98, 8.98 )
	GlowOrangeOver:setRGB( 0.25, 0.25, 0.25 )
	GlowOrangeOver:setAlpha( 0.6 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				dot:completeAnimation()
				self.dot:setRGB( 0.53, 0.53, 0.53 )
				self.dot:setAlpha( 0.5 )
				self.clipFinished( dot, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 2, 6 )
				self.GlowOrangeOver:setTopBottom( true, false, -0.98, 8.98 )
				self.GlowOrangeOver:setRGB( 0.25, 0.25, 0.25 )
				self.GlowOrangeOver:setAlpha( 0.6 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				dot:completeAnimation()
				self.dot:setLeftRight( true, false, 1, 7 )
				self.dot:setTopBottom( true, false, 3, 5 )
				self.dot:setRGB( 1, 0.71, 0.36 )
				self.dot:setAlpha( 0.7 )
				self.dot:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
				self.clipFinished( dot, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 2, 6 )
				self.GlowOrangeOver:setTopBottom( true, false, -0.98, 8.98 )
				self.GlowOrangeOver:setRGB( 1, 0.31, 0 )
				self.GlowOrangeOver:setAlpha( 1 )
				self.GlowOrangeOver:setZRot( 90 )
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
