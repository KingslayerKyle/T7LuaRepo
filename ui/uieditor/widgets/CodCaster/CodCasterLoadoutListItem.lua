-- b6e1986a76418c9fe3f371238dffb494
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItemBackground" )

CoD.CodCasterLoadoutListItem = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutListItem )
	self.id = "CodCasterLoadoutListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 72 )
	
	local bg = CoD.CodCasterLoadoutItemBackground.new( menu, controller )
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 5, -5 )
	Image:setTopBottom( true, true, 12.5, -9.5 )
	Image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local sizeElement = CoD.CodCasterLoadoutItemBackground.new( menu, controller )
	sizeElement:setLeftRight( true, false, 0, 60 )
	sizeElement:setTopBottom( true, false, 0, 72 )
	sizeElement:setAlpha( 0 )
	sizeElement:linkToElementModel( self, nil, false, function ( model )
		sizeElement:setModel( model, controller )
	end )
	sizeElement:linkToElementModel( self, "image", true, function ( model )
		ScaleToFitImageElement( self, sizeElement, "Image" )
	end )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bg:close()
		element.sizeElement:close()
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

