-- fa1aa9a331ded3242466907eb03a87ab
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterLoadoutItemBackgroundAngle = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutItemBackgroundAngle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutItemBackgroundAngle )
	self.id = "CodCasterLoadoutItemBackgroundAngle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 72 )
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 38, -31 )
	Center:setTopBottom( true, true, 0, 0 )
	Center:setImage( RegisterImage( "uie_t7_codcaster_loadoutbackingcenter" ) )
	self:addElement( Center )
	self.Center = Center
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( true, false, 2, 38 )
	Left:setTopBottom( true, true, 0, 0 )
	Left:setImage( RegisterImage( "uie_t7_codcaster_loadoutbackingleftangle" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( false, true, -31, 0 )
	Right:setTopBottom( true, true, 0, 0 )
	Right:setImage( RegisterImage( "uie_t7_codcaster_loadoutbackingcenter" ) )
	self:addElement( Right )
	self.Right = Right
	
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
