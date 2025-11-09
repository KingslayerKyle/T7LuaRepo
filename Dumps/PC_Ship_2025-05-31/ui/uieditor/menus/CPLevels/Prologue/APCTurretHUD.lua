require( "ui.uieditor.widgets.HUD.GenericUpdateBar" )
require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_arg0:getModel(), "frac" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.GenericUpdateBar:setRGB( 1, 1 - modelValue, 1 - modelValue )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "APCTurretHUD.buttonPrompts" )
	local f3_local1 = self
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( false, false, -108.59, 109 )
	BlackFrame:setTopBottom( false, false, 181.7, 191.7 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0.3 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local GenericUpdateBar = CoD.GenericUpdateBar.new( f3_local1, controller )
	GenericUpdateBar:setLeftRight( false, false, -103.5, 103.5 )
	GenericUpdateBar:setTopBottom( false, false, 186.2, 187.2 )
	self:addElement( GenericUpdateBar )
	self.GenericUpdateBar = GenericUpdateBar
	
	local Border = CoD.Border.new( f3_local1, controller )
	Border:setLeftRight( false, false, -103.5, 103.5 )
	Border:setTopBottom( false, false, 184.7, 188.7 )
	self:addElement( Border )
	self.Border = Border
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericUpdateBar:close()
		element.Border:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "APCTurretHUD.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

