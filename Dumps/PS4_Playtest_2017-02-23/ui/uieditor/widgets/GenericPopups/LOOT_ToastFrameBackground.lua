CoD.LOOT_ToastFrameBackground = InheritFrom( LUI.UIElement )
CoD.LOOT_ToastFrameBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LOOT_ToastFrameBackground )
	self.id = "LOOT_ToastFrameBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 520 )
	self:setTopBottom( 0, 0, 0, 169 )
	
	local bot = LUI.UIImage.new()
	bot:setLeftRight( 0, 1, 0, 0 )
	bot:setTopBottom( 1, 1, -74, -1 )
	bot:setImage( RegisterImage( "uie_t7_toast_backer_bottom" ) )
	self:addElement( bot )
	self.bot = bot
	
	local mod = LUI.UIImage.new()
	mod:setLeftRight( 0, 1, 0, 0 )
	mod:setTopBottom( 0, 1, 72, -74 )
	mod:setImage( RegisterImage( "uie_t7_toast_backer_middle" ) )
	self:addElement( mod )
	self.mod = mod
	
	local top = LUI.UIImage.new()
	top:setLeftRight( 0, 1, 0, 0 )
	top:setTopBottom( 0, 0, 1, 72 )
	top:setImage( RegisterImage( "uie_t7_toast_backer_top" ) )
	self:addElement( top )
	self.top = top
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

