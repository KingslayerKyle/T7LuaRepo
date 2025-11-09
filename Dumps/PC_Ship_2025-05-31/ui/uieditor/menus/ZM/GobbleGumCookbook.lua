require( "ui.uieditor.widgets.ZM_Cookbook.GenericMenuFrame_Cookbook" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookDistillsBalance" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookRemainingTime" )

CoD.OverlayUtility.AddSystemOverlay( "NewtonsCookbookWelcomePopup", {
	menuName = "SystemOverlay_Full",
	title = "MENU_NEWTONS_COOKBOOK_WELCOME",
	description = "MENU_NEWTONS_COOKBOOK_WELCOME_DESC",
	image = "t7_menu_zm_cookbook_overlay",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f1_arg0, f1_arg1 )
		DataSources.NewtonsCookbookWelcomePopupList = DataSourceHelpers.ListSetup( "NewtonsCookbookWelcomePopupList", function ( f2_arg0 )
			local f2_local0 = {}
			local f2_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
				return {
					models = {
						displayText = f3_arg0,
						disabled = false
					},
					properties = {
						action = f3_arg1,
						selectIndex = f3_arg2
					}
				}
			end
			
			table.insert( f2_local0, f2_local1( "MENU_GOT_IT", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
				SetSeenNewtonsCookbookFirstTimePopup( f4_arg2 )
				if CanGetFreeGobblegumCookbookUses( f4_arg2 ) then
					GoBackAndOpenSystemOverlayOnParent( f4_arg0, f4_arg2, "PurchaseDistills" )
				else
					GoBack( f4_arg4, f4_arg2 )
				end
			end, true ) )
			return f2_local0
		end, true )
		return "NewtonsCookbookWelcomePopupList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
			local f6_local0 = GoBack( f6_arg3, f6_arg2 )
		end
		
	end
} )
local f0_local0 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5 )
	if f7_arg5.buyingDistill then
		return 
	elseif not CoD.BubbleGumBuffUtility.IsDebuggingEnabled() and (not f7_arg3.sku or f7_arg3.sku == 0 or not Engine.PurchaseDWSKU( f7_arg2, f7_arg3.sku, false )) then
		GoBack( f7_arg4, f7_arg2 )
		LuaUtils.UI_ShowErrorMessageDialog( f7_arg2, "ZMUI_COOKBOOK_DISTILL_PURCHASE_FAILED", "" )
		return 
	else
		f7_arg5.buyingDistill = true
		f7_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
		f7_arg0:setState( "BuyingDistill" )
		f7_arg0.BuyingDistillAnimation:playClip( "StartLiquefying" )
		f7_arg0.optionsHorizontal.disabled = true
		f7_arg0.optionsVertical.disabled = true
		f7_arg5:updateDataSource( true )
		CoD.Menu.UpdateAllButtonPrompts( f7_arg4, f7_arg2 )
		f7_arg0.BuyingDistillAnimation:registerEventHandler( "clip_over", function ( element, event )
			if Engine.IsInventoryBusy( f7_arg2 ) or Engine.GetPurchaseDWSKUResult( f7_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
				LUI.UIElement.clipOver( element, event )
			else
				if Engine.GetPurchaseDWSKUResult( f7_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_FAILURE then
					GoBack( f7_arg4, f7_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f7_arg2, "ZMUI_COOKBOOK_DISTILL_PURCHASE_FAILED", "" )
					return 
				elseif CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
					CoD.BubbleGumBuffUtility.Debug.RefillDistill( f7_arg2, f7_arg3.distillID )
				end
				if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
					DataSources.GobbleGumDistills.getModel( f7_arg2 )
				end
				if f7_arg3.distillID == CoD.BubbleGumBuffUtility.FREE_DISTILL then
					f7_arg0:setState( "DefaultState" )
					f7_arg5.disabled = false
					f7_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
					f7_arg5.buyingDistill = nil
					f7_arg0.optionsHorizontal.disabled = nil
					f7_arg0.optionsVertical.disabled = nil
					CoD.Menu.UpdateAllButtonPrompts( f7_arg4, f7_arg2 )
					f7_arg5:updateDataSource()
				else
					GoBackAndOpenSystemOverlayOnParent( f7_arg0, f7_arg2, "PurchaseDistills" )
				end
			end
		end )
	end
end

CoD.OverlayUtility.AddSystemOverlay( "PurchaseDistills", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_GobbleGumRecipe",
	title = "ZMUI_COOKBOOK_DISTILLS_CAPS",
	description = "ZMUI_COOKBOOK_DISTILLS_DESC",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f9_arg0, f9_arg1 )
		DataSources.PurchaseDistillsItemList = DataSourceHelpers.ListSetup( "PurchaseDistillsItemList", function ( f10_arg0, f10_arg1 )
			local f10_local0 = {}
			local f10_local1 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				local f11_local0 = GoBack( f11_arg4, f11_arg2 )
			end
			
			local f10_local2 = function ( f12_arg0, f12_arg1 )
				if f12_arg1 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
					local f12_local0
					if CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f12_arg0, f12_arg1 ) <= 0 and CoD.BubbleGumBuffUtility.GetDistillCooldown( f12_arg0, f12_arg1 ) <= 0 then
						f12_local0 = false
					else
						f12_local0 = true
					end
					return f12_local0
				else
					return false
				end
			end
			
			local f10_local3 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
				f0_local0( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f10_arg1 )
			end
			
			local f10_local4 = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
				GoBackAndOpenSystemOverlayOnParent( f14_arg0, f14_arg2, "PurchaseDistillsConfirmation", f14_arg3 )
			end
			
			local f10_local5 = function ( f15_arg0 )
				local f15_local0 = {
					[CoD.BubbleGumBuffUtility.FREE_DISTILL] = {
						dvar = Dvar.loot_distill_free_quantity,
						defaultValue = 30
					},
					[CoD.BubbleGumBuffUtility.X3_DISTILL] = {
						dvar = Dvar.loot_distill_paid_x3_quantity,
						defaultValue = 30
					},
					[CoD.BubbleGumBuffUtility.X6_DISTILL] = {
						dvar = Dvar.loot_distill_paid_x6_quantity,
						defaultValue = 60
					},
					[CoD.BubbleGumBuffUtility.X9_DISTILL] = {
						dvar = Dvar.loot_distill_paid_x9_quantity,
						defaultValue = 90
					}
				}
				local f15_local1 = f15_local0[f15_arg0]
				if f15_local1 then
					return f15_local1.dvar:exists() and f15_local1.dvar:get() or f15_local1.defaultValue
				else
					return 0
				end
			end
			
			local f10_local6 = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5, f16_arg6 )
				local f16_local0 = Engine.DvarInt( nil, "loot_distill_paid_" .. f16_arg3 .. "_cpCost" )
				local f16_local1 = Engine.DvarInt( nil, "loot_distill_paid_" .. f16_arg3 .. "_vialCost" )
				f16_arg2.vialCost = f16_local1
				f16_arg2.codPointCost = f16_local0
				f16_arg2.numDistills = f10_local5( f16_arg3 )
				f16_arg2.distillID = f16_arg3
				f16_arg2.image = f16_arg5
				f16_arg2.description = "ZMUI_COOKBOOK_SPEND_COD_POINTS_OR_VIALS_FOR_DISTILLS"
				if Engine.GetZMVials( f16_arg0 ) < f16_local1 and Engine.GetCoDPoints( f16_arg0 ) < f16_local0 then
					f16_arg2.description = "ZMUI_TRADE_CODPOINTS_FOR_VIALS_DESC"
				end
				local f16_local2, f16_local3 = nil
				if f16_arg3 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
					f16_local3 = CoD.GobbleGumCookbook_FreeDistillsListItem
					f16_local2 = true
				end
				local f16_local4 = Engine.Localize( "ZMUI_COOKBOOK_FREE_HINT_TIMER", SecondsAsHourMinutesSeconds( CoD.BubbleGumBuffUtility.GetDistillCooldown( f16_arg0, f16_arg3 ) ) )
				if CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f16_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) >= CoD.BubbleGumBuffUtility.GetRecipeDistillCost() then
					f16_local4 = Engine.Localize( "ZMUI_COOKBOOK_FREE_HINT_HAVE_DISTILLS", math.floor( CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f16_arg0, CoD.BubbleGumBuffUtility.FREE_DISTILL ) / CoD.BubbleGumBuffUtility.GetRecipeDistillCost() ) )
				end
				local f16_local5 = {}
				local f16_local6 = {
					displayText = displayText,
					disabled = f10_local2( f16_arg0, f16_arg3 ),
					text = f16_arg6,
					image = f16_arg5
				}
				local f16_local7
				if f16_arg3 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
					f16_local7 = CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( f16_arg0, f16_arg3 )
					if not f16_local7 then
					
					else
						f16_local6.remainingDistills = f16_local7
						f16_local6.timeRemaining = CoD.BubbleGumBuffUtility.GetDistillCooldown( f16_arg0, f16_arg3 )
						f16_local6.distillID = f16_arg3
						f16_local6.itemCODPointCost = f16_local0
						f16_local6.itemVialCost = f16_local1
						f16_local6.hintTextAlign = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
						f16_local6.hintText = f16_local4
						f16_local5.models = f16_local6
						f16_local5.properties = {
							action = f16_arg1,
							actionParam = f16_arg2,
							selectIndex = f16_arg4,
							customWidgetOverride = f16_local3,
							disabledAllowNav = f16_local2
						}
						return f16_local5
					end
				end
				f16_local7 = 0
			end
			
			if f10_arg1.buyingDistill then
				return {}
			else
				table.insert( f10_local0, f10_local6( f10_arg0, f10_local3, {
					sku = Engine.DvarInt( nil, "loot_distill_free_sku" )
				}, CoD.BubbleGumBuffUtility.FREE_DISTILL, true, "uie_t7_zm_cookbook_distill_icon", f10_local5( CoD.BubbleGumBuffUtility.FREE_DISTILL ) ) )
				table.insert( f10_local0, f10_local6( f10_arg0, f10_local4, {}, CoD.BubbleGumBuffUtility.X3_DISTILL, false, "uie_t7_zm_cookbook_distill_icon", f10_local5( CoD.BubbleGumBuffUtility.X3_DISTILL ) ) )
				table.insert( f10_local0, f10_local6( f10_arg0, f10_local4, {}, CoD.BubbleGumBuffUtility.X6_DISTILL, false, "uie_t7_zm_cookbook_distill_icon_2x", f10_local5( CoD.BubbleGumBuffUtility.X6_DISTILL ) ) )
				table.insert( f10_local0, f10_local6( f10_arg0, f10_local4, {}, CoD.BubbleGumBuffUtility.X9_DISTILL, false, "uie_t7_zm_cookbook_distill_icon_3x", f10_local5( CoD.BubbleGumBuffUtility.X9_DISTILL ) ) )
				return f10_local0
			end
		end, true )
		return "PurchaseDistillsItemList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PurchaseDistillsConfirmation", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.SystemOverlay_GobbleGumRecipe",
	title = function ( f17_arg0, f17_arg1 )
		if Engine.GetZMVials( f17_arg0 ) < f17_arg1.vialCost and Engine.GetCoDPoints( f17_arg0 ) < f17_arg1.codPointCost then
			return Engine.Localize( "MPUI_BM_NO_CURRENCY" )
		else
			return Engine.Localize( "ZMUI_CONFIRM_TRADE_CAPS", f17_arg1.numDistills )
		end
	end,
	image = function ( f18_arg0, f18_arg1 )
		return f18_arg1.image
	end,
	description = function ( f19_arg0, f19_arg1 )
		if Engine.GetZMVials( f19_arg0 ) < f19_arg1.vialCost and Engine.GetCoDPoints( f19_arg0 ) < f19_arg1.codPointCost then
			return Engine.Localize( "ZMUI_COOKBOOK_NOT_ENOUGH_COD_POINTS_TO_TRADE_DISTILLS" )
		else
			return Engine.Localize( "ZMUI_COOKBOOK_SPEND_COD_POINTS_OR_VIALS_FOR_DISTILLS", f19_arg1.numDistills )
		end
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	state = "verticalButtons",
	listDatasource = function ( f20_arg0, f20_arg1 )
		DataSources.PurchaseDistillsConfirmationItemList = DataSourceHelpers.ListSetup( "PurchaseDistillsConfirmationItemList", function ( f21_arg0, f21_arg1 )
			local f21_local0 = {}
			local f21_local1 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5, f22_arg6, f22_arg7, f22_arg8 )
				if f22_arg5 then
					local f22_local0 = f22_arg5
				end
				local f22_local1 = f22_local0 or f22_arg6
				local f22_local2 = {}
				local f22_local3 = {}
				local f22_local4
				if f22_local1 then
					f22_local4 = Engine.Localize( f22_arg0, f22_local1 )
					if not f22_local4 then
					
					else
						f22_local3.displayText = f22_local4
						f22_local3.disabled = f22_arg3
						f22_local2.models = f22_local3
						f22_local2.properties = {
							action = f22_arg1,
							actionParam = {
								vials = f22_arg5,
								codPoints = f22_arg6,
								sku = f22_arg7,
								distillID = f22_arg8
							},
							selectIndex = f22_arg2,
							showStoreButton = f22_arg4
						}
						return f22_local2
					end
				end
				f22_local4 = f22_arg0
			end
			
			local f21_local2 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
				f0_local0( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4, f21_arg1 )
			end
			
			local f21_local3 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
				OpenCodPointsStore( f24_arg0, f24_arg1, f24_arg2, f24_arg4.menuName, f24_arg4 )
			end
			
			local f21_local4 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
				GoBack( f25_arg0, f25_arg2 )
			end
			
			if f21_arg1.buyingDistill then
				return {}
			elseif Engine.GetZMVials( f21_arg0 ) < f20_arg1.vialCost and Engine.GetCoDPoints( f21_arg0 ) < f20_arg1.codPointCost then
				table.insert( f21_local0, f21_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f21_local3, true, false, false ) )
			else
				table.insert( f21_local0, f21_local1( Engine.Localize( "ZMUI_COOKBOOK_SPEND_VIALS", f20_arg1.vialCost ), f21_local2, true, Engine.GetZMVials( f21_arg0 ) < f20_arg1.vialCost, true, f20_arg1.vialCost, f20_arg1.codPointCost, Engine.DvarInt( nil, "loot_distill_paid_" .. f20_arg1.distillID .. "_vial_sku" ), f20_arg1.distillID ) )
				table.insert( f21_local0, f21_local1( Engine.Localize( "ZMUI_PURCHASE_VIALS", f20_arg1.codPointCost ), f21_local2, false, Engine.GetCoDPoints( f21_arg0 ) < f20_arg1.codPointCost, true, f20_arg1.vialCost, f20_arg1.codPointCost, Engine.DvarInt( nil, "loot_distill_paid_" .. f20_arg1.distillID .. "_cp_sku" ), f20_arg1.distillID ) )
			end
			table.insert( f21_local0, f21_local1( "MENU_CANCEL_CAPS", f21_local4, false, false, true ) )
			return f21_local0
		end, true, nil, function ( f26_arg0, f26_arg1, f26_arg2 )
			if not f26_arg1.codPointsSubscription then
				f26_arg1.codPointsSubscription = f26_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f26_arg0 ), "CryptoKeyProgress.codPoints" ), function ( model )
					f26_arg1:updateDataSource()
				end, false )
			end
			if not f26_arg1.vialCountSubscription then
				f26_arg1.vialCountSubscription = f26_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f26_arg0 ), "MegaChewTokens.remainingTokens" ), function ( model )
					f26_arg1:updateDataSource()
				end, false )
			end
		end )
		return "PurchaseDistillsConfirmationItemList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = function ()
		return function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
			GoBackAndOpenSystemOverlayOnParent( f30_arg0, f30_arg2, "PurchaseDistills" )
		end
		
	end
} )
local PostLoadFunc = function ( self, controller, menu )
	self:addElement( LUI.UITimer.newElementTimer( 100, false, function ()
		CoD.BubbleGumBuffUtility.ScheduleTimerTick( controller )
	end ) )
