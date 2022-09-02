-- 461ce172c68feb1e340f177294aa9f54
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 2 )
	self:setTopBottom( true, false, 0, 26 )
	
	local line = LUI.UIImage.new()
	line:setLeftRight( true, true, 0, 0 )
	line:setTopBottom( true, true, 0, 0 )
	self:addElement( line )
	self.line = line
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, true, -16, 16 )
	arrow:setTopBottom( true, false, -19.5, 12.5 )
	arrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

