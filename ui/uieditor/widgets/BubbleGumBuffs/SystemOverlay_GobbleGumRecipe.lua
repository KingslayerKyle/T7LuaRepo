-- a056f20d3258ef2c76c8a4d0504f328f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbook_BuyDistillsListItem" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BGB_LiquefyAnimation" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CurrencyCounts" )
require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookbookDistillsBalance" )

local PostLoadFunc = function ( self, controller, menu )
	self:addElement( LUI.UITimer.new( 100, "gobble_gum_recipe_distill_tick", false, self ) )
	self:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( controller ), "scheduleIndex" ), function ( model )
		DelayGoBack( menu, controller )
	end, false )
	self.optionsVertical:makeNotFocusable()

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if controller == "VerticalButtons" then
			CoD.SwapFocusableElements( controller, self.optionsHorizontal, self.optionsVertical )
		end
		if controller == "DefaultState" then
			CoD.SwapFocusableElements( controller, self.optionsVertical, self.optionsHorizontal )
		end
	end )
end

CoD.SystemOverlay_GobbleGumRecipe = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_GobbleGumRecipe.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_GobbleGumRecipe )
	self.id = "SystemOverlay_GobbleGumRecipe"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 1280 )
	bg:setTopBottom( true, false, -5, 331 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_backgroundbg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 62.5, 342.5 )
	largeImage:setTopBottom( true, false, 23, 303 )
	largeImage:setAlpha( 0 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 64, 727 )
	text:setTopBottom( true, false, 45, 65 )
	text:setAlpha( 0.85 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 64, 222 )
	title:setTopBottom( true, false, 15, 45 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local optionsVertical = LUI.UIList.new( menu, controller, 3, 0, nil, true, false, 0, 0, false, false )
	optionsVertical:makeFocusable()
	optionsVertical:setLeftRight( true, false, 422, 1170 )
	optionsVertical:setTopBottom( true, false, 120, 257 )
	optionsVertical:setAlpha( 0 )
	optionsVertical:setWidgetType( CoD.CACGenericButton )
	optionsVertical:setVerticalCount( 4 )
	optionsVertical:setSpacing( 3 )
	optionsVertical:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			optionsVertical:setDataSource( listDatasource )
		end
	end )
	optionsVertical:linkToElementModel( optionsVertical, "disabled", true, function ( model )
		local f9_local0 = optionsVertical
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsVertical:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f10_local0
	end )
	optionsVertical:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			ProcessListAction( self, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( optionsVertical, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "P", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		OpenCodPointsStore( self, f14_arg0, f14_arg2, "menuName", f14_arg1 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
		return true
	end, false )
	self:addElement( optionsVertical )
	self.optionsVertical = optionsVertical
	
	local optionsHorizontal = LUI.UIList.new( menu, controller, 15, 0, nil, false, false, 0, 0, false, false )
	optionsHorizontal:makeFocusable()
	optionsHorizontal:setLeftRight( true, false, 237.5, 1042.5 )
	optionsHorizontal:setTopBottom( true, false, 81, 271 )
	optionsHorizontal:setWidgetType( CoD.GobbleGumCookbook_BuyDistillsListItem )
	optionsHorizontal:setHorizontalCount( 4 )
	optionsHorizontal:setSpacing( 15 )
	optionsHorizontal:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			optionsHorizontal:setDataSource( listDatasource )
		end
	end )
	optionsHorizontal:linkToElementModel( optionsHorizontal, "disabled", true, function ( model )
		local f17_local0 = optionsHorizontal
		local f17_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f17_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	optionsHorizontal:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f18_local0 = nil
		UpdateOverlayImageWithElementImage( self, element, controller )
		return f18_local0
	end )
	optionsHorizontal:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f19_local0
	end )
	optionsHorizontal:registerEventHandler( "lose_focus", function ( element, event )
		local f20_local0 = nil
		if element.loseFocus then
			f20_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f20_local0 = element.super:loseFocus( event )
		end
		return f20_local0
	end )
	menu:AddButtonCallbackFunction( optionsHorizontal, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if not IsDisabled( f21_arg0, f21_arg2 ) then
			ProcessListAction( self, f21_arg0, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f22_arg0, f22_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	menu:AddButtonCallbackFunction( optionsHorizontal, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "P", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsElementPropertyValue( f23_arg0, "showStoreButton", true ) then
			OpenCodPointsStore( self, f23_arg0, f23_arg2, "menuName", f23_arg1 )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsElementPropertyValue( f24_arg0, "showStoreButton", true ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MPUI_PURCHASE_CODPOINTS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( optionsHorizontal )
	self.optionsHorizontal = optionsHorizontal
	
	local CookingAnimation = CoD.BGB_LiquefyAnimation.new( menu, controller )
	CookingAnimation:setLeftRight( true, false, 390, 890 )
	CookingAnimation:setTopBottom( true, false, 136, 236 )
	CookingAnimation:setAlpha( 0 )
	self:addElement( CookingAnimation )
	self.CookingAnimation = CookingAnimation
	
	local BuyingDistillAnimation = CoD.BGB_LiquefyAnimation.new( menu, controller )
	BuyingDistillAnimation:setLeftRight( true, false, 390, 890 )
	BuyingDistillAnimation:setTopBottom( true, false, 136, 236 )
	BuyingDistillAnimation:setAlpha( 0 )
	self:addElement( BuyingDistillAnimation )
	self.BuyingDistillAnimation = BuyingDistillAnimation
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( menu, controller )
	StartMenuCurrencyCounts:setLeftRight( true, false, 1059.76, 1263.76 )
	StartMenuCurrencyCounts:setTopBottom( true, false, 7.78, 37.78 )
	StartMenuCurrencyCounts:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyCODPoints",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyKeys",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownAllExceptVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShownOnlyVials",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuCurrencyCounts:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( StartMenuCurrencyCounts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local GobbleGumCookbookDistillsBalance = CoD.GobbleGumCookbookDistillsBalance.new( menu, controller )
	GobbleGumCookbookDistillsBalance:setLeftRight( true, false, 959.76, 1034.76 )
	GobbleGumCookbookDistillsBalance:setTopBottom( true, false, 10.5, 35.5 )
	GobbleGumCookbookDistillsBalance.balance:setRGB( 1, 1, 1 )
	GobbleGumCookbookDistillsBalance.balance:setScale( 0.85 )
	self:addElement( GobbleGumCookbookDistillsBalance )
	self.GobbleGumCookbookDistillsBalance = GobbleGumCookbookDistillsBalance
	
	optionsVertical.navigation = {
		left = optionsHorizontal,
		up = optionsHorizontal
	}
	optionsHorizontal.navigation = {
		right = optionsVertical,
		down = optionsVertical
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )

				text:completeAnimation()
				self.text:setAlpha( 0.85 )
				self.clipFinished( text, {} )

				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )

				optionsHorizontal:completeAnimation()
				self.optionsHorizontal:setAlpha( 1 )
				self.clipFinished( optionsHorizontal, {} )

				CookingAnimation:completeAnimation()
				self.CookingAnimation:setAlpha( 0 )
				self.clipFinished( CookingAnimation, {} )

				BuyingDistillAnimation:completeAnimation()
				self.BuyingDistillAnimation:setAlpha( 0 )
				self.clipFinished( BuyingDistillAnimation, {} )
			end
		},
		BuyingDistill = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )

				optionsVertical:completeAnimation()
				self.optionsVertical:setAlpha( 0 )
				self.clipFinished( optionsVertical, {} )

				optionsHorizontal:completeAnimation()
				self.optionsHorizontal:setAlpha( 0 )
				self.clipFinished( optionsHorizontal, {} )

				CookingAnimation:completeAnimation()
				self.CookingAnimation:setAlpha( 0 )
				self.clipFinished( CookingAnimation, {} )

				BuyingDistillAnimation:completeAnimation()
				self.BuyingDistillAnimation:setAlpha( 1 )
				self.clipFinished( BuyingDistillAnimation, {} )
			end
		},
		VerticalButtons = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 1 )
				self.clipFinished( largeImage, {} )

				text:completeAnimation()
				self.text:setLeftRight( true, false, 421, 1128 )
				self.text:setTopBottom( true, false, 45, 65 )
				self.clipFinished( text, {} )

				title:completeAnimation()
				self.title:setLeftRight( true, false, 421, 621 )
				self.title:setTopBottom( true, false, 11, 41 )
				self.clipFinished( title, {} )

				optionsVertical:completeAnimation()
				self.optionsVertical:setAlpha( 1 )
				self.clipFinished( optionsVertical, {} )

				optionsHorizontal:completeAnimation()
				self.optionsHorizontal:setAlpha( 0 )
				self.clipFinished( optionsHorizontal, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BuyingDistill",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "buyingDistill" )
			end
		},
		{
			stateName = "VerticalButtons",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "verticalButtons" )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	optionsVertical.id = "optionsVertical"
	optionsHorizontal.id = "optionsHorizontal"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.optionsHorizontal:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.optionsVertical:close()
		element.optionsHorizontal:close()
		element.CookingAnimation:close()
		element.BuyingDistillAnimation:close()
		element.StartMenuCurrencyCounts:close()
		element.GobbleGumCookbookDistillsBalance:close()
		element.largeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

