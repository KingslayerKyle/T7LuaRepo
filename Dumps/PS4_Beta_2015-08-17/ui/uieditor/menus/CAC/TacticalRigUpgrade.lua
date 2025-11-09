require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeModelWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

DataSources.TacRigUpgrades = {
	prepare = function ( controller, list, filter )
		local loadoutSlot = CoD.perController[controller].weaponCategory
		local classModel = CoD.perController[controller].classModel
		list.rigs = {}
		if loadoutSlot ~= "cybercom_tacrig1" and loadoutSlot ~= "cybercom_tacrig2" then
			return 
		end
		local itemRef = CoD.CACUtility.GetItemRefEquippedInSlot( loadoutSlot, controller, classModel )
		if not CoD.UnlockablesTable then
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
		end
		if CoD.UnlockablesTable then
			for index, model in ipairs( CoD.UnlockablesTable.cybercom_tacrig ) do
				local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
				if ref and LUI.startswith( ref, itemRef ) then
					table.insert( list.rigs, model )
				end
			end
		end
	end,
	getCount = function ( list )
		return #list.rigs
	end,
	getItem = function ( controller, list, index )
		return list.rigs[index]
	end
}
local SetTitle = function ( self, controller )
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local tacRigName = CoD.CACUtility.GetItemName( loadoutSlot, controller, classModel )
	self.TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( tacRigName ) .. " Upgrades" )
end

local PostLoadFunc = function ( self, controller )
	SetTitle( self, controller )
end

LUI.createMenu.TacticalRigUpgrade = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TacticalRigUpgrade" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_LethalGrenade"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TacticalRigUpgrade.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( false, false, -647, 647 )
	TitleBacking:setTopBottom( false, false, -360, -274 )
	TitleBacking:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local TacRigUpgradeWidget = CoD.TacRigUpgradeWidget.new( self, controller )
	TacRigUpgradeWidget:setLeftRight( true, false, 0, 1280 )
	TacRigUpgradeWidget:setTopBottom( true, false, 0, 720 )
	TacRigUpgradeWidget.TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "Install for 1 Fabrication Token" ) )
	TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( "" ) )
	TacRigUpgradeWidget.UpgradeTitle0:setText( Engine.Localize( "" ) )
	self:addElement( TacRigUpgradeWidget )
	self.TacRigUpgradeWidget = TacRigUpgradeWidget
	
	local TacRigUpgradeList = LUI.UIList.new( self, controller, 40, 0, nil, false, false, 0, 0, false, true )
	TacRigUpgradeList:makeFocusable()
	TacRigUpgradeList:setLeftRight( true, false, 97.4, 217.4 )
	TacRigUpgradeList:setTopBottom( true, false, 140, 580 )
	TacRigUpgradeList:setDataSource( "TacRigUpgrades" )
	TacRigUpgradeList:setWidgetType( CoD.TacRigUpgradeModelWidget )
	TacRigUpgradeList:setVerticalCount( 3 )
	TacRigUpgradeList:setSpacing( 40 )
	TacRigUpgradeList:linkToElementModel( TacRigUpgradeList, "itemIndex", true, function ( model )
		local element = TacRigUpgradeList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TacRigUpgradeList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	TacRigUpgradeList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( TacRigUpgradeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
			PurchaseItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( TacRigUpgradeList )
	self.TacRigUpgradeList = TacRigUpgradeList
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -647, 647 )
	FooterBacking:setTopBottom( false, false, 300, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, nil, false, function ( model )
		TacRigUpgradeWidget:setModel( model, controller )
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.UpdgradeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacRigUpgradeWidget.TacRigInfoWidget.cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CAPS" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UploadStats( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK_CAPS" )
		return true
	end, false )
	TacRigUpgradeList.id = "TacRigUpgradeList"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TacRigUpgradeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.TacRigUpgradeWidget:close()
		self.TacRigUpgradeList:close()
		self.ElemsSideList:close()
		self.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TacticalRigUpgrade.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

