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
	self.imgSpinner:setImage( RegisterMaterial( "lui_loader" ) )
	self:registerEventHandler( "spinner_update", SpinnerUpdate )
	self:registerEventHandler( "spinner_close", SpinnerClose )
end

LUI.createMenu.Spinner = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Spinner" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local lblMessage = LUI.UITightText.new()
	lblMessage:setLeftRight( true, false, 1032, 1111 )
	lblMessage:setTopBottom( true, false, 620, 645 )
	lblMessage:setRGB( 1, 1, 1 )
	lblMessage:setTTF( "fonts/default.ttf" )
	lblMessage:subscribeToGlobalModel( controller, "SpinnerMessage", "spinnerMessage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lblMessage:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local imgSpinner = LUI.UIImage.new()
	imgSpinner:setLeftRight( true, false, 1032, 1071.5 )
	imgSpinner:setTopBottom( true, false, 580.5, 620 )
	imgSpinner:setRGB( 1, 1, 1 )
	imgSpinner:setAlpha( 0.5 )
	imgSpinner:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgSpinner )
	self.imgSpinner = imgSpinner
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.lblMessage:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

