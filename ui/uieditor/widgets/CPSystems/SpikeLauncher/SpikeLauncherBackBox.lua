-- 8abe00f5b1537b8ef9998d142066f1c7
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherBackBox = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherBackBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SpikeLauncherBackBox )
	self.id = "SpikeLauncherBackBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 335 )
	self:setTopBottom( true, false, 0, 65 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -167.5, 167.5 )
	Image2:setTopBottom( true, true, 0, 0 )
	Image2:setRGB( 0.1, 0.1, 0.1 )
	Image2:setAlpha( 0.6 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_backboxnormal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -167.5, 167.5 )
	Image1:setTopBottom( true, true, 0, 0 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_backboxadd" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

