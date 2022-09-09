-- 656cc96ddf9b8c0cab6198b2f77fab07
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.lootImage:linkToElementModel( f1_arg0, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local f2_local1 = ConvertToLootDecalIndexIfDecal( f1_arg1, modelValue )
			if f2_local1 == modelValue then
				f1_arg0.lootImage:setImage( RegisterImage( modelValue ) )
			else
				f1_arg0.lootImage:setupDrawDecalById( f2_local1 )
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
	self:setLeftRight( true, false, 0, 255 )
	self:setTopBottom( true, false, 0, 348 )
	
	local lootImage = LUI.UIImage.new()
	lootImage:setLeftRight( false, false, -104, 104 )
	lootImage:setTopBottom( false, false, -26, 26 )
	lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	lootImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( lootImage )
	self.lootImage = lootImage
	
	local itemImage = LUI.UIElement.new()
	itemImage:setLeftRight( false, false, -112.5, 112.5 )
	itemImage:setTopBottom( false, false, -78, 78 )
	itemImage:setAlpha( 0 )
	itemImage:linkToElementModel( self, "emblem", true, function ( model )
		local emblem = Engine.GetModelValue( model )
		if emblem then
			itemImage:setupEmblemByEmblemIndex( GetLootEmblemIndexParams( controller, emblem ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -103.75, 103.75 )
				self.lootImage:setTopBottom( false, false, -45, 45 )
				self.lootImage:setAlpha( 1 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -112.5, 112.5 )
				self.itemImage:setTopBottom( false, false, -78, 78 )
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		Dimensions4by1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -104, 104 )
				self.lootImage:setTopBottom( false, false, -26, 26 )
				self.lootImage:setAlpha( 1 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -112.5, 112.5 )
				self.itemImage:setTopBottom( false, false, -78, 78 )
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		Decal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -58, 58 )
				self.lootImage:setTopBottom( false, false, -55, 61 )
				self.lootImage:setAlpha( 0.75 )
				self.lootImage:setScale( 0.8 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -112.5, 112.5 )
				self.itemImage:setTopBottom( false, false, -78, 78 )
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		EpicTaunt = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -78, 78 )
				self.lootImage:setTopBottom( false, false, -86.3, 86.3 )
				self.lootImage:setAlpha( 1 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		LimitedItem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -78, 78 )
				self.lootImage:setTopBottom( false, false, -86.3, 86.3 )
				self.lootImage:setAlpha( 1 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		Dimensions1by1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -58, 58 )
				self.lootImage:setTopBottom( false, false, -58, 58 )
				self.lootImage:setAlpha( 1 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -112.5, 112.5 )
				self.itemImage:setTopBottom( false, false, -78, 78 )
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				lootImage:completeAnimation()
				self.lootImage:setLeftRight( false, false, -140, 140 )
				self.lootImage:setTopBottom( false, false, -35, 35 )
				self.lootImage:setAlpha( 0 )
				self.lootImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.lootImage:setShaderVector( 0, 1, 0, 0, 0 )
				self.clipFinished( lootImage, {} )

				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -77.88, 77.88 )
				self.itemImage:setTopBottom( false, false, -54, 54 )
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
			stateName = "EpicTaunt",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "category", "taunt" ) and IsSelfModelValueEqualTo( element, controller, "rarity", "epic" )
			end
		},
		{
			stateName = "LimitedItem",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarity", "limited" )
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
	self:linkToElementModel( self, "rarity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
