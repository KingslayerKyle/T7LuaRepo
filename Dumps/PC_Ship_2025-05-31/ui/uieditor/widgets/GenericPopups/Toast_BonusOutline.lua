require( "ui.uieditor.widgets.GenericPopups.Toast_ItemTitleGlow" )
require( "ui.uieditor.widgets.GenericPopups.GP_FrameBackgroundt" )

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
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local ToastItemTitleGlow = CoD.Toast_ItemTitleGlow.new( menu, controller )
	ToastItemTitleGlow:setLeftRight( false, false, -41, 37 )
	ToastItemTitleGlow:setTopBottom( false, true, -23, 2 )
	self:addElement( ToastItemTitleGlow )
	self.ToastItemTitleGlow = ToastItemTitleGlow
	
	local Bonus = LUI.UIText.new()
	Bonus:setLeftRight( false, false, -75.5, 71.5 )
	Bonus:setTopBottom( false, true, -17, 0 )
	Bonus:setRGB( 0, 0, 0 )
	Bonus:setText( Engine.Localize( "MPUI_BONUS_CAPS" ) )
	Bonus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Bonus:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Bonus:setShaderVector( 0, 0.06, 0, 0, 0 )
	Bonus:setShaderVector( 1, 0.02, 0, 0, 0 )
	Bonus:setShaderVector( 2, 1, 0, 0, 0 )
	Bonus:setLetterSpacing( 1 )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Bonus )
	self.Bonus = Bonus
	
	local FrameBackground = CoD.GP_FrameBackgroundt.new( menu, controller )
	FrameBackground:setLeftRight( true, true, -29.5, 28.5 )
	FrameBackground:setTopBottom( true, true, 0, -16 )
	self:addElement( FrameBackground )
	self.FrameBackground = FrameBackground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ToastItemTitleGlow:close()
		element.FrameBackground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

