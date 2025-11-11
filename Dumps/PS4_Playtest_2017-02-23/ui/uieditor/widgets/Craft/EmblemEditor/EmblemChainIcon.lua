CoD.EmblemChainIcon = InheritFrom( LUI.UIElement )
CoD.EmblemChainIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemChainIcon )
	self.id = "EmblemChainIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local topbar = LUI.UIImage.new()
	topbar:setLeftRight( 0, 0, 0, 24 )
	topbar:setTopBottom( 0, 0, 0, 24 )
	topbar:setRGB( 0, 0, 0 )
	topbar:setAlpha( 0 )
	self:addElement( topbar )
	self.topbar = topbar
	
	local linkIcon = LUI.UIImage.new()
	linkIcon:setLeftRight( 0, 1, 0, 0 )
	linkIcon:setTopBottom( 0, 1, 0, 0 )
	linkIcon:setAlpha( 0 )
	linkIcon:setImage( RegisterImage( "uie_t7_menu_emblem_chain" ) )
	self:addElement( linkIcon )
	self.linkIcon = linkIcon
	
	self.resetProperties = function ()
		linkIcon:completeAnimation()
		linkIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Show = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				linkIcon:completeAnimation()
				self.linkIcon:setAlpha( 1 )
				self.clipFinished( linkIcon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

