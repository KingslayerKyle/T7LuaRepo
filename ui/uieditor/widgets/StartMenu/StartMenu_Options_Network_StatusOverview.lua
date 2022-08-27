-- 4edbc336ce7221ec0918dd76acdc9dd7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

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
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 75 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local NetworkBox5 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox5:setLeftRight( true, false, 39, 545 )
	NetworkBox5:setTopBottom( true, false, 0, 75 )
	self:addElement( NetworkBox5 )
	self.NetworkBox5 = NetworkBox5
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 39, -125 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 39, -125 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local NetworkPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel0:setLeftRight( true, false, 49, 535 )
	NetworkPanel0:setTopBottom( true, false, 10, 64.46 )
	NetworkPanel0:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel0:setAlpha( 0.3 )
	self:addElement( NetworkPanel0 )
	self.NetworkPanel0 = NetworkPanel0
	
	local FirstPartyStateLabel = LUI.UITightText.new()
	FirstPartyStateLabel:setLeftRight( true, false, 59, 525 )
	FirstPartyStateLabel:setTopBottom( true, false, 12.23, 36 )
	FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
	FirstPartyStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FirstPartyStateLabel )
	self.FirstPartyStateLabel = FirstPartyStateLabel
	
	local InternetStateLabel = LUI.UITightText.new()
	InternetStateLabel:setLeftRight( true, false, 59, 46.43 )
	InternetStateLabel:setTopBottom( true, false, 12.23, 37.23 )
	InternetStateLabel:setAlpha( 0 )
	InternetStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED" ) )
	InternetStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( InternetStateLabel )
	self.InternetStateLabel = InternetStateLabel
	
	local ServerStateLabel = LUI.UITightText.new()
	ServerStateLabel:setLeftRight( true, false, 59, 525 )
	ServerStateLabel:setTopBottom( true, false, 36, 60 )
	ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
	ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
	ServerStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ServerStateLabel )
	self.ServerStateLabel = ServerStateLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				NetworkBox5:completeAnimation()
				self.NetworkBox5:setAlpha( 1 )
				self.clipFinished( NetworkBox5, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 59, 525 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 12.23, 36 )
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( 0.55, 1, 0 )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 1 )
				self.clipFinished( FirstPartyStateLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 1 )
				self.clipFinished( ServerStateLabel, {} )
			end
		},
		NoInternet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
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
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
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
				self:setupElementClipCounter( 4 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED" ) )
				self.clipFinished( InternetStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end
		},
		NotConnectedToCodServer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 1 )
				self.clipFinished( FirstPartyStateLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 1 )
				self.clipFinished( ServerStateLabel, {} )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 1 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 1 )
				self.clipFinished( ServerStateLabel, {} )
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
				local f13_local0
				if not IsPlayerConnectedToCodServers( controller ) then
					f13_local0 = IsPlayerSignedInToLive( controller )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "ArabicFrontEnd",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsInGame() then
					f14_local0 = IsArabicSku()
				else
					f14_local0 = false
				end
				return f14_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NetworkBox5:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.NetworkPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

