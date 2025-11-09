require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponAttachmentsModItemWidget_Internal" )

CoD.SecondaryWeaponAttachmentsModItemWidget = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachmentsModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachmentsModItemWidget )
	self.id = "SecondaryWeaponAttachmentsModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 267 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	local SecondaryWeaponAttachmentsModItemWidgetInternal0 = CoD.SecondaryWeaponAttachmentsModItemWidget_Internal.new( menu, controller )
	SecondaryWeaponAttachmentsModItemWidgetInternal0:setLeftRight( true, true, 0, 0 )
	SecondaryWeaponAttachmentsModItemWidgetInternal0:setTopBottom( true, true, 0, 0 )
	SecondaryWeaponAttachmentsModItemWidgetInternal0:setRGB( 1, 1, 1 )
	SecondaryWeaponAttachmentsModItemWidgetInternal0:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsSecondaryWeaponAttachmentAvailable( controller ) then
					f2_local0 = AlwaysFalse()
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "TwoAttachments",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	if SecondaryWeaponAttachmentsModItemWidgetInternal0.m_eventHandlers.update_class then
		local currentEv = SecondaryWeaponAttachmentsModItemWidgetInternal0.m_eventHandlers.update_class
		SecondaryWeaponAttachmentsModItemWidgetInternal0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SecondaryWeaponAttachmentsModItemWidgetInternal0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( SecondaryWeaponAttachmentsModItemWidgetInternal0 )
	self.SecondaryWeaponAttachmentsModItemWidgetInternal0 = SecondaryWeaponAttachmentsModItemWidgetInternal0
	
	SecondaryWeaponAttachmentsModItemWidgetInternal0.id = "SecondaryWeaponAttachmentsModItemWidgetInternal0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SecondaryWeaponAttachmentsModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.SecondaryWeaponAttachmentsModItemWidgetInternal0:close()
		CoD.SecondaryWeaponAttachmentsModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

