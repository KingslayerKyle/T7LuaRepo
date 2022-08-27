-- 1e36aa06202703a3b3da59b901f5bd95
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderPanel" )

CoD.Social_CallingCardTitle = InheritFrom( LUI.UIElement )
CoD.Social_CallingCardTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_CallingCardTitle )
	self.id = "Social_CallingCardTitle"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 20 )
	
	local FEListSubHeaderPanel0 = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	FEListSubHeaderPanel0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderPanel0:setTopBottom( true, true, 0, 0 )
	FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	self:addElement( FEListSubHeaderPanel0 )
	self.FEListSubHeaderPanel0 = FEListSubHeaderPanel0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 3.88, 297.13 )
	Label0:setTopBottom( true, false, 0, 20 )
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

