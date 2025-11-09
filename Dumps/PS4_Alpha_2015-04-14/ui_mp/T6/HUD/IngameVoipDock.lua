CoD.IngameVoipDock = {}
CoD.IngameVoipDock.IconWidth = 24
CoD.IngameVoipDock.SetupHudUpdateBits = function ( self )
	self:registerEventHandler( "hud_update_refresh", CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.IngameVoipDock.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.IngameVoipDock.UpdateVisibility )
	self.visible = true
end

CoD.IngameVoipDock.New = function ( defaultAnimationState )
	local ingameTalker = LUI.UIElement.new( defaultAnimationState )
	ingameTalker:setupIngameTalkers()
	CoD.IngameVoipDock.SetupHudUpdateBits( ingameTalker )
	return ingameTalker
end

CoD.IngameVoipDock.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

