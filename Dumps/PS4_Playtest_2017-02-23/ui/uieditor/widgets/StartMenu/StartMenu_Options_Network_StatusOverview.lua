require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StartMenu_Options_Network_StatusOverview = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Network_StatusOverview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Network_StatusOverview )
	self.id = "StartMenu_Options_Network_StatusOverview"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1005 )
	self:setTopBottom( 0, 0, 0, 112 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local NetworkBox5 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox5:setLeftRight( 0, 0, 58, 817 )
	NetworkBox5:setTopBottom( 0, 0, 0, 112 )
	self:addElement( NetworkBox5 )
	self.NetworkBox5 = NetworkBox5
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 59, -187 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 59, -187 )
	FocusBarB:setTopBottom( 1, 1, -6, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local NetworkPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel0:setLeftRight( 0, 0, 73, 802 )
	NetworkPanel0:setTopBottom( 0, 0, 15, 97 )
	NetworkPanel0:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel0:setAlpha( 0.3 )
	self:addElement( NetworkPanel0 )
	self.NetworkPanel0 = NetworkPanel0
	
	local FirstPartyStateLabel = LUI.UITightText.new()
	FirstPartyStateLabel:setLeftRight( 0, 0, 88, 787 )
	FirstPartyStateLabel:setTopBottom( 0, 0, 18, 54 )
	FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
	FirstPartyStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FirstPartyStateLabel )
	self.FirstPartyStateLabel = FirstPartyStateLabel
	
	local InternetStateLabel = LUI.UITightText.new()
	InternetStateLabel:setLeftRight( 0, 0, 88.5, 69.5 )
	InternetStateLabel:setTopBottom( 0, 0, 18, 56 )
	InternetStateLabel:setAlpha( 0 )
	InternetStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED" ) )
	InternetStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( InternetStateLabel )
	self.InternetStateLabel = InternetStateLabel
	
	local ServerStateLabel = LUI.UITightText.new()
	ServerStateLabel:setLeftRight( 0, 0, 88, 787 )
	ServerStateLabel:setTopBottom( 0, 0, 54, 90 )
	ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
	ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
	ServerStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ServerStateLabel )
	self.ServerStateLabel = ServerStateLabel
	
	self.resetProperties = function ()
		ServerStateLabel:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		FirstPartyStateLabel:completeAnimation()
		InternetStateLabel:completeAnimation()
		ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
		ServerStateLabel:setAlpha( 1 )
		ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		FirstPartyStateLabel:setAlpha( 1 )
		FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
		InternetStateLabel:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( 0.55, 1, 0 )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		NoInternet = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 0 )
				self.clipFinished( FirstPartyStateLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 1 )
				self.clipFinished( InternetStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 0 )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 0 )
				self.clipFinished( FirstPartyStateLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 1 )
				self.clipFinished( InternetStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 0 )
				self.clipFinished( ServerStateLabel, {} )
			end
		},
		NotSignedInToLive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end
		},
		NotConnectedToCodServer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoInternet",
			condition = function ( menu, element, event )
				return not HasNetworkConnection()
			end
		},
		{
			stateName = "NotSignedInToLive",
			condition = function ( menu, element, event )
				return not IsPlayerSignedInToLive( controller )
			end
		},
		{
			stateName = "NotConnectedToCodServer",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsPlayerConnectedToCodServers( controller ) then
					f14_local0 = IsPlayerSignedInToLive( controller )
				else
					f14_local0 = false
				end
				return f14_local0
			end
		},
		{
			stateName = "ArabicFrontEnd",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsInGame() then
					f15_local0 = IsArabicSku()
				else
					f15_local0 = false
				end
				return f15_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NetworkBox5:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.NetworkPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

