require( "ui.uieditor.widgets.AAR.MedalsTab.MedalPreviewWidget" )
require( "ui.uieditor.widgets.AAR.MedalsTab.MedalsGridItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.MedalsTabWidget = InheritFrom( LUI.UIElement )
CoD.MedalsTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalsTabWidget )
	self.id = "MedalsTabWidget"
	self.soundSet = "AAR"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MedalsGrid = LUI.UIList.new( menu, controller, 12, 0, nil, true, false, 0, 0, false, false )
	MedalsGrid:makeFocusable()
	MedalsGrid:setLeftRight( 0, 0, 670, 1766 )
	MedalsGrid:setTopBottom( 0, 0, 40, 739 )
	MedalsGrid:setWidgetType( CoD.MedalsGridItem )
	MedalsGrid:setHorizontalCount( 4 )
	MedalsGrid:setVerticalCount( 3 )
	MedalsGrid:setSpacing( 12 )
	MedalsGrid:setVerticalCounter( CoD.verticalCounter )
	MedalsGrid:setDataSource( "AARMedalsList" )
	self:addElement( MedalsGrid )
	self.MedalsGrid = MedalsGrid
	
	local MedalPreviewWidget0 = CoD.MedalPreviewWidget.new( menu, controller )
	MedalPreviewWidget0:setLeftRight( 0, 0, 100, 659 )
	MedalPreviewWidget0:setTopBottom( 0, 0, 37, 766 )
	self:addElement( MedalPreviewWidget0 )
	self.MedalPreviewWidget0 = MedalPreviewWidget0
	
	MedalPreviewWidget0:linkToElementModel( MedalsGrid, nil, false, function ( model )
		MedalPreviewWidget0:setModel( model, controller )
	end )
	MedalsGrid.id = "MedalsGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MedalsGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MedalsGrid:close()
		self.MedalPreviewWidget0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

