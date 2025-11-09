require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.DOA_outro_frame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_outro_frame" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_outro_frame.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	feLeftContainer:setLeftRight( false, true, -280, 152 )
	feLeftContainer:setTopBottom( false, true, -80, -36 )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if ShouldSwapCircleAndCross() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ShouldSwapCircleAndCross() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "CP_DOA_BO3_OUTRO_ABORT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not ShouldSwapCircleAndCross() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not ShouldSwapCircleAndCross() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "CP_DOA_BO3_OUTRO_ABORT" )
			return true
		else
			return false
		end
	end, false )
	feLeftContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feLeftContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_outro_frame.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

