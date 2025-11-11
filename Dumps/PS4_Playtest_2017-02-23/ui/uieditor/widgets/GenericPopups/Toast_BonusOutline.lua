require( "ui.uieditor.widgets.GenericPopups.GP_FrameBackgroundt" )
require( "ui.uieditor.widgets.GenericPopups.Toast_ItemTitleGlow" )

CoD.Toast_BonusOutline = InheritFrom( LUI.UIElement )
CoD.Toast_BonusOutline.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Toast_BonusOutline )
	self.id = "Toast_BonusOutline"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 456 )
	self:setTopBottom( 0, 0, 0, 120 )
	
	local ToastItemTitleGlow = CoD.Toast_ItemTitleGlow.new( menu, controller )
	ToastItemTitleGlow:setLeftRight( 0.5, 0.5, -61, 56 )
	ToastItemTitleGlow:setTopBottom( 1, 1, -35, 3 )
	self:addElement( ToastItemTitleGlow )
	self.ToastItemTitleGlow = ToastItemTitleGlow
	
	local Bonus = LUI.UIText.new()
	Bonus:setLeftRight( 0.5, 0.5, -113, 107 )
	Bonus:setTopBottom( 1, 1, -25, 0 )
	Bonus:setRGB( 0, 0, 0 )
	Bonus:setText( Engine.Localize( "MPUI_BONUS_CAPS" ) )
	Bonus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Bonus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Bonus:setShaderVector( 0, 0.06, 0, 0, 0 )
	Bonus:setShaderVector( 1, 0.02, 0, 0, 0 )
	Bonus:setShaderVector( 2, 1, 0, 0, 0 )
	Bonus:setLetterSpacing( 1 )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Bonus )
	self.Bonus = Bonus
	
	local FrameBackground = CoD.GP_FrameBackgroundt.new( menu, controller )
	FrameBackground:setLeftRight( 0, 1, -45, 43 )
	FrameBackground:setTopBottom( 0, 1, 0, -24 )
	self:addElement( FrameBackground )
	self.FrameBackground = FrameBackground
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ToastItemTitleGlow:close()
		self.FrameBackground:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

