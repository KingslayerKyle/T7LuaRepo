require( "ui.uieditor.widgets.HUD.ZM_Panels.ZmPanel_AmmoInt" )

CoD.ZmPanel_AmmoExt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_AmmoExt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmPanel_AmmoExt )
	self.id = "ZmPanel_AmmoExt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 328 )
	self:setTopBottom( true, false, 0, 192 )
	
	local ZmPanelAmmoInt0 = CoD.ZmPanel_AmmoInt.new( menu, controller )
	ZmPanelAmmoInt0:setLeftRight( true, false, 0, 328 )
	ZmPanelAmmoInt0:setTopBottom( true, false, 0, 192 )
	ZmPanelAmmoInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	ZmPanelAmmoInt0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( ZmPanelAmmoInt0 )
	self.ZmPanelAmmoInt0 = ZmPanelAmmoInt0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmPanelAmmoInt0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

