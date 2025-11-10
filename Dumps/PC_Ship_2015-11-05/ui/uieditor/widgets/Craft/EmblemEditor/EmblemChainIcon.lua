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
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local topbar = LUI.UIImage.new()
	topbar:setLeftRight( true, false, 0, 16 )
	topbar:setTopBottom( true, false, 0, 16 )
	topbar:setRGB( 0, 0, 0 )
	topbar:setAlpha( 0 )
	self:addElement( topbar )
	self.topbar = topbar
	
	local linkIcon = LUI.UIImage.new()
	linkIcon:setLeftRight( true, true, 0, 0 )
	linkIcon:setTopBottom( true, true, 0, 0 )
	linkIcon:setAlpha( 0 )
	linkIcon:setImage( RegisterImage( "uie_t7_menu_emblem_chain" ) )
	self:addElement( linkIcon )
	self.linkIcon = linkIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				topbar:completeAnimation()
				self.topbar:setAlpha( 0 )
				self.clipFinished( topbar, {} )
				linkIcon:completeAnimation()
				self.linkIcon:setAlpha( 0 )
				self.clipFinished( linkIcon, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				topbar:completeAnimation()
				self.topbar:setAlpha( 0 )
				self.clipFinished( topbar, {} )
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

