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
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 0, 25, 293 )
	backing:setTopBottom( 0, 0, -20, 57 )
	backing:setScale( 0.9 )
	backing:setImage( RegisterImage( "uie_t7_blackmarket_counterbacking" ) )
	self:addElement( backing )
	self.backing = backing
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( 0.5, 0.5, -53, -8 )
	currentItem:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
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
	dividor:setLeftRight( 0.5, 0.5, 1, 10 )
	dividor:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	dividor:setRGB( 0.6, 1, 0.93 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/escom.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0.5, 0.5, 19, 64 )
	count:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
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
	RightOff:setLeftRight( 0.5, 0.5, 52, 108 )
	RightOff:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	RightOff:setScale( 0.9 )
	RightOff:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowoff" ) )
	self:addElement( RightOff )
	self.RightOff = RightOff
	
	local RightOn = LUI.UIImage.new()
	RightOn:setLeftRight( 0.5, 0.5, 52, 108 )
	RightOn:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	RightOn:setScale( 0.9 )
	RightOn:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowon" ) )
	self:addElement( RightOn )
	self.RightOn = RightOn
	
	local LeftOff = LUI.UIImage.new()
	LeftOff:setLeftRight( 0.5, 0.5, -98, -42 )
	LeftOff:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	LeftOff:setZRot( 180 )
	LeftOff:setScale( 0.9 )
	LeftOff:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowoff" ) )
	self:addElement( LeftOff )
	self.LeftOff = LeftOff
	
	local LeftOn = LUI.UIImage.new()
	LeftOn:setLeftRight( 0.5, 0.5, -98, -42 )
	LeftOn:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	LeftOn:setZRot( 180 )
	LeftOn:setScale( 0.9 )
	LeftOn:setImage( RegisterImage( "uie_t7_blackmarket_counterarrowon" ) )
	self:addElement( LeftOn )
	self.LeftOn = LeftOn
	
	self.resetProperties = function ()
		currentItem:completeAnimation()
		dividor:completeAnimation()
		count:completeAnimation()
		LeftOff:completeAnimation()
		RightOff:completeAnimation()
		LeftOn:completeAnimation()
		RightOn:completeAnimation()
		currentItem:setAlpha( 0.65 )
		dividor:setAlpha( 0.65 )
		count:setAlpha( 0.65 )
		LeftOff:setAlpha( 1 )
		RightOff:setAlpha( 1 )
		LeftOn:setAlpha( 1 )
		RightOn:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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
				LeftOff:completeAnimation()
				self.LeftOff:setAlpha( 0 )
				self.clipFinished( LeftOff, {} )
			end
		},
		AtLeftAndRight = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
			end
		},
		NoItems = {
			DefaultClip = function ()
				self.resetProperties()
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

