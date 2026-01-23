require( "ui.uieditor.widgets.DOA.overworld_map" )
require( "ui.uieditor.widgets.DOA.overworld_frame" )

LUI.createMenu.DOA_overworld = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_overworld" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_overworld.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local overworldmap = CoD.overworld_map.new( self, controller )
	overworldmap:setLeftRight( true, false, 0, 1280 )
	overworldmap:setTopBottom( true, false, 0, 720 )
	self:addElement( overworldmap )
	self.overworldmap = overworldmap
	
	local overworldframe = CoD.overworld_frame.new( self, controller )
	overworldframe:setLeftRight( true, false, 0, 1280 )
	overworldframe:setTopBottom( true, false, 0, 720 )
	self:addElement( overworldframe )
	self.overworldframe = overworldframe
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			return true
		else
			return false
		end
	end, false )
	overworldframe:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.overworldmap:close()
		element.overworldframe:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_overworld.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

