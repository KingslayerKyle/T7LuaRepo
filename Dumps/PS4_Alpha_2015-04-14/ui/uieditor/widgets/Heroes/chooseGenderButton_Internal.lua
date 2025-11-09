require( "ui.uieditor.widgets.Border" )

CoD.chooseGenderButton_Internal = InheritFrom( LUI.UIElement )
CoD.chooseGenderButton_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.chooseGenderButton_Internal )
	self.id = "chooseGenderButton_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -75, 75 )
	image:setTopBottom( false, false, -200, 200 )
	image:setRGB( 1, 1, 1 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	self.close = function ( self )
		self.border:close()
		self.image:close()
		CoD.chooseGenderButton_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

