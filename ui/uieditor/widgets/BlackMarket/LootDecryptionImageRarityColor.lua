-- 66410b5b17dd7b9d050a91df5ee59c6c
-- This hash is used for caching, delete to decompile the file again

CoD.LootDecryptionImageRarityColor = InheritFrom( LUI.UIElement )
CoD.LootDecryptionImageRarityColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LootDecryptionImageRarityColor )
	self.id = "LootDecryptionImageRarityColor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 255 )
	self:setTopBottom( true, false, 0, 348 )
	
	local Spin = LUI.UIImage.new()
	Spin:setLeftRight( true, true, -28.5, 28.5 )
	Spin:setTopBottom( true, true, -25, 25 )
	Spin:linkToElementModel( self, "rarity", true, function ( model )
		local rarity = Engine.GetModelValue( model )
		if rarity then
			Spin:setImage( RegisterImage( GetSpinImageForRarity( rarity ) ) )
		end
	end )
	self:addElement( Spin )
	self.Spin = Spin
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Looping = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Spin:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

