-- 61a4ce3af6826a0269e7054fd2164257
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherSides = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherSides.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.SpikeLauncherSides )
	self.id = "SpikeLauncherSides"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 50 )
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 0, 10.86 )
	Image8:setTopBottom( false, false, -25, 24.67 )
	Image8:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framesideinner" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -0.14, -11 )
	Image2:setTopBottom( false, false, -25, 24.67 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framesideinner" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
