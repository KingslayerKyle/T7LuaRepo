CoD.H1AmmoBG = InheritFrom( LUI.UIElement )
CoD.H1AmmoBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1AmmoBG )
	self.id = "H1AmmoBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.AmmoBGBlur = LUI.UIImage.new()
	self.AmmoBGBlur:setLeftRight( false, true, -350 - 48 - 48, -15 - 48 - 48 )
    self.AmmoBGBlur:setTopBottom( false, true, -100, -15 )
	self.AmmoBGBlur:setImage( RegisterImage( "h1_weaponwidget_firearms_blurmask" ) )
	self.AmmoBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	self.AmmoBGBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( self.AmmoBGBlur )

	self.LethalBGBlur = LUI.UIImage.new()
	self.LethalBGBlur:setLeftRight( false, true, -62, -15 )
	self.LethalBGBlur:setTopBottom( false, true, -100, -15 )
	self.LethalBGBlur:setImage( RegisterImage( "h1_basewidgets_box_blurmask" ) )
	self.LethalBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	self.LethalBGBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( self.LethalBGBlur )

	self.TacticalBGBlur = LUI.UIImage.new()
	self.TacticalBGBlur:setLeftRight( false, true, -62 - 48, -15 - 48 )
	self.TacticalBGBlur:setTopBottom( false, true, -100, -15 )
	self.TacticalBGBlur:setImage( RegisterImage( "h1_basewidgets_box_blurmask" ) )
	self.TacticalBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	self.TacticalBGBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( self.TacticalBGBlur )
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoBGBlur:close()
		element.LethalBGBlur:close()
		element.TacticalBGBlur:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
