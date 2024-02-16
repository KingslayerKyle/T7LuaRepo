-- 0c016b923dceac26de4bbe320082508e
-- This hash is used for caching, delete to decompile the file again

CoD.BM_PromoTitle = InheritFrom( LUI.UIElement )
CoD.BM_PromoTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_PromoTitle )
	self.id = "BM_PromoTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 832 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Left0 = LUI.UIImage.new()
	Left0:setLeftRight( true, true, 38.26, 0 )
	Left0:setTopBottom( true, false, -25, 71 )
	Left0:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg_left_center" ) )
	self:addElement( Left0 )
	self.Left0 = Left0
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( true, false, -21.74, 38.26 )
	Left:setTopBottom( true, false, -25, 71 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg_left" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 14.5, 822 )
	Title:setTopBottom( true, false, 7, 41 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( Engine.Localize( "MENU_HALF_OFF" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.09, 0, 0, 0 )
	Title:setShaderVector( 1, 0.06, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 1.6 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
