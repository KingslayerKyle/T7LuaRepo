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
	line:setRGB( 1, 1, 1 )
	line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line )
	self.line = line
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, true, -16, 16 )
	arrow:setTopBottom( true, false, -19.5, 12.5 )
	arrow:setRGB( 1, 1, 1 )
	arrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

