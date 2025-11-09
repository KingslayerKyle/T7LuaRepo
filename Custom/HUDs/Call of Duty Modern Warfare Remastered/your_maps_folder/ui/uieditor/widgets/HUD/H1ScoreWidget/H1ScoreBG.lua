CoD.H1ScoreBG = InheritFrom( LUI.UIElement )
CoD.H1ScoreBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1ScoreBG )
	self.id = "H1ScoreBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBGBlur = LUI.UIImage.new()
	self.ScoreBGBlur:setLeftRight( true, false, 15, 350 )
    self.ScoreBGBlur:setTopBottom( false, true, -100, -15 )
	self.ScoreBGBlur:setImage( RegisterImage( "h1_weaponwidget_firearms_blurmask" ) )
	self.ScoreBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	self.ScoreBGBlur:setYRot( 180 )
	self.ScoreBGBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( self.ScoreBGBlur )
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBGBlur:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
