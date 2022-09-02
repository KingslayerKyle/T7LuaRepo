-- 8aad259e5b81e360fabc081e66ff5556
-- This hash is used for caching, delete to decompile the file again

CoD.RankUpNotification_TitleBacking9Slice = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_TitleBacking9Slice.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_TitleBacking9Slice )
	self.id = "RankUpNotification_TitleBacking9Slice"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 70 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 56 )
	Image0:setTopBottom( true, false, 0, 40 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_left" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -56, 0 )
	Image1:setTopBottom( true, false, 0, 40 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_right" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 56, -56 )
	Image2:setTopBottom( true, false, 0, 40 )
	Image2:setRGB( 0, 0, 0 )
	Image2:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_stretch" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -60, 60 )
	Image3:setTopBottom( true, false, 40, 68 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_02" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
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

