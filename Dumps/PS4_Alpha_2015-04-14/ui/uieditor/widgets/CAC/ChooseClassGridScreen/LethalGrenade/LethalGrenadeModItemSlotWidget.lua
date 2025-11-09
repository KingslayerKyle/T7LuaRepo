CoD.LethalGrenadeModItemSlotWidget = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModItemSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LethalGrenadeModItemSlotWidget )
	self.id = "LethalGrenadeModItemSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 131 )
	self:setTopBottom( true, false, 0, 91 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.34, 0.37, 0.46 )
	background:setAlpha( 0.3 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local notAvailableImage = LUI.UIImage.new()
	notAvailableImage:setLeftRight( true, false, -34.5, 165.5 )
	notAvailableImage:setTopBottom( true, false, -4.5, 95.5 )
	notAvailableImage:setRGB( 1, 1, 1 )
	notAvailableImage:setAlpha( 0 )
	notAvailableImage:setImage( RegisterImage( "uie_t7_menu_mp_cac_panelna_200x99" ) )
	notAvailableImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( notAvailableImage )
	self.notAvailableImage = notAvailableImage
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( false, false, -16, 16 )
	iconImage:setTopBottom( false, false, -16, 16 )
	iconImage:setRGB( 0.4, 0.44, 0.53 )
	iconImage:setAlpha( 0 )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	iconImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			iconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setRGB( 0.95, 0.65, 0.13 )
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0.2 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setRGB( 1, 1, 1 )
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0.2 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setRGB( 0.4, 0.44, 0.53 )
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.iconImage:close()
		CoD.LethalGrenadeModItemSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

