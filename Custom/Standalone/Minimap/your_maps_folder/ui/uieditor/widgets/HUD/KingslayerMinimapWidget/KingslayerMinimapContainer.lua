require( "ui.uieditor.widgets.HUD.KingslayerMinimapWidget.KingslayerMinimap" )

CoD.KingslayerMinimapContainer = InheritFrom( LUI.UIElement )
CoD.KingslayerMinimapContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KingslayerMinimapContainer )
	self.id = "KingslayerMinimapContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.CompassMinimapBG = LUI.UIImage.new()
	self.CompassMinimapBG:setLeftRight( true, false, 0, 225 )
	self.CompassMinimapBG:setTopBottom( true, false, 0, 225 )
	self.CompassMinimapBG:setImage( RegisterImage( "minimap_circle_bg" ) )
	self.CompassMinimapBG:setRGB( 0, 0, 0 )
	self.CompassMinimapBG:setScale( 0.95 )
	self:addElement( self.CompassMinimapBG )

	self.KingslayerMinimap = CoD.KingslayerMinimap.new( menu, controller )
	self.KingslayerMinimap:setLeftRight( true, true, 0, 0 )
	self.KingslayerMinimap:setTopBottom( true, true, 0, 0 )
	self.KingslayerMinimap:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.KingslayerMinimap )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CompassMinimapBG:close()
		element.KingslayerMinimap:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
