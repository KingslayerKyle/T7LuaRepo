CoD.HelpBackground = InheritFrom( LUI.UIElement )
CoD.HelpBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HelpBackground )
	self.id = "HelpBackground"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( false, true, -57, 0 )
	Image:setRGB( 0, 0, 0 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

