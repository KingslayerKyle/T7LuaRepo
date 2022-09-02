-- 0d776bcd2291ec8565bceccbb4e3022a
-- This hash is used for caching, delete to decompile the file again

CoD.RankUpNotification_WingContainer = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_WingContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_WingContainer )
	self.id = "RankUpNotification_WingContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 35 )
	
	local wing01 = LUI.UIImage.new()
	wing01:setLeftRight( true, false, 0, 10.67 )
	wing01:setTopBottom( true, false, 0, 34.67 )
	wing01:setRGB( 0, 0, 0 )
	wing01:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_wing01" ) )
	self:addElement( wing01 )
	self.wing01 = wing01
	
	local wing02 = LUI.UIImage.new()
	wing02:setLeftRight( false, true, -10.67, 0 )
	wing02:setTopBottom( true, false, 0, 34.67 )
	wing02:setRGB( 0, 0, 0 )
	wing02:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_wing02" ) )
	self:addElement( wing02 )
	self.wing02 = wing02
	
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

