-- 5a28771b6edbc32383d341d0bf826d85
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_Promo_DoubleVialWidgetListItem = InheritFrom( LUI.UIElement )
CoD.ZM_Promo_DoubleVialWidgetListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_Promo_DoubleVialWidgetListItem )
	self.id = "ZM_Promo_DoubleVialWidgetListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 49 )
	self:setTopBottom( true, false, 0, 49 )
	
	local DoubleVialIcon = LUI.UIImage.new()
	DoubleVialIcon:setLeftRight( true, false, -5, 54 )
	DoubleVialIcon:setTopBottom( true, false, -10, 49 )
	DoubleVialIcon:setScale( 0.95 )
	DoubleVialIcon:setImage( RegisterImage( "uie_t7_icon_zm_double_vial_backer" ) )
	self:addElement( DoubleVialIcon )
	self.DoubleVialIcon = DoubleVialIcon
	
	local x2LabelOutline = LUI.UIText.new()
	x2LabelOutline:setLeftRight( true, false, 3.5, 41.5 )
	x2LabelOutline:setTopBottom( true, false, 11, 45 )
	x2LabelOutline:setRGB( 0.24, 0.11, 0.01 )
	x2LabelOutline:setScale( 0.75 )
	x2LabelOutline:setText( Engine.Localize( "MP_X2" ) )
	x2LabelOutline:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	x2LabelOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	x2LabelOutline:setShaderVector( 0, 0.31, 0, 0, 0 )
	x2LabelOutline:setShaderVector( 1, 0.11, 0, 0, 0 )
	x2LabelOutline:setShaderVector( 2, 1, 0, 0, 0 )
	x2LabelOutline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	x2LabelOutline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( x2LabelOutline )
	self.x2LabelOutline = x2LabelOutline
	
	local x2Label = LUI.UIText.new()
	x2Label:setLeftRight( true, false, 3.5, 41.5 )
	x2Label:setTopBottom( true, false, 11, 45 )
	x2Label:setRGB( 1, 0.89, 0.12 )
	x2Label:setScale( 0.75 )
	x2Label:setText( Engine.Localize( "MP_X2" ) )
	x2Label:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	x2Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	x2Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( x2Label )
	self.x2Label = x2Label
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

