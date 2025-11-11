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
	self:setLeftRight( 0, 0, 0, 780 )
	self:setTopBottom( 0, 0, 0, 562 )
	self.anyChildUsesUpdateState = true
	
	local NetworkBox1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox1:setLeftRight( 0, 1, 0, 0 )
	NetworkBox1:setTopBottom( 0, 0, 0, 105 )
	self:addElement( NetworkBox1 )
	self.NetworkBox1 = NetworkBox1
	
	local NetworkBox2 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox2:setLeftRight( 0, 1, 0, 0 )
	NetworkBox2:setTopBottom( 0, 0, 457, 562 )
	self:addElement( NetworkBox2 )
	self.NetworkBox2 = NetworkBox2
	
	local NetworkBox3 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox3:setLeftRight( 0, 1, 0, 0 )
	NetworkBox3:setTopBottom( 0, 0, 123, 444 )
	self:addElement( NetworkBox3 )
	self.NetworkBox3 = NetworkBox3
	
	local NetworkPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel1:setLeftRight( 0, 1, 18, -18 )
	NetworkPanel1:setTopBottom( 0, 0, 292, 424 )
	NetworkPanel1:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel1:setAlpha( 0.3 )
	self:addElement( NetworkPanel1 )
	self.NetworkPanel1 = NetworkPanel1
	
	local NetworkPanel3 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel3:setLeftRight( 0, 1, 286, -18 )
	NetworkPanel3:setTopBottom( 0, 0, 468, 549 )
	NetworkPanel3:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel3:setAlpha( 0.3 )
	self:addElement( NetworkPanel3 )
	self.NetworkPanel3 = NetworkPanel3
	
	local VersionLabel = LUI.UITightText.new()
	VersionLabel:setLeftRight( 0, 0, 37, 201 )
	VersionLabel:setTopBottom( 0, 0, 489, 527 )
	VersionLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_VERSION" ) )
	VersionLabel:setTTF( "fonts/default.ttf" )
	self:addElement( VersionLabel )
	self.VersionLabel = VersionLabel
	
	local VersionValueLabel = LUI.UITightText.new()
	VersionValueLabel:setLeftRight( 0, 0, 300, 600 )
	VersionValueLabel:setTopBottom( 0, 0, 473, 503 )
	VersionValueLabel:setTTF( "fonts/default.ttf" )
	VersionValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "version", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VersionValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( VersionValueLabel )
	self.VersionValueLabel = VersionValueLabel
	
	local AboutPingBarsDesc = LUI.UIText.new()
	AboutPingBarsDesc:setLeftRight( 0, 1, 38, -38 )
	AboutPingBarsDesc:setTopBottom( 0, 0, 183, 216 )
	AboutPingBarsDesc:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS_DES" ) )
	AboutPingBarsDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AboutPingBarsDesc )
	self.AboutPingBarsDesc = AboutPingBarsDesc
	
	local AboutPingBarsLabel = LUI.UITightText.new()
	AboutPingBarsLabel:setLeftRight( 0, 0, 38, 201 )
	AboutPingBarsLabel:setTopBottom( 0, 0, 144, 183 )
	AboutPingBarsLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS" ) )
	AboutPingBarsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( AboutPingBarsLabel )
	self.AboutPingBarsLabel = AboutPingBarsLabel
	
	local SupportLinkLabel = LUI.UITightText.new()
	SupportLinkLabel:setLeftRight( 0, 0, 38, 434 )
	SupportLinkLabel:setTopBottom( 0, 0, 52, 90 )
	SupportLinkLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK" ) )
	SupportLinkLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLinkLabel )
	self.SupportLinkLabel = SupportLinkLabel
	
	local SupportLabel = LUI.UITightText.new()
	SupportLabel:setLeftRight( 0, 0, 37, 345 )
	SupportLabel:setTopBottom( 0, 0, 15, 53 )
	SupportLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_SUPPORT_LINK" ) )
	SupportLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLabel )
	self.SupportLabel = SupportLabel
	
	local ConnectivityLabel = LUI.UITightText.new()
	ConnectivityLabel:setLeftRight( 0, 0, 300, 600 )
	ConnectivityLabel:setTopBottom( 0, 0, 508, 538 )
	ConnectivityLabel:setTTF( "fonts/default.ttf" )
	ConnectivityLabel:subscribeToGlobalModel( controller, "NetworkInfo", "connectivityInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConnectivityLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ConnectivityLabel )
	self.ConnectivityLabel = ConnectivityLabel
	
	local pingList = LUI.GridLayout.new( menu, controller, false, 0, 0, 15, 0, nil, nil, false, false, 0, 0, false, false )
	pingList:setLeftRight( 0.5, 0.5, -340, 350 )
	pingList:setTopBottom( 0, 0, 296, 422 )
	pingList:setWidgetType( CoD.StartMenu_Options_Network_PingListItem )
	pingList:setHorizontalCount( 5 )
	pingList:setSpacing( 15 )
	pingList:setDataSource( "AboutPingBars" )
	self:addElement( pingList )
	self.pingList = pingList
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NetworkBox1:close()
		self.NetworkBox2:close()
		self.NetworkBox3:close()
		self.NetworkPanel1:close()
		self.NetworkPanel3:close()
		self.pingList:close()
		self.VersionValueLabel:close()
		self.ConnectivityLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

