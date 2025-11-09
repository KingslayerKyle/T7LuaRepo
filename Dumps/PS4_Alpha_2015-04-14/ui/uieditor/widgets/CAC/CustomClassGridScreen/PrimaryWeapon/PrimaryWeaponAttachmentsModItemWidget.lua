require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponAttachmentsModItemWidget_Internal" )

CoD.PrimaryWeaponAttachmentsModItemWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponAttachmentsModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponAttachmentsModItemWidget )
	self.id = "PrimaryWeaponAttachmentsModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 447 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PrimaryWeaponAttachmentsModItemWidgetInternal0 = CoD.PrimaryWeaponAttachmentsModItemWidget_Internal.new( menu, controller )
	PrimaryWeaponAttachmentsModItemWidgetInternal0:setLeftRight( true, true, 0, 0 )
	PrimaryWeaponAttachmentsModItemWidgetInternal0:setTopBottom( true, true, 0, 0 )
	PrimaryWeaponAttachmentsModItemWidgetInternal0:setRGB( 1, 1, 1 )
	PrimaryWeaponAttachmentsModItemWidgetInternal0:mergeStateConditions( {
		{
			stateName = "ThreeAttachments",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( PrimaryWeaponAttachmentsModItemWidgetInternal0 )
	self.PrimaryWeaponAttachmentsModItemWidgetInternal0 = PrimaryWeaponAttachmentsModItemWidgetInternal0
	
	PrimaryWeaponAttachmentsModItemWidgetInternal0.id = "PrimaryWeaponAttachmentsModItemWidgetInternal0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponAttachmentsModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PrimaryWeaponAttachmentsModItemWidgetInternal0:close()
		CoD.PrimaryWeaponAttachmentsModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

