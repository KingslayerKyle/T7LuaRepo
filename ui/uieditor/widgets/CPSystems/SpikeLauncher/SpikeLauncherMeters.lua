-- 9853c50fd2f6da688a52d6cc2229c86a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherMetersBase" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherMetersTop" )

CoD.SpikeLauncherMeters = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherMeters.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherMeters )
	self.id = "SpikeLauncherMeters"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 47 )
	self:setTopBottom( true, false, 0, 268 )
	self.anyChildUsesUpdateState = true
	
	local MetersBase = CoD.SpikeLauncherMetersBase.new( menu, controller )
	MetersBase:setLeftRight( true, false, 0, 47.33 )
	MetersBase:setTopBottom( true, false, 162, 266.16 )
	self:addElement( MetersBase )
	self.MetersBase = MetersBase
	
	local MetersTop = CoD.SpikeLauncherMetersTop.new( menu, controller )
	MetersTop:setLeftRight( true, false, 0, 47.33 )
	MetersTop:setTopBottom( true, false, 0, 89.5 )
	self:addElement( MetersTop )
	self.MetersTop = MetersTop
	
	local MeterArrow = LUI.UIImage.new()
	MeterArrow:setLeftRight( true, false, 35.84, 41.33 )
	MeterArrow:setTopBottom( true, false, 15.08, 11.08 )
	MeterArrow:setAlpha( 0 )
	MeterArrow:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmeterarrow" ) )
	self:addElement( MeterArrow )
	self.MeterArrow = MeterArrow
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MetersBase:close()
		element.MetersTop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
