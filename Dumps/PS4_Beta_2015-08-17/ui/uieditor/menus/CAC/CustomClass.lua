require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PreLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	self:setModel( classModel )
	self.disableBlur = true
	CoD.CACUtility.ValidateWeaponVariantForClass( controller, classModel )
end

local UpdateScriptModelPreview = function ( controller, classNum, classModel, loadoutSlot )
	local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, loadoutSlot )
	local weaponName, baseWeaponLoadoutSlot = nil
	if equipped then
		baseWeaponLoadoutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlot )
	elseif LUI.startswith( loadoutSlot, "primaryattachment" ) then
		baseWeaponLoadoutSlot = "primary"
	elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
		baseWeaponLoadoutSlot = "secondary"
	end
	if baseWeaponLoadoutSlot and baseWeaponLoadoutSlot ~= "" then
		if LUI.startswith( baseWeaponLoadoutSlot, "specialty" ) then
			weaponName = CoD.CACUtility.GetPerkXModel( Engine.GetClassItem( controller, classNum, baseWeaponLoadoutSlot ) )
		elseif LUI.startswith( baseWeaponLoadoutSlot, "bonuscard" ) then
			weaponName = CoD.CACUtility.GetBonuscardXModel( Engine.GetClassItem( controller, classNum, baseWeaponLoadoutSlot ) )
		elseif baseWeaponLoadoutSlot == "cybercom" then
			weaponName = CoD.CACUtility.GetPerkXModel( Engine.GetClassItem( controller, classNum, loadoutSlot ) )
		else
			weaponName = Engine.GetWeaponString( controller, classNum, baseWeaponLoadoutSlot )
		end
	end
	if weaponName and weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", baseWeaponLoadoutSlot, weaponName, camera, weaponOptions, attachmentInfo )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	end
end

local IsNavigationColumn = function ( controller, self, widget, event )
	if event then
		local possibleSlot = event.possibleSlot
		local prevColumnNav = self.columnNav
		if self.weaponSlotTable[possibleSlot] then
			if type( self.columnNav ) == "table" then
				prevColumnNav = self.columnNav[1]
			end
			local columnNav = self.weaponSlotTable[possibleSlot].columnNav
			if type( columnNav ) == "table" then
				for index, columnNavValue in ipairs( columnNav ) do
					if prevColumnNav == columnNavValue then
						return true
					end
				end
			elseif prevColumnNav == columnNav then
				return true
			end
		end
	end
	return false
end

