-- f5a840323bbe32241b16d553710e5d35
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanel" )

CoD.Social_CallingCardSubTitle = InheritFrom( LUI.UIElement )
CoD.Social_CallingCardSubTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_CallingCardSubTitle )
	self.id = "Social_CallingCardSubTitle"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 18 )
	
	local FEListSubHeaderPanel0 = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	FEListSubHeaderPanel0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderPanel0:setTopBottom( true, true, 0, 0 )
	FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	self:addElement( FEListSubHeaderPanel0 )
	self.FEListSubHeaderPanel0 = FEListSubHeaderPanel0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0.38, 61.63 )
	Label0:setTopBottom( true, false, 0, 18 )
	Label0:setText( "" )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:setLetterSpacing( 0.5 )

	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeaderPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

