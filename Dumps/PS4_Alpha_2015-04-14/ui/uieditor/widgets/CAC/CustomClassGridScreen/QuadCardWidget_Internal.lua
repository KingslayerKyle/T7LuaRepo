require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.MainItemCardWidget" )
require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.ModItemCardWidget" )

CoD.QuadCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.QuadCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.QuadCardWidget_Internal )
	self.id = "QuadCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 409 )
	self:setTopBottom( true, false, 0, 227 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local mainItemCardWidget = CoD.MainItemCardWidget.new( menu, controller )
	mainItemCardWidget:setLeftRight( true, true, 0, 0 )
	mainItemCardWidget:setTopBottom( true, false, 0, 128 )
	mainItemCardWidget:setRGB( 1, 1, 1 )
	self:addElement( mainItemCardWidget )
	self.mainItemCardWidget = mainItemCardWidget
	
	local modItemCardWidget = CoD.ModItemCardWidget.new( menu, controller )
	modItemCardWidget:setLeftRight( true, true, 0, 0 )
	modItemCardWidget:setTopBottom( false, true, -109, 0 )
	modItemCardWidget:setRGB( 1, 1, 1 )
	modItemCardWidget.modItemCard.headerLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	modItemCardWidget.modItemCard.modItemWidget1.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	modItemCardWidget.modItemCard.modItemWidget2.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	modItemCardWidget.modItemCard.modItemWidget3.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemCardWidget )
	self.modItemCardWidget = modItemCardWidget
	
	mainItemCardWidget.navigation = {
		left = modItemCardWidget,
		down = modItemCardWidget
	}
	modItemCardWidget.navigation = {
		left = mainItemCardWidget,
		up = mainItemCardWidget
	}
	mainItemCardWidget.id = "mainItemCardWidget"
	modItemCardWidget.id = "modItemCardWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.mainItemCardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.mainItemCardWidget:close()
		self.modItemCardWidget:close()
		CoD.QuadCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

