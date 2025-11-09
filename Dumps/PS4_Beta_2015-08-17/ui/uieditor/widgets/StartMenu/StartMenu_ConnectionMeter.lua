local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkImage", true )
	Engine.CreateModel( rootModel, "image1", true )
	Engine.CreateModel( rootModel, "image2", true )
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
	
	local BarGraphValue0 = LUI.UITightText.new()
	BarGraphValue0:setLeftRight( true, false, 260.5, 307 )
	BarGraphValue0:setTopBottom( true, false, 22.5, 47.5 )
	BarGraphValue0:setTTF( "fonts/default.ttf" )
	BarGraphValue0:setupRenderGraphValue()
	BarGraphValue0:setGraphValueMode( 1 )
	self:addElement( BarGraphValue0 )
	self.BarGraphValue0 = BarGraphValue0
	
	local bg10 = LUI.UIImage.new()
	bg10:setLeftRight( true, false, 191.63, 309 )
	bg10:setTopBottom( true, false, 89, 159 )
	bg10:setRGB( 0, 0, 0 )
	bg10:setAlpha( 0.7 )
	self:addElement( bg10 )
	self.bg10 = bg10
	
	local bg00 = LUI.UIImage.new()
	bg00:setLeftRight( true, false, 2, 192 )
	bg00:setTopBottom( true, false, 90, 160 )
	bg00:setRGB( 0, 0, 0 )
	bg00:setAlpha( 0.4 )
	self:addElement( bg00 )
	self.bg00 = bg00
	
	local PacketLossBarGraph = LUI.UIImage.new()
	PacketLossBarGraph:setLeftRight( true, false, 2, 192 )
	PacketLossBarGraph:setTopBottom( true, false, 90, 163 )
	PacketLossBarGraph:setupRenderGraph()
	PacketLossBarGraph:setGraphMode( 2 )
	self:addElement( PacketLossBarGraph )
	self.PacketLossBarGraph = PacketLossBarGraph
	
	local BarGraphValue00 = LUI.UITightText.new()
	BarGraphValue00:setLeftRight( true, false, 262.5, 309 )
	BarGraphValue00:setTopBottom( true, false, 112.5, 137.5 )
	BarGraphValue00:setTTF( "fonts/default.ttf" )
	BarGraphValue00:setupRenderGraphValue()
	BarGraphValue00:setGraphValueMode( 2 )
	self:addElement( BarGraphValue00 )
	self.BarGraphValue00 = BarGraphValue00
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 200, 264 )
	TextBox0:setTopBottom( true, false, 99, 124 )
	TextBox0:setText( Engine.Localize( "MPUI_CONNECTION_METER_PACKET_LOSS_CAPS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 256.75, 285.75 )
	Image0:setTopBottom( true, false, 16.5, 47.5 )
	Image0:subscribeToGlobalModel( controller, "NetworkImage", "image1", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 260.5, 289.5 )
	Image00:setTopBottom( true, false, 99, 130 )
	Image00:subscribeToGlobalModel( controller, "NetworkImage", "image2", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image00:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Image0:close()
		self.Image00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

