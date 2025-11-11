CoD.EmblemEditorColorMixerPointer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorMixerPointer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorMixerPointer )
	self.id = "EmblemEditorColorMixerPointer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 3 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local line = LUI.UIImage.new()
	line:setLeftRight( 0, 1, 0, 0 )
	line:setTopBottom( 0, 1, 0, 0 )
	self:addElement( line )
	self.line = line
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 1, -24, 24 )
	arrow:setTopBottom( 0, 0, -29, 19 )
	arrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

