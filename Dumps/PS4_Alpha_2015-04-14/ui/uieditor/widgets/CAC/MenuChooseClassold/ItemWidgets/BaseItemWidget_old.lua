CoD.BaseItemWidget_old = InheritFrom( LUI.UIElement )
CoD.BaseItemWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BaseItemWidget_old )
	self.id = "BaseItemWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 87 )
	
	local itemItem = LUI.UIImage.new()
	itemItem:setLeftRight( true, false, 5, 65 )
	itemItem:setTopBottom( true, false, 22, 82 )
	itemItem:setRGB( 1, 1, 1 )
	itemItem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemItem:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemItem:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemItem )
	self.itemItem = itemItem
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( false, false, -43, 43 )
	itemName:setTopBottom( true, false, 8, 23 )
	itemName:setRGB( 0.86, 0.89, 0.75 )
	itemName:setAlpha( 0.8 )
	itemName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemItem:completeAnimation()
				self.itemItem:setAlpha( 1 )
				self.clipFinished( itemItem, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.8 )
				self.clipFinished( itemName, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemItem:close()
		self.itemName:close()
		CoD.BaseItemWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

