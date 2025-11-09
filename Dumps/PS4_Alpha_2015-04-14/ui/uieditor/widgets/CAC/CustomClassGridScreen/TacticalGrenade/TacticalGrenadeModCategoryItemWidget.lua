require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.TacticalGrenade.TacticalGrenadeModItemWidget" )

CoD.TacticalGrenadeModCategoryItemWidget = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeModCategoryItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeModCategoryItemWidget )
	self.id = "TacticalGrenadeModCategoryItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local modsHeaderLabel = LUI.UITightText.new()
	modsHeaderLabel:setLeftRight( true, false, 0, 44 )
	modsHeaderLabel:setTopBottom( true, false, 5, 25 )
	modsHeaderLabel:setRGB( 0.4, 0.44, 0.52 )
	modsHeaderLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	modsHeaderLabel:setTTF( "fonts/default.ttf" )
	self:addElement( modsHeaderLabel )
	self.modsHeaderLabel = modsHeaderLabel
	
	local TacticalGrenadeModItemWidget0 = CoD.TacticalGrenadeModItemWidget.new( menu, controller )
	TacticalGrenadeModItemWidget0:setLeftRight( true, true, 0, 0 )
	TacticalGrenadeModItemWidget0:setTopBottom( true, true, 25, 0 )
	TacticalGrenadeModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( TacticalGrenadeModItemWidget0 )
	self.TacticalGrenadeModItemWidget0 = TacticalGrenadeModItemWidget0
	
	TacticalGrenadeModItemWidget0.id = "TacticalGrenadeModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.TacticalGrenadeModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.TacticalGrenadeModItemWidget0:close()
		CoD.TacticalGrenadeModCategoryItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

