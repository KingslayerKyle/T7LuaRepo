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
	self:setLeftRight( 0, 0, 0, 99 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local FEListSubHeaderPanel0 = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	FEListSubHeaderPanel0:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderPanel0:setTopBottom( 0, 1, 0, 0 )
	FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	FEListSubHeaderPanel0:setAlpha( 0.5 )
	self:addElement( FEListSubHeaderPanel0 )
	self.FEListSubHeaderPanel0 = FEListSubHeaderPanel0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 11, 141 )
	Label0:setTopBottom( 0, 0, -1, 32 )
	Label0:setText( Engine.Localize( "Hendricks" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:setLetterSpacing( 0.5 )
	Label0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

