-- 4defa11f79100230f71e7273cd58bcd0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemWeaponLevel" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelMedium" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
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
	
	local WeaponItemModel = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	WeaponItemModel:setLeftRight( true, true, 0, 0 )
	WeaponItemModel:setTopBottom( false, true, -129, 0 )
	WeaponItemModel.plusIcon:setRGB( 1, 0.41, 0 )
	WeaponItemModel:linkToElementModel( self, nil, false, function ( model )
		WeaponItemModel:setModel( model, controller )
	end )
	WeaponItemModel:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			WeaponItemModel.itemImage:setImage( RegisterImage( image ) )
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
	weaponLevel:setLeftRight( true, false, 94, 126 )
	weaponLevel:setTopBottom( false, true, -130, -97 )
	weaponLevel:linkToElementModel( self, nil, false, function ( model )
		weaponLevel:setModel( model, controller )
	end )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local header = CoD.CategoryHeader.new( menu, controller )
	header:setLeftRight( true, false, 0, 129 )
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
	
	local cacListButtonLabelMedium = CoD.cac_ListButtonLabelMedium.new( menu, controller )
	cacListButtonLabelMedium:setLeftRight( true, false, 2, 126 )
	cacListButtonLabelMedium:setTopBottom( true, false, 119.5, 143.5 )
	cacListButtonLabelMedium:setAlpha( 0.6 )
	cacListButtonLabelMedium.itemName:setRGB( 1, 1, 1 )
	cacListButtonLabelMedium:linkToElementModel( self, nil, false, function ( model )
		cacListButtonLabelMedium:setModel( model, controller )
	end )
	cacListButtonLabelMedium:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			cacListButtonLabelMedium.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( cacListButtonLabelMedium )
	self.cacListButtonLabelMedium = cacListButtonLabelMedium
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				weaponLevel:completeAnimation()
				self.weaponLevel:setLeftRight( true, false, 94, 126 )
				self.weaponLevel:setTopBottom( false, true, -130, -97 )
				self.clipFinished( weaponLevel, {} )
			end
		},
		DefaultState_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				weaponLevel:completeAnimation()
				self.weaponLevel:setLeftRight( true, false, 48.5, 80.5 )
				self.weaponLevel:setTopBottom( false, true, -130, -97 )
				self.clipFinished( weaponLevel, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DefaultState_PC",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local5 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local5( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	WeaponItemModel.id = "WeaponItemModel"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.WeaponItemModel:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponItemModel:close()
		element.weaponLevel:close()
		element.header:close()
		element.cacListButtonLabelMedium:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

