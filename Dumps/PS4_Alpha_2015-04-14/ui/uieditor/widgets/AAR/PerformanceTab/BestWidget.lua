CoD.BestWidget = InheritFrom( LUI.UIElement )
CoD.BestWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BestWidget )
	self.id = "BestWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 50 )
	
	local Badge = LUI.UIImage.new()
	Badge:setLeftRight( true, false, -7, 57 )
	Badge:setTopBottom( true, false, -8, 56 )
	Badge:setImage( RegisterImage( "uie_t7_menu_aar_bestbadge" ) )
	Badge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Badge )
	self.Badge = Badge
	
	local BestLabel = LUI.UIText.new()
	BestLabel:setLeftRight( true, true, 0, 0 )
	BestLabel:setTopBottom( true, false, 4, 18 )
	BestLabel:setRGB( 0, 0, 0 )
	BestLabel:setText( Engine.Localize( "MPUI_BEST_CAPS" ) )
	BestLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BestLabel:setLetterSpacing( 2.4 )
	BestLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestLabel )
	self.BestLabel = BestLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

