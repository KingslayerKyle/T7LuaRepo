require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.NetworkStats.NetworkPingBars" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

LUI.createMenu.StartMenu_Options_Network = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Network" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, -2, 1278 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local AboutNatTypeDesc = LUI.UIText.new()
	AboutNatTypeDesc:setLeftRight( true, false, 714.6, 1075.6 )
	AboutNatTypeDesc:setTopBottom( true, false, 182.5, 204.5 )
	AboutNatTypeDesc:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_NAT_DESC" ) )
	AboutNatTypeDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AboutNatTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AboutNatTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AboutNatTypeDesc )
	self.AboutNatTypeDesc = AboutNatTypeDesc
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( menu, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, -77, -44 )
	Line:setTopBottom( true, false, 132, 140 )
	Line:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	local BandwidthLabel = LUI.UITightText.new()
	BandwidthLabel:setLeftRight( true, false, 95.43, 295.43 )
	BandwidthLabel:setTopBottom( true, false, 283, 308 )
	BandwidthLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_BANDWIDTH" ) )
	BandwidthLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BandwidthLabel )
	self.BandwidthLabel = BandwidthLabel
	
	local NatLabel = LUI.UITightText.new()
	NatLabel:setLeftRight( true, false, 94.43, 294.43 )
	NatLabel:setTopBottom( true, false, 231.4, 256.4 )
	NatLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_NAT_TYPE" ) )
	NatLabel:setTTF( "fonts/default.ttf" )
	self:addElement( NatLabel )
	self.NatLabel = NatLabel
	
	local NatValueLabel = LUI.UITightText.new()
	NatValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	NatValueLabel:setTopBottom( true, false, 231.4, 256.4 )
	NatValueLabel:setTTF( "fonts/default.ttf" )
	NatValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "natType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NatValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( NatValueLabel )
	self.NatValueLabel = NatValueLabel
	
	local BandwidthValueLabel = LUI.UITightText.new()
	BandwidthValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	BandwidthValueLabel:setTopBottom( true, false, 282, 307 )
	BandwidthValueLabel:setTTF( "fonts/default.ttf" )
	BandwidthValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "bandwidth", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BandwidthValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( BandwidthValueLabel )
	self.BandwidthValueLabel = BandwidthValueLabel
	
	local ExternalIPLabel = LUI.UITightText.new()
	ExternalIPLabel:setLeftRight( true, false, 94.43, 226.43 )
	ExternalIPLabel:setTopBottom( true, false, 389.1, 414.1 )
	ExternalIPLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_EXTERNAL_IP" ) )
	ExternalIPLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ExternalIPLabel )
	self.ExternalIPLabel = ExternalIPLabel
	
	local ConnectionTypeLabel = LUI.UITightText.new()
	ConnectionTypeLabel:setLeftRight( true, false, 95.43, 197.43 )
	ConnectionTypeLabel:setTopBottom( true, false, 335.02, 360.02 )
	ConnectionTypeLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_CONNECTION_TYPE" ) )
	ConnectionTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ConnectionTypeLabel )
	self.ConnectionTypeLabel = ConnectionTypeLabel
	
	local ConnectionTypeValueLabel = LUI.UITightText.new()
	ConnectionTypeValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	ConnectionTypeValueLabel:setTopBottom( true, false, 334.52, 359.52 )
	ConnectionTypeValueLabel:setTTF( "fonts/default.ttf" )
	ConnectionTypeValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "connectionType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConnectionTypeValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ConnectionTypeValueLabel )
	self.ConnectionTypeValueLabel = ConnectionTypeValueLabel
	
	local ExternalIPValueLabel = LUI.UITightText.new()
	ExternalIPValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	ExternalIPValueLabel:setTopBottom( true, false, 389.1, 414.1 )
	ExternalIPValueLabel:setTTF( "fonts/default.ttf" )
	ExternalIPValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "externalIP", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ExternalIPValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ExternalIPValueLabel )
	self.ExternalIPValueLabel = ExternalIPValueLabel
	
	local InternalIPLabel = LUI.UITightText.new()
	InternalIPLabel:setLeftRight( true, false, 95.43, 221.59 )
	InternalIPLabel:setTopBottom( true, false, 442.1, 467.1 )
	InternalIPLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNAL_IP" ) )
	InternalIPLabel:setTTF( "fonts/default.ttf" )
	self:addElement( InternalIPLabel )
	self.InternalIPLabel = InternalIPLabel
	
	local InternalPValueLabel = LUI.UITightText.new()
	InternalPValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	InternalPValueLabel:setTopBottom( true, false, 442.1, 467.1 )
	InternalPValueLabel:setTTF( "fonts/default.ttf" )
	InternalPValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "internalIP", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InternalPValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( InternalPValueLabel )
	self.InternalPValueLabel = InternalPValueLabel
	
	local RegionLabel = LUI.UITightText.new()
	RegionLabel:setLeftRight( true, false, 94.43, 246.43 )
	RegionLabel:setTopBottom( true, false, 496.25, 521.25 )
	RegionLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_GEOGRAPHICAL_REGION" ) )
	RegionLabel:setTTF( "fonts/default.ttf" )
	self:addElement( RegionLabel )
	self.RegionLabel = RegionLabel
	
	local RegionValueLabel = LUI.UITightText.new()
	RegionValueLabel:setLeftRight( true, false, 297.43, 497.43 )
	RegionValueLabel:setTopBottom( true, false, 497.1, 522.1 )
	RegionValueLabel:setTTF( "fonts/default.ttf" )
	RegionValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "region", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RegionValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RegionValueLabel )
	self.RegionValueLabel = RegionValueLabel
	
	local VersionLabel = LUI.UITightText.new()
	VersionLabel:setLeftRight( true, false, 714.1, 823.1 )
	VersionLabel:setTopBottom( true, false, 569.96, 594.96 )
	VersionLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_VERSION" ) )
	VersionLabel:setTTF( "fonts/default.ttf" )
	self:addElement( VersionLabel )
	self.VersionLabel = VersionLabel
	
	local VersionValueLabel = LUI.UITightText.new()
	VersionValueLabel:setLeftRight( true, false, 890.1, 1090.1 )
	VersionValueLabel:setTopBottom( true, false, 558.46, 583.46 )
	VersionValueLabel:setTTF( "fonts/default.ttf" )
	VersionValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "version", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VersionValueLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( VersionValueLabel )
	self.VersionValueLabel = VersionValueLabel
	
	local AboutNatTypeLabel = LUI.UITightText.new()
	AboutNatTypeLabel:setLeftRight( true, false, 714.6, 816.6 )
	AboutNatTypeLabel:setTopBottom( true, false, 154.48, 180.32 )
	AboutNatTypeLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_NAT" ) )
	AboutNatTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( AboutNatTypeLabel )
	self.AboutNatTypeLabel = AboutNatTypeLabel
	
	local AboutPingBarsDesc = LUI.UIText.new()
	AboutPingBarsDesc:setLeftRight( true, false, 710.6, 1038.81 )
	AboutPingBarsDesc:setTopBottom( true, false, 365.02, 387.02 )
	AboutPingBarsDesc:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS_DES" ) )
	AboutPingBarsDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AboutPingBarsDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AboutPingBarsDesc )
	self.AboutPingBarsDesc = AboutPingBarsDesc
	
	local AboutPingBarsLabel = LUI.UITightText.new()
	AboutPingBarsLabel:setLeftRight( true, false, 710.6, 823.1 )
	AboutPingBarsLabel:setTopBottom( true, false, 339, 364.85 )
	AboutPingBarsLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_ABOUT_PING_BARS" ) )
	AboutPingBarsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( AboutPingBarsLabel )
	self.AboutPingBarsLabel = AboutPingBarsLabel
	
	local SupportLinkLabel = LUI.UITightText.new()
	SupportLinkLabel:setLeftRight( true, false, 95.43, 359.43 )
	SupportLinkLabel:setTopBottom( true, false, 581.92, 606.92 )
	SupportLinkLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK" ) )
	SupportLinkLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLinkLabel )
	self.SupportLinkLabel = SupportLinkLabel
	
	local SupportLabel = LUI.UITightText.new()
	SupportLabel:setLeftRight( true, false, 96.43, 300.43 )
	SupportLabel:setTopBottom( true, false, 556.46, 581.46 )
	SupportLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_SUPPORT_LINK" ) )
	SupportLabel:setTTF( "fonts/default.ttf" )
	self:addElement( SupportLabel )
	self.SupportLabel = SupportLabel
	
	local InternetStateLabel = LUI.UITightText.new()
	InternetStateLabel:setLeftRight( true, false, 88.43, 114.43 )
	InternetStateLabel:setTopBottom( true, false, 145.6, 170.6 )
	InternetStateLabel:setAlpha( 0 )
	InternetStateLabel:setText( Engine.Localize( "MENU_NEW" ) )
	InternetStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( InternetStateLabel )
	self.InternetStateLabel = InternetStateLabel
	
	local ConnectivityLabel = LUI.UITightText.new()
	ConnectivityLabel:setLeftRight( true, false, 890.1, 1090.1 )
	ConnectivityLabel:setTopBottom( true, false, 580.92, 605.92 )
	ConnectivityLabel:setTTF( "fonts/default.ttf" )
	ConnectivityLabel:subscribeToGlobalModel( controller, "NetworkInfo", "connectivityInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConnectivityLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ConnectivityLabel )
	self.ConnectivityLabel = ConnectivityLabel
	
	local FirstPartyStateLabel = LUI.UITightText.new()
	FirstPartyStateLabel:setLeftRight( true, false, 88.43, 198.43 )
	FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
	FirstPartyStateLabel:setRGB( 0.55, 1, 0 )
	FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
	FirstPartyStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FirstPartyStateLabel )
	self.FirstPartyStateLabel = FirstPartyStateLabel
	
	local ServerStateLabel = LUI.UITightText.new()
	ServerStateLabel:setLeftRight( true, false, 88.43, 298.43 )
	ServerStateLabel:setTopBottom( true, false, 170.6, 194.6 )
	ServerStateLabel:setRGB( 0.55, 1, 0 )
	ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
	ServerStateLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ServerStateLabel )
	self.ServerStateLabel = ServerStateLabel
	
	local ErrorImage = LUI.UIImage.new()
	ErrorImage:setLeftRight( true, false, 710.6, 746.6 )
	ErrorImage:setTopBottom( true, false, 151.63, 186.13 )
	ErrorImage:setAlpha( 0 )
	ErrorImage:setImage( RegisterImage( "uie_t7_icon_aar_death" ) )
	self:addElement( ErrorImage )
	self.ErrorImage = ErrorImage
	
	local ProblemInternetDescLabel = LUI.UIText.new()
	ProblemInternetDescLabel:setLeftRight( true, false, 748.6, 1075.6 )
	ProblemInternetDescLabel:setTopBottom( true, false, 154.48, 179.48 )
	ProblemInternetDescLabel:setAlpha( 0 )
	ProblemInternetDescLabel:setText( Engine.Localize( "MENU_NEW" ) )
	ProblemInternetDescLabel:setTTF( "fonts/default.ttf" )
	ProblemInternetDescLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ProblemInternetDescLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProblemInternetDescLabel )
	self.ProblemInternetDescLabel = ProblemInternetDescLabel
	
	local NetworkBox5 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox5:setLeftRight( true, true, 68, -681.23 )
	NetworkBox5:setTopBottom( true, true, 134.58, -510.5 )
	self:addElement( NetworkBox5 )
	self.NetworkBox5 = NetworkBox5
	
	local NetworkBox4 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox4:setLeftRight( true, true, 689.35, -71 )
	NetworkBox4:setTopBottom( true, true, 134.58, -405.08 )
	self:addElement( NetworkBox4 )
	self.NetworkBox4 = NetworkBox4
	
	local NetworkBox3 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox3:setLeftRight( true, true, 689.35, -71 )
	NetworkBox3:setTopBottom( true, true, 324.58, -181.5 )
	self:addElement( NetworkBox3 )
	self.NetworkBox3 = NetworkBox3
	
	local NetworkBox2 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox2:setLeftRight( true, true, 689.35, -71 )
	NetworkBox2:setTopBottom( true, true, 547, -102.08 )
	self:addElement( NetworkBox2 )
	self.NetworkBox2 = NetworkBox2
	
	local NetworkBox1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox1:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox1:setTopBottom( true, true, 547, -102.08 )
	self:addElement( NetworkBox1 )
	self.NetworkBox1 = NetworkBox1
	
	local NetworkPanel = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel:setLeftRight( true, true, 702.02, -82.4 )
	NetworkPanel:setTopBottom( true, true, 144.52, -414.98 )
	NetworkPanel:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel:setAlpha( 0.3 )
	self:addElement( NetworkPanel )
	self.NetworkPanel = NetworkPanel
	
	local NetworkPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel0:setLeftRight( true, true, 79.59, -692.82 )
	NetworkPanel0:setTopBottom( true, true, 143.88, -521.04 )
	NetworkPanel0:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel0:setAlpha( 0.3 )
	self:addElement( NetworkPanel0 )
	self.NetworkPanel0 = NetworkPanel0
	
	local NetworkPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel1:setLeftRight( true, true, 702.02, -82.4 )
	NetworkPanel1:setTopBottom( true, true, 438.1, -194.6 )
	NetworkPanel1:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel1:setAlpha( 0.3 )
	self:addElement( NetworkPanel1 )
	self.NetworkPanel1 = NetworkPanel1
	
	local NetworkPanel2 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel2:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel2:setTopBottom( true, true, 226.9, -461.6 )
	NetworkPanel2:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel2:setAlpha( 0.3 )
	self:addElement( NetworkPanel2 )
	self.NetworkPanel2 = NetworkPanel2
	
	local NetworkPanel3 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel3:setLeftRight( true, true, 880.02, -82.4 )
	NetworkPanel3:setTopBottom( true, true, 556, -111.08 )
	NetworkPanel3:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel3:setAlpha( 0.3 )
	self:addElement( NetworkPanel3 )
	self.NetworkPanel3 = NetworkPanel3
	
	local NetworkBox6 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox6:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox6:setTopBottom( true, true, 219.58, -452.42 )
	self:addElement( NetworkBox6 )
	self.NetworkBox6 = NetworkBox6
	
	local NetworkBox7 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox7:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox7:setTopBottom( true, true, 272, -400 )
	self:addElement( NetworkBox7 )
	self.NetworkBox7 = NetworkBox7
	
	local NetworkBox8 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox8:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox8:setTopBottom( true, true, 324.58, -347.42 )
	self:addElement( NetworkBox8 )
	self.NetworkBox8 = NetworkBox8
	
	local NetworkBox9 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox9:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox9:setTopBottom( true, true, 378.15, -293.85 )
	self:addElement( NetworkBox9 )
	self.NetworkBox9 = NetworkBox9
	
	local NetworkBox10 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox10:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox10:setTopBottom( true, true, 431.54, -240.46 )
	self:addElement( NetworkBox10 )
	self.NetworkBox10 = NetworkBox10
	
	local NetworkBox11 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox11:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox11:setTopBottom( true, true, 485.75, -186.25 )
	self:addElement( NetworkBox11 )
	self.NetworkBox11 = NetworkBox11
	
	local NetworkPanel12 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel12:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel12:setTopBottom( true, true, 280.67, -408.67 )
	NetworkPanel12:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel12:setAlpha( 0.3 )
	self:addElement( NetworkPanel12 )
	self.NetworkPanel12 = NetworkPanel12
	
	local NetworkPanel13 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel13:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel13:setTopBottom( true, true, 331.7, -357.65 )
	NetworkPanel13:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel13:setAlpha( 0.3 )
	self:addElement( NetworkPanel13 )
	self.NetworkPanel13 = NetworkPanel13
	
	local NetworkPanel14 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel14:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel14:setTopBottom( true, true, 386.27, -303.08 )
	NetworkPanel14:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel14:setAlpha( 0.3 )
	self:addElement( NetworkPanel14 )
	self.NetworkPanel14 = NetworkPanel14
	
	local NetworkPanel15 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel15:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel15:setTopBottom( true, true, 440.21, -249.14 )
	NetworkPanel15:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel15:setAlpha( 0.3 )
	self:addElement( NetworkPanel15 )
	self.NetworkPanel15 = NetworkPanel15
	
	local NetworkPanel16 = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel16:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel16:setTopBottom( true, true, 494.42, -194.92 )
	NetworkPanel16:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel16:setAlpha( 0.3 )
	self:addElement( NetworkPanel16 )
	self.NetworkPanel16 = NetworkPanel16
	
	local NetworkPingBars = CoD.NetworkPingBars.new( menu, controller )
	NetworkPingBars:setLeftRight( true, false, 714.6, 1090.1 )
	NetworkPingBars:setTopBottom( true, false, 427.64, 521.25 )
	NetworkPingBars:setAlpha( 0 )
	self:addElement( NetworkPingBars )
	self.NetworkPingBars = NetworkPingBars
	
	local MenuFrame = CoD.GenericMenuFrame.new( menu, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SET1 = LUI.UIImage.new()
	SET1:setLeftRight( true, false, 714.6, 1098.6 )
	SET1:setTopBottom( true, false, 441.08, 525.08 )
	SET1:setImage( RegisterImage( "uie_t7_icon_network_set1" ) )
	self:addElement( SET1 )
	self.SET1 = SET1
	
	local SET2 = LUI.UIImage.new()
	SET2:setLeftRight( true, false, 714.1, 1098.1 )
	SET2:setTopBottom( true, false, 440.21, 524.21 )
	SET2:setAlpha( 0 )
	SET2:setImage( RegisterImage( "uie_t7_icon_network_set2" ) )
	self:addElement( SET2 )
	self.SET2 = SET2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setLeftRight( true, false, 84.43, 110.43 )
				self.InternetStateLabel:setTopBottom( true, false, 145.6, 170.6 )
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 84.43, 217.59 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
				self.FirstPartyStateLabel:setRGB( 0.55, 1, 0 )
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( 0.55, 1, 0 )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setAlpha( 0 )
				self.clipFinished( ProblemInternetDescLabel, {} )
				NetworkPanel2:completeAnimation()
				self.NetworkPanel2:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel2:setTopBottom( true, true, 228.25, -461.1 )
				self.clipFinished( NetworkPanel2, {} )
				NetworkPanel12:completeAnimation()
				self.NetworkPanel12:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel12:setTopBottom( true, true, 280.67, -408.67 )
				self.clipFinished( NetworkPanel12, {} )
				NetworkPanel13:completeAnimation()
				self.NetworkPanel13:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel13:setTopBottom( true, true, 331.7, -357.65 )
				self.clipFinished( NetworkPanel13, {} )
				NetworkPanel14:completeAnimation()
				self.NetworkPanel14:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel14:setTopBottom( true, true, 386.27, -303.08 )
				self.clipFinished( NetworkPanel14, {} )
				NetworkPanel15:completeAnimation()
				self.NetworkPanel15:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel15:setTopBottom( true, true, 440.21, -249.14 )
				self.clipFinished( NetworkPanel15, {} )
				NetworkPanel16:completeAnimation()
				self.NetworkPanel16:setLeftRight( true, true, 286.59, -696.82 )
				self.NetworkPanel16:setTopBottom( true, true, 490.42, -198.92 )
				self.clipFinished( NetworkPanel16, {} )
			end
		},
		NoInternet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				AboutPingBarsDesc:completeAnimation()
				self.AboutPingBarsDesc:setAlpha( 0 )
				self.clipFinished( AboutPingBarsDesc, {} )
				AboutPingBarsLabel:completeAnimation()
				self.AboutPingBarsLabel:setAlpha( 0 )
				self.clipFinished( AboutPingBarsLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setLeftRight( true, false, 81.72, 251.15 )
				self.InternetStateLabel:setTopBottom( true, false, 147.04, 172.04 )
				self.InternetStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.InternetStateLabel:setAlpha( 1 )
				self.InternetStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED" ) )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 84.43, 251.15 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
				self.FirstPartyStateLabel:setAlpha( 0 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 0 )
				self.clipFinished( ServerStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 709.02, 745.02 )
				self.ErrorImage:setTopBottom( true, false, 145.82, 180.32 )
				self.ErrorImage:setRGB( 1, 0, 0 )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setLeftRight( true, false, 744.18, 1168.18 )
				self.ProblemInternetDescLabel:setTopBottom( true, false, 150.6, 175.6 )
				self.ProblemInternetDescLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED_DESC" ) )
				self.clipFinished( ProblemInternetDescLabel, {} )
			end
		},
		NotSignedInToLive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				AboutPingBarsDesc:completeAnimation()
				self.AboutPingBarsDesc:setAlpha( 0 )
				self.clipFinished( AboutPingBarsDesc, {} )
				AboutPingBarsLabel:completeAnimation()
				self.AboutPingBarsLabel:setAlpha( 0 )
				self.clipFinished( AboutPingBarsLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 84.43, 242.43 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
				self.FirstPartyStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 718.6, 754.6 )
				self.ErrorImage:setTopBottom( true, false, 150.6, 185.1 )
				self.ErrorImage:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setLeftRight( true, false, 754.6, 1081.6 )
				self.ProblemInternetDescLabel:setTopBottom( true, false, 155.6, 180.6 )
				self.ProblemInternetDescLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN_DESC" ) )
				self.clipFinished( ProblemInternetDescLabel, {} )
			end
		},
		NotConnectedToCodServer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				FooterBacking:completeAnimation()
				self.FooterBacking:setAlpha( 0 )
				self.clipFinished( FooterBacking, {} )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				AboutPingBarsDesc:completeAnimation()
				self.AboutPingBarsDesc:setAlpha( 0 )
				self.clipFinished( AboutPingBarsDesc, {} )
				AboutPingBarsLabel:completeAnimation()
				self.AboutPingBarsLabel:setAlpha( 0 )
				self.clipFinished( AboutPingBarsLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 84.43, 217.59 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
				self.FirstPartyStateLabel:setRGB( 0.55, 1, 0 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setLeftRight( true, false, 84.43, 339.89 )
				self.ServerStateLabel:setTopBottom( true, false, 170.6, 194.6 )
				self.ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setLeftRight( true, false, 754.6, 1081.6 )
				self.ProblemInternetDescLabel:setTopBottom( true, false, 151.04, 176.04 )
				self.ProblemInternetDescLabel:setAlpha( 1 )
				self.ProblemInternetDescLabel:setText( Engine.Localize( "MENU_SERVER_NOT_AVAILABLE_TRY_LATER" ) )
				self.clipFinished( ProblemInternetDescLabel, {} )
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
				local f16_local0
				if not IsPlayerConnectedToCodServers( controller ) then
					f16_local0 = IsPlayerSignedInToLive( controller )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( menu )
		SetHeadingKickerText( "MENU_OPTIONS_NETWORK_ONLINE_SERVICES_CAPS" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenulineGraphicsOptions0:close()
		self.NetworkBox5:close()
		self.NetworkBox4:close()
		self.NetworkBox3:close()
		self.NetworkBox2:close()
		self.NetworkBox1:close()
		self.NetworkPanel:close()
		self.NetworkPanel0:close()
		self.NetworkPanel1:close()
		self.NetworkPanel2:close()
		self.NetworkPanel3:close()
		self.NetworkBox6:close()
		self.NetworkBox7:close()
		self.NetworkBox8:close()
		self.NetworkBox9:close()
		self.NetworkBox10:close()
		self.NetworkBox11:close()
		self.NetworkPanel12:close()
		self.NetworkPanel13:close()
		self.NetworkPanel14:close()
		self.NetworkPanel15:close()
		self.NetworkPanel16:close()
		self.NetworkPingBars:close()
		self.MenuFrame:close()
		self.NatValueLabel:close()
		self.BandwidthValueLabel:close()
		self.ConnectionTypeValueLabel:close()
		self.ExternalIPValueLabel:close()
		self.InternalPValueLabel:close()
		self.RegionValueLabel:close()
		self.VersionValueLabel:close()
		self.ConnectivityLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

