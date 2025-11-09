CoD.PlayerFlag = InheritFrom( LUI.UIElement )
CoD.PlayerFlag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerFlag )
	self.id = "PlayerFlag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local FlagTemp = LUI.UIImage.new()
	FlagTemp:setLeftRight( true, true, 0, 0 )
	FlagTemp:setTopBottom( true, true, 0, 0 )
	FlagTemp:setImage( RegisterImage( "uie_t7_mp_hud_flagtemp" ) )
	self:addElement( FlagTemp )
	self.FlagTemp = FlagTemp
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

