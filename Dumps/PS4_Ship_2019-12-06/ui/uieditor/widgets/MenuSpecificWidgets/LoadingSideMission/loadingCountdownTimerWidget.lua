local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
		f2_arg0.countdownTimer:setText( f2_arg2.text )
	end
	
	f1_arg0:animationQueue( {
		{
			funct = f1_local0,
			time = 1000,
			text = "10"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "9"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "8"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "7"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "6"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "5"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "4"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "3"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "2"
		},
		{
			funct = f1_local0,
			time = 1000,
			text = "1"
		},
		{
			funct = f1_local0,
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
	header:setText( Engine.Localize( "Mission Starting in:" ) )
	header:setTTF( "fonts/default.ttf" )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( header )
	self.header = header
	
	local countdownTimer = LUI.UIText.new()
	countdownTimer:setLeftRight( true, true, 0, 0 )
	countdownTimer:setTopBottom( true, true, 50, 0 )
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

