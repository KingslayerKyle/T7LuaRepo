require( "ui.uieditor.widgets.Border" )

CoD.ChannelFilterColorButton = InheritFrom( LUI.UIElement )
CoD.ChannelFilterColorButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChannelFilterColorButton )
	self.id = "ChannelFilterColorButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 14 )
	self:setTopBottom( true, false, 0, 14 )
	
	local color = LUI.UIImage.new()
	color:setLeftRight( true, true, 1, -1 )
	color:setTopBottom( true, true, 1, -1 )
	color:linkToElementModel( self, "color", true, function ( model )
		local _color = Engine.GetModelValue( model )
		if _color then
			color:setRGB( _color )
		end
	end )
	self:addElement( color )
	self.color = color
	
	local focusBorder = CoD.Border.new( menu, controller )
	focusBorder:setLeftRight( true, true, 0, 0 )
	focusBorder:setTopBottom( true, true, 0, 0 )
	focusBorder:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	focusBorder:setAlpha( 0 )
	focusBorder.FETitleNumBrdr0:setAlpha( 1 )
	self:addElement( focusBorder )
	self.focusBorder = focusBorder
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				focusBorder:completeAnimation()
				self.focusBorder:setAlpha( 0 )
				self.clipFinished( focusBorder, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.focusBorder:close()
		element.color:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

