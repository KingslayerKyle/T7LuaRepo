require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

CoD.TacticalEquipmentWidget = InheritFrom( LUI.UIElement )
CoD.TacticalEquipmentWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalEquipmentWidget )
	self.id = "TacticalEquipmentWidget"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 217 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Equipment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	Equipment2:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	Equipment2:setLeftRight( 0, 1, 0, 0 )
	Equipment2:setTopBottom( 0, 0, 125, 218 )
	Equipment2.plusIcon:setRGB( 1, 0.41, 0 )
	Equipment2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Equipment2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Equipment2 )
	self.Equipment2 = Equipment2
	
	local Equipment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	Equipment1:setLeftRight( 0, 1, 0, 0 )
	Equipment1:setTopBottom( 0, 0, 24, 117 )
	Equipment1.plusIcon:setRGB( 1, 0.41, 0 )
	Equipment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Equipment1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Equipment1 )
	self.Equipment1 = Equipment1
	
	local header = CoD.CategoryHeader.new( menu, controller )
	header:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyLoadoutSlotNew( element, controller )
			end
		}
	} )
	header:setLeftRight( 0, 0, 0, 105 )
	header:setTopBottom( 0, 0, -7, 23 )
	header:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			header.header:setText( Engine.Localize( modelValue ) )
		end
	end )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Equipment2:close()
		self.Equipment1:close()
		self.header:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

