CoD.MinimapHelper = InheritFrom( LUI.UIElement )
CoD.MinimapHelper.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MinimapHelper )
	self.id = "MinimapHelper"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 150 )
	
	local map = LUI.UIImage.new()
	map:setLeftRight( true, true, 0, 0 )
	map:setTopBottom( true, true, 0, 0 )
	map:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	map:setupCompassMap( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( map )
	self.map = map
	
	local underlay = LUI.UIImage.new()
	underlay:setLeftRight( true, true, 0, 0 )
	underlay:setTopBottom( true, true, 0, 0 )
	underlay:setRGB( 1, 1, 1 )
	underlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	underlay:setupCompassUnderlay( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( underlay )
	self.underlay = underlay
	
	local items = LUI.UIImage.new()
	items:setLeftRight( true, true, 0, 0 )
	items:setTopBottom( true, true, 0, 0 )
	items:setRGB( 1, 1, 1 )
	items:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	items:setupCompassItems( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( items )
	self.items = items
	
	local overlay = LUI.UIImage.new()
	overlay:setLeftRight( true, true, 0, 0 )
	overlay:setTopBottom( true, true, 0, 0 )
	overlay:setRGB( 1, 1, 1 )
	overlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	overlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_PARTIAL )
	self:addElement( overlay )
	self.overlay = overlay
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

