CoD.SecondaryWeaponSlotAttachmentItem = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponSlotAttachmentItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SecondaryWeaponSlotAttachmentItem )
	self.id = "SecondaryWeaponSlotAttachmentItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 60 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.34, 0.37, 0.46 )
	background:setAlpha( 0.3 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local notAvailableImage = LUI.UIImage.new()
	notAvailableImage:setLeftRight( true, false, -12, 188 )
	notAvailableImage:setTopBottom( true, false, -20, 80 )
	notAvailableImage:setAlpha( 0 )
	notAvailableImage:setImage( RegisterImage( "uie_t7_menu_mp_cac_panelna_200x99" ) )
	notAvailableImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( notAvailableImage )
	self.notAvailableImage = notAvailableImage
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( false, false, -25, 25 )
	iconImage:setTopBottom( false, false, -25, 25 )
	iconImage:setRGB( 1, 1, 1 )
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
	
	local plus = LUI.UIImage.new()
	plus:setLeftRight( false, false, -16, 16 )
	plus:setTopBottom( false, false, -16, 16 )
	plus:setRGB( 0.4, 0.44, 0.52 )
	plus:setAlpha( 0 )
	plus:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	plus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( plus )
	self.plus = plus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0.2 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0.2 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				notAvailableImage:completeAnimation()
				self.notAvailableImage:setAlpha( 0 )
				self.clipFinished( notAvailableImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0.3 )
				self.clipFinished( plus, {} )
			end
		}
	}
	self.close = function ( self )
		self.iconImage:close()
		CoD.SecondaryWeaponSlotAttachmentItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

