CoD.Pregame_VSPanelChild = InheritFrom( LUI.UIElement )
CoD.Pregame_VSPanelChild.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_VSPanelChild )
	self.id = "Pregame_VSPanelChild"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 80 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 40 )
	Image0:setTopBottom( false, false, -40, 40 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vsrightl" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 40, -32 )
	Image00:setTopBottom( false, false, -40, 40 )
	Image00:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vsrightm" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -32, 0 )
	Image1:setTopBottom( false, false, -40, 40 )
	Image1:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vsrightr" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

