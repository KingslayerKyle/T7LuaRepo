CoD.FE_LabelSubHeadingA = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingA.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 7
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingA )
	self.id = "FE_LabelSubHeadingA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 74 )
	self:setTopBottom( true, false, 0, 29 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 74 )
	Label0:setTopBottom( false, false, -14.5, 14.5 )
	Label0:setRGB( 0.58, 0.64, 0.65 )
	Label0:setText( Engine.Localize( "33,241" ) )
	Label0:setTTF( "fonts/Entovo.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

