-- 2691d097c3c0934a8b132d80d408ab36
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.NetworkStatsRowWidget = InheritFrom( LUI.UIElement )
CoD.NetworkStatsRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.NetworkStatsRowWidget )
	self.id = "NetworkStatsRowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 150 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 7.37, -7.89 )
	FEButtonPanel0:setTopBottom( true, true, 8.48, -9.48 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.3 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 193.5, 246 )
	TextBox1:setTopBottom( true, false, 22, 47 )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox1:subscribeToGlobalModel( controller, "NetStats", "NETSTATS_PACKETLOSS", function ( model )
		local NETSTATS_PACKETLOSS = Engine.GetModelValue( model )
		if NETSTATS_PACKETLOSS then
			TextBox1:setText( Engine.Localize( NETSTATS_PACKETLOSS ) )
		end
	end )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 193.5, 246 )
	TextBox0:setTopBottom( true, false, 103, 128 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "NetStats", "NETSTATS_LATENCY", function ( model )
		local NETSTATS_LATENCY = Engine.GetModelValue( model )
		if NETSTATS_LATENCY then
			TextBox0:setText( Engine.Localize( NETSTATS_LATENCY ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 193.5, 246 )
	TextBox2:setTopBottom( true, false, 48, 73 )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox2:subscribeToGlobalModel( controller, "NetStats", "NETSTATS_REORDERED", function ( model )
		local NETSTATS_REORDERED = Engine.GetModelValue( model )
		if NETSTATS_REORDERED then
			TextBox2:setText( Engine.Localize( NETSTATS_REORDERED ) )
		end
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 193.5, 246 )
	TextBox3:setTopBottom( true, false, 75, 100 )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox3:subscribeToGlobalModel( controller, "NetStats", "NETSTATS_DUPLICATE", function ( model )
		local NETSTATS_DUPLICATE = Engine.GetModelValue( model )
		if NETSTATS_DUPLICATE then
			TextBox3:setText( Engine.Localize( NETSTATS_DUPLICATE ) )
		end
	end )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 22, 124 )
	Label0:setTopBottom( true, false, 22, 47 )
	Label0:setText( Engine.Localize( "Dropped Packets" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 22, 136 )
	Label1:setTopBottom( true, false, 48, 73 )
	Label1:setText( Engine.Localize( "Reordered Packets" ) )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( true, false, 22, 132 )
	Label2:setTopBottom( true, false, 75, 100 )
	Label2:setText( Engine.Localize( "Duplicate Packets" ) )
	Label2:setTTF( "fonts/default.ttf" )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label3 = LUI.UITightText.new()
	Label3:setLeftRight( true, false, 22, 72 )
	Label3:setTopBottom( true, false, 103, 128 )
	Label3:setText( Engine.Localize( "Latency" ) )
	Label3:setTTF( "fonts/default.ttf" )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.TextBox1:close()
		element.TextBox0:close()
		element.TextBox2:close()
		element.TextBox3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
