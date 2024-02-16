-- d151a3246c95735612e944e09d08d05a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButtonContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButtonContainerRight" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_key_mouse_layout" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if not CoD.isPC then
		f1_arg0.vhudgenerickeymouselayout:close()
		return 
	else
		f1_arg0.leftBottom:close()
		f1_arg0.leftMiddle:close()
		f1_arg0.leftTop:close()
		f1_arg0.rightBottom:close()
		f1_arg0.rightMiddle:close()
		f1_arg0.rightTop:close()
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local0( self, controller, menu )
end

CoD.VehicleGround_HelpContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HelpContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HelpContainer )
	self.id = "VehicleGround_HelpContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local leftBottom = CoD.VehicleGround_HelpButtonContainer.new( menu, controller )
	leftBottom:setLeftRight( true, false, -35, 260 )
	leftBottom:setTopBottom( false, true, -109, 0 )
	leftBottom:setXRot( 26 )
	leftBottom:setYRot( 51 )
	leftBottom:setZRot( 12 )
	leftBottom:setZoom( -400 )
	leftBottom:linkToElementModel( self, "bottomLeftButton", false, function ( model )
		leftBottom:setModel( model, controller )
	end )
	self:addElement( leftBottom )
	self.leftBottom = leftBottom
	
	local leftMiddle = CoD.VehicleGround_HelpButtonContainer.new( menu, controller )
	leftMiddle:setLeftRight( true, false, -80, 215 )
	leftMiddle:setTopBottom( false, true, -204, -95 )
	leftMiddle:setXRot( 26 )
	leftMiddle:setYRot( 51 )
	leftMiddle:setZRot( 10 )
	leftMiddle:setZoom( -400 )
	leftMiddle:linkToElementModel( self, "middleLeftButton", false, function ( model )
		leftMiddle:setModel( model, controller )
	end )
	self:addElement( leftMiddle )
	self.leftMiddle = leftMiddle
	
	local leftTop = CoD.VehicleGround_HelpButtonContainer.new( menu, controller )
	leftTop:setLeftRight( true, false, -102, 193 )
	leftTop:setTopBottom( false, true, -300, -191 )
	leftTop:setXRot( 26 )
	leftTop:setYRot( 51 )
	leftTop:setZRot( 7 )
	leftTop:setZoom( -400 )
	leftTop:linkToElementModel( self, "topLeftButton", false, function ( model )
		leftTop:setModel( model, controller )
	end )
	self:addElement( leftTop )
	self.leftTop = leftTop
	
	local rightBottom = CoD.VehicleGround_HelpButtonContainerRight.new( menu, controller )
	rightBottom:setLeftRight( false, true, -257, 38 )
	rightBottom:setTopBottom( false, true, -109, 0 )
	rightBottom:setXRot( 26 )
	rightBottom:setYRot( -51 )
	rightBottom:setZRot( -12 )
	rightBottom:setZoom( -400 )
	rightBottom:linkToElementModel( self, "bottomRightButton", false, function ( model )
		rightBottom:setModel( model, controller )
	end )
	self:addElement( rightBottom )
	self.rightBottom = rightBottom
	
	local rightMiddle = CoD.VehicleGround_HelpButtonContainerRight.new( menu, controller )
	rightMiddle:setLeftRight( false, true, -212, 83 )
	rightMiddle:setTopBottom( false, true, -204, -95 )
	rightMiddle:setXRot( 26 )
	rightMiddle:setYRot( -51 )
	rightMiddle:setZRot( -10 )
	rightMiddle:setZoom( -400 )
	rightMiddle:linkToElementModel( self, "middleRightButton", false, function ( model )
		rightMiddle:setModel( model, controller )
	end )
	self:addElement( rightMiddle )
	self.rightMiddle = rightMiddle
	
	local rightTop = CoD.VehicleGround_HelpButtonContainerRight.new( menu, controller )
	rightTop:setLeftRight( false, true, -194, 101 )
	rightTop:setTopBottom( false, true, -300, -191 )
	rightTop:setXRot( 26 )
	rightTop:setYRot( -51 )
	rightTop:setZRot( -7 )
	rightTop:setZoom( -400 )
	rightTop:linkToElementModel( self, "topRightButton", false, function ( model )
		rightTop:setModel( model, controller )
	end )
	self:addElement( rightTop )
	self.rightTop = rightTop
	
	local vhudgenerickeymouselayout = CoD.vhud_generic_key_mouse_layout.new( menu, controller )
	vhudgenerickeymouselayout:setLeftRight( true, false, 0, 1280 )
	vhudgenerickeymouselayout:setTopBottom( true, false, 0, 720 )
	vhudgenerickeymouselayout:subscribeToGlobalModel( controller, "PerController", "vehicle.bindings", function ( model )
		vhudgenerickeymouselayout:setModel( model, controller )
	end )
	self:addElement( vhudgenerickeymouselayout )
	self.vhudgenerickeymouselayout = vhudgenerickeymouselayout
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftBottom:close()
		element.leftMiddle:close()
		element.leftTop:close()
		element.rightBottom:close()
		element.rightMiddle:close()
		element.rightTop:close()
		element.vhudgenerickeymouselayout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
