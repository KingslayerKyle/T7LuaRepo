-- 766ba431ab1af93445fe9f9257afc91a
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherLineTop = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherLineTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.SpikeLauncherLineTop )
	self.id = "SpikeLauncherLineTop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 17 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, false, 0, 30 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchortop" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

