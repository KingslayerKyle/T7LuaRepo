-- 9c17ee7619005e3e13bd4925d9128e8f
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_PanelNoBlur = InheritFrom( LUI.UIElement )
CoD.DamageWidget_PanelNoBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_PanelNoBlur )
	self.id = "DamageWidget_PanelNoBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 35 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 8 )
	Image1:setTopBottom( false, true, -8.33, -0.33 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelll" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 8, -7.67 )
	Image2:setTopBottom( false, true, -8.33, -0.33 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panellm" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -7.67, 0.33 )
	Image3:setTopBottom( false, true, -8.33, -0.33 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panellr" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 8 )
	Image4:setTopBottom( true, true, 8, -8.33 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelml" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 8, -7.67 )
	Image5:setTopBottom( true, true, 8, -8.33 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelmm" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -7.67, 0.33 )
	Image6:setTopBottom( true, true, 8.01, -8.33 )
	Image6:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelmr" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 8 )
	Image7:setTopBottom( true, false, 0, 8 )
	Image7:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelul" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 8, -7.67 )
	Image8:setTopBottom( true, false, 0, 8 )
	Image8:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelum" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -7.67, 0.33 )
	Image9:setTopBottom( true, false, 0, 8 )
	Image9:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelur" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
