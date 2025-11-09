require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Network_PingListItem" )

CoD.StartMenu_Options_Network_OverviewPanel = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Network_OverviewPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Network_OverviewPanel )
	self.id = "StartMenu_Options_Network_OverviewPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 375 )
	self.anyChildUsesUpdateState = true
	
	local NetworkBox1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox1:setLeftRight( true, true, 0, 0 )
	NetworkBox1:setTopBottom( true, false, 0, 70 )
	self:addElement( NetworkBox1 )
	self.NetworkBox1 = NetworkBox1
	
	local NetworkBox2 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox2:setLeftRight( true, true, 0, 0 )
	NetworkBox2:setTopBottom( true, false, 305, 375 )
	self:addElement( NetworkBox2 )
	self.NetworkBox2 = NetworkBox2
	
	local NetworkBox3 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox3:setLeftRight( true, true, 0, 0 )
	NetworkBox3:setTopBottom( true, false, 82, 296 )
	self:addElement( NetworkBox3 )
	self.NetworkBox3 = NetworkBox3
	
	local NetworkPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel1:setLeftRight( true, true, 12, -12 )
	NetworkPanel1:setTopBottom( true, false, 195, 283 )
	NetworkPanel1:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel1:setAlpha( 0.3 )
	self:addElement( NetworkPanel1 )
	self.NetworkPanel1 = NetworkPanel1
	
	local NetworkPanel3 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel3:setLeftRight( true, true, 190, -12 )
	NetworkPanel3:setTopBottom( true, false, 312, 366 )
	NetworkPanel3:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel3:setAlpha( 0.3 )
	self:addElement( NetworkPanel3 )
	self.NetworkPanel3 = NetworkPanel3
	
	local VersionLabel = LUI.UITightText.new()
	VersionLabel:setLeftRight( true, false, 25, 134 )
	VersionLabel:setTopBottom( true, false, 326.5, 351.5 )
	VersionLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_VERSION" ) )
	VersionLabel:setTTF( "fonts/default.ttf" )
	self:addElement( VersionLabel )
	self.VersionLabel = VersionLabel
	
	local VersionValueLabel = LUI.UITightText.new()
	VersionValueLabel:setLeftRight( true, false, 200, 400 )
	VersionValueLabel:setTopBottom( true, false, 315, 335 )
	VersionValueLabel:setTTF( "fonts/default.ttf" )
	VersionValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "version", function ( model )
		local version = Engine.GetModelValue( model )
		if version then
			VersionValueLabel:setText( Engine.Localize( version ) )
		end
	end )
	self:addElement( VersionValueLabel )
	self.VersionValueLabel = VersionValueLabel
	
	local AboutPingBarsDesc = LUI.UIText.new()
	AboutPingBarsDesc:setLeftRight( true, true, 25, -25 )
	AboutPingBarsDesc:setTopBottom( true, false, 122, 144 )
	AboutPingBarsDesc:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS_DES" ) )
	AboutPingBarsDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AboutPingBarsDesc )
	self.AboutPingBarsDesc = AboutPingBarsDesc
	
	local AboutPingBarsLabel = LUI.UITightText.new()
	AboutPingBarsLabel:setLeftRight( true, false, 25, 133.75 )
	AboutPingBarsLabel:setTopBottom( true, false, 96, 122 )
	AboutPingBarsLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS" ) )
	AboutPingBarsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( AboutPingBarsLabel )
	self.AboutPingBarsLabel = AboutPingBarsLabel
	
	local SupportLinkLabel = LUI.UITightText.new()
	SupportLinkLabel:setLeftRight( true, false, 25, 289 )
	SupportLinkLabel:setTopBottom( true, false, 35, 60 )
	SupportLinkLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK" ) )
	SupportLinkLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLinkLabel )
	self.SupportLinkLabel = SupportLinkLabel
	
	local SupportLabel = LUI.UITightText.new()
	SupportLabel:setLeftRight( true, false, 25, 230.16 )
	SupportLabel:setTopBottom( true, false, 10, 35 )
	SupportLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_SUPPORT_LINK" ) )
	SupportLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLabel )
	self.SupportLabel = SupportLabel
	
	local ConnectivityLabel = LUI.UITightText.new()
	ConnectivityLabel:setLeftRight( true, false, 200, 400 )
	ConnectivityLabel:setTopBottom( true, false, 339, 359 )
	ConnectivityLabel:setTTF( "fonts/default.ttf" )
	ConnectivityLabel:subscribeToGlobalModel( controller, "NetworkInfo", "connectivityInfo", function ( model )
		local connectivityInfo = Engine.GetModelValue( model )
		if connectivityInfo then
			ConnectivityLabel:setText( Engine.Localize( connectivityInfo ) )
		end
	end )
	self:addElement( ConnectivityLabel )
	self.ConnectivityLabel = ConnectivityLabel
	
	local pingList = LUI.GridLayout.new( menu, controller, false, 0, 0, 10, 0, nil, nil, false, false, 0, 0, false, true )
	pingList:setLeftRight( false, false, -226.43, 233.57 )
	pingList:setTopBottom( true, false, 197.48, 281.48 )
	pingList:setWidgetType( CoD.StartMenu_Options_Network_PingListItem )
	pingList:setHorizontalCount( 5 )
	pingList:setSpacing( 10 )
	pingList:setDataSource( "AboutPingBars" )
	self:addElement( pingList )
	self.pingList = pingList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				NetworkBox2:completeAnimation()
				self.NetworkBox2:setLeftRight( true, true, 0, 0 )
				self.NetworkBox2:setTopBottom( true, false, 75.5, 145.5 )
				self.clipFinished( NetworkBox2, {} )
				NetworkBox3:completeAnimation()
				self.NetworkBox3:setAlpha( 0 )
				self.clipFinished( NetworkBox3, {} )
				NetworkPanel1:completeAnimation()
				self.NetworkPanel1:setAlpha( 0 )
				self.clipFinished( NetworkPanel1, {} )
				NetworkPanel3:completeAnimation()
				self.NetworkPanel3:setLeftRight( true, true, 190, -12 )
				self.NetworkPanel3:setTopBottom( true, false, 82.5, 136.5 )
				self.clipFinished( NetworkPanel3, {} )
				VersionLabel:completeAnimation()
				self.VersionLabel:setLeftRight( true, false, 25, 134 )
				self.VersionLabel:setTopBottom( true, false, 97, 122 )
				self.clipFinished( VersionLabel, {} )
				VersionValueLabel:completeAnimation()
				self.VersionValueLabel:setLeftRight( true, false, 200, 400 )
				self.VersionValueLabel:setTopBottom( true, false, 85.5, 105.5 )
				self.clipFinished( VersionValueLabel, {} )
				AboutPingBarsDesc:completeAnimation()
				self.AboutPingBarsDesc:setAlpha( 0 )
				self.clipFinished( AboutPingBarsDesc, {} )
				AboutPingBarsLabel:completeAnimation()
				self.AboutPingBarsLabel:setAlpha( 0 )
				self.clipFinished( AboutPingBarsLabel, {} )
				ConnectivityLabel:completeAnimation()
				self.ConnectivityLabel:setLeftRight( true, false, 200, 400 )
				self.ConnectivityLabel:setTopBottom( true, false, 109.5, 129.5 )
				self.clipFinished( ConnectivityLabel, {} )
				pingList:completeAnimation()
				self.pingList:setAlpha( 0 )
				self.clipFinished( pingList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NetworkBox1:close()
		element.NetworkBox2:close()
		element.NetworkBox3:close()
		element.NetworkPanel1:close()
		element.NetworkPanel3:close()
		element.pingList:close()
		element.VersionValueLabel:close()
		element.ConnectivityLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

