require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBaked" )

CoD.collectiblesInspectionArea = InheritFrom( LUI.UIElement )
CoD.collectiblesInspectionArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.collectiblesInspectionArea )
	self.id = "collectiblesInspectionArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 555 )
	self:setTopBottom( true, false, 0, 475 )
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0.11, 0.14, 0.17 )
	BorderBakedMask0:setAlpha( 0.6 )
	BorderBakedMask0:setZoom( -40 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 0, 0 )
	BorderBaked0:setTopBottom( true, true, 0, 0 )
	BorderBaked0:setRGB( 1, 1, 1 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local inspectingImage = LUI.UIImage.new()
	inspectingImage:setLeftRight( false, false, -197.5, 196.5 )
	inspectingImage:setTopBottom( false, false, -188.5, 205.5 )
	inspectingImage:setRGB( 1, 1, 1 )
	inspectingImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	inspectingImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			inspectingImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( inspectingImage )
	self.inspectingImage = inspectingImage
	
	local inspectingName = LUI.UITightText.new()
	inspectingName:setLeftRight( true, false, 10, 260 )
	inspectingName:setTopBottom( true, false, 12, 42 )
	inspectingName:setRGB( 1, 1, 1 )
	inspectingName:setTTF( "fonts/escom.ttf" )
	inspectingName:linkToElementModel( self, "longName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			inspectingName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( inspectingName )
	self.inspectingName = inspectingName
	
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBaked0:close()
		self.inspectingImage:close()
		self.inspectingName:close()
		CoD.collectiblesInspectionArea.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

