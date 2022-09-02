-- a7a4c937803f91554265058bd4e0f834
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 48 )
	
	local spacer = CoD.TipWidgetInternal.new( menu, controller )
	spacer:setLeftRight( true, false, 0, 1249 )
	spacer:setTopBottom( true, false, 13, 35 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1249, 1313 )
	Image2:setTopBottom( true, false, 24, 31 )
	Image2:setAlpha( 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.spacer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

