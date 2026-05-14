CoD.T5AmmoEquipmentListItem = InheritFrom( LUI.UIElement )
CoD.T5AmmoEquipmentListItem.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T5AmmoEquipmentListItem )
	self.id = "T5AmmoEquipmentListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 27 )
	self:setTopBottom( true, false, 0, 27 )
	self.anyChildUsesUpdateState = true

	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, false, 0, 27 )
	self.image:setTopBottom( true, false, 0, 27 )
	self.image:setImage( RegisterImage( "blacktransparent" ) )
	self.image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )

		if image then
			self.image:setImage( RegisterImage( image ) )
		end
	end )
	self.image:linkToElementModel( self, "alpha", true, function ( model )
		local alpha = Engine.GetModelValue( model )

		if alpha then
			self.image:setAlpha( alpha )
		end
	end )
	self:addElement( self.image )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
