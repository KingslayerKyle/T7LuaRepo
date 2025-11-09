require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Border = InheritFrom( LUI.UIElement )
CoD.Border.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Border )
	self.id = "Border"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 25 )
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, true, 0, 0 )
	top:setTopBottom( true, false, 0, 2 )
	top:setRGB( 1, 1, 1 )
	top:setAlpha( 0 )
	top:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( top )
	self.top = top
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, true, 0, 0 )
	bottom:setTopBottom( false, true, -2, 0 )
	bottom:setRGB( 1, 1, 1 )
	bottom:setAlpha( 0 )
	bottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 2 )
	left:setTopBottom( true, true, 2, -2 )
	left:setRGB( 1, 1, 1 )
	left:setAlpha( 0 )
	left:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -2, 0 )
	right:setTopBottom( true, true, 2, -2 )
	right:setRGB( 1, 1, 1 )
	right:setAlpha( 0 )
	right:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( right )
	self.right = right
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local FETitleNumBrdr00 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr00:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr00:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr00:setRGB( 1, 1, 1 )
	FETitleNumBrdr00:setAlpha( 0.5 )
	self:addElement( FETitleNumBrdr00 )
	self.FETitleNumBrdr00 = FETitleNumBrdr00
	
	self.close = function ( self )
		self.FETitleNumBrdr0:close()
		self.FETitleNumBrdr00:close()
		CoD.Border.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

