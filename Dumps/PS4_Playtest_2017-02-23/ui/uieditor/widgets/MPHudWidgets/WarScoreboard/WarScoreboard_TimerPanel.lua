CoD.WarScoreboard_TimerPanel = InheritFrom( LUI.UIElement )
CoD.WarScoreboard_TimerPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboard_TimerPanel )
	self.id = "WarScoreboard_TimerPanel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 108 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local TimerBG = LUI.UIImage.new()
	TimerBG:setLeftRight( 0, 0, 0, 108 )
	TimerBG:setTopBottom( 0, 0, 0, 36 )
	TimerBG:setImage( RegisterImage( "uie_hud_common_core_objective_timerback" ) )
	TimerBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	TimerBG:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( TimerBG )
	self.TimerBG = TimerBG
	
	self.resetProperties = function ()
		
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			SpeedBoost = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

