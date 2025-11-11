local PostLoadFunc = function ( self, controller )
	self.lootImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local lootDecal = ConvertToLootDecalIndexIfDecal( controller, modelValue )
			if lootDecal == modelValue then
				self.lootImage:setImage( RegisterImage( modelValue ) )
			else
				self.lootImage:setupDrawDecalById( lootDecal )
			end
		end
	end )
end

CoD.LootDecryptionImage = InheritFrom( LUI.UIElement )
CoD.LootDecryptionImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LootDecryptionImage )
	self.id = "LootDecryptionImage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 382 )
	self:setTopBottom( 0, 0, 0, 522 )
	
	local lootImage = LUI.UIImage.new()
	lootImage:setLeftRight( 0.5, 0.5, -156, 156 )
	lootImage:setTopBottom( 0.5, 0.5, -39, 39 )
	lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	lootImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( lootImage )
	self.lootImage = lootImage
	
	local itemImage = LUI.UIElement.new()
	itemImage:setLeftRight( 0.5, 0.5, -169, 169 )
	itemImage:setTopBottom( 0.5, 0.5, -117, 117 )
	itemImage:setAlpha( 0 )
	itemImage:linkToElementModel( self, "emblem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setupEmblemByEmblemIndex( GetLootEmblemIndexParams( controller, modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.resetProperties = function ()
		lootImage:completeAnimation()
		itemImage:completeAnimation()
		lootImage:setLeftRight( 0.5, 0.5, -156, 156 )
		lootImage:setTopBottom( 0.5, 0.5, -39, 39 )
		lootImage:setAlpha( 1 )
		lootImage:setScale( 1 )
		lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
		lootImage:setShaderVector( 0, 1, 0, 0, 0 )
		itemImage:setLeftRight( 0.5, 0.5, -169, 169 )
		itemImage:setTopBottom( 0.5, 0.5, -117, 117 )
		itemImage:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lootImage:completeAnimation()
				self.lootImage:setLeftRight( 0.5, 0.5, -155.5, 155.5 )
				self.lootImage:setTopBottom( 0.5, 0.5, -67.5, 67.5 )
				self.clipFinished( lootImage, {} )
			end
		},
		Dimensions4by1 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Decal = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lootImage:completeAnimation()
				self.lootImage:setLeftRight( 0.5, 0.5, -87, 87 )
				self.lootImage:setTopBottom( 0.5, 0.5, -83, 91 )
				self.lootImage:setAlpha( 0.75 )
				self.lootImage:setScale( 0.8 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( lootImage, {} )
			end
		},
		Dimensions1by1 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lootImage:completeAnimation()
				self.lootImage:setLeftRight( 0.5, 0.5, -87, 87 )
				self.lootImage:setTopBottom( 0.5, 0.5, -87, 87 )
				self.clipFinished( lootImage, {} )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				lootImage:completeAnimation()
				self.lootImage:setLeftRight( 0.5, 0.5, -210, 210 )
				self.lootImage:setTopBottom( 0.5, 0.5, -52.5, 52.5 )
				self.lootImage:setAlpha( 0 )
				self.clipFinished( lootImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( 0.5, 0.5, -117, 117 )
				self.itemImage:setTopBottom( 0.5, 0.5, -81, 81 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Dimensions4by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "calling_card" )
			end
		},
		{
			stateName = "Decal",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "decal" )
			end
		},
		{
			stateName = "Dimensions1by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToAnyValue5( element, controller, "category", "attachment_variant", "gesture", "taunt", "specialist_outfit", "reticle" )
			end
		},
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "emblem" )
			end
		}
	} )
	self:linkToElementModel( self, "category", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

