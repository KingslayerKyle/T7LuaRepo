require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.cac_restriction_warning" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = CoD.perController[controller].classModel
	self:setModel( f1_local0 )
	self.disableBlur = true
	if f1_local0 then
		CoD.CACUtility.ValidateWeaponVariantForClass( controller, f1_local0 )
	end
	CheckGCCatchUp()
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0, f2_local1, f2_local2 = CoD.CACUtility.GetCACSlotStatus( f2_arg0, f2_arg2, f2_arg3 )
	local f2_local3, f2_local4 = nil
	local f2_local5 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if f2_local1 then
		f2_local4 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f2_arg3 )
	elseif LUI.startswith( f2_arg3, "primaryattachment" ) then
		f2_local4 = "primary"
	elseif LUI.startswith( f2_arg3, "secondaryattachment" ) then
		f2_local4 = "secondary"
	end
	if f2_local4 and f2_local4 ~= "" then
		if LUI.startswith( f2_local4, "specialty" ) then
			f2_local3 = CoD.CACUtility.GetPerkXModel( Engine.GetClassItem( f2_arg0, f2_arg1, f2_local4, f2_local5 ), f2_local5 )
		elseif LUI.startswith( f2_local4, "bonuscard" ) then
			f2_local3 = CoD.CACUtility.GetBonuscardXModel( Engine.GetClassItem( f2_arg0, f2_arg1, f2_local4, f2_local5 ), f2_local5 )
		elseif f2_local4 == "cybercom" then
			f2_local3 = CoD.CACUtility.GetPerkXModel( Engine.GetClassItem( f2_arg0, f2_arg1, f2_arg3, f2_local5 ), f2_local5 )
		else
			f2_local3 = Engine.GetWeaponString( f2_arg0, f2_arg1, f2_local4, f2_local5 )
		end
	end
	if f2_local3 and f2_local3 ~= "" then
		Engine.SendClientScriptNotify( f2_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f2_arg0 ), f2_local4, f2_local3, CoD.CACUtility.GetCameraNameForAttachments( f2_local3 ), CoD.CACUtility.GetWeaponOptionsFromClass( f2_arg0, f2_arg2, f2_local4 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( f2_arg0, f2_arg2, f2_local4 ) )
	else
		Engine.SendClientScriptNotify( f2_arg0, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f2_arg0 ) )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	if f3_arg3 then
		local f3_local0 = f3_arg3.possibleSlot
		local f3_local1 = f3_arg1.columnNav
		if f3_arg1.weaponSlotTable[f3_local0] then
			if type( f3_arg1.columnNav ) == "table" then
				f3_local1 = f3_arg1.columnNav[1]
			end
			local f3_local2 = f3_arg1.weaponSlotTable[f3_local0].columnNav
			if type( f3_local2 ) == "table" then
				for f3_local6, f3_local7 in ipairs( f3_local2 ) do
					if f3_local1 == f3_local7 then
						return true
					end
				end
			elseif f3_local1 == f3_local2 then
				return true
			end
		end
	end
	return false
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0:registerEventHandler( "mouse_focus", function ( element, event )
		local f5_local0 = event.element
		while f5_local0 and not f5_local0.slotName do
			f5_local0 = f5_local0:getParent()
		end
		if f5_local0 and f5_local0.slotName then
			element.navigationHistory = {}
			element:navigateTo( f5_local0.slotName, "jump" )
			EnableMouseButton( element, f4_arg1 )
		end
	end )
end

