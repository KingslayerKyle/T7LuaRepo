-- 70c404d6e1c121e8504b75eb93ed10fc
-- This hash is used for caching, delete to decompile the file again

CoD.CAC_varientTitlePanel = InheritFrom( LUI.UIElement )
CoD.CAC_varientTitlePanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CAC_varientTitlePanel )
	self.id = "CAC_varientTitlePanel"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 309 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

