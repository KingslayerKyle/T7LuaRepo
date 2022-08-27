-- 0ecd0289412bfc93a2a0c9c507824075
-- This hash is used for caching, delete to decompile the file again

CoD.AllyFlag = InheritFrom( LUI.UIElement )
CoD.AllyFlag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AllyFlag )
	self.id = "AllyFlag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 44 )
	self:setTopBottom( true, false, 0, 78 )
	
	local Flag = LUI.UIImage.new()
	Flag:setLeftRight( true, true, 0, -1 )
	Flag:setTopBottom( true, true, 0, 0 )
	Flag:setImage( RegisterImage( "uie_t7_hud_widget_ctf_faction_enemys_windslowcorp" ) )
	self:addElement( Flag )
	self.Flag = Flag
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

