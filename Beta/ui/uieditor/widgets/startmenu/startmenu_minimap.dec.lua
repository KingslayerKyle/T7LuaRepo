require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.StartMenu_Minimap = InheritFrom( LUI.UIElement )
CoD.StartMenu_Minimap.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_Minimap )
	self.id = "StartMenu_Minimap"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 633 )
	self:setTopBottom( true, false, 0, 353 )
	self.anyChildUsesUpdateState = true
	
	local minimapOverlay = LUI.UIImage.new()
	minimapOverlay:setLeftRight( true, true, -118.96, 118.96 )
	minimapOverlay:setTopBottom( true, true, -113.5, 122.5 )
	minimapOverlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapOverlay )
	self.minimapOverlay = minimapOverlay
	
	local minimapMap = LUI.UIImage.new()
	minimapMap:setLeftRight( false, false, -327.46, 327.46 )
	minimapMap:setTopBottom( false, false, -327, 326 )
	minimapMap:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapMap )
	self.minimapMap = minimapMap
	
	local minimapItems = LUI.UIImage.new()
	minimapItems:setLeftRight( false, false, -327.46, 327.46 )
	minimapItems:setTopBottom( false, false, -327, 326 )
	minimapItems:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapItems )
	self.minimapItems = minimapItems
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, -0.5 )
	self:addElement( border )
	self.border = border
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

