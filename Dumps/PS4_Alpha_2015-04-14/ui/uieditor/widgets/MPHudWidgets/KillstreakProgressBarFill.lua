CoD.KillstreakProgressBarFill = InheritFrom( LUI.UIElement )
CoD.KillstreakProgressBarFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.KillstreakProgressBarFill )
	self.id = "KillstreakProgressBarFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 128 )
	
	local progressBarFill = LUI.UIImage.new()
	progressBarFill:setLeftRight( true, true, 0, 0 )
	progressBarFill:setTopBottom( false, true, -128, 0 )
	progressBarFill:setRGB( 1, 1, 1 )
	progressBarFill:setImage( RegisterImage( "uie_hud_mp_vis_ks_bar" ) )
	progressBarFill:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( progressBarFill )
	self.progressBarFill = progressBarFill
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

