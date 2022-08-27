-- e7eac579df537464db09f273b062772e
-- This hash is used for caching, delete to decompile the file again

CoD.CPTrainingSimBackground = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimBackground )
	self.id = "CPTrainingSimBackground"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 94 )
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( false, false, -125, -31 )
	BackGlow:setTopBottom( false, false, -47, 47 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelcircle" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local scoreBackground0 = LUI.UIImage.new()
	scoreBackground0:setLeftRight( true, false, 88, 250 )
	scoreBackground0:setTopBottom( true, false, 48, 77 )
	scoreBackground0:setRGB( 0, 0, 0 )
	self:addElement( scoreBackground0 )
	self.scoreBackground0 = scoreBackground0
	
	local scoreBackground = LUI.UIImage.new()
	scoreBackground:setLeftRight( true, false, 88, 250 )
	scoreBackground:setTopBottom( true, false, 18, 47 )
	scoreBackground:setRGB( 0, 0, 0 )
	self:addElement( scoreBackground )
	self.scoreBackground = scoreBackground
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

