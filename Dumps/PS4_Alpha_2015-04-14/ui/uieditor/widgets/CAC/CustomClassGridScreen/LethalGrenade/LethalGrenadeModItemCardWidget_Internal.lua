require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.LethalGrenade.LethalGrenadeModCategoryItemWidget" )

CoD.LethalGrenadeModItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeModItemCardWidget_Internal )
	self.id = "LethalGrenadeModItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LethalGrenadeModCategoryItemWidget0 = CoD.LethalGrenadeModCategoryItemWidget.new( menu, controller )
	LethalGrenadeModCategoryItemWidget0:setLeftRight( true, false, 0, 130 )
	LethalGrenadeModCategoryItemWidget0:setTopBottom( true, false, 0, 89 )
	LethalGrenadeModCategoryItemWidget0:setRGB( 1, 1, 1 )
	LethalGrenadeModCategoryItemWidget0.modsHeaderLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	LethalGrenadeModCategoryItemWidget0:linkToElementModel( self, "custprimarygadgetattachment1", false, function ( model )
		LethalGrenadeModCategoryItemWidget0.LethalGrenadeModItemWidget0.modItemWidget:setModel( model, controller )
	end )
	self:addElement( LethalGrenadeModCategoryItemWidget0 )
	self.LethalGrenadeModCategoryItemWidget0 = LethalGrenadeModCategoryItemWidget0
	
	local LethalGrenadeModCategoryItemWidget1 = CoD.LethalGrenadeModCategoryItemWidget.new( menu, controller )
	LethalGrenadeModCategoryItemWidget1:setLeftRight( true, false, 133, 263 )
	LethalGrenadeModCategoryItemWidget1:setTopBottom( true, false, 0, 89 )
	LethalGrenadeModCategoryItemWidget1:setRGB( 1, 1, 1 )
	LethalGrenadeModCategoryItemWidget1.modsHeaderLabel:setText( Engine.Localize( "MENU_QUANTITY_CAPS" ) )
	LethalGrenadeModCategoryItemWidget1:linkToElementModel( self, "custprimarygadgetattachment2", false, function ( model )
		LethalGrenadeModCategoryItemWidget1.LethalGrenadeModItemWidget0.modItemWidget:setModel( model, controller )
	end )
	self:addElement( LethalGrenadeModCategoryItemWidget1 )
	self.LethalGrenadeModCategoryItemWidget1 = LethalGrenadeModCategoryItemWidget1
	
	LethalGrenadeModCategoryItemWidget0.navigation = {
		right = LethalGrenadeModCategoryItemWidget1
	}
	LethalGrenadeModCategoryItemWidget1.navigation = {
		left = LethalGrenadeModCategoryItemWidget0
	}
	LethalGrenadeModCategoryItemWidget0.id = "LethalGrenadeModCategoryItemWidget0"
	LethalGrenadeModCategoryItemWidget1.id = "LethalGrenadeModCategoryItemWidget1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LethalGrenadeModCategoryItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.LethalGrenadeModCategoryItemWidget0:close()
		self.LethalGrenadeModCategoryItemWidget1:close()
		CoD.LethalGrenadeModItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

