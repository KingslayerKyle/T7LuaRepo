-- 054eab32653a3f50a216520d555bc814
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ButtonWidget" )

CoD.vhud_generic_key_mouse_layout = InheritFrom( LUI.UIElement )
CoD.vhud_generic_key_mouse_layout.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_generic_key_mouse_layout )
	self.id = "vhud_generic_key_mouse_layout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Right0 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Right0:setLeftRight( false, true, -151, -65 )
	Right0:setTopBottom( false, true, -144, -35 )
	Right0:setYRot( -50 )
	Right0:setZRot( -10 )
	Right0:linkToElementModel( self, "RIGHT_0", false, function ( model )
		Right0:setModel( model, controller )
	end )
	self:addElement( Right0 )
	self.Right0 = Right0
	
	local Right1 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Right1:setLeftRight( false, true, -150, -64 )
	Right1:setTopBottom( false, true, -227.5, -118.5 )
	Right1:setYRot( -50 )
	Right1:setZRot( -10 )
	Right1:linkToElementModel( self, "RIGHT_1", false, function ( model )
		Right1:setModel( model, controller )
	end )
	self:addElement( Right1 )
	self.Right1 = Right1
	
	local Right3 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Right3:setLeftRight( false, true, -151, -65 )
	Right3:setTopBottom( false, true, -312.5, -203.5 )
	Right3:setYRot( -50 )
	Right3:setZRot( -10 )
	Right3:linkToElementModel( self, "RIGHT_2", false, function ( model )
		Right3:setModel( model, controller )
	end )
	self:addElement( Right3 )
	self.Right3 = Right3
	
	local Right4 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Right4:setLeftRight( false, true, -151, -65 )
	Right4:setTopBottom( false, true, -395, -286 )
	Right4:setYRot( -50 )
	Right4:setZRot( -10 )
	Right4:linkToElementModel( self, "RIGHT_3", false, function ( model )
		Right4:setModel( model, controller )
	end )
	self:addElement( Right4 )
	self.Right4 = Right4
	
	local Left00 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Left00:setLeftRight( true, false, 64, 150 )
	Left00:setTopBottom( false, true, -145, -36 )
	Left00:setYRot( 50 )
	Left00:setZRot( 10 )
	Left00:linkToElementModel( self, "LEFT_0", false, function ( model )
		Left00:setModel( model, controller )
	end )
	self:addElement( Left00 )
	self.Left00 = Left00
	
	local Left10 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Left10:setLeftRight( true, false, 64, 150 )
	Left10:setTopBottom( false, true, -228.5, -119.5 )
	Left10:setYRot( 50 )
	Left10:setZRot( 10 )
	Left10:linkToElementModel( self, "LEFT_1", false, function ( model )
		Left10:setModel( model, controller )
	end )
	self:addElement( Left10 )
	self.Left10 = Left10
	
	local Left20 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Left20:setLeftRight( true, false, 64, 150 )
	Left20:setTopBottom( false, true, -313.5, -204.5 )
	Left20:setYRot( 50 )
	Left20:setZRot( 10 )
	Left20:linkToElementModel( self, "LEFT_2", false, function ( model )
		Left20:setModel( model, controller )
	end )
	self:addElement( Left20 )
	self.Left20 = Left20
	
	local Left30 = CoD.vhud_ms_ButtonWidget.new( menu, controller )
	Left30:setLeftRight( true, false, 64, 150 )
	Left30:setTopBottom( false, true, -395, -286 )
	Left30:setYRot( 50 )
	Left30:setZRot( 10 )
	Left30:linkToElementModel( self, "LEFT_3", false, function ( model )
		Left30:setModel( model, controller )
	end )
	self:addElement( Left30 )
	self.Left30 = Left30
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Right0:close()
		element.Right1:close()
		element.Right3:close()
		element.Right4:close()
		element.Left00:close()
		element.Left10:close()
		element.Left20:close()
		element.Left30:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
