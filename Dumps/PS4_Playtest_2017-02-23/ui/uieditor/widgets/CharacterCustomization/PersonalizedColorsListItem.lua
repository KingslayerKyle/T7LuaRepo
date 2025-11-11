CoD.PersonalizedColorsListItem = InheritFrom( LUI.UIElement )
CoD.PersonalizedColorsListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizedColorsListItem )
	self.id = "PersonalizedColorsListItem"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 55 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( 0, 1, 3, -3 )
	fill:setTopBottom( 0, 1, 18, -20 )
	fill:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fill:setRGB( modelValue )
		end
	end )
	fill:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fill:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( fill )
	self.fill = fill
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 3, -3 )
	Image0:setTopBottom( 0, 1, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_mp_hero_colorswatch_border" ) )
	Image0:setupUIStreamedImage( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fill:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

