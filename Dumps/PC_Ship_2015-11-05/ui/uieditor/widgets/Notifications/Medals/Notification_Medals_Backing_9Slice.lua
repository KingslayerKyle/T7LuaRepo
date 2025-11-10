CoD.Notification_Medals_Backing_9Slice = InheritFrom( LUI.UIElement )
CoD.Notification_Medals_Backing_9Slice.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Medals_Backing_9Slice )
	self.id = "Notification_Medals_Backing_9Slice"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -54, 0 )
	Image3:setTopBottom( true, true, 0, 0 )
	Image3:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_right" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 56 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_left" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 56, -54 )
	Image4:setTopBottom( true, true, 0, 0 )
	Image4:setImage( RegisterImage( "uie_t7_hud_playerlevel_backing_title_01_stretch" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Combined = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

