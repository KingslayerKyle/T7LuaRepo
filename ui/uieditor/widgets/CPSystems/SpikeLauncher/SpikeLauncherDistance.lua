-- a0d0d47af5e8a16802d1cb9d14d641b6
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherDistance = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherDistance.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherDistance )
	self.id = "SpikeLauncherDistance"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 13 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 0, 7.33 )
	arrow:setTopBottom( true, false, 3.58, 8.92 )
	arrow:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforarrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local M = LUI.UIImage.new()
	M:setLeftRight( true, false, 43.38, 51.38 )
	M:setTopBottom( true, false, 1.92, 9.92 )
	M:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inform" ) )
	M:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( M )
	self.M = M
	
	local DistanceLbl = LUI.UITightText.new()
	DistanceLbl:setLeftRight( true, false, 14.5, 36.5 )
	DistanceLbl:setTopBottom( true, false, 0, 12.5 )
	DistanceLbl:setText( Engine.Localize( "243" ) )
	DistanceLbl:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( DistanceLbl )
	self.DistanceLbl = DistanceLbl
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

