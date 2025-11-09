CoD.WeaponVariantIcon = InheritFrom( LUI.UIElement )
CoD.WeaponVariantIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponVariantIcon )
	self.id = "WeaponVariantIcon"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 0, 0 )
	icon:setTopBottom( true, true, 0, 0 )
	icon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

