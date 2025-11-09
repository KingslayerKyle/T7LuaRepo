require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

LUI.createMenu.StartMenu_Options_Network_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Network_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network_PC.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 1, 1281 )
	Background:setTopBottom( true, false, -4.08, 715.92 )
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
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
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
		local natType = Engine.GetModelValue( model )
		if natType then
			NatValueLabel:setText( Engine.Localize( natType ) )
		end
	end )
	self:addElement( NatValueLabel )
	self.NatValueLabel = NatValueLabel
	
	local BandwidthValueLabel = LUI.UITightText.new()
	BandwidthValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	BandwidthValueLabel:setTopBottom( true, false, 282, 307 )
	BandwidthValueLabel:setTTF( "fonts/default.ttf" )
	BandwidthValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "bandwidth", function ( model )
		local bandwidth = Engine.GetModelValue( model )
		if bandwidth then
			BandwidthValueLabel:setText( Engine.Localize( bandwidth ) )
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
		local connectionType = Engine.GetModelValue( model )
		if connectionType then
			ConnectionTypeValueLabel:setText( Engine.Localize( connectionType ) )
		end
	end )
	self:addElement( ConnectionTypeValueLabel )
	self.ConnectionTypeValueLabel = ConnectionTypeValueLabel
	
	local ExternalIPValueLabel = LUI.UITightText.new()
	ExternalIPValueLabel:setLeftRight( true, false, 300.43, 500.43 )
	ExternalIPValueLabel:setTopBottom( true, false, 389.1, 414.1 )
	ExternalIPValueLabel:setTTF( "fonts/default.ttf" )
	ExternalIPValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "externalIP", function ( model )
		local externalIP = Engine.GetModelValue( model )
		if externalIP then
			ExternalIPValueLabel:setText( Engine.Localize( externalIP ) )
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
		local internalIP = Engine.GetModelValue( model )
		if internalIP then
			InternalPValueLabel:setText( Engine.Localize( internalIP ) )
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
		local region = Engine.GetModelValue( model )
		if region then
			RegionValueLabel:setText( Engine.Localize( region ) )
		end
	end )
	self:addElement( RegionValueLabel )
	self.RegionValueLabel = RegionValueLabel
	
	local VersionLabel = LUI.UITightText.new()
	VersionLabel:setLeftRight( true, false, 714.74, 823.74 )
	VersionLabel:setTopBottom( true, false, 344.96, 369.96 )
	VersionLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_VERSION" ) )
	VersionLabel:setTTF( "fonts/default.ttf" )
	self:addElement( VersionLabel )
	self.VersionLabel = VersionLabel
	
	local VersionValueLabel = LUI.UITightText.new()
	VersionValueLabel:setLeftRight( true, false, 890.74, 1090.74 )
	VersionValueLabel:setTopBottom( true, false, 333.46, 358.46 )
	VersionValueLabel:setTTF( "fonts/default.ttf" )
	VersionValueLabel:subscribeToGlobalModel( controller, "NetworkInfo", "version", function ( model )
		local version = Engine.GetModelValue( model )
		if version then
			VersionValueLabel:setText( Engine.Localize( version ) )
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
	ConnectivityLabel:setLeftRight( true, false, 890.74, 1090.74 )
	ConnectivityLabel:setTopBottom( true, false, 355.92, 380.92 )
	ConnectivityLabel:setTTF( "fonts/default.ttf" )
	ConnectivityLabel:subscribeToGlobalModel( controller, "NetworkInfo", "connectivityInfo", function ( model )
		local connectivityInfo = Engine.GetModelValue( model )
		if connectivityInfo then
			ConnectivityLabel:setText( Engine.Localize( connectivityInfo ) )
		end
	end )
	self:addElement( ConnectivityLabel )
	self.ConnectivityLabel = ConnectivityLabel
	
	local FirstPartyStateLabel = LUI.UITightText.new()
	FirstPartyStateLabel:setLeftRight( true, false, 88.43, 543.43 )
	FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
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
	ErrorImage:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
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
	
	local NetworkBox5 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox5:setLeftRight( true, true, 68, -681.23 )
	NetworkBox5:setTopBottom( true, true, 134.58, -510.5 )
	self:addElement( NetworkBox5 )
	self.NetworkBox5 = NetworkBox5
	
	local NetworkBox4 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox4:setLeftRight( true, true, 689.35, -71 )
	NetworkBox4:setTopBottom( true, true, 134.58, -405.08 )
	self:addElement( NetworkBox4 )
	self.NetworkBox4 = NetworkBox4
	
	local NetworkBox2 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox2:setLeftRight( true, true, 689.99, -70.37 )
	NetworkBox2:setTopBottom( true, true, 322, -327.08 )
	self:addElement( NetworkBox2 )
	self.NetworkBox2 = NetworkBox2
	
	local NetworkBox1 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox1:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox1:setTopBottom( true, true, 547, -102.08 )
	self:addElement( NetworkBox1 )
	self.NetworkBox1 = NetworkBox1
	
	local NetworkPanel = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel:setLeftRight( true, true, 702.02, -82.4 )
	NetworkPanel:setTopBottom( true, true, 144.52, -414.98 )
	NetworkPanel:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel:setAlpha( 0.3 )
	self:addElement( NetworkPanel )
	self.NetworkPanel = NetworkPanel
	
	local NetworkPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel0:setLeftRight( true, true, 79.59, -692.82 )
	NetworkPanel0:setTopBottom( true, true, 143.88, -521.04 )
	NetworkPanel0:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel0:setAlpha( 0.3 )
	self:addElement( NetworkPanel0 )
	self.NetworkPanel0 = NetworkPanel0
	
	local NetworkPanel2 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel2:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel2:setTopBottom( true, true, 226.9, -461.6 )
	NetworkPanel2:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel2:setAlpha( 0.3 )
	self:addElement( NetworkPanel2 )
	self.NetworkPanel2 = NetworkPanel2
	
	local NetworkPanel3 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel3:setLeftRight( true, true, 880.65, -81.76 )
	NetworkPanel3:setTopBottom( true, true, 331, -336.08 )
	NetworkPanel3:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel3:setAlpha( 0.3 )
	self:addElement( NetworkPanel3 )
	self.NetworkPanel3 = NetworkPanel3
	
	local NetworkBox6 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox6:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox6:setTopBottom( true, true, 219.58, -452.42 )
	self:addElement( NetworkBox6 )
	self.NetworkBox6 = NetworkBox6
	
	local NetworkBox7 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox7:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox7:setTopBottom( true, true, 272, -400 )
	self:addElement( NetworkBox7 )
	self.NetworkBox7 = NetworkBox7
	
	local NetworkBox8 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox8:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox8:setTopBottom( true, true, 324.58, -347.42 )
	self:addElement( NetworkBox8 )
	self.NetworkBox8 = NetworkBox8
	
	local NetworkBox9 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox9:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox9:setTopBottom( true, true, 378.15, -293.85 )
	self:addElement( NetworkBox9 )
	self.NetworkBox9 = NetworkBox9
	
	local NetworkBox10 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox10:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox10:setTopBottom( true, true, 431.54, -240.46 )
	self:addElement( NetworkBox10 )
	self.NetworkBox10 = NetworkBox10
	
	local NetworkBox11 = CoD.cac_ButtonBoxLrgInactiveStroke.new( self, controller )
	NetworkBox11:setLeftRight( true, true, 70.27, -681.23 )
	NetworkBox11:setTopBottom( true, true, 485.75, -186.25 )
	self:addElement( NetworkBox11 )
	self.NetworkBox11 = NetworkBox11
	
	local NetworkPanel12 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel12:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel12:setTopBottom( true, true, 280.67, -408.67 )
	NetworkPanel12:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel12:setAlpha( 0.3 )
	self:addElement( NetworkPanel12 )
	self.NetworkPanel12 = NetworkPanel12
	
	local NetworkPanel13 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel13:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel13:setTopBottom( true, true, 331.7, -357.65 )
	NetworkPanel13:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel13:setAlpha( 0.3 )
	self:addElement( NetworkPanel13 )
	self.NetworkPanel13 = NetworkPanel13
	
	local NetworkPanel14 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel14:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel14:setTopBottom( true, true, 386.27, -303.08 )
	NetworkPanel14:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel14:setAlpha( 0.3 )
	self:addElement( NetworkPanel14 )
	self.NetworkPanel14 = NetworkPanel14
	
	local NetworkPanel15 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel15:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel15:setTopBottom( true, true, 440.21, -249.14 )
	NetworkPanel15:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel15:setAlpha( 0.3 )
	self:addElement( NetworkPanel15 )
	self.NetworkPanel15 = NetworkPanel15
	
	local NetworkPanel16 = CoD.FE_ButtonPanel.new( self, controller )
	NetworkPanel16:setLeftRight( true, true, 290.59, -692.82 )
	NetworkPanel16:setTopBottom( true, true, 494.42, -194.92 )
	NetworkPanel16:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel16:setAlpha( 0.3 )
	self:addElement( NetworkPanel16 )
	self.NetworkPanel16 = NetworkPanel16
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setLeftRight( true, false, 84.43, 110.43 )
				self.InternetStateLabel:setTopBottom( true, false, 145.6, 170.6 )
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setLeftRight( true, false, 88.43, 221.59 )
				self.FirstPartyStateLabel:setTopBottom( true, false, 146.6, 170.6 )
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
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
			end
		},
		NoInternet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.InternetStateLabel:setAlpha( 1 )
				self.InternetStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED" ) )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setAlpha( 0 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setAlpha( 0 )
				self.clipFinished( ServerStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 710.6, 746.6 )
				self.ErrorImage:setTopBottom( true, false, 151.63, 182.6 )
				self.ErrorImage:setRGB( 1, 0, 0 )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setAlpha( 1 )
				self.ProblemInternetDescLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_INTERNET_NOT_CONNECTED_DESC" ) )
				self.clipFinished( ProblemInternetDescLabel, {} )
			end
		},
		NotSignedInToLive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
				self.FirstPartyStateLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN" ) )
				self.clipFinished( FirstPartyStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 710.6, 746.6 )
				self.ErrorImage:setTopBottom( true, false, 151.63, 182.6 )
				self.ErrorImage:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
				self.ProblemInternetDescLabel:setAlpha( 1 )
				self.ProblemInternetDescLabel:setText( Engine.Localize( "PLATFORM_OPTIONS_NETWORK_NOT_SIGNED_IN_DESC" ) )
				self.clipFinished( ProblemInternetDescLabel, {} )
			end
		},
		NotConnectedToCodServer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FooterBacking:completeAnimation()
				self.FooterBacking:setAlpha( 0 )
				self.clipFinished( FooterBacking, {} )
				AboutNatTypeDesc:completeAnimation()
				self.AboutNatTypeDesc:setAlpha( 0 )
				self.clipFinished( AboutNatTypeDesc, {} )
				AboutNatTypeLabel:completeAnimation()
				self.AboutNatTypeLabel:setAlpha( 0 )
				self.clipFinished( AboutNatTypeLabel, {} )
				InternetStateLabel:completeAnimation()
				self.InternetStateLabel:setAlpha( 0 )
				self.clipFinished( InternetStateLabel, {} )
				FirstPartyStateLabel:completeAnimation()
				self.FirstPartyStateLabel:setRGB( 1, 1, 1 )
				self.clipFinished( FirstPartyStateLabel, {} )
				ServerStateLabel:completeAnimation()
				self.ServerStateLabel:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ServerStateLabel:setText( Engine.Localize( "MENU_OPTIONS_NETWORK_COD_NOT_CONNECTED" ) )
				self.clipFinished( ServerStateLabel, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 710.6, 746.6 )
				self.ErrorImage:setTopBottom( true, false, 151.63, 182.6 )
				self.ErrorImage:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProblemInternetDescLabel:completeAnimation()
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f17_local0 = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerText( "MENU_OPTIONS_NETWORK_ONLINE_SERVICES_CAPS" )
		if not f17_local0 then
			f17_local0 = self:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
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
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenulineGraphicsOptions0:close()
		element.NetworkBox5:close()
		element.NetworkBox4:close()
		element.NetworkBox2:close()
		element.NetworkBox1:close()
		element.NetworkPanel:close()
		element.NetworkPanel0:close()
		element.NetworkPanel2:close()
		element.NetworkPanel3:close()
		element.NetworkBox6:close()
		element.NetworkBox7:close()
		element.NetworkBox8:close()
		element.NetworkBox9:close()
		element.NetworkBox10:close()
		element.NetworkBox11:close()
		element.NetworkPanel12:close()
		element.NetworkPanel13:close()
		element.NetworkPanel14:close()
		element.NetworkPanel15:close()
		element.NetworkPanel16:close()
		element.MenuFrame:close()
		element.NatValueLabel:close()
		element.BandwidthValueLabel:close()
		element.ConnectionTypeValueLabel:close()
		element.ExternalIPValueLabel:close()
		element.InternalPValueLabel:close()
		element.RegionValueLabel:close()
		element.VersionValueLabel:close()
		element.ConnectivityLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network_PC.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

