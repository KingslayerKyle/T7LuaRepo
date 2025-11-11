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
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setRGB( 0.4, 0.44, 0.52 )
	bgImage:setAlpha( 0.1 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local headerBgImage = LUI.UIImage.new()
	headerBgImage:setLeftRight( 0, 1, 0, 0 )
	headerBgImage:setTopBottom( 0, 0, 0, 36 )
	headerBgImage:setRGB( 0.34, 0.37, 0.46 )
	headerBgImage:setAlpha( 0.44 )
	self:addElement( headerBgImage )
	self.headerBgImage = headerBgImage
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( 0, 0, 6, 135 )
	nameLabel:setTopBottom( 0, 0, 3, 33 )
	nameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0.5, 0.5, -43.5, 43.5 )
	itemImage:setTopBottom( 1, 1, -93, -6 )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( 1, 1, -30, -6 )
	alertIcon:setTopBottom( 0, 0, 6, 30 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( 1, 1, -30, -6 )
	equippedIcon:setTopBottom( 0, 0, 6, 30 )
	equippedIcon:setRGB( 0.1, 0.65, 0.09 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		equippedIcon:completeAnimation()
		alertIcon:completeAnimation()
		equippedIcon:setAlpha( 0 )
		alertIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.nameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

