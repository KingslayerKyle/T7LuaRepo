CoD.StartMenu_ConnectionMeter_PingImage = InheritFrom( LUI.UIElement )
CoD.StartMenu_ConnectionMeter_PingImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_ConnectionMeter_PingImage )
	self.id = "StartMenu_ConnectionMeter_PingImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 29 )
	self:setTopBottom( true, false, 0, 31 )
	
	local Level1Image = LUI.UIImage.new()
	Level1Image:setLeftRight( true, false, 0, 29 )
	Level1Image:setTopBottom( true, false, 0, 31 )
	Level1Image:setAlpha( 0 )
	Level1Image:setImage( RegisterImage( "uie_t7_icon_network_wired1" ) )
	self:addElement( Level1Image )
	self.Level1Image = Level1Image
	
	local Level2Image = LUI.UIImage.new()
	Level2Image:setLeftRight( true, false, 0, 29 )
	Level2Image:setTopBottom( true, false, 0, 31 )
	Level2Image:setAlpha( 0 )
	Level2Image:setImage( RegisterImage( "uie_t7_icon_network_wired2" ) )
	self:addElement( Level2Image )
	self.Level2Image = Level2Image
	
	local Level3Image = LUI.UIImage.new()
	Level3Image:setLeftRight( true, false, 0, 29 )
	Level3Image:setTopBottom( true, false, 0, 31 )
	Level3Image:setAlpha( 0 )
	Level3Image:setImage( RegisterImage( "uie_t7_icon_network_wired3" ) )
	self:addElement( Level3Image )
	self.Level3Image = Level3Image
	
	local Level4Image = LUI.UIImage.new()
	Level4Image:setLeftRight( true, false, 0, 29 )
	Level4Image:setTopBottom( true, false, 0, 31 )
	Level4Image:setAlpha( 0 )
	Level4Image:setImage( RegisterImage( "uie_t7_icon_network_wired4" ) )
	self:addElement( Level4Image )
	self.Level4Image = Level4Image
	
	local WirelessLevel4Image = LUI.UIImage.new()
	WirelessLevel4Image:setLeftRight( true, false, 0, 29 )
	WirelessLevel4Image:setTopBottom( true, false, 0, 31 )
	WirelessLevel4Image:setAlpha( 0 )
	WirelessLevel4Image:setImage( RegisterImage( "uie_t7_icon_network_wireless4" ) )
	self:addElement( WirelessLevel4Image )
	self.WirelessLevel4Image = WirelessLevel4Image
	
	local WirelessLevel3Image = LUI.UIImage.new()
	WirelessLevel3Image:setLeftRight( true, false, 0, 29 )
	WirelessLevel3Image:setTopBottom( true, false, 0, 31 )
	WirelessLevel3Image:setAlpha( 0 )
	WirelessLevel3Image:setImage( RegisterImage( "uie_t7_icon_network_wireless3" ) )
	self:addElement( WirelessLevel3Image )
	self.WirelessLevel3Image = WirelessLevel3Image
	
	local WirelessLevel2Image = LUI.UIImage.new()
	WirelessLevel2Image:setLeftRight( true, false, 0, 29 )
	WirelessLevel2Image:setTopBottom( true, false, 0, 31 )
	WirelessLevel2Image:setAlpha( 0 )
	WirelessLevel2Image:setImage( RegisterImage( "uie_t7_icon_network_wireless2" ) )
	self:addElement( WirelessLevel2Image )
	self.WirelessLevel2Image = WirelessLevel2Image
	
	local WirelessLevel1Image = LUI.UIImage.new()
	WirelessLevel1Image:setLeftRight( true, false, 0, 29 )
	WirelessLevel1Image:setTopBottom( true, false, 0, 31 )
	WirelessLevel1Image:setAlpha( 0 )
	WirelessLevel1Image:setImage( RegisterImage( "uie_t7_icon_network_wireless1" ) )
	self:addElement( WirelessLevel1Image )
	self.WirelessLevel1Image = WirelessLevel1Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		Level1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 1 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		Level2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 1 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		Level3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 1 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		Level4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 1 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		WirelessLevel1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 1 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		WirelessLevel2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setRGB( 1, 1, 1 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setRGB( 1, 1, 1 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		WirelessLevel3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 1 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		},
		WirelessLevel4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )
				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )
				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
				Level4Image:completeAnimation()
				self.Level4Image:setAlpha( 0 )
				self.clipFinished( Level4Image, {} )
				WirelessLevel4Image:completeAnimation()
				self.WirelessLevel4Image:setAlpha( 1 )
				self.clipFinished( WirelessLevel4Image, {} )
				WirelessLevel3Image:completeAnimation()
				self.WirelessLevel3Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel3Image, {} )
				WirelessLevel2Image:completeAnimation()
				self.WirelessLevel2Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel2Image, {} )
				WirelessLevel1Image:completeAnimation()
				self.WirelessLevel1Image:setAlpha( 0 )
				self.clipFinished( WirelessLevel1Image, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Level1",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 300 )
			end
		},
		{
			stateName = "Level2",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 200 ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 299 )
			end
		},
		{
			stateName = "Level3",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 100 ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 199 )
			end
		},
		{
			stateName = "Level4",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 0 ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "NETSTATS_LATENCY", 99 )
			end
		},
		{
			stateName = "WirelessLevel1",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "WirelessLevel2",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "WirelessLevel3",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "WirelessLevel4",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "NETSTATS_LATENCY", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "NETSTATS_LATENCY"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

