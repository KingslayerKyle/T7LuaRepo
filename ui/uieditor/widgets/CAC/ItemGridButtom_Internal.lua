-- f0a4ea99c9312238c3fd130e834b81f9
-- This hash is used for caching, delete to decompile the file again

CoD.ItemGridButtom_Internal = InheritFrom( LUI.UIElement )
CoD.ItemGridButtom_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ItemGridButtom_Internal )
	self.id = "ItemGridButtom_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 90 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.4, 0.44, 0.52 )
	bgImage:setAlpha( 0.1 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local headerBgImage = LUI.UIImage.new()
	headerBgImage:setLeftRight( true, true, 0, 0 )
	headerBgImage:setTopBottom( true, false, 0, 24 )
	headerBgImage:setRGB( 0.34, 0.37, 0.46 )
	headerBgImage:setAlpha( 0.44 )
	self:addElement( headerBgImage )
	self.headerBgImage = headerBgImage
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 4, 90 )
	nameLabel:setTopBottom( true, false, 2, 22 )
	nameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( false, false, -28, 28 )
	itemImage:setTopBottom( false, true, -60, -4 )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( false, true, -20, -4 )
	alertIcon:setTopBottom( true, false, 4, 20 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "uie_t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -20, -4 )
	equippedIcon:setTopBottom( true, false, 4, 20 )
	equippedIcon:setRGB( 0.1, 0.65, 0.09 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.nameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			nameLabel:setText( Engine.Localize( name ) )
		end
	end )
	self.itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.nameLabel:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
