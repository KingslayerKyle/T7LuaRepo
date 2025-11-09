CoD.ChooseClass_ClassSetTabPip = InheritFrom( LUI.UIElement )
CoD.ChooseClass_ClassSetTabPip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseClass_ClassSetTabPip )
	self.id = "ChooseClass_ClassSetTabPip"
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
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				dot:completeAnimation()
				self.dot:setRGB( 0.13, 0.13, 0.13 )
				self.dot:setAlpha( 0.3 )
				self.clipFinished( dot, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 2, 6 )
				self.GlowOrangeOver:setTopBottom( true, false, -0.98, 8.98 )
				self.GlowOrangeOver:setRGB( 0.25, 0.25, 0.25 )
				self.GlowOrangeOver:setAlpha( 0.6 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsControllerModelValueEqualToSelfModelValue( element, controller, "currentClassSetIndex", "classSetId" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isDisabled" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentClassSetIndex"
		} )
	end )
	self:linkToElementModel( self, "classSetId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classSetId"
		} )
	end )
	self:linkToElementModel( self, "isDisabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isDisabled"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

