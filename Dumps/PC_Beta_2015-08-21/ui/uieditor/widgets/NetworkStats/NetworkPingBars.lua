CoD.NetworkPingBars = InheritFrom( LUI.UIElement )
CoD.NetworkPingBars.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NetworkPingBars )
	self.id = "NetworkPingBars"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 94 )
	
	local Ping1 = LUI.UIImage.new()
	Ping1:setLeftRight( true, false, 306.6, 378.6 )
	Ping1:setTopBottom( true, false, 2, 74 )
	Ping1:setImage( RegisterImage( "uie_t7_icon_network_wired1" ) )
	self:addElement( Ping1 )
	self.Ping1 = Ping1
	
	local Ping2 = LUI.UIImage.new()
	Ping2:setLeftRight( true, false, 208.85, 280.85 )
	Ping2:setTopBottom( true, false, 2, 74 )
	Ping2:setImage( RegisterImage( "uie_t7_icon_network_wired2" ) )
	self:addElement( Ping2 )
	self.Ping2 = Ping2
	
	local Ping3 = LUI.UIImage.new()
	Ping3:setLeftRight( true, false, 111.75, 183.75 )
	Ping3:setTopBottom( true, false, 1, 73 )
	Ping3:setImage( RegisterImage( "uie_t7_icon_network_wired3" ) )
	self:addElement( Ping3 )
	self.Ping3 = Ping3
	
	local Ping4 = LUI.UIImage.new()
	Ping4:setLeftRight( true, false, 15, 87 )
	Ping4:setTopBottom( true, false, 1, 73 )
	Ping4:setImage( RegisterImage( "uie_t7_icon_network_wired4" ) )
	self:addElement( Ping4 )
	self.Ping4 = Ping4
	
	local RANGE = LUI.UITightText.new()
	RANGE:setLeftRight( true, false, 28.5, 72.5 )
	RANGE:setTopBottom( true, false, 65, 90 )
	RANGE:setText( Engine.Localize( "0-99" ) )
	RANGE:setTTF( "fonts/default.ttf" )
	self:addElement( RANGE )
	self.RANGE = RANGE
	
	local RANGE0 = LUI.UITightText.new()
	RANGE0:setLeftRight( true, false, 122.25, 176.25 )
	RANGE0:setTopBottom( true, false, 65, 90 )
	RANGE0:setText( Engine.Localize( "100-199" ) )
	RANGE0:setTTF( "fonts/default.ttf" )
	self:addElement( RANGE0 )
	self.RANGE0 = RANGE0
	
	local RANGE00 = LUI.UITightText.new()
	RANGE00:setLeftRight( true, false, 220.85, 274.85 )
	RANGE00:setTopBottom( true, false, 65, 90 )
	RANGE00:setText( Engine.Localize( "200-225" ) )
	RANGE00:setTTF( "fonts/default.ttf" )
	self:addElement( RANGE00 )
	self.RANGE00 = RANGE00
	
	local RANGE000 = LUI.UITightText.new()
	RANGE000:setLeftRight( true, false, 320.3, 363.3 )
	RANGE000:setTopBottom( true, false, 65, 90 )
	RANGE000:setText( Engine.Localize( "300+" ) )
	RANGE000:setTTF( "fonts/default.ttf" )
	self:addElement( RANGE000 )
	self.RANGE000 = RANGE000
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 306.6, 378.6 )
	Image1:setTopBottom( true, false, -1, 71 )
	Image1:setAlpha( 0 )
	Image1:setImage( RegisterImage( "uie_t7_icon_network_wireless1" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 208.85, 280.85 )
	Image2:setTopBottom( true, false, -1, 70 )
	Image2:setAlpha( 0 )
	Image2:setImage( RegisterImage( "uie_t7_icon_network_wireless2" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 110.75, 182.75 )
	Image3:setTopBottom( true, false, 0, 71 )
	Image3:setAlpha( 0 )
	Image3:setImage( RegisterImage( "uie_t7_icon_network_wireless3" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 15, 87 )
	Image4:setTopBottom( true, false, 0, 71 )
	Image4:setAlpha( 0 )
	Image4:setImage( RegisterImage( "uie_t7_icon_network_wireless4" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoInternet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NotSignedInToLive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NotConnectedToCodServer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Ping1:completeAnimation()
				self.Ping1:setLeftRight( true, false, 736.6, 808.6 )
				self.Ping1:setTopBottom( true, false, 431.1, 503.1 )
				self.clipFinished( Ping1, {} )
				Ping2:completeAnimation()
				self.Ping2:setLeftRight( true, false, 827.35, 899.35 )
				self.Ping2:setTopBottom( true, false, 431.1, 503.1 )
				self.clipFinished( Ping2, {} )
				Ping3:completeAnimation()
				self.Ping3:setLeftRight( true, false, 921.46, 993.46 )
				self.Ping3:setTopBottom( true, false, 431.1, 503.1 )
				self.clipFinished( Ping3, {} )
				Ping4:completeAnimation()
				self.Ping4:setLeftRight( true, false, 1024.21, 1096.21 )
				self.Ping4:setTopBottom( true, false, 431.1, 503.1 )
				self.clipFinished( Ping4, {} )
				RANGE:completeAnimation()
				self.RANGE:setLeftRight( true, false, 750.6, 792.6 )
				self.RANGE:setTopBottom( true, false, 495.1, 520.1 )
				self.clipFinished( RANGE, {} )
				RANGE0:completeAnimation()
				self.RANGE0:setLeftRight( true, false, 839.85, 886.85 )
				self.RANGE0:setTopBottom( true, false, 495.1, 520.1 )
				self.clipFinished( RANGE0, {} )
				RANGE00:completeAnimation()
				self.RANGE00:setLeftRight( true, false, 934.71, 988.71 )
				self.RANGE00:setTopBottom( true, false, 495.1, 520.1 )
				self.clipFinished( RANGE00, {} )
				RANGE000:completeAnimation()
				self.RANGE000:setLeftRight( true, false, 1037.71, 1082.31 )
				self.RANGE000:setTopBottom( true, false, 495.1, 520.1 )
				self.clipFinished( RANGE000, {} )
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
				local f8_local0
				if not IsPlayerConnectedToCodServers( controller ) then
					f8_local0 = IsPlayerSignedInToLive( controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

