-- 7d3165ec8fb87346c522ffec639baace
-- This hash is used for caching, delete to decompile the file again

CoD.doa_bubble_internal = InheritFrom( LUI.UIElement )
CoD.doa_bubble_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.doa_bubble_internal )
	self.id = "doa_bubble_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 25 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setAlpha( 0.7 )
	self:addElement( background )
	self.background = background
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, 0, 8 )
	right:setTopBottom( true, true, 0, 0 )
	right:setAlpha( 0.7 )
	self:addElement( right )
	self.right = right
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, -8, 0 )
	left:setTopBottom( true, true, 0, 0 )
	left:setAlpha( 0.7 )
	self:addElement( left )
	self.left = left
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, true, 0, 0 )
	top:setTopBottom( true, false, -8, 0 )
	top:setAlpha( 0.7 )
	self:addElement( top )
	self.top = top
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, true, 0, 0 )
	bottom:setTopBottom( false, true, 0, 8 )
	bottom:setAlpha( 0.7 )
	self:addElement( bottom )
	self.bottom = bottom
	
	local topLeft = LUI.UIImage.new()
	topLeft:setLeftRight( true, false, -8, 0 )
	topLeft:setTopBottom( true, false, -8, 0 )
	topLeft:setAlpha( 0.7 )
	topLeft:setZRot( 180 )
	topLeft:setImage( RegisterImage( "uie_t7_hud_doa_roundcorner" ) )
	self:addElement( topLeft )
	self.topLeft = topLeft
	
	local bottomLeft = LUI.UIImage.new()
	bottomLeft:setLeftRight( true, false, -8, 0 )
	bottomLeft:setTopBottom( false, true, 0, 8 )
	bottomLeft:setAlpha( 0.7 )
	bottomLeft:setZRot( -90 )
	bottomLeft:setImage( RegisterImage( "uie_t7_hud_doa_roundcorner" ) )
	self:addElement( bottomLeft )
	self.bottomLeft = bottomLeft
	
	local topRight = LUI.UIImage.new()
	topRight:setLeftRight( false, true, 0, 8 )
	topRight:setTopBottom( true, false, -8, 0 )
	topRight:setAlpha( 0.7 )
	topRight:setZRot( 90 )
	topRight:setImage( RegisterImage( "uie_t7_hud_doa_roundcorner" ) )
	self:addElement( topRight )
	self.topRight = topRight
	
	local bottomRight = LUI.UIImage.new()
	bottomRight:setLeftRight( false, true, 0, 8 )
	bottomRight:setTopBottom( false, true, 0, 8 )
	bottomRight:setAlpha( 0.7 )
	bottomRight:setImage( RegisterImage( "uie_t7_hud_doa_roundcorner" ) )
	self:addElement( bottomRight )
	self.bottomRight = bottomRight
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 0, 200 )
	text:setTopBottom( true, false, 0, 25 )
	text:setRGB( 0, 0, 0 )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "text", true, function ( model )
		local _text = Engine.GetModelValue( model )
		if _text then
			text:setText( Engine.Localize( _text ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( text )
	self.text = text
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 18 )
	Image0:setTopBottom( false, true, 8, 23 )
	Image0:setAlpha( 0.7 )
	Image0:setImage( RegisterImage( "uie_t7_hud_doa_roundtail" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
