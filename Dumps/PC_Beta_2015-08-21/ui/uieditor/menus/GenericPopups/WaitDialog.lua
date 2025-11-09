require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.setMessage = function ( f2_arg0 )
		f1_arg0.waitMessage:setText( Engine.Localize( f2_arg0 ) )
	end
	
end

LUI.createMenu.WaitDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WaitDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WaitDialog.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local WaitSpinner = CoD.DialogSpinner.new( self, controller )
	WaitSpinner:setLeftRight( false, true, -102, -64 )
	WaitSpinner:setTopBottom( false, true, -74, -36 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local waitMessage = LUI.UIText.new()
	waitMessage:setLeftRight( false, true, -367.5, -109 )
	waitMessage:setTopBottom( false, true, -63, -47 )
	waitMessage:setAlpha( 0.9 )
	waitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	waitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	waitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	waitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( waitMessage )
	self.waitMessage = waitMessage
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaitSpinner:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WaitDialog.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

