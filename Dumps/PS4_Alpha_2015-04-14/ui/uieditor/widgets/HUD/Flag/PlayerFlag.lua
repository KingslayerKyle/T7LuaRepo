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
	FlagTemp:setLeftRight( true, false, 0, 24 )
	FlagTemp:setTopBottom( true, false, 0, 24 )
	FlagTemp:setRGB( 1, 1, 1 )
	FlagTemp:setImage( RegisterImage( "uie_t7_mp_hud_flagtemp" ) )
	FlagTemp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FlagTemp )
	self.FlagTemp = FlagTemp
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

