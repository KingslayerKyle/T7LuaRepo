CoD.BM_LogoRecently = InheritFrom( LUI.UIElement )
CoD.BM_LogoRecently.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_LogoRecently )
	self.id = "BM_LogoRecently"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 586 )
	self:setTopBottom( 0, 0, 0, 181 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( 0, 0, 0, 249 )
	left:setTopBottom( 0, 1, 0, 0 )
	left:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_left" ) )
	self:addElement( left )
	self.left = left
	
	local left0 = LUI.UIImage.new()
	left0:setLeftRight( 0, 1, 249, -49 )
	left0:setTopBottom( 0, 1, 0, 0 )
	left0:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_center" ) )
	self:addElement( left0 )
	self.left0 = left0
	
	local left00 = LUI.UIImage.new()
	left00:setLeftRight( 1, 1, -49, 0 )
	left00:setTopBottom( 0, 1, 0, 0 )
	left00:setImage( RegisterImage( "uie_t7_blackmarket_logo_header_right" ) )
	self:addElement( left00 )
	self.left00 = left00
	
	local RecentItems = LUI.UITightText.new()
	RecentItems:setLeftRight( 0, 0, 249, 587 )
	RecentItems:setTopBottom( 0, 0, 84, 102 )
	RecentItems:setRGB( 0.87, 0.87, 0.75 )
	RecentItems:setText( Engine.Localize( "MPUI_RECENT_CONTRABAND_CAPS" ) )
	RecentItems:setTTF( "fonts/escom.ttf" )
	RecentItems:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RecentItems:setShaderVector( 0, 0.06, 0, 0, 0 )
	RecentItems:setShaderVector( 1, 0.03, 0, 0, 0 )
	RecentItems:setShaderVector( 2, 1, 0, 0, 0 )
	RecentItems:setLetterSpacing( 6.9 )
	LUI.OverrideFunction_CallOriginalFirst( RecentItems, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -159 )
	end )
	self:addElement( RecentItems )
	self.RecentItems = RecentItems
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

