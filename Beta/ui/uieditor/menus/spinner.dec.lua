require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoading2" )

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
function SpinnerUpdate_JoinProgress( self, state, model )
	if state == 1 then
		Engine.SetModelValue( model, "MENU_SPINNER_JOIN_CONNECTING" )
	elseif state == 2 then
		Engine.SetModelValue( model, "MENU_SPINNER_JOIN_ASSOCIATING" )
	elseif state == 3 then
		Engine.SetModelValue( model, "MENU_SPINNER_JOIN_HANDSHAKING" )
	elseif state == 4 then
		Engine.SetModelValue( model, "MENU_SPINNER_JOIN_AGREEMENT" )
	elseif state == 6 then
		Engine.SetModelValue( model, "MENU_SPINNER_JOIN_AGREEMENT_SUCCESS" )
	end
end

function SpinnerUpdate_JoinResult( self, state, model )
	if state ~= 1 then
		GoBack( self, self:getOwner() )
	end
end

function SpinnerUpdate_Leave( self, state, model )
	if state == 9 then
		Engine.SetModelValue( model, "Deleting advertised session.." )
	elseif state == 6 then
		Engine.SetModelValue( model, "Letting clients know we are leaving.." )
	end
end

function SpinnerUpdate_Move( self, state, model )
	if state == CoD.Spinner.SYSTEM_PROCESS_MOVE then
		Engine.SetModelValue( model, "Waiting for clients..." )
	elseif state == CoD.Spinner.SYSTEM_PROCESS_SEARCH then
		Engine.SetModelValue( model, "Searching for sessions..." )
	elseif state == CoD.Spinner.SYSTEM_PROCESS_QOS then
		Engine.SetModelValue( model, "Firing QoS..." )
	elseif state == CoD.Spinner.SYSTEM_PROCESS_JOIN then
		Engine.SetModelValue( model, "Joining a session..." )
	elseif state == CoD.Spinner.SYSTEM_PROCESS_ONLINE_CREATE then
		Engine.SetModelValue( model, "Creating session..." )
	end
end

function SpinnerUpdate( self, event )
	local state = event.spinnerState
	local model = Engine.GetModel( Engine.GetGlobalModel(), "spinnerModel.spinnerMessage" )
	if model == nil then
		return 
	elseif event.system == "join_progress" then
		SpinnerUpdate_JoinProgress( self, state, model )
	elseif event.system == "join_result" then
		SpinnerUpdate_JoinResult( self, state, model )
	elseif event.system == "lobby_leave" then
		SpinnerUpdate_Leave( self, state, model )
	elseif event.system == "lobby_move" then
		SpinnerUpdate_Move( self, state, model )
	end
end

function SpinnerClose( self, event )
	GoBack( self, self:getOwner() )
end

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
	self.disableBlur = true
	self:registerEventHandler( "spinner_update", SpinnerUpdate )
	self:registerEventHandler( "spinner_close", SpinnerClose )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Spinner.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local AnimationLoading20 = CoD.AnimationLoading2.new( menu, controller )
	AnimationLoading20:setLeftRight( false, true, -192, -64 )
	AnimationLoading20:setTopBottom( false, true, -164, -36 )
	AnimationLoading20:setScale( 0.5 )
	AnimationLoading20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AnimationLoading20 )
	self.AnimationLoading20 = AnimationLoading20
	
	local lblMessage = LUI.UIText.new()
	lblMessage:setLeftRight( false, true, -167.5, -88.5 )
	lblMessage:setTopBottom( false, true, -69, -44 )
	lblMessage:setTTF( "fonts/default.ttf" )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lblMessage:subscribeToGlobalModel( controller, "SpinnerMessage", "spinnerMessage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lblMessage:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.AnimationLoading20:close()
		self.lblMessage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Spinner.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

