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
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TipWidget )
	self.id = "TipWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 72 )
	
	local spacer = CoD.TipWidgetInternal.new( menu, controller )
	spacer:setLeftRight( 0, 0, 0, 1874 )
	spacer:setTopBottom( 0, 0, 19.5, 52.5 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 1874, 1970 )
	Image2:setTopBottom( 0, 0, 36, 46 )
	Image2:setAlpha( 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.spacer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

