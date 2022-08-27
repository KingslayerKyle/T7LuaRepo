-- 3f80cce9a170fc6a02f3dcbfecad78cc
-- This hash is used for caching, delete to decompile the file again

CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel )
	self.id = "PersonalizeCharacterCarouselItem_InfoAreaLabel"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 22 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 0, 0 )
	BlackBox:setTopBottom( true, true, 0, 0 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.6 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, false, 0, 200 )
	name:setTopBottom( true, false, 1, 21 )
	name:setTTF( "fonts/escom.ttf" )
	name:linkToElementModel( self, "categoryName", true, function ( model )
		local categoryName = Engine.GetModelValue( model )
		if categoryName then
			name:setText( Engine.Localize( categoryName ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( name )
	self.name = name
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

