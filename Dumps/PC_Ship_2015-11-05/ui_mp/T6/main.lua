require( "ui.T6.CoDBase" )
require( "ui.T6.lobby.friends" )
require( "ui.T6.lobby.lobbybase" )
require( "ui.T6.lobby.lobbymenus" )
require( "ui.T6.lobby.presence" )
require( "ui.T6.Menus.ChangeGameModePopup" )
require( "ui_mp.T6.Menus.CODTv" )
require( "ui_mp.T6.Menus.EditGameOptionsPopup" )
require( "ui_mp.T6.Menus.EditModeSpecificOptionsMenu" )
require( "ui_mp.T6.Menus.PlaylistSelectionPopup" )
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
	LUI.roots.UIRootFull:addElement( CoD.SetupSafeAreaOverlay() )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self.name = "Main"
	Engine.Exec( nil, "checkforinvites" )
	self:setPriority( 9999 )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" ), "mapVoteMapNext" )
	local f1_local3 = function ( f2_arg0, f2_arg1 )
		f2_arg0.toastNotification = CoD.ToastNotification.new( f2_arg0, f2_arg1 )
		f2_arg0.toastNotification:setState( "DefaultState" )
		f2_arg0:addElement( f2_arg0.toastNotification )
		
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
	self:registerEventHandler( "refresh_dw_inventory_menu", function ( self, event )
		local f4_local0 = Engine.GetMaxControllerCount()
		for f4_local1 = 0, f4_local0 - 1, 1 do
			DataSources.CryptoKeyProgress.getModel( f4_local1 )
		end
	end )
	self:registerEventHandler( "debug_reload", function ( self, event )
		if self.toastNotification ~= nil then
			self.toastNotification:close()
			self.toastNotification = nil
		end
		if self.LoadingScreenPreloadHidden ~= nil then
			self.LoadingScreenPreloadHidden:close()
			self.LoadingScreenPreloadHidden = nil
		end
		self:removeAllChildren()
		f1_local3( self, f1_local4 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.toastNotification:close()
	end )
	return self
end

DisableGlobals()
Engine.StopEditingPresetClass()
