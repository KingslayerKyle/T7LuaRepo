CoD.MainItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.MainItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MainItemCardWidget_Internal )
	self.id = "MainItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 538 )
	self:setTopBottom( true, false, 0, 128 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 25, 0 )
	bgImage:setRGB( 0.34, 0.37, 0.46 )
	bgImage:setAlpha( 0.3 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local weaponImage = LUI.UIImage.new()
	weaponImage:setLeftRight( true, true, 168, -168 )
	weaponImage:setTopBottom( true, false, 25, 126 )
	weaponImage:setRGB( 1, 1, 1 )
	weaponImage:setAlpha( 0 )
	weaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	weaponImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( weaponImage )
	self.weaponImage = weaponImage
	
	local weaponName = LUI.UITightText.new()
	weaponName:setLeftRight( true, false, 3, 54 )
	weaponName:setTopBottom( false, true, -25, 0 )
	weaponName:setRGB( 0.9, 0.9, 0.9 )
	weaponName:setAlpha( 0 )
	weaponName:setTTF( "fonts/default.ttf" )
	weaponName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponName )
	self.weaponName = weaponName
	
	local plus = LUI.UIImage.new()
	plus:setLeftRight( false, false, -16, 16 )
	plus:setTopBottom( true, false, 59.5, 91.5 )
	plus:setRGB( 0.4, 0.44, 0.52 )
	plus:setAlpha( 0 )
	plus:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	plus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( plus )
	self.plus = plus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponImage:completeAnimation()
				self.weaponImage:setAlpha( 1 )
				self.clipFinished( weaponImage, {} )
				weaponName:completeAnimation()
				self.weaponName:setAlpha( 1 )
				self.clipFinished( weaponName, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponImage:completeAnimation()
				self.weaponImage:setAlpha( 0 )
				self.clipFinished( weaponImage, {} )
				weaponName:completeAnimation()
				self.weaponName:setAlpha( 0 )
				self.clipFinished( weaponName, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0.3 )
				self.clipFinished( plus, {} )
			end
		}
	}
	self.close = function ( self )
		self.weaponImage:close()
		self.weaponName:close()
		CoD.MainItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

