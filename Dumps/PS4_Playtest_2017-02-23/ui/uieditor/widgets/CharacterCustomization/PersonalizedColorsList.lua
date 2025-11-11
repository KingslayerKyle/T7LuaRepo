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
	self:setLeftRight( 0, 0, 0, 139 )
	self:setTopBottom( 0, 0, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local colors = LUI.GridLayout.new( menu, controller, false, 0, 0, -4, 0, nil, nil, false, false, 0, 0, false, false )
	colors:setLeftRight( 0, 0, -13.5, 143.5 )
	colors:setTopBottom( 0, 0, 0, 45 )
	colors:setWidgetType( CoD.PersonalizedColorsListItem )
	colors:setHorizontalCount( 3 )
	colors:setSpacing( -4 )
	self:addElement( colors )
	self.colors = colors
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colors:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

