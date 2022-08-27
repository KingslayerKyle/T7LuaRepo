-- 70ca78dc9d2665333a071001397e6276
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.FileshareFetching = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareFetching" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareFetching.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( f1_local1, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 2.96, 1282.96 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_ERROR" ) )
	FullscreenPopupTemplate0:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		}
	} )
	FullscreenPopupTemplate0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		f1_local1:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	leftButtonBar:setLeftRight( true, false, 79, 511 )
	leftButtonBar:setTopBottom( true, false, 533.11, 565.11 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		Close( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f6_local0 = self
		if FileshareIsReady( controller ) then
			FileshareOpenPreviousPublishMenu( self, f6_local0, controller, f1_local1 )
			Close( self, controller )
		end
	end )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate0:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareFetching.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