local SetupPC = function ( self, controller )
	self:registerEventHandler( "mouse_focus", function ( self, event )
		local widget = event.element
		while widget and not widget.slotName do
			widget = widget:getParent()
		end
		if widget and widget.slotName then
			self.navigationHistory = {}
			self:navigateTo( widget.slotName, "jump" )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local customClassMenuModel = self:getModel( controller, "CustomClassMenu" )
	local currentLoadoutNameModel, currentItemNameModel = nil
	if customClassMenuModel then
		currentLoadoutNameModel = Engine.GetModel( customClassMenuModel, "currentLoadoutName" )
		currentItemNameModel = Engine.GetModel( customClassMenuModel, "currentItemName" )
	end
	self.CACBackground0:setPriority( 100 )
	self.weaponSlotTable = {}
	local addSlotToSlotTable = function ( slotName, pathFromLayout, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		local widget = LUI.getTableFromPath( "chooseClassWidget." .. pathFromLayout, self )
		widget.slotName = slotName
		self.weaponSlotTable[slotName] = {
			widget = widget,
			nav = {
				up = upNavSlot,
				down = downNavSlot,
				left = leftNavSlot,
				right = rightNavSlot
			},
			state = CoD.isCampaign and "Campaign" or "DefaultState",
			columnNav = column
		}
	end
	
	local addChildSlotToSlotTable = function ( slotName, parentWidgetName, widgetName, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		local pathFromLayout = parentWidgetName .. "." .. widgetName
		addSlotToSlotTable( slotName, pathFromLayout, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		local parentWidget = LUI.getTableFromPath( "chooseClassWidget." .. parentWidgetName, self )
		self.weaponSlotTable[slotName].parentWidget = parentWidget
	end
	
	local addWildcardSlotToSlotTable = function ( slotName, parentWidgetName, widgetName, widgetState, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot, leftNavClip, rightNavClip )
		local column = nil
		addChildSlotToSlotTable( slotName, parentWidgetName, widgetName, column, leftNavSlot, rightNavSlot, upNavSlot, downNavSlot )
		self.weaponSlotTable[slotName].state = "Wildcards"
		self.weaponSlotTable[slotName].widgetState = widgetState
		self.weaponSlotTable[slotName].clipNav = {
			left = leftNavClip,
			right = rightNavClip
		}
		self.weaponSlotTable[slotName].setFocusToChild = "bonuscard1"
	end
	
	local isCPorMP = function ( cpNavSlot, mpNavSlot )
		if CoD.isCampaign == true then
			return cpNavSlot
		else
			return mpNavSlot
		end
	end
	
	local leftNavSlot, rightNavSlot, upNavSlot, downNavSlot, leftNavClip, rightNavClip = nil
	addSlotToSlotTable( "primary", "PrimaryWeapon", {
		1,
		2
	}, leftNavSlot, "primaryattachment1", upNavSlot, "secondary" )
	addSlotToSlotTable( "primaryattachment1", "PrimaryWeaponAttachment.optic", 3, "primary", "primaryattachment2", upNavSlot, "primaryattachment4" )
	addSlotToSlotTable( "primaryattachment2", "PrimaryWeaponAttachment.attachment1", 4, "primaryattachment1", "primaryattachment3", upNavSlot, {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment2"
		}
	} )
	addSlotToSlotTable( "primaryattachment3", "PrimaryWeaponAttachment.attachment2", 5, "primaryattachment2", rightNavSlot, upNavSlot, {
		{
			slot = "primaryattachment6",
			condition = IsCACFifthPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment3"
		}
	} )
	addSlotToSlotTable( "primaryattachment4", "PrimaryWeaponAttachment.attachment3", 3, "primary", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		}
	}, "primaryattachment1", "secondaryattachment1" )
	addSlotToSlotTable( "primaryattachment5", "PrimaryWeaponAttachment.attachment4", 4, "primaryattachment4", {
		{
			slot = "primaryattachment6",
			condition = IsCACFifthPrimaryAttachmentAvailable
		}
	}, {
		{
			slot = "primaryattachment2",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "bonuscard1"
		}
	}, "secondaryattachment2" )
	addSlotToSlotTable( "primaryattachment6", "PrimaryWeaponAttachment.attachment5", 5, "primaryattachment5", rightNavSlot, {
		{
			slot = "primaryattachment3",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "bonuscard1"
		}
	}, "secondaryattachment3" )
	addSlotToSlotTable( "secondary", "SecondaryWeapon", {
		1,
		2
	}, leftNavSlot, "secondaryattachment1", "primary", "primarygadget" )
	addSlotToSlotTable( "secondaryattachment1", "SecondaryWeaponAttachment.optic", 3, "secondary", "secondaryattachment2", "primaryattachment4", isCPorMP( "cybercom_tacrig1", "specialty1" ) )
	addSlotToSlotTable( "secondaryattachment2", "SecondaryWeaponAttachment.attachment1", 4, "secondaryattachment1", "secondaryattachment3", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment2"
		}
	}, isCPorMP( "cybercom_tacrig1", "specialty2" ) )
	addSlotToSlotTable( "secondaryattachment3", "SecondaryWeaponAttachment.attachment2", 5, "secondaryattachment2", rightNavSlot, {
		{
			slot = "primaryattachment6",
			condition = IsCACFifthPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment3"
		}
	}, isCPorMP( "cybercom_tacrig1", "specialty3" ) )
	addSlotToSlotTable( "primarygadget", "LethalEquipment.Equipment1", 1, leftNavSlot, "secondarygadget", "secondary", "primarygadgetattachment1" )
	addSlotToSlotTable( "primarygadgetattachment1", "LethalEquipment.Equipment2", 1, leftNavSlot, "secondarygadgetattachment1", "primarygadget", "bonuscard1" )
	addSlotToSlotTable( "secondarygadget", "TacticalEquipment.Equipment1", 2, "primarygadget", isCPorMP( "cybercom_tacrig1", "specialty1" ), "secondary", "secondarygadgetattachment1" )
	addSlotToSlotTable( "secondarygadgetattachment1", "TacticalEquipment.Equipment2", 2, "primarygadgetattachment1", isCPorMP( "cybercom_tacrig2", "specialty4" ), "secondarygadget", "bonuscard1" )
	addSlotToSlotTable( "specialty1", "SpecialtyPerks.perk1.perk", 3, "secondarygadget", "specialty2", "secondaryattachment1", "specialty4" )
	addSlotToSlotTable( "specialty2", "SpecialtyPerks.perk2.perk", 4, "specialty1", "specialty3", "secondaryattachment2", "specialty5" )
	addSlotToSlotTable( "specialty3", "SpecialtyPerks.perk3.perk", 5, "specialty2", rightNavSlot, "secondaryattachment3", "specialty6" )
	addSlotToSlotTable( "specialty4", "SpecialtyPerks.perk1.perkPlus", 3, "secondarygadgetattachment1", "specialty5", "specialty1", "bonuscard1" )
	addSlotToSlotTable( "specialty5", "SpecialtyPerks.perk2.perkPlus", 4, "specialty4", "specialty6", "specialty2", "bonuscard1" )
	addSlotToSlotTable( "specialty6", "SpecialtyPerks.perk3.perkPlus", 5, "specialty5", rightNavSlot, "specialty3", "bonuscard1" )
	addSlotToSlotTable( "cybercom_tacrig1", "TacticalRig.TacRig1", 4, "secondarygadget", rightNavSlot, "secondaryattachment1", "cybercom_tacrig2" )
	addSlotToSlotTable( "cybercom_tacrig2", "TacticalRig.TacRig2", 5, "secondarygadget", rightNavSlot, "cybercom_tacrig1", "bonuscard1" )
	local downNavigationForWildcard = {
		{
			slot = "primary",
			condition = IsNavigationColumn
		},
		{
			slot = "primary",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment2",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment3",
			condition = IsNavigationColumn
		},
		{
			slot = "primaryattachment1"
		}
	}
	local upNavigationForWildcard = isCPorMP( {
		{
			slot = "cybercom_tacrig2",
			condition = IsNavigationColumn
		},
		{
			slot = "primarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "secondarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "cybercom_tacrig2"
		}
	}, {
		{
			slot = "primarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "secondarygadgetattachment1",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty4",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty5",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty6",
			condition = IsNavigationColumn
		},
		{
			slot = "specialty4"
		}
	} )
	addWildcardSlotToSlotTable( "bonuscard3", "Wildcards", "wildcard3", "Card1to3", leftNavSlot, "bonuscard1", upNavigationForWildcard, downNavSlot, leftNavClip, "ToCard1" )
	addWildcardSlotToSlotTable( "bonuscard1", "Wildcards", "wildcard1", "ToCard1", "bonuscard3", "bonuscard2", upNavigationForWildcard, downNavSlot, "Card1to3", "Card1to2" )
	addWildcardSlotToSlotTable( "bonuscard2", "Wildcards", "wildcard2", "Card1to2", "bonuscard1", rightNavSlot, upNavigationForWildcard, downNavSlot, "ToCard1", rightNavClip )
	self.inverseNavigation = {
		left = "right",
		right = "left",
		up = "down",
		down = "up"
	}
	self.navigationHistory = {}
	self.navigateTo = function ( self, newSlot, direction )
		local oldWidgetData, newWidgetData = nil
		if self.currentActiveSlot then
			newWidgetData = self.weaponSlotTable[newSlot]
			oldWidgetData = self.weaponSlotTable[self.currentActiveSlot]
			if oldWidgetData and oldWidgetData.widget then
				oldWidgetData.widget:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
				oldWidgetData.widget:setPriority( 0 )
				local parentWidget = oldWidgetData.widget:getParent()
				while parentWidget ~= self do
					parentWidget:setPriority( 0 )
					parentWidget = parentWidget:getParent()
				end
				if oldWidgetData.parentWidget then
					if not newWidgetData.parentWidget or oldWidgetData.parentWidget ~= newWidgetData.parentWidget then
						oldWidgetData.parentWidget:setState( "DefaultState" )
					end
					if oldWidgetData.clipNav and oldWidgetData.clipNav[direction] then
						oldWidgetData.parentWidget:setState( oldWidgetData.clipNav[direction] )
					end
					if oldWidgetData.parentWidget.id == "Wildcards" then
						oldWidgetData.parentWidget:setPriority( 0 )
						self.feFooterContainer:setPriority( 1 )
					end
				end
			end
		end
		self.currentActiveSlot = newSlot
		CoD.CACUtility.CustomClass_LastSelection = newSlot
		CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = newSlot
		newWidgetData = self.weaponSlotTable[self.currentActiveSlot]
		if newWidgetData and newWidgetData.widget then
			newWidgetData.widget:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			newWidgetData.widget:setPriority( 100 )
			local parentWidget = newWidgetData.widget:getParent()
			if parentWidget.id == "Wildcards" then
				self.feFooterContainer:setPriority( 0 )
				while parentWidget ~= self do
					parentWidget:setPriority( 100 )
					parentWidget = parentWidget:getParent()
				end
			end
			while parentWidget ~= self.chooseClassWidget do
				parentWidget:setPriority( 100 )
				parentWidget = parentWidget:getParent()
			end
			self:playSound( "navigate" )
			self.chooseClassWidget:setState( newWidgetData.state )
			if direction ~= "jump" then
				if oldWidgetData and newWidgetData.parentWidget ~= oldWidgetData.parentWidget and newWidgetData.widgetState then
					newWidgetData.parentWidget:setState( newWidgetData.widgetState )
				end
				if not oldWidgetData and newWidgetData.widgetState then
					newWidgetData.parentWidget:setState( newWidgetData.widgetState )
				end
			end
			self.previewWidget:setModel( newWidgetData.widget:getModel() )
			UpdateScriptModelPreview( controller, classNum, classModel, newSlot )
		end
		if newWidgetData.columnNav then
			self.columnNav = newWidgetData.columnNav
		end
		SetHintText( self, newWidgetData.widget, controller )
	end
	
	self.performNav = function ( self, direction )
		local slotTable = self.weaponSlotTable[self.currentActiveSlot]
		local currentWidget = slotTable.widget
		local navHistorySize = #self.navigationHistory
		if navHistorySize > 0 then
			local lastHistoryItem = self.navigationHistory[navHistorySize]
			if lastHistoryItem.direction == direction and (not lastHistoryItem.conditionFn or lastHistoryItem.conditionFn( controller, self, currentWidget )) then
				self:navigateTo( lastHistoryItem.slot, direction )
				table.remove( self.navigationHistory, navHistorySize )
				return 
			end
		end
		local itemTable = slotTable.nav
		if itemTable then
			local possibleSlot = itemTable[direction]
			if possibleSlot then
				local widget, conditionFn = nil
				if type( possibleSlot ) == "table" then
					for index, additionalPossibleSlot in ipairs( possibleSlot ) do
						if additionalPossibleSlot.slot then
							local possibleWidget = self.weaponSlotTable[additionalPossibleSlot.slot].widget
							if possibleWidget and (not additionalPossibleSlot.condition or additionalPossibleSlot.condition( controller, self, possibleWidget, {
								possibleSlot = additionalPossibleSlot.slot
							} )) then
								widget = possibleWidget
								possibleSlot = additionalPossibleSlot.slot
								conditionFn = additionalPossibleSlot.condition
							end
						end
					end
				elseif self.weaponSlotTable[possibleSlot] then
					widget = self.weaponSlotTable[possibleSlot].widget
				end
				if widget then
					if #self.navigationHistory >= 10 then
						table.remove( self.navigationHistory, 1 )
					end
					local previousSlot = self.currentActiveSlot
					local previousSlotWidget = self.weaponSlotTable[previousSlot]
					if previousSlotWidget.setFocusToChild then
						self.navigationHistory = {}
						table.insert( self.navigationHistory, {
							direction = self.inverseNavigation[direction],
							slot = previousSlotWidget.setFocusToChild,
							conditionFn = conditionFn
						} )
					else
						table.insert( self.navigationHistory, {
							direction = self.inverseNavigation[direction],
							slot = previousSlot,
							conditionFn = conditionFn
						} )
					end
					self:navigateTo( possibleSlot, direction )
					return 
				end
			end
		end
	end
	
	self.handleGamepadButtonModelCallback = function ( menu, self, controller, luiButton, traversingUpFromElement )
		local button = LUI.UIElement.GetCorrespondingGamepadButtonString( luiButton )
		if button == "left" or button == "right" or button == "up" or button == "down" then
			menu:performNav( button )
			return true
		else
			return false
		end
	end
	
	if CoD.isPC then
		SetupPC( self, controller )
	end
	self:dispatchEventToChildren( {
		name = "lose_focus",
		controller = controller
	} )
	if CoD.CACUtility.CustomClass_LastClassNum ~= classNum then
		if not CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] then
			CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1] = "primary"
		end
		CoD.CACUtility.CustomClass_LastSelection = CoD.CACUtility.CustomClass_PerClassLastSelection[classNum + 1]
	end
	CoD.CACUtility.CustomClass_LastClassNum = classNum
	self:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
