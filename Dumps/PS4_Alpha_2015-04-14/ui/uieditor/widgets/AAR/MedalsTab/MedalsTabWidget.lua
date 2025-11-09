require( "ui.uieditor.widgets.AAR.MedalsTab.MedalsGridItem" )
require( "ui.uieditor.widgets.AAR.MedalsTab.MedalPreviewWidget" )

CoD.MedalsTabWidget = InheritFrom( LUI.UIElement )
CoD.MedalsTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalsTabWidget )
	self.id = "MedalsTabWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MedalsGrid = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	MedalsGrid:makeFocusable()
	MedalsGrid:setLeftRight( true, false, 491.77, 1177.77 )
	MedalsGrid:setTopBottom( true, false, 79, 641 )
	MedalsGrid:setRGB( 1, 1, 1 )
	MedalsGrid:setWidgetType( CoD.MedalsGridItem )
	MedalsGrid:setHorizontalCount( 4 )
	MedalsGrid:setVerticalCount( 4 )
	self:addElement( MedalsGrid )
	self.MedalsGrid = MedalsGrid
	
	local MedalPreviewWidget0 = CoD.MedalPreviewWidget.new( menu, controller )
	MedalPreviewWidget0:setLeftRight( true, false, 126.71, 413.28 )
	MedalPreviewWidget0:setTopBottom( true, false, 79, 641 )
	MedalPreviewWidget0:setRGB( 1, 1, 1 )
	self:addElement( MedalPreviewWidget0 )
	self.MedalPreviewWidget0 = MedalPreviewWidget0
	
	MedalsGrid.id = "MedalsGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MedalsGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.MedalsGrid:close()
		self.MedalPreviewWidget0:close()
		CoD.MedalsTabWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

