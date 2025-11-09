CoD.PrimaryWeaponSlotWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponSlotWidget )
	self.id = "PrimaryWeaponSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 495 )
	self:setTopBottom( true, false, 0, 128 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 25, 0 )
	bgImage:setRGB( 0.34, 0.37, 0.46 )
	bgImage:setAlpha( 0.29 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local groupNameLabel = LUI.UITightText.new()
	groupNameLabel:setLeftRight( true, false, 2, 88 )
	groupNameLabel:setTopBottom( true, false, 0, 25 )
	groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
	groupNameLabel:setTTF( "fonts/default.ttf" )
	groupNameLabel:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			groupNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( groupNameLabel )
	self.groupNameLabel = groupNameLabel
	
	local weaponImage = LUI.UIImage.new()
	weaponImage:setLeftRight( false, false, -101, 101 )
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
	plus:setTopBottom( true, false, 57, 89 )
	plus:setRGB( 0.4, 0.44, 0.52 )
	plus:setAlpha( 0 )
	plus:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	plus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( plus )
	self.plus = plus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				groupNameLabel:completeAnimation()
				self.groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
				self.groupNameLabel:setAlpha( 1 )
				self.clipFinished( groupNameLabel, {} )
				weaponImage:completeAnimation()
				self.weaponImage:setRGB( 1, 1, 1 )
				self.weaponImage:setAlpha( 1 )
				self.clipFinished( weaponImage, {} )
				weaponName:completeAnimation()
				self.weaponName:setRGB( 0.9, 0.9, 0.9 )
				self.weaponName:setAlpha( 1 )
				self.clipFinished( weaponName, {} )
				plus:completeAnimation()
				self.plus:setRGB( 0.4, 0.44, 0.52 )
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bgImage:completeAnimation()
				self.bgImage:setRGB( 0.34, 0.37, 0.46 )
				self.bgImage:setAlpha( 0.3 )
				self.clipFinished( bgImage, {} )
				groupNameLabel:completeAnimation()
				self.groupNameLabel:setRGB( 0.4, 0.44, 0.52 )
				self.groupNameLabel:setAlpha( 1 )
				self.clipFinished( groupNameLabel, {} )
				weaponImage:completeAnimation()
				self.weaponImage:setRGB( 1, 1, 1 )
				self.weaponImage:setAlpha( 0 )
				self.clipFinished( weaponImage, {} )
				weaponName:completeAnimation()
				self.weaponName:setRGB( 0.9, 0.9, 0.9 )
				self.weaponName:setAlpha( 0 )
				self.clipFinished( weaponName, {} )
				plus:completeAnimation()
				self.plus:setRGB( 0.4, 0.44, 0.52 )
				self.plus:setAlpha( 0.3 )
				self.clipFinished( plus, {} )
			end
		}
	}
	self.close = function ( self )
		self.groupNameLabel:close()
		self.weaponImage:close()
		self.weaponName:close()
		CoD.PrimaryWeaponSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

