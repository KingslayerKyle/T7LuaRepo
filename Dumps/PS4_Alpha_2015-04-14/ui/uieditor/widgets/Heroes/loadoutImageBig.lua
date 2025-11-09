CoD.loadoutImageBig = InheritFrom( LUI.UIElement )
CoD.loadoutImageBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.loadoutImageBig )
	self.id = "loadoutImageBig"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -128, 128 )
	image:setTopBottom( false, false, -128, 128 )
	image:setRGB( 1, 1, 1 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "imageBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local lock = LUI.UIImage.new()
	lock:setLeftRight( false, false, -64, 64 )
	lock:setTopBottom( false, false, -64, 64 )
	lock:setRGB( 1, 1, 1 )
	lock:setAlpha( 0 )
	lock:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lock:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lock )
	self.lock = lock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setLeftRight( false, false, -128, 128 )
				self.image:setTopBottom( false, false, -128, 128 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setLeftRight( false, false, -128, 128 )
				self.image:setTopBottom( false, false, -64, 64 )
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 0 )
				self.clipFinished( lock, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
				lock:completeAnimation()
				self.lock:setAlpha( 1 )
				self.clipFinished( lock, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return HeroUsingWeapon( self, controller )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.image:close()
		CoD.loadoutImageBig.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

