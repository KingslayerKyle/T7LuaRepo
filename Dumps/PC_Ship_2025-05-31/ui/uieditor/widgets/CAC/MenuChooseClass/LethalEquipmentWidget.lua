require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )

CoD.LethalEquipmentWidget = InheritFrom( LUI.UIElement )
CoD.LethalEquipmentWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalEquipmentWidget )
	self.id = "LethalEquipmentWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Equipment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	Equipment2:setLeftRight( true, true, 0, 0 )
	Equipment2:setTopBottom( true, false, 83, 145 )
	Equipment2.plusIcon:setRGB( 1, 0.41, 0 )
	Equipment2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Equipment2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	Equipment2:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACSecondLethalAvailable( menu, element, controller )
			end
		},
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f5_local0 = IsCACSpecificSlotEquipped( menu, controller, "primarygadget" )
				if f5_local0 then
					if not IsCACSpecificWildcardEquipped( menu, "bonuscard_danger_close" ) then
						f5_local0 = IsNonAttachmentItemLocked( controller, "bonuscard_danger_close" )
					else
						f5_local0 = false
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return IsCACSpecificSlotEquipped( menu, controller, "primarygadget" ) and not IsCACSpecificWildcardEquipped( menu, "bonuscard_danger_close" )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	self:addElement( Equipment2 )
	self.Equipment2 = Equipment2
	
	local Equipment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	Equipment1:setLeftRight( true, true, 0, 0 )
	Equipment1:setTopBottom( true, false, 16, 78 )
	Equipment1.plusIcon:setRGB( 1, 0.41, 0 )
	Equipment1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Equipment1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Equipment1 )
	self.Equipment1 = Equipment1
	
	local header = CoD.CategoryHeader.new( menu, controller )
	header:setLeftRight( true, false, 0, 70 )
	header:setTopBottom( true, false, -5, 15 )
	header:linkToElementModel( self, "headerName", true, function ( model )
		local headerName = Engine.GetModelValue( model )
		if headerName then
			header.header:setText( Engine.Localize( headerName ) )
		end
	end )
	header:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyLoadoutSlotNew( element, controller )
			end
		}
	} )
	self:addElement( header )
	self.header = header
	
	Equipment2.navigation = {
		up = Equipment1
	}
	Equipment1.navigation = {
		down = Equipment2
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Equipment2.id = "Equipment2"
	Equipment1.id = "Equipment1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Equipment2:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Equipment2:close()
		element.Equipment1:close()
		element.header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

