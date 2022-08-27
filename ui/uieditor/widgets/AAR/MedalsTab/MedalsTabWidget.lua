-- ad0e61235a18c0d71d14355561ba7dd7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.MedalsTab.MedalsGridItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
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
	self.soundSet = "AAR"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MedalsGrid = LUI.UIList.new( menu, controller, 8, 0, nil, true, false, 0, 0, false, false )
	MedalsGrid:makeFocusable()
	MedalsGrid:setLeftRight( true, false, 445.77, 1177.77 )
	MedalsGrid:setTopBottom( true, false, 27, 493 )
	MedalsGrid:setDataSource( "AARMedalsList" )
	MedalsGrid:setWidgetType( CoD.MedalsGridItem )
	MedalsGrid:setHorizontalCount( 4 )
	MedalsGrid:setVerticalCount( 3 )
	MedalsGrid:setSpacing( 8 )
	MedalsGrid:setVerticalCounter( CoD.verticalCounter )
	self:addElement( MedalsGrid )
	self.MedalsGrid = MedalsGrid
	
	local MedalPreviewWidget0 = CoD.MedalPreviewWidget.new( menu, controller )
	MedalPreviewWidget0:setLeftRight( true, false, 66.71, 439.28 )
	MedalPreviewWidget0:setTopBottom( true, false, 25, 511 )
	self:addElement( MedalPreviewWidget0 )
	self.MedalPreviewWidget0 = MedalPreviewWidget0
	
	MedalPreviewWidget0:linkToElementModel( MedalsGrid, nil, false, function ( model )
		MedalPreviewWidget0:setModel( model, controller )
	end )
	MedalsGrid.id = "MedalsGrid"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.MedalsGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MedalsGrid:close()
		element.MedalPreviewWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

