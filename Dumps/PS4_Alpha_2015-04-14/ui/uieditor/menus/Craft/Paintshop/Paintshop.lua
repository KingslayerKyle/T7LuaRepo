require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopWeaponListButtonNew" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelector" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )

local GetPaintshopModeValue = function ( controller )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	local modeValue = Engine.GetModelValue( paintshopModeModel )
	return modeValue
end

local SetPaintshoModeValue = function ( controller, value )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	local modeValue = Engine.SetModelValue( paintshopModeModel, value )
	return modeValue
end

local SetFocusOnLastSelectedWeapon = function ( self, controller )
	local lastIndex = 1
	if CoD.perController[controller].paintshopWeaponListIndex ~= nil then
		lastIndex = CoD.perController[controller].paintshopWeaponListIndex
	end
	local weaponWidget = self.weaponList:getItemAt( lastIndex )
	if weaponWidget then
		self.weaponList:setActiveItem( weaponWidget )
	end
end

local SetFocusOnLastSelectedWeaponCategory = function ( self, controller )
	local lastIndex = 2
	if CoD.perController[controller].paintshopWeaponCategoryIndex ~= nil then
		lastIndex = CoD.perController[controller].paintshopWeaponCategoryIndex
	end
	local weaponCategoryWidget = self.tabList.grid:getItemAt( lastIndex )
	if weaponCategoryWidget then
		self.tabList.grid:setActiveItem( weaponCategoryWidget )
	end
end

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
	self.disableBlur = true
	local controller = self.m_ownerController
	self:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE" )
	self.updateMode = function ( self, mode, element )
		SetPaintshoModeValue( controller, mode )
		if mode == Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST then
			self.tabList.m_disableNavigation = false
			SetFocusOnLastSelectedWeaponCategory( self, controller )
			CoD.SwapFocusableElements( controller, self.paintjobSelector, self.weaponList )
			SetFocusOnLastSelectedWeapon( self, controller )
			self:setState( "DefaultState" )
		elseif mode == Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS then
			self.tabList.m_disableNavigation = true
			CoD.SwapFocusableElements( controller, self.weaponList, self.paintjobSelector )
			self:setState( "ShowPaintjobs" )
		end
	end
	
	local modeValue = GetPaintshopModeValue( controller )
	self:updateMode( modeValue )
end

