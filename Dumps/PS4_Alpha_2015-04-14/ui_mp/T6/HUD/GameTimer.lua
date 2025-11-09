CoD.GameTimer = InheritFrom( LUI.UIText )
local CountdownLow, Update, UpdateVisibility = nil
CoD.GameTimer.new = function ()
	local self = LUI.UIText.new()
	self:setClass( CoD.GameTimer )
	self:setupGameTimer()
	self.visible = true
	return self
end

CountdownLow = function ( self, event )
	if event.low == true then
		self:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	else
		self:setRGB( 1, 1, 1 )
	end
end

UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ) then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.GameTimer:registerEventHandler( "hud_update_refresh", UpdateVisibility )
CoD.GameTimer:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_BOMB_TIMER, UpdateVisibility )
CoD.GameTimer:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A, UpdateVisibility )
CoD.GameTimer:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B, UpdateVisibility )
CoD.GameTimer:registerEventHandler( "countdown_low", CountdownLow )
