CoD.Theater_HintText = InheritFrom( LUI.UIElement )
CoD.Theater_HintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Theater_HintText )
	self.id = "Theater_HintText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 24 )
	
	local ItemHintText = LUI.UIText.new()
	ItemHintText:setLeftRight( true, false, 15, 280 )
	ItemHintText:setTopBottom( true, false, 2, 20 )
	ItemHintText:setAlpha( 0.8 )
	ItemHintText:setText( Engine.Localize( "MENU_NEW" ) )
	ItemHintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ItemHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ItemHintText )
	self.ItemHintText = ItemHintText
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 1, 10.82 )
	Arrow:setTopBottom( true, false, 7.09, 16.91 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

