-- 5fd94a233b7e2eb2443a275805887fce
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 40 )
	
	local titleBacking = LUI.UIImage.new()
	titleBacking:setLeftRight( true, true, 0, 0 )
	titleBacking:setTopBottom( true, true, 0, 0 )
	titleBacking:setRGB( 0, 0, 0 )
	titleBacking:setAlpha( 0.5 )
	self:addElement( titleBacking )
	self.titleBacking = titleBacking
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

