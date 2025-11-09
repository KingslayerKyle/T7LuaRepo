require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackground" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationListButton_NB" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponCustomizationSelect" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponPreviewPane" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponCustomizationSelect" )
require( "ui.uieditor.widgets.CAC.Customization.AttachmentVariantSelect" )

CoD.WC_Category = {}
CoD.WC_Category.Modes = {
	SELECTING_CATEGORY = 1,
	SELECTING_ITEM = 2
}
CoD.WC_Category.ModeToOpenIn = CoD.WC_Category.Modes.SELECTING_CATEGORY
CoD.WC_Category.DefaultFrameWidget = CoD.WeaponPreviewPane
CoD.WC_Category.ACV = {}
local PreLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	local weaponRefModel = Engine.GetModel( classModel, loadoutSlotName .. ".ref" )
	local itemIndexModel = Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" )
	if itemIndexModel and weaponRefModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		local weaponRef = Engine.GetModelValue( weaponRefModel )
		local weaponPlusAttachments = Engine.GetWeaponString( controller, classNum, loadoutSlotName )
		CoD.WC_Category.ACV.attachmentTable = Engine.GetAttachmentCosmeticVariantTable( weaponPlusAttachments )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, loadoutSlotName )
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, loadoutSlotName )
		local scriptMenuResponseMessage = loadoutSlotName .. "," .. weaponRef .. "," .. weaponPlusAttachments .. "," .. weaponOptions .. "," .. attachmentInfo
		SendMenuResponse( self, "WeaponCustomization", "opened," .. scriptMenuResponseMessage, controller )
		Engine.SendClientScriptNotify( controller, "cam_customization_opened", weaponRef, CoD.gameMode:lower(), weaponPlusAttachments, scriptMenuResponseMessage )
	end
	self.disableBlur = true
end

local UpdateButtonPrompts = function ( self, event )
	local controller = event.controller
	self:removeButtonPrompt( "secondary", self )
	self:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", self )
end

local SetStartFocusItem = function ( controller, list, element )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local selectedModel, focusedWidget = nil
	if element.acv == true then
		local attachmentRef = CoD.WC_Category.ACV.selectedAttachment
		local attachmentLoadoutSlot = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, attachmentRef )
		selectedModel = Engine.GetModel( classModel, attachmentLoadoutSlot .. "cosmeticvariant" .. ".itemIndex" )
		if selectedModel then
			local variantIndex = Engine.GetModelValue( selectedModel )
			focusedWidget = list:findItem( nil, {
				variantIndex = variantIndex
			}, false, nil )
		end
	else
		local currentFilter = DataSources.WeaponOptions.getCurrentFilterItem()
		selectedModel = Engine.GetModel( classModel, loadoutSlotName .. currentFilter .. ".itemIndex" )
		if selectedModel then
			local selectedModelItemIndex = Engine.GetModelValue( selectedModel )
			focusedWidget = list:findItem( {
				weaponOptionTypeName = currentFilter,
				weaponOptionSubIndex = selectedModelItemIndex
			}, nil, false, nil )
		else
			focusedWidget = list:findItem( {
				weaponOptionTypeName = currentFilter,
				weaponOptionSubIndex = 0
			}, nil, false, nil )
		end
	end
	if focusedWidget then
		list:setActiveItem( focusedWidget )
	end
end

local UpdateSelectionMode = function ( self, event )
	local mode = event.mode
	local element = event.element
	local controller = self:getOwner()
	self.currentMode = mode
	CoD.WC_Category.ModeToOpenIn = mode
	if mode == CoD.WC_Category.Modes.SELECTING_CATEGORY then
		CoD.SwapFocusableElements( controller, self.frame, self.categoryList )
		self:setState( "DefaultState" )
	elseif mode == CoD.WC_Category.Modes.SELECTING_ITEM then
		local attachmentRef = Engine.GetModelValue( element:getModel( controller, "type" ) )
		CoD.WC_Category.ACV.selectedAttachment = attachmentRef
		DataSources.WeaponOptions.setCurrentFilterItem( attachmentRef )
		self.frame:changeFrameWidget( element.viewWidget, true )
		local list = self.frame.framedWidget.selectionList
		SetStartFocusItem( controller, list, element )
		CoD.SwapFocusableElements( controller, self.categoryList, self.frame )
		self:setState( "Editting" )
	end
end

local PostLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	CoD.WeaponOptionsTable = nil
	CoD.GetWeaponOptionsTable( controller )
	CoD.CACUtility.UpdateWeaponOptions( controller, classModel )
	CoD.CACUtility.UpdateAttachmentCosmeticVariants( controller, classModel )
	local nameModel = Engine.GetModel( classModel, loadoutSlotName .. ".name" )
	if nameModel then
		local nameModelValue = Engine.GetModelValue( nameModel )
		if nameModelValue and self.background.titleLabel then
			self.background.titleLabel:setText( Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) .. " " .. nameModelValue )
		end
	end
	self.updateMode = UpdateSelectionMode
	self:updateMode( {
		mode = CoD.WC_Category.ModeToOpenIn
	} )
	UpdateButtonPrompts( self, {
		controller = controller
	} )
	self:registerEventHandler( "update_button_prompts", UpdateButtonPrompts )
	self:registerEventHandler( "update_selection_mode", UpdateSelectionMode )
	self:playClip( "FadeIn" )
end

LUI.createMenu.WeaponCustomization = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponCustomization" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, false, -16, 1300 )
	Fade:setTopBottom( true, false, -23, 739 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.79 )
	Fade:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 310 )
	LeftPanel:setTopBottom( true, false, 85, 674 )
	LeftPanel:setRGB( 0.67, 0.67, 0.67 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local background = CoD.CACBackground.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.classAllocation:setAlpha( 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local categoryList = LUI.UIList.new( self, controller, 5, 0, nil, true, false, 0, 0, false, false )
	categoryList:makeFocusable()
	categoryList:setLeftRight( true, false, 74.5, 299.5 )
	categoryList:setTopBottom( true, false, 135.5, 550.5 )
	categoryList:setRGB( 1, 1, 1 )
	categoryList:setDataSource( "WeaponCustomCategory" )
	categoryList:setWidgetType( CoD.CustomizationListButton_NB )
	categoryList:setVerticalCount( 6 )
	categoryList:setSpacing( 5 )
	categoryList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsDisabled( element, controller ) then
			WC_SetSelectingItem( self, element, controller )
		end
		return retVal
	end )
	categoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		WC_WeaponCustomizationGainFocus( self, element, controller )
		return retVal
	end )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local frame = LUI.UIFrame.new( self, controller, 0, 0 )
	frame:setLeftRight( true, false, 65.5, 2070 )
	frame:setTopBottom( true, false, 125, 630 )
	frame:setRGB( 1, 1, 1 )
	frame:setAlpha( 0 )
	frame:changeFrameWidget( CoD.WeaponCustomizationSelect )
	self:addElement( frame )
	self.frame = frame
	
	local previewPane = CoD.WeaponPreviewPane.new( self, controller )
	previewPane:setLeftRight( true, false, 279, 1135 )
	previewPane:setTopBottom( true, false, 116, 621 )
	previewPane:setRGB( 1, 1, 1 )
	self:addElement( previewPane )
	self.previewPane = previewPane
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -12, 658 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	frame:linkToElementModel( categoryList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	previewPane:linkToElementModel( categoryList, nil, false, function ( model )
		previewPane:setModel( model, controller )
	end )
	categoryList.navigation = {
		right = frame,
		down = frame
	}
	frame.navigation = {
		left = categoryList,
		up = categoryList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				categoryListFrame2( categoryList, {} )
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				self.clipFinished( frame, {} )
				local previewPaneFrame2 = function ( previewPane, event )
					if not event.interrupted then
						previewPane:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					previewPane:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewPane, event )
					else
						previewPane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewPane:completeAnimation()
				self.previewPane:setAlpha( 0 )
				previewPaneFrame2( previewPane, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end,
			Editting = function ()
				self:setupElementClipCounter( 3 )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				categoryListFrame2( categoryList, {} )
				local frameFrame2 = function ( frame, event )
					if not event.interrupted then
						frame:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					frame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( frame, event )
					else
						frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				frameFrame2( frame, {} )
				local previewPaneFrame2 = function ( previewPane, event )
					if not event.interrupted then
						previewPane:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					previewPane:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( previewPane, event )
					else
						previewPane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewPane:completeAnimation()
				self.previewPane:setAlpha( 1 )
				previewPaneFrame2( previewPane, {} )
			end
		},
		Editting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if WC_SelectingCategory( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		elseif WC_SelectingItem( menu ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			if WC_SelectingCategory( self ) then
				GoBack( self, controller )
				ClearSavedState( self, controller )
				SendMenuResponse( self, "WeaponCustomization", "closed", controller )
				PlaySoundSetSound( self, "menu_go_back" )
				SendClientScriptNotify( controller, "cam_customization_closed", "" )
			elseif WC_SelectingItem( self ) then
				WC_SetChoosingCategory( self, element, controller )
				WC_VariantSelectionCancel( self, element, controller )
				PlaySoundSetSound( self, "menu_go_back" )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlaySoundSetSound( self, "navigate" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	categoryList.id = "categoryList"
	frame.id = "frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftPanel:close()
		self.background:close()
		self.categoryList:close()
		self.previewPane:close()
		self.ElemsSideList:close()
		self.frame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

