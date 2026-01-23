LUI.createMenu.xcam_pip_test2 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "xcam_pip_test2" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "xcam_pip_test2.buttonPrompts" )
	local f1_local1 = self
	
	local ExtraCam = LUI.UIImage.new()
	ExtraCam:setLeftRight( true, false, 77.5, 291.5 )
	ExtraCam:setTopBottom( true, false, 49, 177 )
	ExtraCam:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam" ) )
	ExtraCam:setShaderVector( 0, 0, 0, 1, 1 )
	ExtraCam:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( ExtraCam )
	self.ExtraCam = ExtraCam
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "xcam_pip_test2.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

