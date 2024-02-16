-- e20588c18ada33427fbc39e5de456ed1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Doa2VideoWidget" )

LUI.createMenu.Doa2 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Doa2" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Doa2.buttonPrompts" )
	local f1_local1 = self
	
	local Doa2VideoWidget = CoD.Doa2VideoWidget.new( f1_local1, controller )
	Doa2VideoWidget:setLeftRight( true, false, 0, 900 )
	Doa2VideoWidget:setTopBottom( true, false, 0, 600 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	Doa2VideoWidget:setUI3DWindow( 5 )
	self:addElement( Doa2VideoWidget )
	self.Doa2VideoWidget = Doa2VideoWidget
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Doa2VideoWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Doa2.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

