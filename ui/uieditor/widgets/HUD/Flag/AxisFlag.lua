-- 25666912cf9708f73c1b1b36c8b90893
-- This hash is used for caching, delete to decompile the file again

CoD.AxisFlag = InheritFrom( LUI.UIElement )
CoD.AxisFlag.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AxisFlag )
	self.id = "AxisFlag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 44 )
	self:setTopBottom( true, false, 0, 78 )
	
	local Flag = LUI.UIImage.new()
	Flag:setLeftRight( true, true, 0, 0.42 )
	Flag:setTopBottom( true, true, 0, 0 )
	Flag:setImage( RegisterImage( "uie_t7_hud_widget_ctf_faction_enemys_cdp" ) )
	self:addElement( Flag )
	self.Flag = Flag
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

