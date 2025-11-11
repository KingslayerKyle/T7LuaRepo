require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentsPreview" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsLockIcon" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsWeaponList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local GetGunsmithModeValue = function ( controller )
	local gunsmithMode = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	local modeValue = Engine.GetModelValue( gunsmithMode )
	return modeValue
end

local SetGunsmithModeValue = function ( controller, value )
	local gunsmithMode = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithMode, value )
end

local SetFocusOnLastSelectedWeapon = function ( self, controller )
	local lastIndex = 1
	if CoD.perController[controller].gunsmithWeaponListIndex ~= nil then
		lastIndex = CoD.perController[controller].gunsmithWeaponListIndex
	end
	local weaponWidget = self.weaponList:getItemAtPosition( lastIndex, 1, false )
	if weaponWidget then
		self.weaponList:setActiveItem( weaponWidget )
	end
end

local PostLoadFunc = function ( self, controller )
	self.disableDarkenElement = true
	self.disableBlur = true
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	self.updateMode = function ( self, mode, element )
		SetGunsmithModeValue( controller, mode )
		if mode == Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST then
			CoD.SwapFocusableElements( controller, self.variantSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.GunsmithMode.GUNSMITHMODE_VARIANTS then
			CoD.SwapFocusableElements( controller, self.weaponList, self.variantSelector )
			self:setState( "ShowVariants" )
		end
	end
	
	local modeValue = GetGunsmithModeValue( controller )
	self:updateMode( modeValue )
end

local PreLoadFunc = function ( self, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.UpdateDataSource" )
end

LUI.createMenu.WeaponBuildKits = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKits" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 552 )
	LeftPanel:setTopBottom( 0, 0, 127, 1000 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( 0.5, 0.5, -1125, 1125 )
	FooterBacking:setTopBottom( 0.5, 0.5, 446, 540 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( 0, 1, 0, 0 )
	TabBacking:setTopBottom( 0, 0, 185, 123 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		self:updateElementState( weaponList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	weaponList:setLeftRight( 0, 0, 115, 535 )
	weaponList:setTopBottom( 0, 0, 208.5, 947.5 )
	weaponList:setWidgetType( CoD.WeaponBuildKitsWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 10 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local element = weaponList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			FocusWeaponBuildKit( self, element, controller )
		else
			FocusWeaponBuildKit( self, element, controller )
		end
		return retVal
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) then
			SelectWeaponBuildKit( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsCACItemLocked( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantSelector = CoD.GunsmithVariantSelector.new( self, controller )
	variantSelector:setLeftRight( 0, 0, -471, 5 )
	variantSelector:setTopBottom( 0, 0, 193, 982 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0.5, 0.5, -973, 968 )
	TitleBacking0:setTopBottom( 0.5, 0.5, -541, -412 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -108, 806 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, -6, 213 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	itemName:setLeftRight( 0, 0, 582, 1154 )
	itemName:setTopBottom( 0, 0, 205.5, 256.5 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( 0, 0, 28, 108 )
	cacElemsSideListBoxes0:setTopBottom( 0, 0, -18.5, 986.5 )
	cacElemsSideListBoxes0:setAlpha( 0 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 6, 108 )
	ElemsSideList:setTopBottom( 0, 0, -16.5, 988.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local cacWpnLvl0 = CoD.cac_WpnLvl.new( self, controller )
	cacWpnLvl0:setLeftRight( 0, 0, 1202, 1824 )
	cacWpnLvl0:setTopBottom( 1, 1, -189, -129 )
	cacWpnLvl0.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	cacWpnLvl0.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	self:addElement( cacWpnLvl0 )
	self.cacWpnLvl0 = cacWpnLvl0
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( 0.5, 0.5, -378, 183 )
	highlightedDescription:setTopBottom( 0.5, 0.5, -265, -232 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local LockIcon = CoD.WeaponBuildKitsLockIcon.new( self, controller )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "itemIndex", true, function ( model )
		self:updateElementState( LockIcon, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LockIcon:setLeftRight( 0, 0, 1098, 1242 )
	LockIcon:setTopBottom( 0, 0, 21.5, 1026.5 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local WeaponBuildKitsAttachmentsPreview = CoD.WeaponBuildKitsAttachmentsPreview.new( self, controller )
	WeaponBuildKitsAttachmentsPreview:setLeftRight( 0, 0, 570, 1178 )
	WeaponBuildKitsAttachmentsPreview:setTopBottom( 1, 1, -269, -129 )
	WeaponBuildKitsAttachmentsPreview:linkToElementModel( self, nil, false, function ( model )
		WeaponBuildKitsAttachmentsPreview:setModel( model, controller )
	end )
	self:addElement( WeaponBuildKitsAttachmentsPreview )
	self.WeaponBuildKitsAttachmentsPreview = WeaponBuildKitsAttachmentsPreview
	
	local highlightedDescription0 = LUI.UIText.new()
	highlightedDescription0:setLeftRight( 0.5, 0.5, -845, -284 )
	highlightedDescription0:setTopBottom( 0.5, 0.5, -407, -362 )
	highlightedDescription0:setText( GetLocalizedStringForCurrentWeaponCategory( controller, "Weapon Category" ) )
	highlightedDescription0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription0:setLineSpacing( 0.5 )
	highlightedDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription0 )
	self.highlightedDescription0 = highlightedDescription0
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -1244, -228 )
	XCamMouseControl:setTopBottom( 0, 1, 347, -269 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	itemName:linkToElementModel( weaponList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemName:linkToElementModel( variantSelector.variantList, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, nil, false, function ( model )
		cacWpnLvl0:setModel( model, controller )
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacWpnLvl0.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, modelValue ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, modelValue ) ) )
		end
	end )
	LockIcon:linkToElementModel( weaponList, nil, false, function ( model )
		LockIcon:setModel( model, controller )
	end )
	weaponList.navigation = {
		left = variantSelector
	}
	variantSelector.navigation = {
		right = weaponList
	}
	self.resetProperties = function ()
		LeftPanel:completeAnimation()
		itemName:completeAnimation()
		LockIcon:completeAnimation()
		weaponList:completeAnimation()
		variantSelector:completeAnimation()
		TabBacking:completeAnimation()
		cacElemsSideListBoxes0:completeAnimation()
		ElemsSideList:completeAnimation()
		LeftPanel:setLeftRight( 0, 0, 96, 552 )
		LeftPanel:setTopBottom( 0, 0, 127, 1000 )
		itemName:setLeftRight( 0, 0, 582, 1154 )
		itemName:setTopBottom( 0, 0, 205.5, 256.5 )
		itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
		LockIcon:setAlpha( 1 )
		weaponList:setAlpha( 1 )
		variantSelector:setLeftRight( 0, 0, -471, 5 )
		variantSelector:setTopBottom( 0, 0, 193, 982 )
		variantSelector:setAlpha( 0 )
		TabBacking:setAlpha( 1 )
		cacElemsSideListBoxes0:setLeftRight( 0, 0, 28, 108 )
		cacElemsSideListBoxes0:setTopBottom( 0, 0, -18.5, 986.5 )
		cacElemsSideListBoxes0:setAlpha( 0 )
		ElemsSideList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				self.clipFinished( LeftPanel, {} )
				itemName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 581, 1153 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.clipFinished( itemName, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			ShowVariants = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 642 )
					LeftPanel:setTopBottom( 0, 0, 127, 1000 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 552 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1000 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				TabBackingFrame2( TabBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( 0, 0, 108, 584 )
					variantSelector:setTopBottom( 0, 0, 193, 982 )
					variantSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, -471, 5 )
				self.variantSelector:setTopBottom( 0, 0, 193, 982 )
				self.variantSelector:setAlpha( 0 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 673, 1245 )
					itemName:setTopBottom( 0, 0, 205.5, 256.5 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 582, 1154 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				local cacElemsSideListBoxes0Frame2 = function ( cacElemsSideListBoxes0, event )
					if not event.interrupted then
						cacElemsSideListBoxes0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					cacElemsSideListBoxes0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cacElemsSideListBoxes0, event )
					else
						cacElemsSideListBoxes0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setAlpha( 0 )
				cacElemsSideListBoxes0Frame2( cacElemsSideListBoxes0, {} )
			end
		},
		ShowVariants = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, 108, 464 )
				self.variantSelector:setTopBottom( 0, 0, 193, 982 )
				self.variantSelector:setAlpha( 1 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 674, 1246 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setLeftRight( 0, 0, 28, 108 )
				self.cacElemsSideListBoxes0:setTopBottom( 0, 0, -16.5, 988.5 )
				self.cacElemsSideListBoxes0:setAlpha( 1 )
				self.clipFinished( cacElemsSideListBoxes0, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setAlpha( 0 )
				self.clipFinished( ElemsSideList, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 552 )
					LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 642 )
				self.LeftPanel:setTopBottom( 0, 0, 116.5, 1000.5 )
				LeftPanelFrame2( LeftPanel, {} )
				local TabBackingFrame2 = function ( TabBacking, event )
					if not event.interrupted then
						TabBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TabBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBacking, event )
					else
						TabBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 0 )
				TabBackingFrame2( TabBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				weaponListFrame2( weaponList, {} )
				local variantSelectorFrame2 = function ( variantSelector, event )
					if not event.interrupted then
						variantSelector:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
					end
					variantSelector:setLeftRight( 0, 0, -470, 6 )
					variantSelector:setTopBottom( 0, 0, 193.5, 929.5 )
					variantSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( 0, 0, 108, 584 )
				self.variantSelector:setTopBottom( 0, 0, 190.5, 932.5 )
				self.variantSelector:setAlpha( 1 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 250, true, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( 0, 0, 582, 1154 )
					itemName:setTopBottom( 0, 0, 205.5, 256.5 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( 0, 0, 663, 1235 )
				self.itemName:setTopBottom( 0, 0, 205.5, 256.5 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				itemNameFrame2( itemName, {} )
				local cacElemsSideListBoxes0Frame2 = function ( cacElemsSideListBoxes0, event )
					if not event.interrupted then
						cacElemsSideListBoxes0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					cacElemsSideListBoxes0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( cacElemsSideListBoxes0, event )
					else
						cacElemsSideListBoxes0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setAlpha( 1 )
				cacElemsSideListBoxes0Frame2( cacElemsSideListBoxes0, {} )
				local ElemsSideListFrame2 = function ( ElemsSideList, event )
					if not event.interrupted then
						ElemsSideList:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					ElemsSideList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ElemsSideList, event )
					else
						ElemsSideList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setAlpha( 0 )
				ElemsSideListFrame2( ElemsSideList, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.Mode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_ZOMBIES" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if not IsLAN() then
			SetHeadingKickerText( "MENU_ZOMBIES" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_ChooseWeaponList( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif IsModelValueEqualTo( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if AlwaysFalse() then
			UpdateState( self, event )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_GUNSMITH_VARIANT_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	weaponList.id = "weaponList"
	variantSelector.id = "variantSelector"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.weaponList:close()
		self.variantSelector:close()
		self.cac3dTitleIntermediary0:close()
		self.itemName:close()
		self.cacElemsSideListBoxes0:close()
		self.ElemsSideList:close()
		self.cacWpnLvl0:close()
		self.LockIcon:close()
		self.WeaponBuildKitsAttachmentsPreview:close()
		self.MenuFrame:close()
		self.XCamMouseControl:close()
		self.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