end

LUI.createMenu.GobbleGumCookbook = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GobbleGumCookbook" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GobbleGumCookbook.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 1280 )
	BG:setTopBottom( true, false, 0, 720 )
	BG:setImage( RegisterImage( "uie_t7_zm_cookbook_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 1280 )
	bg2:setTopBottom( true, false, 0, 720 )
	bg2:setImage( RegisterImage( "uie_t7_zm_cookbook_bg_cookbook" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, 355, 578 )
	Backing:setTopBottom( false, false, -290.34, -160.38 )
	Backing:setAlpha( 0.8 )
	Backing:setImage( RegisterImage( "uie_t7_zm_cookbook_timeframe" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local GenericMenuFrameCookbook = CoD.GenericMenuFrame_Cookbook.new( self, controller )
	GenericMenuFrameCookbook:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrameCookbook:setTopBottom( true, false, 0, 720 )
	GenericMenuFrameCookbook.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( GenericMenuFrameCookbook )
	self.GenericMenuFrameCookbook = GenericMenuFrameCookbook
	
	local RecipeList = LUI.UIList.new( self, controller, 59, 0, nil, false, false, 0, 0, false, false )
	RecipeList:makeFocusable()
	RecipeList:setLeftRight( true, false, 144, 1162 )
	RecipeList:setTopBottom( true, false, 228, 568 )
	RecipeList:setWidgetType( CoD.GobbleGumCookbookListItem )
	RecipeList:setHorizontalCount( 3 )
	RecipeList:setSpacing( 59 )
	RecipeList:setDataSource( "GobbleGumRecipeResultList" )
	RecipeList:registerEventHandler( "gain_focus", function ( element, event )
		local f34_local0 = nil
		if element.gainFocus then
			f34_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f34_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f34_local0
	end )
	RecipeList:registerEventHandler( "lose_focus", function ( element, event )
		local f35_local0 = nil
		if element.loseFocus then
			f35_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f35_local0 = element.super:loseFocus( event )
		end
		return f35_local0
	end )
	self:AddButtonCallbackFunction( RecipeList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenGobbleGumRecipe( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( RecipeList )
	self.RecipeList = RecipeList
	
	local PickYourRecipe = LUI.UIText.new()
	PickYourRecipe:setLeftRight( true, false, 335, 994 )
	PickYourRecipe:setTopBottom( true, false, 107.66, 127.66 )
	PickYourRecipe:setRGB( 0.3, 0.2, 0.14 )
	PickYourRecipe:setAlpha( 0.9 )
	PickYourRecipe:setText( Engine.Localize( "ZMUI_COOKBOOK_CHOOSE_RECIPE" ) )
	PickYourRecipe:setTTF( "fonts/default.ttf" )
	PickYourRecipe:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PickYourRecipe:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PickYourRecipe )
	self.PickYourRecipe = PickYourRecipe
	
	local GobbleGumCookbookDistillsBalance = CoD.GobbleGumCookbookDistillsBalance.new( self, controller )
	GobbleGumCookbookDistillsBalance:setLeftRight( true, false, 1065, 1170 )
	GobbleGumCookbookDistillsBalance:setTopBottom( true, false, 96.66, 121.66 )
	self:addElement( GobbleGumCookbookDistillsBalance )
	self.GobbleGumCookbookDistillsBalance = GobbleGumCookbookDistillsBalance
	
	local GobbleGumCookbookRemainingTime = CoD.GobbleGumCookbookRemainingTime.new( self, controller )
	GobbleGumCookbookRemainingTime:setLeftRight( true, false, 1016, 1170 )
	GobbleGumCookbookRemainingTime:setTopBottom( true, false, 125.83, 150.83 )
	GobbleGumCookbookRemainingTime:setRGB( 0.3, 0.2, 0.14 )
	GobbleGumCookbookRemainingTime:setAlpha( 0.7 )
	GobbleGumCookbookRemainingTime:setScale( 0.8 )
	self:addElement( GobbleGumCookbookRemainingTime )
	self.GobbleGumCookbookRemainingTime = GobbleGumCookbookRemainingTime
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 129, 466 )
	Title:setTopBottom( true, false, 52.66, 77.66 )
	Title:setRGB( 0.3, 0.2, 0.14 )
	Title:setZRot( -1.5 )
	Title:setText( Engine.Localize( "MENU_NEWTONS_COOKBOOK_CAPS" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 2.8 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f38_local0 = nil
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		if not f38_local0 then
			f38_local0 = self:dispatchEventToChildren( event )
		end
		return f38_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f39_local0 = nil
		if not HasSeenNewtonsCookbookFirstTimePopup( controller ) then
			OpenSystemOverlay( self, self, controller, "NewtonsCookbookWelcomePopup", "" )
		elseif CanGetFreeGobblegumCookbookUses( controller ) and HasSeenNewtonsCookbookFirstTimePopup( controller ) then
			OpenSystemOverlay( self, self, controller, "PurchaseDistills", nil )
		end
		if not f39_local0 then
			f39_local0 = self:dispatchEventToChildren( event )
		end
		return f39_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		HandleGoBackFromCookbook( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "P", function ( element, menu, controller, model )
		OpenSystemOverlay( self, menu, controller, "PurchaseDistills", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "ZMUI_COOKBOOK_BUY_DISTILLS" )
		return true
	end, true )
	GenericMenuFrameCookbook:setModel( self.buttonModel, controller )
	RecipeList.id = "RecipeList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.RecipeList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrameCookbook:close()
		element.RecipeList:close()
		element.GobbleGumCookbookDistillsBalance:close()
		element.GobbleGumCookbookRemainingTime:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumCookbook.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

