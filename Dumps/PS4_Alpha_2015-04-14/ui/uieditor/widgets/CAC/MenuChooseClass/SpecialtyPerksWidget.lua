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
	
	local perk1 = CoD.PerksWidget.new( menu, controller )
	perk1:setLeftRight( false, true, -196, -134 )
	perk1:setTopBottom( true, false, 0, 145 )
	perk1:setRGB( 1, 1, 1 )
	perk1.header:setText( Engine.Localize( "MPUI_PERK1_CAPS" ) )
	self:addElement( perk1 )
	self.perk1 = perk1
	
	local perk2 = CoD.PerksWidget.new( menu, controller )
	perk2:setLeftRight( true, false, 67, 129 )
	perk2:setTopBottom( true, false, 0, 145 )
	perk2:setRGB( 1, 1, 1 )
	perk2:setYRot( -1 )
	perk2.header:setText( Engine.Localize( "MPUI_PERK2_CAPS" ) )
	self:addElement( perk2 )
	self.perk2 = perk2
	
	local perk3 = CoD.PerksWidget.new( menu, controller )
	perk3:setLeftRight( false, true, -62, 0 )
	perk3:setTopBottom( true, false, 0, 145 )
	perk3:setRGB( 1, 1, 1 )
	perk3.header:setText( Engine.Localize( "MPUI_PERK3_CAPS" ) )
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
	self.close = function ( self )
		self.perk1:close()
		self.perk2:close()
		self.perk3:close()
		CoD.SpecialtyPerksWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

