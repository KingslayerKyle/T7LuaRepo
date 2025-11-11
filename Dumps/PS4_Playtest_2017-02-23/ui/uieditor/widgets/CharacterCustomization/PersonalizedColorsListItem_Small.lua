CoD.PersonalizedColorsListItem_Small = InheritFrom( LUI.UIElement )
CoD.PersonalizedColorsListItem_Small.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizedColorsListItem_Small )
	self.id = "PersonalizedColorsListItem_Small"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 45 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( 0, 1, 0, 0 )
	fill:setTopBottom( 0, 1, 0, 0 )
	fill:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_backing" ) )
	fill:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fill:setRGB( modelValue )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_border" ) )
	self:addElement( backing )
	self.backing = backing
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fill:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

