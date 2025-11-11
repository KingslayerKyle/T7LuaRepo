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
	self:setLeftRight( 0, 0, 0, 382 )
	self:setTopBottom( 0, 0, 0, 522 )
	
	local Spin = LUI.UIImage.new()
	Spin:setLeftRight( 0, 1, -43, 43 )
	Spin:setTopBottom( 0, 1, -38, 38 )
	Spin:linkToElementModel( self, "rarity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Spin:setImage( RegisterImage( GetSpinImageForRarity( modelValue ) ) )
		end
	end )
	self:addElement( Spin )
	self.Spin = Spin
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Spin:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

