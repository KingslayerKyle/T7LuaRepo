require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelMedium" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemWeaponLevel" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

local SetupPC = function ( self, controller )
	self:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller )
	if CursorInputEnabledForBuild() then
		SetupPC( self, controller )
	end
end

CoD.SecondaryWeaponWidget = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponWidget )
	self.id = "SecondaryWeaponWidget"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 193 )
	self:setTopBottom( 0, 0, 0, 217 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local WeaponItemModel = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	WeaponItemModel:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	WeaponItemModel:setLeftRight( 0, 1, 0, 0 )
	WeaponItemModel:setTopBottom( 1, 1, -194, 0 )
	WeaponItemModel.plusIcon:setRGB( 1, 0.41, 0 )
	WeaponItemModel:linkToElementModel( self, nil, false, function ( model )
		WeaponItemModel:setModel( model, controller )
	end )
	WeaponItemModel:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponItemModel.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( WeaponItemModel )
	self.WeaponItemModel = WeaponItemModel
	
	local weaponLevel = CoD.ItemWeaponLevel.new( menu, controller )
	weaponLevel:setLeftRight( 0, 0, 141, 189 )
	weaponLevel:setTopBottom( 1, 1, -195, -145 )
	weaponLevel:linkToElementModel( self, nil, false, function ( model )
		weaponLevel:setModel( model, controller )
	end )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
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
	
	local cacListButtonLabelMedium = CoD.cac_ListButtonLabelMedium.new( menu, controller )
	cacListButtonLabelMedium:setLeftRight( 0, 0, 3, 191 )
	cacListButtonLabelMedium:setTopBottom( 0, 0, 179, 215 )
	cacListButtonLabelMedium:setAlpha( 0.6 )
	cacListButtonLabelMedium.itemName:setRGB( 1, 1, 1 )
	cacListButtonLabelMedium:linkToElementModel( self, nil, false, function ( model )
		cacListButtonLabelMedium:setModel( model, controller )
	end )
	cacListButtonLabelMedium:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacListButtonLabelMedium.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacListButtonLabelMedium )
	self.cacListButtonLabelMedium = cacListButtonLabelMedium
	
	self.resetProperties = function ()
		weaponLevel:completeAnimation()
		weaponLevel:setLeftRight( 0, 0, 141, 189 )
		weaponLevel:setTopBottom( 1, 1, -195, -145 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultState_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				weaponLevel:completeAnimation()
				self.weaponLevel:setLeftRight( 0, 0, 73, 121 )
				self.weaponLevel:setTopBottom( 1, 1, -195, -145 )
				self.clipFinished( weaponLevel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultState_PC",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsGamepad( controller ) then
					f16_local0 = IsPC()
				else
					f16_local0 = false
				end
				return f16_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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
		self.header:close()
		self.cacListButtonLabelMedium:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

