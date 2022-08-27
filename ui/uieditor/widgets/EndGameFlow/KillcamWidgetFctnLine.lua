-- c59d455260547cebb928f36d8c892195
-- This hash is used for caching, delete to decompile the file again

CoD.KillcamWidgetFctnLine = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetFctnLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetFctnLine )
	self.id = "KillcamWidgetFctnLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 8 )
	Image2:setTopBottom( false, false, -4, 4 )
	Image2:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vslinel" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 8, -8 )
	Image3:setTopBottom( false, false, -4, 4 )
	Image3:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vslinem" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -8, 0 )
	Image4:setTopBottom( false, false, -4, 4 )
	Image4:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vsliner" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

