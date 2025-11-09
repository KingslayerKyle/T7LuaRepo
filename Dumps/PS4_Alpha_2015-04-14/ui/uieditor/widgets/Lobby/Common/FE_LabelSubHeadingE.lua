require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanel" )

CoD.FE_LabelSubHeadingE = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingE.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingE )
	self.id = "FE_LabelSubHeadingE"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 66 )
	self:setTopBottom( true, false, 0, 22 )
	
	local FEListSubHeaderPanel0 = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	FEListSubHeaderPanel0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderPanel0:setTopBottom( true, true, 0, 0 )
	FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	FEListSubHeaderPanel0:setAlpha( 0.9 )
	self:addElement( FEListSubHeaderPanel0 )
	self.FEListSubHeaderPanel0 = FEListSubHeaderPanel0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 6.75, 68 )
	Label0:setTopBottom( true, false, -1, 21 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "Hendricks" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.close = function ( self )
		self.FEListSubHeaderPanel0:close()
		CoD.FE_LabelSubHeadingE.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

