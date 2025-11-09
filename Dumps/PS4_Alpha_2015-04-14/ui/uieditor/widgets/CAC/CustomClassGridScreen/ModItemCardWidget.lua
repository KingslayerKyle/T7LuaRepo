require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.ModItemCardWidget_Internal" )

CoD.ModItemCardWidget = InheritFrom( LUI.UIElement )
CoD.ModItemCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ModItemCardWidget )
	self.id = "ModItemCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 409 )
	self:setTopBottom( true, false, 0, 109 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local modItemCard = CoD.ModItemCardWidget_Internal.new( menu, controller )
	modItemCard:setLeftRight( true, false, 0, 409 )
	modItemCard:setTopBottom( true, false, 0, 109 )
	modItemCard:setRGB( 1, 1, 1 )
	modItemCard.headerLabel:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	modItemCard.modItemWidget1.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	modItemCard.modItemWidget2.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	modItemCard.modItemWidget3.modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemCard )
	self.modItemCard = modItemCard
	
	modItemCard.id = "modItemCard"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.modItemCard:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.modItemCard:close()
		CoD.ModItemCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

