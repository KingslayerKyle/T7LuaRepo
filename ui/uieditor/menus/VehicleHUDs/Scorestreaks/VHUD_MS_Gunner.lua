-- 244584d9e1b75e6b68fc6125b336314b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_GunnerInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_inputDisabled = true
end

LUI.createMenu.VHUD_MS_Gunner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_MS_Gunner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_MS_Gunner.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local vhudmsGunnerInternal0 = CoD.vhud_ms_GunnerInternal.new( f2_local1, controller )
	vhudmsGunnerInternal0:setLeftRight( true, true, 0, 0 )
	vhudmsGunnerInternal0:setTopBottom( true, true, 0, 0 )
	vhudmsGunnerInternal0:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudmsGunnerInternal0:setModel( model, controller )
	end )
	self:addElement( vhudmsGunnerInternal0 )
	self.vhudmsGunnerInternal0 = vhudmsGunnerInternal0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsGunnerInternal0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_MS_Gunner.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

