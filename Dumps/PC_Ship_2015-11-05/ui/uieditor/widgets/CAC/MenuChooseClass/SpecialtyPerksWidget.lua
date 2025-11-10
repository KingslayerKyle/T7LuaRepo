require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.PerksWidget" )

CoD.SpecialtyPerksWidget = InheritFrom( LUI.UIElement )
CoD.SpecialtyPerksWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialtyPerksWidget )
	self.id = "SpecialtyPerksWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local perk1Header = CoD.CategoryHeader.new( menu, controller )
	perk1Header:setLeftRight( true, false, 0, 70 )
	perk1Header:setTopBottom( true, false, -5, 15 )
	perk1Header.header:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	perk1Header:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACSpecificLoadoutSlotNew( element, controller, "specialty1" )
			end
		}
	} )
	self:addElement( perk1Header )
	self.perk1Header = perk1Header
	
	local perk1 = CoD.PerksWidget.new( menu, controller )
	perk1:setLeftRight( false, true, -196, -134 )
	perk1:setTopBottom( true, false, 0, 145 )
	self:addElement( perk1 )
	self.perk1 = perk1
	
	local perk2Header = CoD.CategoryHeader.new( menu, controller )
	perk2Header:setLeftRight( true, false, 67, 137 )
	perk2Header:setTopBottom( true, false, -5, 15 )
	perk2Header.header:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	perk2Header:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACSpecificLoadoutSlotNew( element, controller, "specialty2" )
			end
		}
	} )
	self:addElement( perk2Header )
	self.perk2Header = perk2Header
	
	local perk2 = CoD.PerksWidget.new( menu, controller )
	perk2:setLeftRight( true, false, 67, 129 )
	perk2:setTopBottom( true, false, 0, 145 )
	self:addElement( perk2 )
	self.perk2 = perk2
	
	local perk3Header = CoD.CategoryHeader.new( menu, controller )
	perk3Header:setLeftRight( true, false, 134, 204 )
	perk3Header:setTopBottom( true, false, -5, 15 )
	perk3Header.header:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	perk3Header:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACSpecificLoadoutSlotNew( element, controller, "specialty3" )
			end
		}
	} )
	self:addElement( perk3Header )
	self.perk3Header = perk3Header
	
	local perk3 = CoD.PerksWidget.new( menu, controller )
	perk3:setLeftRight( false, true, -62, 0 )
	perk3:setTopBottom( true, false, 0, 145 )
	self:addElement( perk3 )
	self.perk3 = perk3
	
	perk1.navigation = {
		right = perk2
	}
	perk2.navigation = {
		left = perk1,
		right = perk3
	}
	perk3.navigation = {
		left = perk2
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	perk1.id = "perk1"
	perk2.id = "perk2"
	perk3.id = "perk3"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.perk1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perk1Header:close()
		element.perk1:close()
		element.perk2Header:close()
		element.perk2:close()
		element.perk3Header:close()
		element.perk3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

