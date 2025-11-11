CoD.GameSettings_textboxBG = InheritFrom( LUI.UIElement )
CoD.GameSettings_textboxBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_textboxBG )
	self.id = "GameSettings_textboxBG"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( 0, 1, 0, 0 )
	titleBacking:setTopBottom( 0, 1, 0, 0 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

