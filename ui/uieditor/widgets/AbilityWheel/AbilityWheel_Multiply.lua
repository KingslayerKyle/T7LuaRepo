-- 28ac5b7c352da82237622180c09ca8d7
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_Multiply = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Multiply.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Multiply )
	self.id = "AbilityWheel_Multiply"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 672 )
	self:setTopBottom( true, false, 0, 672 )
	
	local GradMultiply = LUI.UIImage.new()
	GradMultiply:setLeftRight( false, false, -336, 0 )
	GradMultiply:setTopBottom( false, false, -336, 0 )
	GradMultiply:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradmultiply" ) )
	GradMultiply:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( GradMultiply )
	self.GradMultiply = GradMultiply
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -336, 0 )
	Image3:setTopBottom( false, false, 0, 336 )
	Image3:setXRot( -180 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradmultiply" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, false, 0, 336 )
	Image4:setTopBottom( false, false, -336, 0 )
	Image4:setYRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradmultiply" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, false, 0, 336 )
	Image5:setTopBottom( false, false, 0, 336 )
	Image5:setXRot( 180 )
	Image5:setYRot( -180 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradmultiply" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.AbilityButton6:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

