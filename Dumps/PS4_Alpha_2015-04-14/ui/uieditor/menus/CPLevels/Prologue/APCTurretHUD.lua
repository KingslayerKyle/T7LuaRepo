require( "ui.uieditor.widgets.HUD.GenericUpdateBar" )
require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( self, controller )
	local fracModel = Engine.GetModel( self:getModel(), "frac" )
	self:subscribeToModel( fracModel, function ( model )
		local frac = Engine.GetModelValue( model )
		if frac then
			self.GenericUpdateBar:setRGB( 1, 1 - frac, 1 - frac )
		end
	end )
end

LUI.createMenu.APCTurretHUD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "APCTurretHUD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local GenericUpdateBar = CoD.GenericUpdateBar.new( menu, controller )
	GenericUpdateBar:setLeftRight( true, false, 536.5, 743.5 )
	GenericUpdateBar:setTopBottom( true, false, 597, 615 )
	GenericUpdateBar:setRGB( 1, 1, 1 )
	self:addElement( GenericUpdateBar )
	self.GenericUpdateBar = GenericUpdateBar
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 536.5, 743.5 )
	Border:setTopBottom( true, false, 597, 615 )
	Border:setRGB( 1, 1, 1 )
	self:addElement( Border )
	self.Border = Border
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.GenericUpdateBar:close()
		self.Border:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

