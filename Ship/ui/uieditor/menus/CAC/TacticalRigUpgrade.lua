-- 73915becda788695c1403667fc7900a1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.TacRigUpgradeModelWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

DataSources.TacRigUpgrades = {
	prepare = function ( f1_arg0, f1_arg1, f1_arg2 )
		local f1_local0 = CoD.perController[f1_arg0].weaponCategory
		local f1_local1 = CoD.perController[f1_arg0].classModel
		f1_arg1.rigs = {}
		if f1_local0 ~= "cybercom_tacrig1" and f1_local0 ~= "cybercom_tacrig2" then
			return 
		end
		local f1_local2 = CoD.CACUtility.GetItemRefEquippedInSlot( f1_local0, f1_arg0, f1_local1 )
		if not CoD.UnlockablesTable then
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( f1_arg0 )
		end
		if CoD.UnlockablesTable then
			for f1_local6, f1_local7 in ipairs( CoD.UnlockablesTable.cybercom_tacrig ) do
				local f1_local8 = Engine.GetModelValue( Engine.GetModel( f1_local7, "ref" ) )
				if f1_local8 and LUI.startswith( f1_local8, f1_local2 ) then
					table.insert( f1_arg1.rigs, f1_local7 )
				end
			end
		end
	end,
	getCount = function ( f2_arg0 )
		return #f2_arg0.rigs
	end,
	getItem = function ( f3_arg0, f3_arg1, f3_arg2 )
		return f3_arg1.rigs[f3_arg2]
	end
}
local f0_local0 = function ( f4_arg0, f4_arg1 )
	f4_arg0.TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( CoD.CACUtility.GetItemName( CoD.perController[f4_arg1].weaponCategory, f4_arg1, CoD.perController[f4_arg1].classModel ) ) .. " Upgrades" )
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f0_local0( f5_arg0, f5_arg1 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TacticalRigUpgrade.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
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
	
	local TacRigUpgradeWidget = CoD.TacRigUpgradeWidget.new( f6_local1, controller )
	TacRigUpgradeWidget:setLeftRight( true, false, 0, 1280 )
	TacRigUpgradeWidget:setTopBottom( true, false, 0, 720 )
	TacRigUpgradeWidget.TacRigInfoWidget.PurchaseInstructionWidget.PurchaseInstruction:setText( Engine.Localize( "Install for 1 Fabrication Token" ) )
	TacRigUpgradeWidget.UpgradeTitle:setText( Engine.Localize( "" ) )
	TacRigUpgradeWidget.UpgradeTitle0:setText( Engine.Localize( "" ) )
	self:addElement( TacRigUpgradeWidget )
	self.TacRigUpgradeWidget = TacRigUpgradeWidget
	
	local TacRigUpgradeList = LUI.UIList.new( f6_local1, controller, 40, 0, nil, false, false, 0, 0, false, true )
	TacRigUpgradeList:makeFocusable()
	TacRigUpgradeList:setLeftRight( true, false, 97.4, 217.4 )
	TacRigUpgradeList:setTopBottom( true, false, 140, 580 )
	TacRigUpgradeList:setDataSource( "TacRigUpgrades" )
	TacRigUpgradeList:setWidgetType( CoD.TacRigUpgradeModelWidget )
	TacRigUpgradeList:setVerticalCount( 3 )
	TacRigUpgradeList:setSpacing( 40 )
	TacRigUpgradeList:linkToElementModel( TacRigUpgradeList, "itemIndex", true, function ( model )
		local f7_local0 = TacRigUpgradeList
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	TacRigUpgradeList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	TacRigUpgradeList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f6_local1:AddButtonCallbackFunction( TacRigUpgradeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsCACItemLocked( f10_arg1, f10_arg0, f10_arg2 ) and not IsCACItemPurchased( f10_arg0, f10_arg2 ) and IsCACHaveTokens( f10_arg2 ) then
			PurchaseItem( self, f10_arg0, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsCACItemPurchased( f11_arg0, f11_arg2 ) and IsCACHaveTokens( f11_arg2 ) then
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
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( f6_local1, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f6_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		SizeToSafeArea( element, controller )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, nil, false, function ( model )
		TacRigUpgradeWidget:setModel( model, controller )
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			TacRigUpgradeWidget.TacRigInfoWidget.UpgradeDesc:setText( Engine.Localize( description ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			TacRigUpgradeWidget.TacRigInfoWidget.UpdgradeImage:setImage( RegisterImage( image ) )
		end
	end )
	TacRigUpgradeWidget:linkToElementModel( TacRigUpgradeList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			TacRigUpgradeWidget.TacRigInfoWidget.cacTacticalRigDescription0.UpgradeName0:setText( Engine.Localize( name ) )
		end
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CAPS" )
		return true
	end, false )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		GoBack( self, f19_arg2 )
		UploadStats( self, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK_CAPS" )
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
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.TacRigUpgradeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.TacRigUpgradeWidget:close()
		element.TacRigUpgradeList:close()
		element.ElemsSideList:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TacticalRigUpgrade.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

