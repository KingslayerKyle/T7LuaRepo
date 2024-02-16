-- 975e5395bce814693efa90ab29d98ea6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.DOA.overworld_map" )
require( "ui.uieditor.widgets.DOA.overworld_frame" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal" ), "changingLevel" )
end

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
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local overworldmap = CoD.overworld_map.new( f2_local1, controller )
	overworldmap:setLeftRight( true, false, 0, 1280 )
	overworldmap:setTopBottom( true, false, 0, 720 )
	self:addElement( overworldmap )
	self.overworldmap = overworldmap
	
	local overworldframe = CoD.overworld_frame.new( f2_local1, controller )
	overworldframe:setLeftRight( true, false, 0, 1280 )
	overworldframe:setTopBottom( true, false, 0, 720 )
	self:addElement( overworldframe )
	self.overworldframe = overworldframe
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.changingLevel" ), function ( model )
		local f3_local0 = self
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.changingLevel"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if not IsGlobalModelValueEqualTo( f4_arg0, f4_arg2, "DeadOpsArcadeGlobal.changingLevel", 1 ) then
			GoBack( self, f4_arg2 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if not IsGlobalModelValueEqualTo( f5_arg0, f5_arg2, "DeadOpsArcadeGlobal.changingLevel", 1 ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
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