end

LUI.createMenu.CustomClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, -16, 20 )
	Fade:setTopBottom( true, true, -23, 19 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local BlackImage = LUI.UIImage.new()
	BlackImage:setLeftRight( true, false, 0, 1280 )
	BlackImage:setTopBottom( true, false, 80, 729 )
	BlackImage:setRGB( 0.09, 0.18, 0.19 )
	BlackImage:setAlpha( 0 )
	self:addElement( BlackImage )
	self.BlackImage = BlackImage
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 77, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( true, false, -4, 496 )
	chooseClassWidget:setTopBottom( true, false, 80, 663 )
	chooseClassWidget:linkToElementModel( self, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local previewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	previewWidget:setLeftRight( false, true, -850, 0 )
	previewWidget:setTopBottom( false, true, -596, 0 )
	self:addElement( previewWidget )
	self.previewWidget = previewWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 417 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListCustomClass0:setAlpha( 0 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
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
	
	local CACBackground0 = CoD.CACBackgroundNew.new( self, controller )
	CACBackground0:setLeftRight( true, true, 0, 0 )
	CACBackground0:setTopBottom( true, true, 0, 0 )
	CACBackground0:linkToElementModel( self, nil, false, function ( model )
		CACBackground0:setModel( model, controller )
	end )
	CACBackground0:linkToElementModel( self, "customClassName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CACBackground0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	CACBackground0:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( CACBackground0 )
	self.CACBackground0 = CACBackground0
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "CustomClass",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Fade:completeAnimation()
				self.Fade:setAlpha( 0 )
				self.clipFinished( Fade, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 720 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, -3, 497 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.clipFinished( chooseClassWidget, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setAlpha( 1 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeFrame2 = function ( Fade, event )
					local FadeFrame3 = function ( Fade, event )
						if not event.interrupted then
							Fade:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						end
						Fade:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fade, event )
						else
							Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeFrame3( Fade, event )
						return 
					else
						Fade:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Fade:registerEventHandler( "transition_complete_keyframe", FadeFrame3 )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 4 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 0 )
				FadeFrame2( Fade, {} )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 378 )
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
				local previewWidgetFrame2 = function ( previewWidget, event )
					if not event.interrupted then
						previewWidget:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					previewWidget:setLeftRight( false, true, -902, -3 )
					previewWidget:setTopBottom( false, true, -595, 1 )
					previewWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewWidget, event )
					else
						previewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( false, true, -853, -3 )
				self.previewWidget:setTopBottom( false, true, -595, 1 )
				self.previewWidget:setAlpha( 1 )
				previewWidgetFrame2( previewWidget, {} )
				local cacElemsSideListCustomClass0Frame2 = function ( cacElemsSideListCustomClass0, event )
					local cacElemsSideListCustomClass0Frame3 = function ( cacElemsSideListCustomClass0, event )
						if not event.interrupted then
							cacElemsSideListCustomClass0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image100:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image1010:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Linear )
						end
						cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
						cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
						if event.interrupted then
							self.clipFinished( cacElemsSideListCustomClass0, event )
						else
							cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacElemsSideListCustomClass0Frame3( cacElemsSideListCustomClass0, event )
						return 
					else
						cacElemsSideListCustomClass0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", cacElemsSideListCustomClass0Frame3 )
					end
				end
				
				cacElemsSideListCustomClass0:completeAnimation()
				cacElemsSideListCustomClass0.Image100:completeAnimation()
				cacElemsSideListCustomClass0.Image1010:completeAnimation()
				self.cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
				self.cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
				cacElemsSideListCustomClass0Frame2( cacElemsSideListCustomClass0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
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
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 428 )
					LeftPanel:setTopBottom( true, false, 78, 720 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 77, 720 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 540, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( true, false, -3, 497 )
					chooseClassWidget:setTopBottom( true, false, 80, 663 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local previewWidgetFrame2 = function ( previewWidget, event )
					if not event.interrupted then
						previewWidget:beginAnimation( "keyframe", 920, true, true, CoD.TweenType.Linear )
					end
					previewWidget:setLeftRight( false, true, -853, -3 )
					previewWidget:setTopBottom( false, true, -595, 1 )
					previewWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewWidget, event )
					else
						previewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( false, true, -213, 637 )
				self.previewWidget:setTopBottom( false, true, -596, 0 )
				self.previewWidget:setAlpha( 0.34 )
				previewWidgetFrame2( previewWidget, {} )
				local cacElemsSideListCustomClass0Frame2 = function ( cacElemsSideListCustomClass0, event )
					local cacElemsSideListCustomClass0Frame3 = function ( cacElemsSideListCustomClass0, event )
						if not event.interrupted then
							cacElemsSideListCustomClass0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image100:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
							cacElemsSideListCustomClass0.Image1010:beginAnimation( "subkeyframe", 289, false, false, CoD.TweenType.Linear )
						end
						cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
						cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
						if event.interrupted then
							self.clipFinished( cacElemsSideListCustomClass0, event )
						else
							cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacElemsSideListCustomClass0Frame3( cacElemsSideListCustomClass0, event )
						return 
					else
						cacElemsSideListCustomClass0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cacElemsSideListCustomClass0:registerEventHandler( "transition_complete_keyframe", cacElemsSideListCustomClass0Frame3 )
					end
				end
				
				cacElemsSideListCustomClass0:completeAnimation()
				cacElemsSideListCustomClass0.Image100:completeAnimation()
				cacElemsSideListCustomClass0.Image1010:completeAnimation()
				self.cacElemsSideListCustomClass0.Image100:setAlpha( 0.82 )
				self.cacElemsSideListCustomClass0.Image1010:setAlpha( 0.82 )
				cacElemsSideListCustomClass0Frame2( cacElemsSideListCustomClass0, {} )
			end
		}
	}
	self:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "CACBackground0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "previewWidget",
			clipName = "Intro"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "weaponProgression",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "enable_mouse_button", function ( element, event )
		local retVal = nil
		EnableMouseButton( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "disable_mouse_button", function ( element, event )
		local retVal = nil
		DisableMouseButton( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "remove_item_from_class", function ( element, event )
		local retVal = nil
		RemoveItemFromClass( self, element, controller )
		EnableMouseButton( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "personalize_class_item", function ( element, event )
		local retVal = nil
		NavigateToPersonalizeMenu( self, controller )
		PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
		EnableMouseButton( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if CACShowSelectPrompt( self, element, controller ) then
			NavigateToLoadoutMenu( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if CACShowSelectPrompt( self, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetBackFromCustomClass( self )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SendClientScriptNotify( controller, "CustomClass_closed", "" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( element, menu, controller, model )
		if CACShowRemovePrompt( self, element ) then
			RemoveItemFromClass( self, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REMOVE" )
		if CACShowRemovePrompt( self, element ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "C", function ( element, menu, controller, model )
		if not IsGamesComBuild() then
			NavigateToPersonalizeMenu( self, controller )
			PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if not IsGamesComBuild() then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "SPACE", function ( element, menu, controller, model )
		if not IsGamepad( controller ) and IsPC() and AlwaysFalse() then
			ToggleMouse( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "TEST" )
		if not IsGamepad( controller ) and IsPC() and AlwaysFalse() then
			return true
		else
			return false
		end
	end, false )
	chooseClassWidget.id = "chooseClassWidget"
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
		self.chooseClassWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.chooseClassWidget:close()
		self.previewWidget:close()
		self.cacElemsSideListCustomClass0:close()
		self.feFooterContainer:close()
		self.CACBackground0:close()
		self.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

