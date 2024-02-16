-- abfde62b512694c33912c7b3bf1c7087
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.quadtank.vhud_quadtank_internal" )

LUI.createMenu.VHUD_QuadTank = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_QuadTank" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_QuadTank.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local vhudquadtankinternal = CoD.vhud_quadtank_internal.new( f1_local1, controller )
	vhudquadtankinternal:setLeftRight( true, true, 0, 0 )
	vhudquadtankinternal:setTopBottom( true, true, 0, 0 )
	vhudquadtankinternal:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudquadtankinternal:setModel( model, controller )
	end )
	self:addElement( vhudquadtankinternal )
	self.vhudquadtankinternal = vhudquadtankinternal
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudquadtankinternal:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_QuadTank.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

