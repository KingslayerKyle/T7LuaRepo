require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.PerksWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.NewNumberBreadcrumb" )

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
	
	local perk1 = CoD.PerksWidget.new( menu, controller )
	perk1:setLeftRight( false, true, -196, -134 )
	perk1:setTopBottom( true, false, 0, 145 )
	perk1.header:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	self:addElement( perk1 )
	self.perk1 = perk1
	
	local perk1NewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	perk1NewNumber:setLeftRight( true, false, 43, 59 )
	perk1NewNumber:setTopBottom( true, false, 19, 35 )
	perk1NewNumber:setAlpha( 0 )
	self:addElement( perk1NewNumber )
	self.perk1NewNumber = perk1NewNumber
	
	local perk2 = CoD.PerksWidget.new( menu, controller )
	perk2:setLeftRight( true, false, 67, 129 )
	perk2:setTopBottom( true, false, 0, 145 )
	perk2:setYRot( -1 )
	perk2.header:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	self:addElement( perk2 )
	self.perk2 = perk2
	
	local perk2NewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	perk2NewNumber:setLeftRight( false, false, 12, 28 )
	perk2NewNumber:setTopBottom( true, false, 19, 35 )
	self:addElement( perk2NewNumber )
	self.perk2NewNumber = perk2NewNumber
	
	local perk3 = CoD.PerksWidget.new( menu, controller )
	perk3:setLeftRight( false, true, -62, 0 )
	perk3:setTopBottom( true, false, 0, 145 )
	perk3.header:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
	self:addElement( perk3 )
	self.perk3 = perk3
	
	local perk3NewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	perk3NewNumber:setLeftRight( false, true, -19, -3 )
	perk3NewNumber:setTopBottom( true, false, 19, 35 )
	self:addElement( perk3NewNumber )
	self.perk3NewNumber = perk3NewNumber
	
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
		element.perk1:close()
		element.perk1NewNumber:close()
		element.perk2:close()
		element.perk2NewNumber:close()
		element.perk3:close()
		element.perk3NewNumber:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

