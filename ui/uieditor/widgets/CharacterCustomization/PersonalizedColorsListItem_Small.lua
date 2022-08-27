-- 3b2fdcb998560521c06989a030461a2e
-- This hash is used for caching, delete to decompile the file again

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
	fill:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			fill:setRGB( color )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_border" ) )
	self:addElement( backing )
	self.backing = backing
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