LUI.createMenu.Paintshop = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Paintshop" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Paintshop"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local HelpBacking00 = LUI.UIImage.new()
	HelpBacking00:setLeftRight( true, true, 0, 0 )
	HelpBacking00:setTopBottom( false, false, 292, 294 )
	HelpBacking00:setRGB( 0.01, 0.02, 0.02 )
	HelpBacking00:setAlpha( 0.7 )
	HelpBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking00 )
	self.HelpBacking00 = HelpBacking00
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 64, 696 )
	title:setTopBottom( true, false, 28, 76 )
	title:setRGB( 0.87, 0.88, 0.78 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setRGB( 1, 1, 1 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 367 )
	LeftPanel:setTopBottom( true, false, 91, 680 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 79.5, 380 )
	WeaponListBacking:setTopBottom( true, false, 174.5, 672.5 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0 )
	WeaponListBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local weaponList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 83.5, 422.5 )
	weaponList:setTopBottom( true, false, 159, 714 )
	weaponList:setRGB( 1, 1, 1 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.PaintshopWeaponListButtonNew )
	weaponList:setVerticalCount( 8 )
	weaponList:setSpacing( 5 )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		PaintshopWeaponList_GainFocus( self, element, controller )
		return retVal
	end )
	weaponList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		PaintshopWeaponList_ChooseWeapon( self, element, controller )
		return retVal
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local paintjobSelector = CoD.PaintjobSelector.new( self, controller )
	paintjobSelector:setLeftRight( true, false, 64, 487 )
	paintjobSelector:setTopBottom( true, false, 141.5, 477.5 )
	paintjobSelector:setRGB( 1, 1, 1 )
	paintjobSelector:setAlpha( 0 )
	self:addElement( paintjobSelector )
	self.paintjobSelector = paintjobSelector
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local tabList = CoD.craftTabList.new( self, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList:setRGB( 1, 1, 1 )
	tabList.grid:setDataSource( "PaintshopWeaponTabType" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		PaintshopWeaponList_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	weaponList.navigation = {
		up = paintjobSelector,
		right = paintjobSelector
	}
	paintjobSelector.navigation = {
		left = weaponList,
		down = weaponList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 79.5, 380 )
				self.WeaponListBacking:setTopBottom( true, false, 174.5, 672.5 )
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 422.5 )
				self.weaponList:setTopBottom( true, false, 159, 714 )
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 487 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 477.5 )
				self.paintjobSelector:setAlpha( 0 )
				self.clipFinished( paintjobSelector, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
			end,
			ShowPaintjobs = function ()
				self:setupElementClipCounter( 4 )
				local WeaponListBackingFrame2 = function ( WeaponListBacking, event )
					if not event.interrupted then
						WeaponListBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					WeaponListBacking:setLeftRight( true, false, 79.5, 340.5 )
					WeaponListBacking:setTopBottom( true, false, 174.5, 634.5 )
					WeaponListBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WeaponListBacking, event )
					else
						WeaponListBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 78.87, 373.87 )
				self.WeaponListBacking:setTopBottom( true, false, 171, 665 )
				self.WeaponListBacking:setAlpha( 0 )
				WeaponListBackingFrame2( WeaponListBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setLeftRight( true, false, 83.5, 316.5 )
					weaponList:setTopBottom( true, false, 159, 265 )
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 316.5 )
				self.weaponList:setTopBottom( true, false, 159, 265 )
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					local paintjobSelectorFrame3 = function ( paintjobSelector, event )
						if not event.interrupted then
							paintjobSelector:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						paintjobSelector:setLeftRight( true, false, 70, 493 )
						paintjobSelector:setTopBottom( true, false, 141.5, 527.5 )
						paintjobSelector:setRGB( 1, 1, 1 )
						paintjobSelector:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( paintjobSelector, event )
						else
							paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						paintjobSelectorFrame3( paintjobSelector, event )
						return 
					else
						paintjobSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						paintjobSelector:setLeftRight( true, false, 64, 487 )
						paintjobSelector:setTopBottom( true, false, 141.5, 527.5 )
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", paintjobSelectorFrame3 )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, -599, -176 )
				self.paintjobSelector:setTopBottom( true, false, 159, 545 )
				self.paintjobSelector:setRGB( 1, 1, 1 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				tabListFrame2( tabList, {} )
			end
		},
		ShowPaintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 487 )
				self.paintjobSelector:setTopBottom( true, false, 140.5, 560 )
				self.clipFinished( paintjobSelector, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local WeaponListBackingFrame2 = function ( WeaponListBacking, event )
					if not event.interrupted then
						WeaponListBacking:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					WeaponListBacking:setAlpha( 0.03 )
					if event.interrupted then
						self.clipFinished( WeaponListBacking, event )
					else
						WeaponListBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				WeaponListBacking:setAlpha( 0 )
				WeaponListBacking:registerEventHandler( "transition_complete_keyframe", WeaponListBackingFrame2 )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", weaponListFrame2 )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( true, false, -420, 3 )
					paintjobSelector:setTopBottom( true, false, 141.5, 561 )
					paintjobSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 487 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 561 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				tabList:setAlpha( 0 )
				tabList:registerEventHandler( "transition_complete_keyframe", tabListFrame2 )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_DISMISS_MENU" ), "M", element )
		return true
	end
	
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.Mode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.Mode"
		}
		if not element.buttonPromptAddFunctions.secondary( self, element, event ) then
			self:removeButtonPrompt( "secondary", element )
		end
		if not element.buttonPromptAddFunctions.secondary( self, element, event ) then
			self:removeButtonPrompt( "secondary", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
				GoBack( self, controller )
				PaintshopWeaponList_Back( self, element, controller )
				ClearSavedState( self, controller )
			elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
				PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
				PlaySoundSetSound( self, "list_back" )
			end
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			PaintshopWeaponList_Back( self, element, controller )
			CloseStartMenu( self, controller )
			ClearMenuSavedState( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	weaponList.id = "weaponList"
	paintjobSelector.id = "paintjobSelector"
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
	self.close = function ( self )
		self.TitleDotsWidget0:close()
		self.LeftPanel:close()
		self.weaponList:close()
		self.paintjobSelector:close()
		self.tabList:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