local PostLoadFunc = function ( f6_arg0, f6_arg1 )
	local f6_local0 = CoD.perController[f6_arg1].classModel
	local f6_local1 = CoD.perController[f6_arg1].classNum
	local f6_local2 = f6_arg0:getModel( f6_arg1, "CustomClassMenu" )
	local f6_local3, f6_local4 = nil
	if f6_local2 then
		f6_local3 = Engine.GetModel( f6_local2, "currentLoadoutName" )
		f6_local4 = Engine.GetModel( f6_local2, "currentItemName" )
	end
	f6_arg0.CACBackground0:setPriority( 100 )
	f6_arg0.weaponSlotTable = {}
	local f6_local5 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6 )
		local f7_local0 = LUI.getTableFromPath( "chooseClassWidget." .. f7_arg1, f6_arg0 )
		f7_local0.slotName = f7_arg0
		f6_arg0.weaponSlotTable[f7_arg0] = {
			widget = f7_local0,
			nav = {
				up = f7_arg5,
				down = f7_arg6,
				left = f7_arg3,
				right = f7_arg4
			},
			state = CoD.isCampaign and "Campaign" or "DefaultState",
			columnNav = f7_arg2
		}
	end
	
	local f6_local6 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7 )
		f6_local5( f8_arg0, f8_arg1 .. "." .. f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7 )
		f6_arg0.weaponSlotTable[f8_arg0].parentWidget = LUI.getTableFromPath( "chooseClassWidget." .. f8_arg1, f6_arg0 )
	end
	
	local f6_local7 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5, f9_arg6, f9_arg7, f9_arg8, f9_arg9 )
		f6_local6( f9_arg0, f9_arg1, f9_arg2, nil, f9_arg4, f9_arg5, f9_arg6, f9_arg7 )
		f6_arg0.weaponSlotTable[f9_arg0].state = "Wildcards"
		f6_arg0.weaponSlotTable[f9_arg0].widgetState = f9_arg3
		f6_arg0.weaponSlotTable[f9_arg0].clipNav = {
			left = f9_arg8,
			right = f9_arg9
		}
		f6_arg0.weaponSlotTable[f9_arg0].setFocusToChild = "bonuscard1"
	end
	
	local f6_local8 = function ( f10_arg0, f10_arg1 )
		if CoD.isCampaign == true then
			return f10_arg0
		else
			return f10_arg1
		end
	end
	
	local f6_local9, f6_local10, f6_local11, f6_local12, f6_local13, f6_local14 = nil
	f6_local5( "primary", "PrimaryWeapon", {
		1,
		2
	}, f6_local9, "primaryattachment1", f6_local11, "secondary" )
	f6_local5( "primaryattachment1", "PrimaryWeaponAttachment.optic", 3, "primary", "primaryattachment2", f6_local11, "primaryattachment4" )
	f6_local5( "primaryattachment2", "PrimaryWeaponAttachment.attachment1", 4, "primaryattachment1", "primaryattachment3", f6_local11, {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment2"
		}
	} )
	f6_local5( "primaryattachment3", "PrimaryWeaponAttachment.attachment2", 5, "primaryattachment2", f6_local10, f6_local11, {
		{
			slot = "primaryattachment6",
			condition = IsCACFifthPrimaryAttachmentAvailable
		},
		{
			slot = "secondaryattachment3"
		}
	} )
	f6_local5( "primaryattachment4", "PrimaryWeaponAttachment.attachment3", 3, "primary", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		}
	}, "primaryattachment1", "secondaryattachment1" )
	f6_local5( "primaryattachment5", "PrimaryWeaponAttachment.attachment4", 4, "primaryattachment4", {
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
	f6_local5( "primaryattachment6", "PrimaryWeaponAttachment.attachment5", 5, "primaryattachment5", f6_local10, {
		{
			slot = "primaryattachment3",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "bonuscard1"
		}
	}, "secondaryattachment3" )
	f6_local5( "secondary", "SecondaryWeapon", {
		1,
		2
	}, f6_local9, "secondaryattachment1", "primary", "primarygadget" )
	f6_local5( "secondaryattachment1", "SecondaryWeaponAttachment.optic", 3, "secondary", "secondaryattachment2", "primaryattachment4", f6_local8( "cybercom_tacrig1", "specialty1" ) )
	f6_local5( "secondaryattachment2", "SecondaryWeaponAttachment.attachment1", 4, "secondaryattachment1", "secondaryattachment3", {
		{
			slot = "primaryattachment5",
			condition = IsCACThirdPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment2"
		}
	}, f6_local8( "cybercom_tacrig1", "specialty2" ) )
	f6_local5( "secondaryattachment3", "SecondaryWeaponAttachment.attachment2", 5, "secondaryattachment2", f6_local10, {
		{
			slot = "primaryattachment6",
			condition = IsCACFifthPrimaryAttachmentAvailable
		},
		{
			slot = "primaryattachment3"
		}
	}, f6_local8( "cybercom_tacrig1", "specialty3" ) )
	f6_local5( "primarygadget", "LethalEquipment.Equipment1", 1, f6_local9, "secondarygadget", "secondary", "primarygadgetattachment1" )
	f6_local5( "primarygadgetattachment1", "LethalEquipment.Equipment2", 1, f6_local9, "secondarygadgetattachment1", "primarygadget", "bonuscard1" )
	f6_local5( "secondarygadget", "TacticalEquipment.Equipment1", 2, "primarygadget", f6_local8( "cybercom_tacrig1", "specialty1" ), "secondary", "secondarygadgetattachment1" )
	f6_local5( "secondarygadgetattachment1", "TacticalEquipment.Equipment2", 2, "primarygadgetattachment1", f6_local8( "cybercom_tacrig2", "specialty4" ), "secondarygadget", "bonuscard1" )
	f6_local5( "specialty1", "SpecialtyPerks.perk1.perk", 3, "secondarygadget", "specialty2", "secondaryattachment1", "specialty4" )
	f6_local5( "specialty2", "SpecialtyPerks.perk2.perk", 4, "specialty1", "specialty3", "secondaryattachment2", "specialty5" )
	f6_local5( "specialty3", "SpecialtyPerks.perk3.perk", 5, "specialty2", f6_local10, "secondaryattachment3", "specialty6" )
	f6_local5( "specialty4", "SpecialtyPerks.perk1.perkPlus", 3, "secondarygadgetattachment1", "specialty5", "specialty1", "bonuscard1" )
	f6_local5( "specialty5", "SpecialtyPerks.perk2.perkPlus", 4, "specialty4", "specialty6", "specialty2", "bonuscard1" )
	f6_local5( "specialty6", "SpecialtyPerks.perk3.perkPlus", 5, "specialty5", f6_local10, "specialty3", "bonuscard1" )
	f6_local5( "cybercom_tacrig1", "TacticalRig.TacRig1", 4, "secondarygadget", f6_local10, "secondaryattachment1", "cybercom_tacrig2" )
	f6_local5( "cybercom_tacrig2", "TacticalRig.TacRig2", 5, "secondarygadget", f6_local10, "cybercom_tacrig1", "bonuscard1" )
	local f6_local15 = {
		{
			slot = "primary",
			condition = f0_local2
		},
		{
			slot = "primary",
			condition = f0_local2
		},
		{
			slot = "primaryattachment1",
			condition = f0_local2
		},
		{
			slot = "primaryattachment2",
			condition = f0_local2
		},
		{
			slot = "primaryattachment3",
			condition = f0_local2
		},
		{
			slot = "primaryattachment1"
		}
	}
	local f6_local16 = f6_local8( {
		{
			slot = "cybercom_tacrig2",
			condition = f0_local2
		},
		{
			slot = "primarygadgetattachment1",
			condition = f0_local2
		},
		{
			slot = "secondarygadgetattachment1",
			condition = f0_local2
		},
		{
			slot = "cybercom_tacrig2"
		}
	}, {
		{
			slot = "primarygadgetattachment1",
			condition = f0_local2
		},
		{
			slot = "secondarygadgetattachment1",
			condition = f0_local2
		},
		{
			slot = "specialty4",
			condition = f0_local2
		},
		{
			slot = "specialty5",
			condition = f0_local2
		},
		{
			slot = "specialty6",
			condition = f0_local2
		},
		{
			slot = "specialty4"
		}
	} )
	f6_local7( "bonuscard3", "Wildcards", "wildcard3", "Card1to3", f6_local9, "bonuscard1", f6_local16, f6_local12, f6_local13, "ToCard1" )
	f6_local7( "bonuscard1", "Wildcards", "wildcard1", "ToCard1", "bonuscard3", "bonuscard2", f6_local16, f6_local12, "Card1to3", "Card1to2" )
	f6_local7( "bonuscard2", "Wildcards", "wildcard2", "Card1to2", "bonuscard1", f6_local10, f6_local16, f6_local12, "ToCard1", f6_local14 )
	f6_arg0.inverseNavigation = {
		left = "right",
		right = "left",
		up = "down",
		down = "up"
	}
	f6_arg0.navigationHistory = {}
	f6_arg0.navigateTo = function ( f11_arg0, f11_arg1, f11_arg2 )
		local f11_local0, f11_local1 = nil
		if f11_arg0.currentActiveSlot then
			f11_local1 = f11_arg0.weaponSlotTable[f11_arg1]
			f11_local0 = f11_arg0.weaponSlotTable[f11_arg0.currentActiveSlot]
			if f11_local0 and f11_local0.widget then
				f11_local0.widget:processEvent( {
					name = "lose_focus",
					controller = f6_arg1
				} )
				f11_local0.widget:setPriority( 0 )
				local f11_local2 = f11_local0.widget:getParent()
				while f11_local2 ~= f11_arg0 do
					f11_local2:setPriority( 0 )
					f11_local2 = f11_local2:getParent()
				end
				if f11_local0.parentWidget then
					if not f11_local1.parentWidget or f11_local0.parentWidget ~= f11_local1.parentWidget then
						f11_local0.parentWidget:setState( "DefaultState" )
					end
					if f11_local0.clipNav and f11_local0.clipNav[f11_arg2] then
						f11_local0.parentWidget:setState( f11_local0.clipNav[f11_arg2] )
					end
				end
			end
		end
		f11_arg0.currentActiveSlot = f11_arg1
		CoD.CACUtility.CustomClass_LastSelection = f11_arg1
		if f6_local1 then
			CoD.CACUtility.CustomClass_PerClassLastSelection[f6_local1 + 1] = f11_arg1
		end
		f11_local1 = f11_arg0.weaponSlotTable[f11_arg0.currentActiveSlot]
		if f6_local1 and f11_local1 and f11_local1.widget then
			f11_local1.widget:processEvent( {
				name = "gain_focus",
				controller = f6_arg1
			} )
			f11_local1.widget:setPriority( 100 )
			local f11_local2 = f11_local1.widget:getParent()
			if f11_local2.id ~= "Wildcards" then
			
			else
				f11_arg0:playSound( "navigate" )
				f11_arg0.chooseClassWidget:setState( f11_local1.state )
				if f11_arg2 ~= "jump" then
					if f11_local0 and f11_local1.parentWidget ~= f11_local0.parentWidget and f11_local1.widgetState then
						f11_local1.parentWidget:setState( f11_local1.widgetState )
					end
					if not f11_local0 and f11_local1.widgetState then
						f11_local1.parentWidget:setState( f11_local1.widgetState )
					end
				end
				f11_arg0.previewWidget:setModel( f11_local1.widget:getModel() )
				f0_local1( f6_arg1, f6_local1, f6_local0, f11_arg1 )
				f11_arg0.cacrestrictionwarning:setModel( f11_local1.widget:getModel() )
			end
			while f11_local2 ~= f11_arg0.chooseClassWidget do
				f11_local2:setPriority( 100 )
				f11_local2 = f11_local2:getParent()
			end
			f11_arg0:playSound( "navigate" )
			f11_arg0.chooseClassWidget:setState( f11_local1.state )
			if f11_arg2 ~= "jump" then
				if f11_local0 and f11_local1.parentWidget ~= f11_local0.parentWidget and f11_local1.widgetState then
					f11_local1.parentWidget:setState( f11_local1.widgetState )
				end
				if not f11_local0 and f11_local1.widgetState then
					f11_local1.parentWidget:setState( f11_local1.widgetState )
				end
			end
			f11_arg0.previewWidget:setModel( f11_local1.widget:getModel() )
			f0_local1( f6_arg1, f6_local1, f6_local0, f11_arg1 )
			f11_arg0.cacrestrictionwarning:setModel( f11_local1.widget:getModel() )
		end
		if f11_local1.columnNav then
			f11_arg0.columnNav = f11_local1.columnNav
		end
		SetHintText( f11_arg0, f11_local1.widget, f6_arg1 )
	end
	
	f6_arg0.performNav = function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg0.weaponSlotTable[f12_arg0.currentActiveSlot]
		local f12_local1 = f12_local0.widget
		local f12_local2 = #f12_arg0.navigationHistory
		if f12_local2 > 0 then
			local f12_local3 = f12_arg0.navigationHistory[f12_local2]
			if f12_local3.direction == f12_arg1 and (not f12_local3.conditionFn or f12_local3.conditionFn( f6_arg1, f12_arg0, f12_local1 )) then
				f12_arg0:navigateTo( f12_local3.slot, f12_arg1 )
				table.remove( f12_arg0.navigationHistory, f12_local2 )
				return 
			end
		end
		local f12_local3 = f12_local0.nav
		if f12_local3 then
			local f12_local4 = f12_local3[f12_arg1]
			if f12_local4 then
				local f12_local5, f12_local6 = nil
				if type( f12_local4 ) == "table" then
					for f12_local11, f12_local12 in ipairs( f12_local4 ) do
						if f12_local12.slot then
							local f12_local10 = f12_arg0.weaponSlotTable[f12_local12.slot].widget
							if f12_local10 and (not f12_local12.condition or f12_local12.condition( f6_arg1, f12_arg0, f12_local10, {
								possibleSlot = f12_local12.slot
							} )) then
								f12_local5 = f12_local10
								f12_local4 = f12_local12.slot
								f12_local6 = f12_local12.condition
							end
						end
					end
				elseif f12_arg0.weaponSlotTable[f12_local4] then
					f12_local5 = f12_arg0.weaponSlotTable[f12_local4].widget
				end
				if f12_local5 then
					if #f12_arg0.navigationHistory >= 10 then
						table.remove( f12_arg0.navigationHistory, 1 )
					end
					local f12_local7 = f12_arg0.currentActiveSlot
					local f12_local8 = f12_arg0.weaponSlotTable[f12_local7]
					if f12_local8.setFocusToChild then
						f12_arg0.navigationHistory = {}
						table.insert( f12_arg0.navigationHistory, {
							direction = f12_arg0.inverseNavigation[f12_arg1],
							slot = f12_local8.setFocusToChild,
							conditionFn = f12_local6
						} )
					else
						table.insert( f12_arg0.navigationHistory, {
							direction = f12_arg0.inverseNavigation[f12_arg1],
							slot = f12_local7,
							conditionFn = f12_local6
						} )
					end
					f12_arg0:navigateTo( f12_local4, f12_arg1 )
					return 
				end
			end
		end
	end
	
	f6_arg0.handleGamepadButtonModelCallback = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
		local f13_local0 = LUI.UIElement.GetCorrespondingGamepadButtonString( f13_arg3 )
		if f13_local0 == "left" or f13_local0 == "right" or f13_local0 == "up" or f13_local0 == "down" then
			f13_arg0:performNav( f13_local0 )
			return true
		else
			return false
		end
	end
	
	if CoD.isPC then
		f0_local3( f6_arg0, f6_arg1 )
	end
	f6_arg0:dispatchEventToChildren( {
		name = "lose_focus",
		controller = f6_arg1
	} )
	if CoD.CACUtility.CustomClass_LastClassNum ~= f6_local1 and f6_local1 ~= nil then
		if not CoD.CACUtility.CustomClass_PerClassLastSelection[f6_local1 + 1] then
			CoD.CACUtility.CustomClass_PerClassLastSelection[f6_local1 + 1] = "primary"
		end
		CoD.CACUtility.CustomClass_LastSelection = CoD.CACUtility.CustomClass_PerClassLastSelection[f6_local1 + 1]
	end
	CoD.CACUtility.CustomClass_LastClassNum = f6_local1
	f6_arg0:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
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
	self:playSound( "menu_open", controller )
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
	chooseClassWidget:setTopBottom( true, false, 80, 679 )
	chooseClassWidget:linkToElementModel( self, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local previewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	previewWidget:setLeftRight( true, true, 430, 0 )
	previewWidget:setTopBottom( true, false, 124, 720 )
	self:addElement( previewWidget )
	self.previewWidget = previewWidget
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		SizeToSafeArea( element, controller )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	feFooterContainer:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local CACBackground0 = CoD.CACBackgroundNew.new( self, controller )
	CACBackground0:setLeftRight( true, true, 0, 0 )
	CACBackground0:setTopBottom( true, true, 0, 0 )
	CACBackground0:linkToElementModel( self, nil, false, function ( model )
		CACBackground0:setModel( model, controller )
	end )
	CACBackground0:linkToElementModel( self, "customClassName", true, function ( model )
		local customClassName = Engine.GetModelValue( model )
		if customClassName then
			CACBackground0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( customClassName )
		end
	end )
	CACBackground0:registerEventHandler( "menu_opened", function ( element, event )
		local f20_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f20_local0 then
			f20_local0 = element:dispatchEventToChildren( event )
		end
		return f20_local0
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local cacrestrictionwarning = CoD.cac_restriction_warning.new( self, controller )
	cacrestrictionwarning:setLeftRight( true, false, 1008, 1216 )
	cacrestrictionwarning:setTopBottom( true, false, 553.73, 583.73 )
	cacrestrictionwarning:linkToElementModel( self, nil, false, function ( model )
		cacrestrictionwarning:setModel( model, controller )
	end )
	self:addElement( cacrestrictionwarning )
	self.cacrestrictionwarning = cacrestrictionwarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Fade:completeAnimation()
				self.Fade:setAlpha( 0 )
				self.clipFinished( Fade, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 78, 720 )
				self.clipFinished( LeftPanel, {} )
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
				self:setupElementClipCounter( 3 )
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
					previewWidget:setLeftRight( true, true, 378, -3 )
					previewWidget:setTopBottom( true, false, 125, 721 )
					previewWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewWidget, event )
					else
						previewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( true, true, 427, -3 )
				self.previewWidget:setTopBottom( true, false, 125, 721 )
				self.previewWidget:setAlpha( 1 )
				previewWidgetFrame2( previewWidget, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
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
					chooseClassWidget:setTopBottom( true, false, 80, 679 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 679 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local previewWidgetFrame2 = function ( previewWidget, event )
					if not event.interrupted then
						previewWidget:beginAnimation( "keyframe", 920, true, true, CoD.TweenType.Linear )
					end
					previewWidget:setLeftRight( true, true, 427, -3 )
					previewWidget:setTopBottom( true, false, 125, 721 )
					previewWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewWidget, event )
					else
						previewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewWidget:completeAnimation()
				self.previewWidget:setLeftRight( true, true, 1067, 637 )
				self.previewWidget:setTopBottom( true, false, 124, 720 )
				self.previewWidget:setAlpha( 0.34 )
				previewWidgetFrame2( previewWidget, {} )
			end
		}
	}
	self:registerEventHandler( "input_source_changed", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f38_local0 = self
		local f38_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f38_local0, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0 )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f39_local0 = nil
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
		if not f39_local0 then
			f39_local0 = self:dispatchEventToChildren( event )
		end
		return f39_local0
	end )
	self:registerEventHandler( "enable_mouse_button", function ( self, event )
		local f40_local0 = nil
		EnableMouseButton( self, controller )
		if not f40_local0 then
			f40_local0 = self:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	self:registerEventHandler( "disable_mouse_button", function ( self, event )
		local f41_local0 = nil
		DisableMouseButton( self, controller )
		if not f41_local0 then
			f41_local0 = self:dispatchEventToChildren( event )
		end
		return f41_local0
	end )
	self:registerEventHandler( "remove_item_from_class", function ( self, event )
		local f42_local0 = nil
		RemoveItemFromClass( self, self, controller )
		EnableMouseButton( self, controller )
		if not f42_local0 then
			f42_local0 = self:dispatchEventToChildren( event )
		end
		return f42_local0
	end )
	self:registerEventHandler( "personalize_class_item", function ( self, event )
		local f43_local0 = nil
		if not IsCPHeroWeapon( self, controller ) then
			NavigateToPersonalizeMenu( self, controller )
			PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
			EnableMouseButton( self, controller )
		end
		if not f43_local0 then
			f43_local0 = self:dispatchEventToChildren( event )
		end
		return f43_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f44_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		if not f44_local0 then
			f44_local0 = self:dispatchEventToChildren( event )
		end
		return f44_local0
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
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		SetPerControllerTableProperty( controller, "weaponCategory", nil )
		SetPerControllerTableProperty( controller, "weaponSlot", nil )
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
			EnableMouseButton( self, controller )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if not IsGamesComBuild() and not IsCPHeroWeapon( self, controller ) then
			NavigateToPersonalizeMenu( self, controller )
			PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsGamesComBuild() and not IsCPHeroWeapon( self, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
		if not IsGamepad( controller ) and IsPC() and AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "TEST" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.chooseClassWidget:close()
		element.previewWidget:close()
		element.feFooterContainer:close()
		element.CACBackground0:close()
		element.PregameTimerOverlay:close()
		element.FEMenuLeftGraphics:close()
		element.cacrestrictionwarning:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

