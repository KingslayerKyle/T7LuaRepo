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
	BlackBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, false, 0, 200 )
	name:setTopBottom( true, false, 1, 21 )
	name:setTTF( "fonts/Entovo.ttf" )
	name:linkToElementModel( self, "categoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( name )
	self.name = name
	
	self.close = function ( self )
		self.name:close()
		CoD.PersonalizeCharacterCarouselItem_InfoAreaLabel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

