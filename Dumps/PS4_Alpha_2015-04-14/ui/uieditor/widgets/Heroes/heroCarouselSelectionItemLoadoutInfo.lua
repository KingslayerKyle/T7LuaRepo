CoD.heroCarouselSelectionItemLoadoutInfo = InheritFrom( LUI.UIElement )
CoD.heroCarouselSelectionItemLoadoutInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselSelectionItemLoadoutInfo )
	self.id = "heroCarouselSelectionItemLoadoutInfo"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 222 )
	self:setTopBottom( true, false, 0, 157 )
	
	local weaponBacking = LUI.UIImage.new()
	weaponBacking:setLeftRight( true, false, 7, 215 )
	weaponBacking:setTopBottom( true, false, 127, 157 )
	weaponBacking:setRGB( 0, 0, 0 )
	weaponBacking:setAlpha( 0.5 )
	weaponBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( weaponBacking )
	self.weaponBacking = weaponBacking
	
	local loadoutImage = LUI.UIImage.new()
	loadoutImage:setLeftRight( false, false, -111, 111 )
	loadoutImage:setTopBottom( true, false, 5, 116 )
	loadoutImage:setRGB( 1, 1, 1 )
	loadoutImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	loadoutImage:linkToElementModel( self, "loadoutImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( loadoutImage )
	self.loadoutImage = loadoutImage
	
	local loadoutText = LUI.UIText.new()
	loadoutText:setLeftRight( false, false, -111, 111 )
	loadoutText:setTopBottom( true, false, 132, 157 )
	loadoutText:setRGB( 1, 1, 1 )
	loadoutText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	loadoutText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	loadoutText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	loadoutText:linkToElementModel( self, "loadoutName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			loadoutText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( loadoutText )
	self.loadoutText = loadoutText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				loadoutImage:completeAnimation()
				self.loadoutImage:setLeftRight( false, false, -64, 64 )
				self.loadoutImage:setTopBottom( true, false, 0, 128 )
				self.clipFinished( loadoutImage, {} )
			end
		},
		UsingWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				loadoutImage:completeAnimation()
				self.loadoutImage:setLeftRight( false, false, -111, 111 )
				self.loadoutImage:setTopBottom( true, false, 8.5, 119.5 )
				self.clipFinished( loadoutImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.loadoutImage:close()
		self.loadoutText:close()
		CoD.heroCarouselSelectionItemLoadoutInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

