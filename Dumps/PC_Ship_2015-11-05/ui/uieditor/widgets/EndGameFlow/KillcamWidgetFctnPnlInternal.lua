CoD.KillcamWidgetFctnPnlInternal = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetFctnPnlInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetFctnPnlInternal )
	self.id = "KillcamWidgetFctnPnlInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 200 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 400 )
	Image0:setTopBottom( true, false, 0, 200 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_characterpanel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
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

