-- 1a23c1c3cf0c75081a912c07c67c41b4
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.CoDBase" )
require( "ui.T6.lobby.friends" )
require( "ui.T6.lobby.lobbybase" )
require( "ui.T6.lobby.lobbymenus" )
require( "ui.T6.lobby.presence" )
require( "ui.uieditor.menus.Core_UI_require" )
require( "ui.uieditor.menus.core_patch_require" )
require( "ui.uieditor.menus.Core_Frontend_require" )
require( "ui.uieditor.menus.core_frontend_patch_require" )

if CoD.isPC then
	require( "ui.uieditor.menus.core_patch_pc_require" )
end
LUI.createMenu.main = function ()
	local f1_local0 = Engine.GetMaxControllerCount()
	for self = 0, f1_local0 - 1, 1 do
		Engine.LockInput( self, true )
		Engine.SetUIActive( self, true )
	end
	CoD.StartLiveEventFromData( {
		liveEventStreamerIndex = Dvar.currentLiveEvent:get()
	} )
	LUI.roots.UIRootFull:addElement( CoD.SetupSafeAreaOverlay() )
	local self = CoD.Menu.NewForUIEditor( "main" )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self.anyChildUsesUpdateState = true
	Engine.Exec( nil, "checkforinvites" )
	self:setPriority( 9999 )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true ), "mapVoteMapNext", true )
	local f1_local3 = function ( f2_arg0, f2_arg1 )
		f2_arg0.toastNotification = CoD.ToastNotification.new( f2_arg0, f2_arg1 )
		f2_arg0.toastNotification:setState( "DefaultState" )
		f2_arg0:addElement( f2_arg0.toastNotification )
		if CoD.MatchStartWarning then
			f2_arg0.matchStartWarning = CoD.MatchStartWarning.new( f2_arg0, f2_arg1 )
			f2_arg0.matchStartWarning:setLeftRight( true, true, 0, 0 )
			f2_arg0:addElement( f2_arg0.matchStartWarning )
			f2_arg0.matchStartWarning:processEvent( {
				name = "update_state",
				menu = f2_arg0,
				controller = f2_arg1
			} )
		end
		local LoadingScreenPreloadHidden = LUI.UIImage.new()
		LoadingScreenPreloadHidden:setAlpha( 0 )
		LoadingScreenPreloadHidden:setupUIStreamedImage( 0 )
		LoadingScreenPreloadHidden:subscribeToGlobalModel( f2_arg1, "MapVote", "mapVoteMapNext", function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				LoadingScreenPreloadHidden:setImage( RegisterImage( MapNameToMapLoadingImage( modelValue ) ) )
			end
		end )
		f2_arg0:addElement( LoadingScreenPreloadHidden )
		f2_arg0.LoadingScreenPreloadHidden = LoadingScreenPreloadHidden
		
	end
	
	local f1_local4 = Engine.GetPrimaryController()
	f1_local3( self, f1_local4 )
	self:registerEventHandler( "refresh_dw_inventory_menu", function ( element, event )
		local f4_local0 = Engine.GetMaxControllerCount()
		for f4_local1 = 0, f4_local0 - 1, 1 do
			DataSources.CryptoKeyProgress.getModel( f4_local1 )
			DataSources.MegaChewTokens.getModel( f4_local1 )
			DataSources.GobbleGumDistills.getModel( f4_local1 )
		end
	end )
	self:registerEventHandler( "debug_reload", function ( element, event )
		if element.toastNotification ~= nil then
			element.toastNotification:close()
			element.toastNotification = nil
		end
		if self.matchStartWarning ~= nil then
			self.matchStartWarning:close()
			self.matchStartWarning = nil
		end
		if element.LoadingScreenPreloadHidden ~= nil then
			element.LoadingScreenPreloadHidden:close()
			element.LoadingScreenPreloadHidden = nil
		end
		element:removeAllChildren()
		f1_local3( self, f1_local4 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.toastNotification:close()
	end )
	return self
end

DisableGlobals()
Engine.StopEditingPresetClass()
