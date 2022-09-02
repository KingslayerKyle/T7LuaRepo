-- 9cab55e823a8526c9b81f902cfb2df69
-- This hash is used for caching, delete to decompile the file again

CoD.RankUpNotification_FooterBacking02 = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_FooterBacking02.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_FooterBacking02 )
	self.id = "RankUpNotification_FooterBacking02"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 80 )
	Image0:setTopBottom( true, false, 0, 32 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_backing_left" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 80, -80 )
	Image1:setTopBottom( true, false, 0, 32 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_backing_stretch" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -80, 0 )
	Image2:setTopBottom( true, false, 0, 32 )
	Image2:setRGB( 0, 0, 0 )
	Image2:setImage( RegisterImage( "uie_t7_hud_notificaiton_footer_backing_right" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

