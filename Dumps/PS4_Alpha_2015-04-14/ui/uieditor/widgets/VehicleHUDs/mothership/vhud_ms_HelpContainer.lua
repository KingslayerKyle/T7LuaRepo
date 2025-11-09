require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_HelpButtonContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_HelpButtonContainerRight" )

CoD.vhud_ms_HelpContainer = InheritFrom( LUI.UIElement )
CoD.vhud_ms_HelpContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_HelpContainer )
	self.id = "vhud_ms_HelpContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local leftBottom = CoD.vhud_ms_HelpButtonContainer.new( menu, controller )
	leftBottom:setLeftRight( true, false, -35, 260 )
	leftBottom:setTopBottom( false, true, -109, 0 )
	leftBottom:setRGB( 1, 1, 1 )
	leftBottom:setXRot( 26 )
	leftBottom:setYRot( 51 )
	leftBottom:setZRot( 12 )
	leftBottom:setZoom( -400 )
	leftBottom:linkToElementModel( self, "bottomLeftButton", false, function ( model )
		leftBottom:setModel( model, controller )
	end )
	self:addElement( leftBottom )
	self.leftBottom = leftBottom
	
	local leftMiddle = CoD.vhud_ms_HelpButtonContainer.new( menu, controller )
	leftMiddle:setLeftRight( true, false, -80, 215 )
	leftMiddle:setTopBottom( false, true, -204, -95 )
	leftMiddle:setRGB( 1, 1, 1 )
	leftMiddle:setXRot( 26 )
	leftMiddle:setYRot( 51 )
	leftMiddle:setZRot( 10 )
	leftMiddle:setZoom( -400 )
	leftMiddle:linkToElementModel( self, "middleLeftButton", false, function ( model )
		leftMiddle:setModel( model, controller )
	end )
	self:addElement( leftMiddle )
	self.leftMiddle = leftMiddle
	
	local leftTop = CoD.vhud_ms_HelpButtonContainer.new( menu, controller )
	leftTop:setLeftRight( true, false, -102, 193 )
	leftTop:setTopBottom( false, true, -300, -191 )
	leftTop:setRGB( 1, 1, 1 )
	leftTop:setXRot( 26 )
	leftTop:setYRot( 51 )
	leftTop:setZRot( 7 )
	leftTop:setZoom( -400 )
	leftTop:linkToElementModel( self, "topLeftButton", false, function ( model )
		leftTop:setModel( model, controller )
	end )
	self:addElement( leftTop )
	self.leftTop = leftTop
	
	local rightBottom = CoD.vhud_ms_HelpButtonContainerRight.new( menu, controller )
	rightBottom:setLeftRight( false, true, -257, 38 )
	rightBottom:setTopBottom( false, true, -109, 0 )
	rightBottom:setRGB( 1, 1, 1 )
	rightBottom:setXRot( 26 )
	rightBottom:setYRot( -51 )
	rightBottom:setZRot( -12 )
	rightBottom:setZoom( -400 )
	rightBottom:linkToElementModel( self, "bottomRightButton", false, function ( model )
		rightBottom:setModel( model, controller )
	end )
	self:addElement( rightBottom )
	self.rightBottom = rightBottom
	
	local rightTop = CoD.vhud_ms_HelpButtonContainerRight.new( menu, controller )
	rightTop:setLeftRight( false, true, -212, 83 )
	rightTop:setTopBottom( false, true, -204, -95 )
	rightTop:setRGB( 1, 1, 1 )
	rightTop:setXRot( 26 )
	rightTop:setYRot( -51 )
	rightTop:setZRot( -10 )
	rightTop:setZoom( -400 )
	rightTop:linkToElementModel( self, "topRightButton", false, function ( model )
		rightTop:setModel( model, controller )
	end )
	self:addElement( rightTop )
	self.rightTop = rightTop
	
	self.close = function ( self )
		self.leftBottom:close()
		self.leftMiddle:close()
		self.leftTop:close()
		self.rightBottom:close()
		self.rightTop:close()
		CoD.vhud_ms_HelpContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

