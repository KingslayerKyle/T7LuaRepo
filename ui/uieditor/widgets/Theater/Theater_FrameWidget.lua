-- 08bbe24d54ee75168bf1336218a3febd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_TopFramePanel" )
require( "ui.uieditor.widgets.Theater.Theater_BottomFramePanel" )

CoD.Theater_FrameWidget = InheritFrom( LUI.UIElement )
CoD.Theater_FrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Theater_FrameWidget )
	self.id = "Theater_FrameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 536 )
	self:setTopBottom( true, false, 0, 109 )
	
	local TheaterTopFramePanel0 = CoD.Theater_TopFramePanel.new( menu, controller )
	TheaterTopFramePanel0:setLeftRight( true, false, 0, 536 )
	TheaterTopFramePanel0:setTopBottom( true, false, 0, 61.75 )
	TheaterTopFramePanel0:setRGB( 0.6, 0.63, 0.66 )
	self:addElement( TheaterTopFramePanel0 )
	self.TheaterTopFramePanel0 = TheaterTopFramePanel0
	
	local TheaterBottomFramePanel0 = CoD.Theater_BottomFramePanel.new( menu, controller )
	TheaterBottomFramePanel0:setLeftRight( true, false, 21, 536 )
	TheaterBottomFramePanel0:setTopBottom( true, false, 46.88, 108.63 )
	TheaterBottomFramePanel0:setRGB( 0.51, 0.54, 0.57 )
	self:addElement( TheaterBottomFramePanel0 )
	self.TheaterBottomFramePanel0 = TheaterBottomFramePanel0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterTopFramePanel0:close()
		element.TheaterBottomFramePanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

