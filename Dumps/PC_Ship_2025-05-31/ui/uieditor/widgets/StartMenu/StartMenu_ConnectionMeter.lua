require( "ui.uieditor.widgets.StartMenu.StartMenu_ConnectionMeter_PingImage" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ConnectionMeter_PacketLossImage" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "NetStatsInfo", true )
	local f1_local1 = Engine.CreateModel( f1_local0, "NETSTATS_LATENCY", true )
	local f1_local2 = Engine.CreateModel( f1_local0, "NETSTATS_PACKETLOSS", true )
	local f1_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo", true )
end

CoD.StartMenu_ConnectionMeter = InheritFrom( LUI.UIElement )
CoD.StartMenu_ConnectionMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_ConnectionMeter )
	self.id = "StartMenu_ConnectionMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 165 )
	self.anyChildUsesUpdateState = true
	
	local bg1 = LUI.UIImage.new()
	bg1:setLeftRight( true, false, 189.63, 307 )
	bg1:setTopBottom( true, false, 0, 70 )
	bg1:setRGB( 0, 0, 0 )
	bg1:setAlpha( 0.7 )
	self:addElement( bg1 )
	self.bg1 = bg1
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, 0, 190 )
	bg0:setTopBottom( true, false, 0, 70 )
	bg0:setRGB( 0, 0, 0 )
	bg0:setAlpha( 0.4 )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local PingLabel = LUI.UITightText.new()
	PingLabel:setLeftRight( true, false, 200, 228 )
	PingLabel:setTopBottom( true, false, 22.5, 47.5 )
	PingLabel:setText( Engine.Localize( "MPUI_CONNECTION_METER_PING_CAPS" ) )
	PingLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PingLabel )
	self.PingLabel = PingLabel
	
	local PingBarGraph = LUI.UIImage.new()
	PingBarGraph:setLeftRight( true, false, 0, 190 )
	PingBarGraph:setTopBottom( true, false, 0, 70 )
	PingBarGraph:setupRenderGraph()
	PingBarGraph:setGraphMode( 1 )
	self:addElement( PingBarGraph )
	self.PingBarGraph = PingBarGraph
	
	local bg10 = LUI.UIImage.new()
	bg10:setLeftRight( true, false, 191.63, 309 )
	bg10:setTopBottom( true, false, 90, 164 )
	bg10:setRGB( 0, 0, 0 )
	bg10:setAlpha( 0.7 )
	self:addElement( bg10 )
	self.bg10 = bg10
	
	local bg00 = LUI.UIImage.new()
	bg00:setLeftRight( true, false, 2, 192 )
	bg00:setTopBottom( true, false, 90, 164 )
	bg00:setRGB( 0, 0, 0 )
	bg00:setAlpha( 0.4 )
	self:addElement( bg00 )
	self.bg00 = bg00
	
	local PacketLossBarGraph = LUI.UIImage.new()
	PacketLossBarGraph:setLeftRight( true, false, 2, 192 )
	PacketLossBarGraph:setTopBottom( true, false, 90, 164 )
	PacketLossBarGraph:setupRenderGraph()
	PacketLossBarGraph:setGraphMode( 2 )
	self:addElement( PacketLossBarGraph )
	self.PacketLossBarGraph = PacketLossBarGraph
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 200, 264 )
	TextBox0:setTopBottom( true, false, 99, 124 )
	TextBox0:setText( Engine.Localize( "MPUI_CONNECTION_METER_PACKET_LOSS_CAPS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local PingTextBox = LUI.UIText.new()
	PingTextBox:setLeftRight( true, false, 262, 296 )
	PingTextBox:setTopBottom( true, false, 35, 60 )
	PingTextBox:setTTF( "fonts/default.ttf" )
	PingTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PingTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PingTextBox:subscribeToGlobalModel( controller, "NetStatsInfo", "NETSTATS_LATENCY", function ( model )
		local NETSTATS_LATENCY = Engine.GetModelValue( model )
		if NETSTATS_LATENCY then
			PingTextBox:setText( Engine.Localize( AppendString( "ms", NETSTATS_LATENCY ) ) )
		end
	end )
	self:addElement( PingTextBox )
	self.PingTextBox = PingTextBox
	
	local PingTextBox0 = LUI.UIText.new()
	PingTextBox0:setLeftRight( true, false, 262, 296 )
	PingTextBox0:setTopBottom( true, false, 125, 150 )
	PingTextBox0:setTTF( "fonts/default.ttf" )
	PingTextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PingTextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PingTextBox0:subscribeToGlobalModel( controller, "NetStatsInfo", "NETSTATS_PACKETLOSS", function ( model )
		local NETSTATS_PACKETLOSS = Engine.GetModelValue( model )
		if NETSTATS_PACKETLOSS then
			PingTextBox0:setText( Engine.Localize( AppendString( "%", NETSTATS_PACKETLOSS ) ) )
		end
	end )
	self:addElement( PingTextBox0 )
	self.PingTextBox0 = PingTextBox0
	
	local StartMenuConnectionMeterPingImage0 = CoD.StartMenu_ConnectionMeter_PingImage.new( menu, controller )
	StartMenuConnectionMeterPingImage0:setLeftRight( true, false, 262, 291 )
	StartMenuConnectionMeterPingImage0:setTopBottom( true, false, 4, 35 )
	StartMenuConnectionMeterPingImage0:subscribeToGlobalModel( controller, "NetStatsInfo", nil, function ( model )
		StartMenuConnectionMeterPingImage0:setModel( model, controller )
	end )
	self:addElement( StartMenuConnectionMeterPingImage0 )
	self.StartMenuConnectionMeterPingImage0 = StartMenuConnectionMeterPingImage0
	
	local StartMenuConnectionMeterPacketLossImage0 = CoD.StartMenu_ConnectionMeter_PacketLossImage.new( menu, controller )
	StartMenuConnectionMeterPacketLossImage0:setLeftRight( true, false, 264, 293 )
	StartMenuConnectionMeterPacketLossImage0:setTopBottom( true, false, 94, 125 )
	StartMenuConnectionMeterPacketLossImage0:subscribeToGlobalModel( controller, "NetStatsInfo", nil, function ( model )
		StartMenuConnectionMeterPacketLossImage0:setModel( model, controller )
	end )
	self:addElement( StartMenuConnectionMeterPacketLossImage0 )
	self.StartMenuConnectionMeterPacketLossImage0 = StartMenuConnectionMeterPacketLossImage0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuConnectionMeterPingImage0:close()
		element.StartMenuConnectionMeterPacketLossImage0:close()
		element.PingTextBox:close()
		element.PingTextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

