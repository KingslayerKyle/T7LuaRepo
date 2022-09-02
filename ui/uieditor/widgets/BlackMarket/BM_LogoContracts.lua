-- 4158fa6b1291d18919141ff0237c761d
-- This hash is used for caching, delete to decompile the file again

CoD.BM_LogoContracts = InheritFrom( LUI.UIElement )
CoD.BM_LogoContracts.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_LogoContracts )
	self.id = "BM_LogoContracts"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 535 )
	self:setTopBottom( true, false, 0, 121 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 166.03 )
	left:setTopBottom( true, true, 0, 0.49 )
	left:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_left" ) )
	self:addElement( left )
	self.left = left
	
	local left0 = LUI.UIImage.new()
	left0:setLeftRight( true, true, 166.03, -32.4 )
	left0:setTopBottom( true, true, 0, 0.49 )
	left0:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_center" ) )
	self:addElement( left0 )
	self.left0 = left0
	
	local left00 = LUI.UIImage.new()
	left00:setLeftRight( false, true, -32.4, 0 )
	left00:setTopBottom( true, true, 0, 0.49 )
	left00:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_right" ) )
	self:addElement( left00 )
	self.left00 = left00
	
	local RecentItems = LUI.UITightText.new()
	RecentItems:setLeftRight( true, false, 158, 475.2 )
	RecentItems:setTopBottom( true, false, 52, 73 )
	RecentItems:setRGB( 0.82, 0.83, 0.6 )
	RecentItems:setAlpha( 0.6 )
	RecentItems:setText( Engine.Localize( "MPUI_BM_CONTRACTS" ) )
	RecentItems:setTTF( "fonts/escom.ttf" )
	RecentItems:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RecentItems:setShaderVector( 0, 0.06, 0, 0, 0 )
	RecentItems:setShaderVector( 1, 0.03, 0, 0, 0 )
	RecentItems:setShaderVector( 2, 1, 0, 0, 0 )
	RecentItems:setLetterSpacing( 6.9 )

	LUI.OverrideFunction_CallOriginalFirst( RecentItems, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -159 )
	end )
	self:addElement( RecentItems )
	self.RecentItems = RecentItems
	
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

