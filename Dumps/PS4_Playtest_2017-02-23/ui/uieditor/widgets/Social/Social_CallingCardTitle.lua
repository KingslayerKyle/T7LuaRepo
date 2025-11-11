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
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local FEListSubHeaderPanel0 = CoD.FE_ListSubHeaderPanel.new( menu, controller )
	FEListSubHeaderPanel0:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderPanel0:setTopBottom( 0, 1, 0, 0 )
	FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	self:addElement( FEListSubHeaderPanel0 )
	self.FEListSubHeaderPanel0 = FEListSubHeaderPanel0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 6, 446 )
	Label0:setTopBottom( 0, 0, 0, 30 )
	Label0:setText( Engine.Localize( "Hendricks" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
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

