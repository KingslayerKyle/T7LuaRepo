-- aa0ed0403a795c4af82c304b6b3b6f2c
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Promo_Countdown2 = InheritFrom( LUI.UIElement )
CoD.BM_Promo_Countdown2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Promo_Countdown2 )
	self.id = "BM_Promo_Countdown2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 99 )
	self:setTopBottom( true, false, 0, 40 )
	
	local bg00 = LUI.UIImage.new()
	bg00:setLeftRight( false, true, 0, 60 )
	bg00:setTopBottom( true, false, -30, 66 )
	bg00:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg_right" ) )
	self:addElement( bg00 )
	self.bg00 = bg00
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 47 )
	bg:setTopBottom( true, false, -30, 66 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg_center" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, true, 47, 0 )
	bg0:setTopBottom( true, false, -30, 66 )
	bg0:setImage( RegisterImage( "uie_t7_blackmarket_promo_titlebg_right_center" ) )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local Expires = LUI.UITightText.new()
	Expires:setLeftRight( true, false, 19, 99 )
	Expires:setTopBottom( true, false, 10, 30 )
	Expires:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	Expires:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Expires:setLetterSpacing( 1.1 )
	LUI.OverrideFunction_CallOriginalFirst( Expires, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -10 )
	end )
	self:addElement( Expires )
	self.Expires = Expires
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

