require( "ui.uieditor.widgets.StartGameFlow.TipWidgetInternal" )

CoD.TipWidget = InheritFrom( LUI.UIElement )
CoD.TipWidget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TipWidget )
	self.id = "TipWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1216, 1280 )
	Image2:setTopBottom( true, false, 19, 31 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setAlpha( 0 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local spacer = CoD.TipWidgetInternal.new( menu, controller )
	spacer:setLeftRight( true, false, 618, 1216 )
	spacer:setTopBottom( true, false, 13, 35 )
	spacer:setRGB( 1, 1, 1 )
	self:addElement( spacer )
	self.spacer = spacer
	
	self.close = function ( self )
		self.spacer:close()
		CoD.TipWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

