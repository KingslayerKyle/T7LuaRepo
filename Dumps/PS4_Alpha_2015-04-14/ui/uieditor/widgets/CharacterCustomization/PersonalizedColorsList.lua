require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsListItem" )

CoD.PersonalizedColorsList = InheritFrom( LUI.UIElement )
CoD.PersonalizedColorsList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizedColorsList )
	self.id = "PersonalizedColorsList"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 93 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local colors = LUI.GridLayout.new( menu, controller, false, 0, 0, -3, 0, nil, nil, false, false, 0, 0, false, false )
	colors:setLeftRight( true, false, -9, 96 )
	colors:setTopBottom( true, false, 0, 30 )
	colors:setRGB( 1, 1, 1 )
	colors:setWidgetType( CoD.PersonalizedColorsListItem )
	colors:setHorizontalCount( 3 )
	colors:setSpacing( -3 )
	self:addElement( colors )
	self.colors = colors
	
	self.close = function ( self )
		self.colors:close()
		CoD.PersonalizedColorsList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

