-- 54e6a0ffdbcab17a852472b3d79d64cc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoading2" )
require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoadingWidget" )

CoD.Spinner = {}
CoD.Spinner.SYSTEM_PROCESS_INIT = 0
CoD.Spinner.SYSTEM_PROCESS_ERROR = 1
CoD.Spinner.SYSTEM_PROCESS_MOVE = 2
CoD.Spinner.SYSTEM_PROCESS_SEARCH = 3
CoD.Spinner.SYSTEM_PROCESS_QOS = 4
CoD.Spinner.SYSTEM_PROCESS_JOIN = 5
CoD.Spinner.SYSTEM_PROCESS_DISCONNECT = 6
CoD.Spinner.SYSTEM_PROCESS_END = 7
CoD.Spinner.SYSTEM_PROCESS_ONLINE_CREATE = 8
CoD.Spinner.SYSTEM_PROCESS_ONLINE_DELETE = 9
CoD.Spinner.SYSTEM_PROCESS_MIGRATE = 10
CoD.Spinner.SYSTEM_PROCESS_LAUNCH_GAME = 11
function SpinnerUpdate_JoinProgress( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1 == 1 then
		Engine.SetModelValue( f1_arg2, "MENU_SPINNER_JOIN_CONNECTING" )
	elseif f1_arg1 == 2 then
		Engine.SetModelValue( f1_arg2, "MENU_SPINNER_JOIN_ASSOCIATING" )
	elseif f1_arg1 == 3 then
		Engine.SetModelValue( f1_arg2, "MENU_SPINNER_JOIN_HANDSHAKING" )
	elseif f1_arg1 == 4 then
		Engine.SetModelValue( f1_arg2, "MENU_SPINNER_JOIN_AGREEMENT" )
	elseif f1_arg1 == 6 then
		Engine.SetModelValue( f1_arg2, "MENU_SPINNER_JOIN_AGREEMENT_SUCCESS" )
	end
end

function SpinnerUpdate_JoinResult( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg1 ~= 1 then
		GoBack( f2_arg0, f2_arg0:getOwner() )
	end
end

function SpinnerUpdate_Leave( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 == 9 then
		Engine.SetModelValue( f3_arg2, "Deleting advertised session.." )
	elseif f3_arg1 == 6 then
		Engine.SetModelValue( f3_arg2, "Letting clients know we are leaving.." )
	end
end

function SpinnerUpdate_Move( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg1 == CoD.Spinner.SYSTEM_PROCESS_MOVE then
		Engine.SetModelValue( f4_arg2, "Waiting for clients..." )
	elseif f4_arg1 == CoD.Spinner.SYSTEM_PROCESS_SEARCH then
		Engine.SetModelValue( f4_arg2, "Searching for sessions..." )
	elseif f4_arg1 == CoD.Spinner.SYSTEM_PROCESS_QOS then
		Engine.SetModelValue( f4_arg2, "Firing QoS..." )
	elseif f4_arg1 == CoD.Spinner.SYSTEM_PROCESS_JOIN then
		Engine.SetModelValue( f4_arg2, "Joining a session..." )
	elseif f4_arg1 == CoD.Spinner.SYSTEM_PROCESS_ONLINE_CREATE then
		Engine.SetModelValue( f4_arg2, "Creating session..." )
	end
end

function SpinnerUpdate( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.spinnerState
	local f5_local1 = Engine.GetModel( Engine.GetGlobalModel(), "spinnerModel.spinnerMessage" )
	if f5_local1 == nil then
		return 
	elseif f5_arg1.system == "join_progress" then
		SpinnerUpdate_JoinProgress( f5_arg0, f5_local0, f5_local1 )
	elseif f5_arg1.system == "join_result" then
		SpinnerUpdate_JoinResult( f5_arg0, f5_local0, f5_local1 )
	elseif f5_arg1.system == "lobby_leave" then
		SpinnerUpdate_Leave( f5_arg0, f5_local0, f5_local1 )
	elseif f5_arg1.system == "lobby_move" then
		SpinnerUpdate_Move( f5_arg0, f5_local0, f5_local1 )
	end
end

function SpinnerClose( f6_arg0, f6_arg1 )
	GoBack( f6_arg0, f6_arg0:getOwner() )
end

local PostLoadFunc = function ( f7_arg0 )
	f7_arg0.disablePopupOpenCloseAnim = true
	f7_arg0.disableDarkenElement = true
	f7_arg0.disableBlur = true
	f7_arg0:registerEventHandler( "spinner_update", SpinnerUpdate )
	f7_arg0:registerEventHandler( "spinner_close", SpinnerClose )
end

LUI.createMenu.Spinner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Spinner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Special_widgets"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Spinner.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local AnimationLoading20 = CoD.AnimationLoading2.new( f8_local1, controller )
	AnimationLoading20:setLeftRight( false, true, -192, -64 )
	AnimationLoading20:setTopBottom( false, true, -164, -36 )
	AnimationLoading20:setAlpha( 0 )
	AnimationLoading20:setScale( 0.5 )
	self:addElement( AnimationLoading20 )
	self.AnimationLoading20 = AnimationLoading20
	
	local lblMessage = LUI.UIText.new()
	lblMessage:setLeftRight( false, true, -167.5, -88.5 )
	lblMessage:setTopBottom( false, true, -69, -44 )
	lblMessage:setTTF( "fonts/default.ttf" )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lblMessage:subscribeToGlobalModel( controller, "SpinnerMessage", "spinnerMessage", function ( model )
		local spinnerMessage = Engine.GetModelValue( model )
		if spinnerMessage then
			lblMessage:setText( Engine.Localize( spinnerMessage ) )
		end
	end )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local AnimationLoadingWidget0 = CoD.AnimationLoadingWidget.new( f8_local1, controller )
	AnimationLoadingWidget0:setLeftRight( true, false, 1092, 1236 )
	AnimationLoadingWidget0:setTopBottom( true, false, 540, 684 )
	AnimationLoadingWidget0:setScale( 0.65 )
	self:addElement( AnimationLoadingWidget0 )
	self.AnimationLoadingWidget0 = AnimationLoadingWidget0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f8_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AnimationLoading20:close()
		element.AnimationLoadingWidget0:close()
		element.lblMessage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Spinner.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

