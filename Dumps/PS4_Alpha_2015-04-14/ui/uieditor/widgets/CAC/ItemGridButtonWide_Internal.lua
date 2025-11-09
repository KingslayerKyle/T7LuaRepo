CoD.ItemGridButtonWide_Internal = InheritFrom( LUI.UIElement )
CoD.ItemGridButtonWide_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ItemGridButtonWide_Internal )
	self.id = "ItemGridButtonWide_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 90 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.4, 0.44, 0.52 )
	bgImage:setAlpha( 0.1 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local headerBgImage = LUI.UIImage.new()
	headerBgImage:setLeftRight( true, true, 0, 0 )
	headerBgImage:setTopBottom( true, false, 0, 24 )
	headerBgImage:setRGB( 0.34, 0.37, 0.46 )
	headerBgImage:setAlpha( 0.44 )
	headerBgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( headerBgImage )
	self.headerBgImage = headerBgImage
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 4, 90 )
	nameLabel:setTopBottom( true, false, 2, 22 )
	nameLabel:setRGB( 1, 1, 1 )
	nameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( false, false, -29, 29 )
	itemImage:setTopBottom( false, true, -62, -4 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( false, true, -20, -4 )
	alertIcon:setTopBottom( true, false, 4, 20 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "uie_t7_hud_cac_warning_16" ) )
	alertIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -20, -4 )
	equippedIcon:setTopBottom( true, false, 4, 20 )
	equippedIcon:setRGB( 0.1, 0.65, 0.09 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	equippedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		}
	}
	self.close = function ( self )
		self.nameLabel:close()
		CoD.ItemGridButtonWide_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

