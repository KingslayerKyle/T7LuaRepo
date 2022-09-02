-- 8b40e99d46aa9603b7803b3f47320c2c
-- This hash is used for caching, delete to decompile the file again

CoD.ServerBrowserFlag = InheritFrom( LUI.UIElement )
CoD.ServerBrowserFlag.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserFlag )
	self.id = "ServerBrowserFlag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 28 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 2, -2 )
	icon:setTopBottom( true, true, 2, -2 )
	icon:setAlpha( 0 )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
			end
		},
		FlagOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

