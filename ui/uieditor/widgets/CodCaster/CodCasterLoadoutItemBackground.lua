-- 9c361a61e227872c2c0100fc5bd9584b
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterLoadoutItemBackground = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutItemBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutItemBackground )
	self.id = "CodCasterLoadoutItemBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 72 )
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 0, 0 )
	Center:setTopBottom( true, true, 0, 0 )
	Center:setImage( RegisterImage( "uie_t7_codcaster_loadoutbackingcenter" ) )
	self:addElement( Center )
	self.Center = Center
	
	local topbar = LUI.UIImage.new()
	topbar:setLeftRight( true, true, 0, 0 )
	topbar:setTopBottom( true, false, -2, 6 )
	topbar:setImage( RegisterImage( "uie_t7_codcaster_loadouttopbar" ) )
	self:addElement( topbar )
	self.topbar = topbar
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

