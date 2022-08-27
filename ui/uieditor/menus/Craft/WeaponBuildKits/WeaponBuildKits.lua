-- 1a45733e900fd57e03949c11de492597
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsWeaponList" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantSelector" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsLockIcon" )
require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentsPreview" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local f0_local0 = function ( f1_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "Gunsmith.Mode" ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "Gunsmith.Mode" ), f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 1
	if CoD.perController[f3_arg1].gunsmithWeaponListIndex ~= nil then
		f3_local0 = CoD.perController[f3_arg1].gunsmithWeaponListIndex
	end
	local f3_local1 = f3_arg0.weaponList:getItemAtPosition( f3_local0, 1, false )
	if f3_local1 then
		f3_arg0.weaponList:setActiveItem( f3_local1 )
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.disableDarkenElement = true
	f4_arg0.disableBlur = true
	CoD.SetCustomization( f4_arg1, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	f4_arg0.updateMode = function ( f5_arg0, f5_arg1, f5_arg2 )
		f0_local1( f4_arg1, f5_arg1 )
		if f5_arg1 == Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST then
			CoD.SwapFocusableElements( f4_arg1, f5_arg0.variantSelector, f5_arg0.weaponList )
			f0_local2( f5_arg0, f4_arg1 )
			f5_arg0:setState( "DefaultState" )
		elseif f5_arg1 == Enum.GunsmithMode.GUNSMITHMODE_VARIANTS then
			CoD.SwapFocusableElements( f4_arg1, f5_arg0.weaponList, f5_arg0.variantSelector )
			f5_arg0:setState( "ShowVariants" )
		end
	end
	
	f4_arg0:updateMode( f0_local0( f4_arg1 ) )
end

local PreLoadFunc = function ( self, controller )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.UpdateDataSource" )
end

LUI.createMenu.WeaponBuildKits = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponBuildKits" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 85, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 123, 82 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local weaponList = LUI.UIList.new( f7_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 76.5, 356.5 )
	weaponList:setTopBottom( true, false, 137, 634 )
	weaponList:setWidgetType( CoD.WeaponBuildKitsWeaponList )
	weaponList:setVerticalCount( 7 )
	weaponList:setSpacing( 7 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local f8_local0 = weaponList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( f7_local1, element, controller )
			FocusWeaponBuildKit( self, element, controller )
		else
			FocusWeaponBuildKit( self, element, controller )
		end
		return f9_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	f7_local1:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) then
			SelectWeaponBuildKit( self, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	weaponList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		f7_local1:updateElementState( weaponList, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local variantSelector = CoD.GunsmithVariantSelector.new( f7_local1, controller )
	variantSelector:setLeftRight( true, false, -314, 3 )
	variantSelector:setTopBottom( true, false, 129, 655 )
	variantSelector:setAlpha( 0 )
	self:addElement( variantSelector )
	self.variantSelector = variantSelector
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( f7_local1, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setAlpha( 0 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local itemName = CoD.InfoPaneItemName.new( f7_local1, controller )
	itemName:setLeftRight( true, false, 388, 769 )
	itemName:setTopBottom( true, false, 137, 171 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
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
	self:addElement( itemName )
	self.itemName = itemName
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( f7_local1, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setAlpha( 0 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( f7_local1, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -11, 659 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local cacWpnLvl0 = CoD.cac_WpnLvl.new( f7_local1, controller )
	cacWpnLvl0:setLeftRight( true, false, 801, 1216 )
	cacWpnLvl0:setTopBottom( false, true, -126, -86 )
	cacWpnLvl0.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	cacWpnLvl0.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	self:addElement( cacWpnLvl0 )
	self.cacWpnLvl0 = cacWpnLvl0
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, -252, 122 )
	highlightedDescription:setTopBottom( false, false, -177, -155 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local LockIcon = CoD.WeaponBuildKitsLockIcon.new( f7_local1, controller )
	LockIcon:setLeftRight( true, false, 732, 828 )
	LockIcon:setTopBottom( true, false, 14, 684 )
	LockIcon:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	LockIcon:linkToElementModel( LockIcon, "itemIndex", true, function ( model )
		f7_local1:updateElementState( LockIcon, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local WeaponBuildKitsAttachmentsPreview = CoD.WeaponBuildKitsAttachmentsPreview.new( f7_local1, controller )
	WeaponBuildKitsAttachmentsPreview:setLeftRight( true, false, 380.5, 785.5 )
	WeaponBuildKitsAttachmentsPreview:setTopBottom( false, true, -179, -86 )
	WeaponBuildKitsAttachmentsPreview:linkToElementModel( self, nil, false, function ( model )
		WeaponBuildKitsAttachmentsPreview:setModel( model, controller )
	end )
	self:addElement( WeaponBuildKitsAttachmentsPreview )
	self.WeaponBuildKitsAttachmentsPreview = WeaponBuildKitsAttachmentsPreview
	
	local highlightedDescription0 = LUI.UIText.new()
	highlightedDescription0:setLeftRight( false, false, -563.5, -189.5 )
	highlightedDescription0:setTopBottom( false, false, -271.5, -241.5 )
	highlightedDescription0:setText( GetLocalizedStringForCurrentWeaponCategory( controller, "Weapon Category" ) )
	highlightedDescription0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription0:setLineSpacing( 0.5 )
	highlightedDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription0 )
	self.highlightedDescription0 = highlightedDescription0
	
	local MenuFrame = CoD.GenericMenuFrame.new( f7_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_WEAPON_BUILD_KITS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f7_local1, controller )
	XCamMouseControl:setLeftRight( false, true, -829.5, -152 )
	XCamMouseControl:setTopBottom( true, true, 231, -179 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	itemName:linkToElementModel( weaponList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemName:linkToElementModel( variantSelector.variantList, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( variantNameBig ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, nil, false, function ( model )
		cacWpnLvl0:setModel( model, controller )
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			cacWpnLvl0.currentLevelBacking:setText( Engine.Localize( GetCurrentWeaponLevel( controller, itemIndex ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			cacWpnLvl0.currentLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, itemIndex ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			cacWpnLvl0.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( itemIndex, 1 ), CoD.GetVectorComponentFromString( itemIndex, 2 ), CoD.GetVectorComponentFromString( itemIndex, 3 ), CoD.GetVectorComponentFromString( itemIndex, 4 ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			cacWpnLvl0.cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, GetCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( itemIndex, 1 ), CoD.GetVectorComponentFromString( itemIndex, 2 ), CoD.GetVectorComponentFromString( itemIndex, 3 ), CoD.GetVectorComponentFromString( itemIndex, 4 ) ) )
		end
	end )
	cacWpnLvl0:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			cacWpnLvl0.nextLevel:setText( Engine.Localize( GetNextWeaponLevel( controller, itemIndex ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( weaponList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, itemIndex ) ) )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				TabBacking:completeAnimation()
				self.TabBacking:setAlpha( 1 )
				self.clipFinished( TabBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setAlpha( 0 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 387.5, 768.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName:setAlpha( 1 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				CategoryListLine0:completeAnimation()
				self.CategoryListLine0:setAlpha( 1 )
				self.clipFinished( CategoryListLine0, {} )
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
				self.cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
				self.cacElemsSideListBoxes0:setAlpha( 0 )
				self.clipFinished( cacElemsSideListBoxes0, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 4.13, 72 )
				self.ElemsSideList:setTopBottom( true, false, -11, 659 )
				self.ElemsSideList:setAlpha( 1 )
				self.clipFinished( ElemsSideList, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 6 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, false, 85, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 85, 667 )
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
					variantSelector:setLeftRight( true, false, 72, 389 )
					variantSelector:setTopBottom( true, false, 129, 655 )
					variantSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, -314, 3 )
				self.variantSelector:setTopBottom( true, false, 129, 655 )
				self.variantSelector:setAlpha( 0 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 449, 830 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 388, 769 )
				self.itemName:setTopBottom( true, false, 137, 171 )
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
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 72, 309 )
				self.variantSelector:setTopBottom( true, false, 129, 655 )
				self.variantSelector:setAlpha( 1 )
				self.clipFinished( variantSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449.5, 830.5 )
				self.itemName:setTopBottom( true, false, 137, 171 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				cacElemsSideListBoxes0:completeAnimation()
				self.cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
				self.cacElemsSideListBoxes0:setTopBottom( true, false, -11, 659 )
				self.cacElemsSideListBoxes0:setAlpha( 1 )
				self.clipFinished( cacElemsSideListBoxes0, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 4.13, 72 )
				self.ElemsSideList:setTopBottom( true, false, -11, 659 )
				self.ElemsSideList:setAlpha( 0 )
				self.clipFinished( ElemsSideList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 368 )
					LeftPanel:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
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
					variantSelector:setLeftRight( true, false, -312.87, 4.13 )
					variantSelector:setTopBottom( true, false, 129, 620 )
					variantSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( variantSelector, event )
					else
						variantSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				variantSelector:completeAnimation()
				self.variantSelector:setLeftRight( true, false, 72, 389 )
				self.variantSelector:setTopBottom( true, false, 127, 622 )
				self.variantSelector:setAlpha( 1 )
				variantSelectorFrame2( variantSelector, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 250, true, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 388, 769 )
					itemName:setTopBottom( true, false, 137, 171 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 442, 823 )
				self.itemName:setTopBottom( true, false, 137, 171 )
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
		local f51_local0 = self
		local f51_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.Mode"
		}
		CoD.Menu.UpdateButtonShownState( f51_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f7_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f52_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f7_local1, true )
		ShowHeaderKickerAndIcon( f7_local1 )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "cac3dTitleIntermediary0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerText( "MENU_ZOMBIES" )
		if not f52_local0 then
			f52_local0 = element:dispatchEventToChildren( event )
		end
		return f52_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f53_local0 = nil
		if not IsLAN() then
			SetHeadingKickerText( "MENU_ZOMBIES" )
		end
		if not f53_local0 then
			f53_local0 = element:dispatchEventToChildren( event )
		end
		return f53_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		if IsModelValueEqualTo( f54_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			SendClientScriptMenuChangeNotify( f54_arg2, f54_arg1, false )
			GoBack( self, f54_arg2 )
			ClearSavedState( self, f54_arg2 )
			return true
		elseif IsModelValueEqualTo( f54_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_ChooseWeaponList( self, f54_arg0, f54_arg2 )
			return true
		else
			
		end
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		if IsModelValueEqualTo( f55_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif IsModelValueEqualTo( f55_arg2, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		return true
	end, function ( f57_arg0, f57_arg1, f57_arg2 )
		CoD.Menu.SetButtonLabel( f57_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		if CACShowRotatePrompt( self, f58_arg0, f58_arg2 ) then
			return true
		else
			
		end
	end, function ( f59_arg0, f59_arg1, f59_arg2 )
		if CACShowRotatePrompt( self, f59_arg0, f59_arg2 ) then
			CoD.Menu.SetButtonLabel( f59_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
		if AlwaysFalse() then
			UpdateState( self, event )
			return true
		else
			
		end
	end, function ( f61_arg0, f61_arg1, f61_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f61_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_GUNSMITH_VARIANT_OPTIONS" )
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
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.weaponList:close()
		element.variantSelector:close()
		element.cac3dTitleIntermediary0:close()
		element.itemName:close()
		element.cacElemsSideListBoxes0:close()
		element.ElemsSideList:close()
		element.cacWpnLvl0:close()
		element.LockIcon:close()
		element.WeaponBuildKitsAttachmentsPreview:close()
		element.MenuFrame:close()
		element.XCamMouseControl:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponBuildKits.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

