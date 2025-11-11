require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboard_TimerPanel" )

CoD.WarScoreboard_TimerPanelInt = InheritFrom( LUI.UIElement )
CoD.WarScoreboard_TimerPanelInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboard_TimerPanelInt )
	self.id = "WarScoreboard_TimerPanelInt"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 108 )
	self:setTopBottom( 0, 0, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local TimerBG = CoD.WarScoreboard_TimerPanel.new( menu, controller )
	TimerBG:setLeftRight( 0, 0, 0, 108 )
	TimerBG:setTopBottom( 0, 0, 0, 36 )
	TimerBG:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	TimerBG:setShaderVector( 0, 30, 10, 0, 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TimerBG:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

