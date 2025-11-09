local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.LeftOn:setHandleMouse( true )
	f1_arg0.LeftOn:registerEventHandler( "button_action", function ( element, event )
		CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_LEFT )
		return true
	end )
	f1_arg0.RightOn:setHandleMouse( true )
	f1_arg0.RightOn:registerEventHandler( "button_action", function ( element, event )
		CoD.PCUtil.SimulateButtonPress( f1_arg1, Enum.LUIButton.LUI_KEY_RIGHT )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.BM_HorizontalCounter = InheritFrom( LUI.UIElement )
CoD.BM_HorizontalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_HorizontalCounter )
	self.id = "BM_HorizontalCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 16.5, 195.5 )
	backing:setTopBottom( true, false, -13.07, 38.07 )
	backing:setScale( 0.9 )
	backing:setImage( RegisterImage( "uie_t7_blackmarket_counterbacking" ) )
	self:addElement( backing )
	self.backing = backing
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -35, -5 )
	currentItem:setTopBottom( false, false, -9, 9 )
	currentItem:setRGB( 0.6, 1, 0.93 )
	currentItem:setAlpha( 0.65 )
	currentItem:setScale( 0.9 )
	currentItem:setText( Engine.Localize( "25" ) )
	currentItem:setTTF( "fonts/escom.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( false, false, 1, 7 )
	dividor:setTopBottom( false, false, -9, 9 )
	dividor:setRGB( 0.6, 1, 0.93 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/escom.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, 13, 43 )
	count:setTopBottom( false, false, -9, 9 )
	count:setRGB( 0.6, 1, 0.93 )
	count:setAlpha( 0.65 )
	count:setScale( 0.9 )
	count:setText( Engine.Localize( "25" ) )
	count:setTTF( "fonts/escom.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local RightOff = LUI.UIImage.new()
	RightOff:setLeftRight( false, false, 35, 72 )
	RightOff:setTopBottom( false, false, -25, 25 )
	RightOff:setScale( 0.9 )
	RightOff:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowoff" ) )
	self:addElement( RightOff )
	self.RightOff = RightOff
	
	local RightOn = LUI.UIImage.new()
	RightOn:setLeftRight( false, false, 35, 72 )
	RightOn:setTopBottom( false, false, -25, 25 )
	RightOn:setScale( 0.9 )
	RightOn:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowon" ) )
	self:addElement( RightOn )
	self.RightOn = RightOn
	
	local LeftOff = LUI.UIImage.new()
	LeftOff:setLeftRight( false, false, -65, -28 )
	LeftOff:setTopBottom( false, false, -25, 25 )
	LeftOff:setZRot( 180 )
	LeftOff:setScale( 0.9 )
	LeftOff:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowoff" ) )
	self:addElement( LeftOff )
	self.LeftOff = LeftOff
	
	local LeftOn = LUI.UIImage.new()
	LeftOn:setLeftRight( false, false, -65, -28 )
	LeftOn:setTopBottom( false, false, -25, 25 )
	LeftOn:setZRot( 180 )
	LeftOn:setScale( 0.9 )
	LeftOn:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowon" ) )
	self:addElement( LeftOn )
	self.LeftOn = LeftOn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				RightOff:completeAnimation()
				self.RightOff:setAlpha( 0 )
				self.clipFinished( RightOff, {} )
				RightOn:completeAnimation()
				self.RightOn:setAlpha( 1 )
				self.clipFinished( RightOn, {} )
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0 )
				self.clipFinished( LeftOff, {} )
				LeftOn:completeAnimation()
				self.LeftOn:setAlpha( 1 )
				self.clipFinished( LeftOn, {} )
			end
		},
		AtLeftAndRight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				RightOff:completeAnimation()
				self.RightOff:setAlpha( 0.5 )
				self.clipFinished( RightOff, {} )
				RightOn:completeAnimation()
				self.RightOn:setAlpha( 0 )
				self.clipFinished( RightOn, {} )
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0.5 )
				self.clipFinished( LeftOff, {} )
				LeftOn:completeAnimation()
				self.LeftOn:setAlpha( 0 )
				self.clipFinished( LeftOn, {} )
			end
		},
		AtLeft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				RightOff:completeAnimation()
				self.RightOff:setAlpha( 0 )
				self.clipFinished( RightOff, {} )
				RightOn:completeAnimation()
				self.RightOn:setAlpha( 1 )
				self.clipFinished( RightOn, {} )
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0.25 )
				self.clipFinished( LeftOff, {} )
				LeftOn:completeAnimation()
				self.LeftOn:setAlpha( 0 )
				self.clipFinished( LeftOn, {} )
			end
		},
		AtRight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				RightOff:completeAnimation()
				self.RightOff:setAlpha( 0.25 )
				self.clipFinished( RightOff, {} )
				RightOn:completeAnimation()
				self.RightOn:setAlpha( 0 )
				self.clipFinished( RightOn, {} )
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0 )
				self.clipFinished( LeftOff, {} )
				LeftOn:completeAnimation()
				self.LeftOn:setAlpha( 1 )
				self.clipFinished( LeftOn, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
				RightOff:completeAnimation()
				self.RightOff:setAlpha( 0 )
				self.clipFinished( RightOff, {} )
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0 )
				self.clipFinished( LeftOff, {} )
				LeftOn:completeAnimation()
				self.LeftOn:setAlpha( 0 )
				self.clipFinished( LeftOn, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AtLeftAndRight",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtLeftAndRight" )
			end
		},
		{
			stateName = "AtLeft",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtLeft" )
			end
		},
		{
			stateName = "AtRight",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtRight" )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

