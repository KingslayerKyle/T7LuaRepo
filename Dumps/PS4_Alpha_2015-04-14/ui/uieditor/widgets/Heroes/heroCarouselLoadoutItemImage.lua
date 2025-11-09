CoD.heroCarouselLoadoutItemImage = InheritFrom( LUI.UIElement )
CoD.heroCarouselLoadoutItemImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselLoadoutItemImage )
	self.id = "heroCarouselLoadoutItemImage"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 80 )
	
	local loadoutImage = LUI.UIImage.new()
	loadoutImage:setLeftRight( false, false, -40, 40 )
	loadoutImage:setTopBottom( false, false, -20, 20 )
	loadoutImage:setRGB( 1, 1, 1 )
	loadoutImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	loadoutImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( loadoutImage )
	self.loadoutImage = loadoutImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				loadoutImage:completeAnimation()
				self.loadoutImage:setLeftRight( false, false, -40, 40 )
				self.loadoutImage:setTopBottom( false, false, -40, 40 )
				self.clipFinished( loadoutImage, {} )
			end
		},
		UsingWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				loadoutImage:completeAnimation()
				self.loadoutImage:setLeftRight( false, false, -40, 40 )
				self.loadoutImage:setTopBottom( false, false, -20, 20 )
				self.clipFinished( loadoutImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.loadoutImage:close()
		CoD.heroCarouselLoadoutItemImage.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

