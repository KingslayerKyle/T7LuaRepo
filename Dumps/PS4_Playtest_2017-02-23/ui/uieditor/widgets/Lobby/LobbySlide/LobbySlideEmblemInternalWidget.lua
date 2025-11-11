CoD.LobbySlideEmblemInternalWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideEmblemInternalWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideEmblemInternalWidget )
	self.id = "LobbySlideEmblemInternalWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 510 )
	self:setTopBottom( 0, 0, 0, 324 )
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 15, 495 )
	emblem:setTopBottom( 0, 0, 15, 309 )
	self:addElement( emblem )
	self.emblem = emblem
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

