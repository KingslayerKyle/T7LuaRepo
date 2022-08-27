-- 4e2292001a15d8770da69c9e3662179d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 347 )
	self:setTopBottom( true, false, 0, 113 )
	
	local bot = LUI.UIImage.new()
	bot:setLeftRight( true, true, 0, 0 )
	bot:setTopBottom( false, true, -48.91, -0.49 )
	bot:setImage( RegisterImage( "uie_t7_toast_backer_bottom" ) )
	self:addElement( bot )
	self.bot = bot
	
	local mod = LUI.UIImage.new()
	mod:setLeftRight( true, true, 0, 0 )
	mod:setTopBottom( true, true, 47.95, -48.91 )
	mod:setImage( RegisterImage( "uie_t7_toast_backer_middle" ) )
	self:addElement( mod )
	self.mod = mod
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, true, 0, 0 )
	top:setTopBottom( true, false, 0.5, 47.95 )
	top:setImage( RegisterImage( "uie_t7_toast_backer_top" ) )
	self:addElement( top )
	self.top = top
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

