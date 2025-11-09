local PostLoadFunc = function ( self )
	local updateTimerFunc = function ( self, time, event )
		self.countdownTimer:setText( event.text )
	end
	
	self:animationQueue( {
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "10"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "9"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "8"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "7"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "6"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "5"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "4"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "3"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "2"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "1"
		},
		{
			funct = updateTimerFunc,
			time = 1000,
			text = "0"
		}
	}, 0, false )
end

CoD.loadingCountdownTimerWidget = InheritFrom( LUI.UIElement )
CoD.loadingCountdownTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.loadingCountdownTimerWidget )
	self.id = "loadingCountdownTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 100 )
	
	local header = LUI.UIText.new()
	header:setLeftRight( true, true, 0, 0 )
	header:setTopBottom( true, true, 0, -50 )
	header:setRGB( 1, 1, 1 )
	header:setText( Engine.Localize( "Mission Starting in:" ) )
	header:setTTF( "fonts/default.ttf" )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( header )
	self.header = header
	
	local countdownTimer = LUI.UIText.new()
	countdownTimer:setLeftRight( true, true, 0, 0 )
	countdownTimer:setTopBottom( true, true, 50, 0 )
	countdownTimer:setRGB( 1, 1, 1 )
	countdownTimer:setText( Engine.Localize( "10" ) )
	countdownTimer:setTTF( "fonts/default.ttf" )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( countdownTimer )
	self.countdownTimer = countdownTimer
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

