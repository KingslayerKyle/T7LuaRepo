require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemWeaponLevel" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.NewNumberBreadcrumb" )

local SetupPC = function ( self, controller )
	self:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		SetupPC( self, controller )
	end
end

CoD.PrimaryWeaponWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponWidget )
	self.id = "PrimaryWeaponWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 50 )
	header:setTopBottom( true, false, -4, 14 )
	header:setRGB( 0.76, 0.76, 0.76 )
	header:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local WeaponItemModel = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	WeaponItemModel:setLeftRight( true, true, 0, 0 )
	WeaponItemModel:setTopBottom( false, true, -129, 0 )
	WeaponItemModel.plusIcon:setRGB( 1, 0.41, 0 )
	WeaponItemModel:linkToElementModel( self, nil, false, function ( model )
		WeaponItemModel:setModel( model, controller )
	end )
	WeaponItemModel:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponItemModel.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	WeaponItemModel:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponItemModel.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	WeaponItemModel:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	self:addElement( WeaponItemModel )
	self.WeaponItemModel = WeaponItemModel
	
	local weaponLevel = CoD.ItemWeaponLevel.new( menu, controller )
	weaponLevel:setLeftRight( true, false, 2, 34 )
	weaponLevel:setTopBottom( false, true, -35, -2 )
	weaponLevel:linkToElementModel( self, nil, false, function ( model )
		weaponLevel:setModel( model, controller )
	end )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local newNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	newNumber:setLeftRight( false, true, -19, -3 )
	newNumber:setTopBottom( true, false, 19, 35 )
	self:addElement( newNumber )
	self.newNumber = newNumber
	
	WeaponItemModel.id = "WeaponItemModel"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.WeaponItemModel:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponItemModel:close()
		self.weaponLevel:close()
		self.newNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

