CoD.KillcamWidgetVignetteTop = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetVignetteTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetVignetteTop )
	self.id = "KillcamWidgetVignetteTop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 112 )
	
	local imgVignetteTopL = LUI.UIImage.new()
	imgVignetteTopL:setLeftRight( false, false, -640, 0 )
	imgVignetteTopL:setTopBottom( false, false, -56, 56 )
	imgVignetteTopL:setImage( RegisterImage( "uie_t7_mp_menu_startflow_topvignettel" ) )
	imgVignetteTopL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgVignetteTopL )
	self.imgVignetteTopL = imgVignetteTopL
	
	local imgVignetteTopL0 = LUI.UIImage.new()
	imgVignetteTopL0:setLeftRight( false, false, 0, 640 )
	imgVignetteTopL0:setTopBottom( false, false, -56, 56 )
	imgVignetteTopL0:setYRot( 180 )
	imgVignetteTopL0:setImage( RegisterImage( "uie_t7_mp_menu_startflow_topvignettel" ) )
	imgVignetteTopL0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgVignetteTopL0 )
	self.imgVignetteTopL0 = imgVignetteTopL0
	
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

