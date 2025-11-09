CoD.OverCapacityItem_Internal = InheritFrom( LUI.UIElement )
CoD.OverCapacityItem_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverCapacityItem_Internal )
	self.id = "OverCapacityItem_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 150 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.4, 0.44, 0.52 )
	background:setAlpha( 0.1 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local header = LUI.UIImage.new()
	header:setLeftRight( true, true, 0, 0 )
	header:setTopBottom( true, false, 0, 35 )
	header:setRGB( 0.34, 0.37, 0.46 )
	header:setAlpha( 0.44 )
	header:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( header )
	self.header = header
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 5, 82 )
	itemName:setTopBottom( true, false, 5, 32.93 )
	itemName:setRGB( 0.9, 0.9, 0.9 )
	itemName:setTTF( "fonts/default.ttf" )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( false, false, -50, 50 )
	itemImage:setTopBottom( true, false, 40, 140 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local gadgetModItemImage = LUI.UIImage.new()
	gadgetModItemImage:setLeftRight( false, false, -50, 50 )
	gadgetModItemImage:setTopBottom( true, false, 40, 140 )
	gadgetModItemImage:setRGB( 0.95, 0.65, 0.13 )
	gadgetModItemImage:setAlpha( 0 )
	gadgetModItemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	gadgetModItemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gadgetModItemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( gadgetModItemImage )
	self.gadgetModItemImage = gadgetModItemImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -50, 50 )
				self.itemImage:setTopBottom( true, false, 40, 140 )
				self.clipFinished( itemImage, {} )
				gadgetModItemImage:completeAnimation()
				self.gadgetModItemImage:setAlpha( 0 )
				self.clipFinished( gadgetModItemImage, {} )
			end
		},
		GadgetMod = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				gadgetModItemImage:completeAnimation()
				self.gadgetModItemImage:setAlpha( 1 )
				self.clipFinished( gadgetModItemImage, {} )
			end
		},
		WideImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -100, 100 )
				self.itemImage:setTopBottom( true, false, 40, 140 )
				self.clipFinished( itemImage, {} )
				gadgetModItemImage:completeAnimation()
				self.gadgetModItemImage:setAlpha( 0 )
				self.clipFinished( gadgetModItemImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemName:close()
		self.itemImage:close()
		self.gadgetModItemImage:close()
		CoD.OverCapacityItem_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

