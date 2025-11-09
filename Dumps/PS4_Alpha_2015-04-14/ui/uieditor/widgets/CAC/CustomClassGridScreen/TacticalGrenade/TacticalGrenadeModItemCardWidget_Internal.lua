require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.TacticalGrenade.TacticalGrenadeModCategoryItemWidget" )

CoD.TacticalGrenadeModItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeModItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeModItemCardWidget_Internal )
	self.id = "TacticalGrenadeModItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TacticalGrenadeModCategoryItemWidget0 = CoD.TacticalGrenadeModCategoryItemWidget.new( menu, controller )
	TacticalGrenadeModCategoryItemWidget0:setLeftRight( true, false, 0, 130 )
	TacticalGrenadeModCategoryItemWidget0:setTopBottom( true, false, 0, 89 )
	TacticalGrenadeModCategoryItemWidget0:setRGB( 1, 1, 1 )
	TacticalGrenadeModCategoryItemWidget0.modsHeaderLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	TacticalGrenadeModCategoryItemWidget0:linkToElementModel( self, "custsecondarygadgetattachment1", false, function ( model )
		TacticalGrenadeModCategoryItemWidget0.TacticalGrenadeModItemWidget0.modItemWidget:setModel( model, controller )
	end )
	self:addElement( TacticalGrenadeModCategoryItemWidget0 )
	self.TacticalGrenadeModCategoryItemWidget0 = TacticalGrenadeModCategoryItemWidget0
	
	local TacticalGrenadeModCategoryItemWidget1 = CoD.TacticalGrenadeModCategoryItemWidget.new( menu, controller )
	TacticalGrenadeModCategoryItemWidget1:setLeftRight( true, false, 133, 263 )
	TacticalGrenadeModCategoryItemWidget1:setTopBottom( true, false, 0, 89 )
	TacticalGrenadeModCategoryItemWidget1:setRGB( 1, 1, 1 )
	TacticalGrenadeModCategoryItemWidget1.modsHeaderLabel:setText( Engine.Localize( "MENU_QUANTITY_CAPS" ) )
	TacticalGrenadeModCategoryItemWidget1:linkToElementModel( self, "custsecondarygadgetattachment2", false, function ( model )
		TacticalGrenadeModCategoryItemWidget1.TacticalGrenadeModItemWidget0.modItemWidget:setModel( model, controller )
	end )
	self:addElement( TacticalGrenadeModCategoryItemWidget1 )
	self.TacticalGrenadeModCategoryItemWidget1 = TacticalGrenadeModCategoryItemWidget1
	
	TacticalGrenadeModCategoryItemWidget0.navigation = {
		right = TacticalGrenadeModCategoryItemWidget1
	}
	TacticalGrenadeModCategoryItemWidget1.navigation = {
		left = TacticalGrenadeModCategoryItemWidget0
	}
	TacticalGrenadeModCategoryItemWidget0.id = "TacticalGrenadeModCategoryItemWidget0"
	TacticalGrenadeModCategoryItemWidget1.id = "TacticalGrenadeModCategoryItemWidget1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.TacticalGrenadeModCategoryItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.TacticalGrenadeModCategoryItemWidget0:close()
		self.TacticalGrenadeModCategoryItemWidget1:close()
		CoD.TacticalGrenadeModItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

