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
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 25 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, true, 0, 0 )
	fill:setTopBottom( true, true, 0, 0 )
	fill:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_backing" ) )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	fill:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fill:setRGB( modelValue )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 1, 1, 1 )
	backing:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_border" ) )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	self.close = function ( self )
		self.fill:close()
		CoD.PersonalizedColorsListItem_Small.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

