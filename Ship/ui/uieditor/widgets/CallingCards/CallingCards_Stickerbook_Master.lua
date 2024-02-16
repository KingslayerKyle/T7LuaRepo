-- a52d24f37225d26757c2355b0bffcb0e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_Master" )

DataSources.MasterCallingCardsSorted = DataSourceHelpers.ListSetup( "MasterCallingCardsSorted", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = {}
	for f1_local2 = Enum.eModes.MODE_FIRST, Enum.eModes.MODE_COUNT - 1, 1 do
		local f1_local5 = Engine.GetChallengeInfoForImages( f1_arg0, nil, f1_local2 )
		if f1_local5 then
			for f1_local9, f1_local10 in ipairs( f1_local5 ) do
				f1_local10.gameMode = f1_local2
				table.insert( f1_local1, f1_local10 )
			end
		end
	end
	table.sort( f1_local1, function ( f2_arg0, f2_arg1 )
		if f2_arg0.isMastery ~= f2_arg1.isMastery then
			return f2_arg1.isMastery
		elseif f2_arg0.isLocked ~= f2_arg1.isLocked then
			return f2_arg1.isLocked
		elseif f2_arg0.gameMode ~= f2_arg1.gameMode then
			return f2_arg1.gameMode < f2_arg0.gameMode
		elseif f2_arg0.challengeCategory ~= f2_arg1.challengeCategory then
			local f2_local0 = CoD.ChallengesUtility.ChallengeCategoryValues[f2_arg0.gameMode]
			if f2_local0[f2_arg0.challengeCategory] and f2_local0[f2_arg1.challengeCategory] then
				return f2_local0[f2_arg0.challengeCategory] < f2_local0[f2_arg1.challengeCategory]
			else
				return f2_local0[f2_arg0.challengeCategory] ~= nil
			end
		else
			return tonumber( f2_arg0.challengeRow ) < tonumber( f2_arg1.challengeRow )
		end
	end )
	local f1_local2 = {}
	local f1_local3 = {}
	for f1_local6, f1_local7 in ipairs( f1_local1 ) do
		local f1_local8 = f1_local7.challengeRow
		local f1_local9 = f1_local7.currentChallengeRow
		local f1_local10 = f1_local7.tableNum
		local f1_local24 = f1_local7.isLocked
		local f1_local25 = f1_local7.isMastery
		local f1_local26 = f1_local7.gameMode
		local f1_local27 = f1_local7.challengeType
		local f1_local15 = f1_local7.challengeCategory
		local f1_local28 = f1_local7.currChallengeStatValue
		local f1_local29 = f1_local7.imageID
		local f1_local30 = 0
		local f1_local31 = 0
		local f1_local32 = 0
		local f1_local19 = ""
		local f1_local33, f1_local34, f1_local35, f1_local20, f1_local21 = nil
		if f1_local8 ~= nil and CoD.ChallengesUtility.ChallengeCategoryValues[f1_local26][f1_local15] ~= nil then
			local f1_local12 = ""
			local f1_local13 = ""
			local f1_local14 = ""
			if f1_local26 == Enum.eModes.MODE_CAMPAIGN then
				f1_local12 = "cp"
				f1_local13 = Engine.Localize( "MENU_CAMPAIGN" )
				f1_local14 = CoD.ChallengesUtility.GameModeIcons.CP
			elseif f1_local26 == Enum.eModes.MODE_MULTIPLAYER then
				f1_local12 = "mp"
				f1_local13 = Engine.Localize( "MENU_MULTIPLAYER" )
				f1_local14 = CoD.ChallengesUtility.GameModeIcons.MP
			elseif f1_local26 == Enum.eModes.MODE_ZOMBIES then
				f1_local12 = "zm"
				f1_local13 = Engine.Localize( "MENU_ZOMBIES" )
				f1_local14 = CoD.ChallengesUtility.GameModeIcons.ZM
			end
			f1_local15 = f1_local12 .. "_" .. f1_local15
			local f1_local16 = CoD.getStatsMilestoneTable( f1_local10 + 1, f1_local26 )
			local f1_local17 = Engine.TableLookupGetColumnValueForRow( f1_local16, f1_local8, CoD.ChallengesUtility.NameStringCol )
			local f1_local18 = Engine.TableLookupGetColumnValueForRow( f1_local16, f1_local8, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			if not f1_local25 then
				if not f1_local2[f1_local15] or not f1_local3[f1_local15] then
					f1_local2[f1_local15] = 0
					f1_local3[f1_local15] = 0
				end
				f1_local3[f1_local15] = f1_local3[f1_local15] + 1
				if not f1_local24 then
					f1_local2[f1_local15] = f1_local2[f1_local15] + 1
				end
			end
			if f1_local27 == CoD.MILESTONE_WEAPON then
				f1_local19 = Engine.Localize( Engine.GetItemName( f1_local7.itemIndex ) )
			elseif f1_local27 == CoD.MILESTONE_GROUP then
				f1_local19 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f1_local7.itemIndex ) )
			elseif f1_local27 == CoD.MILESTONE_ATTACHMENTS then
				f1_local19 = Engine.Localize( Engine.GetAttachmentNameByIndex( f1_local7.itemIndex ) )
			elseif f1_local27 == CoD.MILESTONE_GAMEMODE then
				f1_local19 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( f1_local7.itemIndex ) )
			end
			f1_local20 = Engine.Localize( f1_local17, "", f1_local19 )
			if not f1_local21 then
				f1_local21 = Engine.Localize( f1_local18, "", f1_local19 )
			end
			local f1_local22 = f1_local2[f1_local15] == f1_local3[f1_local15]
			local f1_local23 = 0
			if f1_local15 == "mp_onehundredpercent" then
				f1_local23 = Engine.GetModelValue( Engine.GetModel( DataSources.ChallengesMPCategoryStats.getModel( f1_arg0 ), "mp" ) )
				f1_local22 = f1_local23 == 1
			else
				f1_local23 = f1_local2[f1_local15] / f1_local3[f1_local15]
			end
			table.insert( f1_local0, {
				models = {
					title = f1_local20,
					description = f1_local21,
					iconId = f1_local29,
					percentComplete = f1_local23,
					challengeCategory = f1_local7.challengeCategory,
					gameMode = f1_local26,
					gameModeName = f1_local13,
					gameModeIcon = f1_local14,
					isLocked = not f1_local22
				},
				properties = {}
			} )
		end
	end
	if ArenaChallengesEnabled() then
		table.insert( f1_local0, CoD.ArenaUtility.GetArenaVetMasterCard( f1_arg0 ) )
	end
	table.sort( f1_local0, function ( f3_arg0, f3_arg1 )
		if f3_arg0.models.isLocked ~= f3_arg1.models.isLocked then
			return f3_arg1.models.isLocked
		elseif f3_arg0.models.gameMode ~= f3_arg1.models.gameMode then
			return f3_arg1.models.gameMode < f3_arg0.models.gameMode
		else
			local f3_local0 = CoD.ChallengesUtility.ChallengeCategoryValues[f3_arg0.models.gameMode]
			return f3_local0[f3_arg0.models.challengeCategory] < f3_local0[f3_arg1.models.challengeCategory]
		end
	end )
	return f1_local0
end, true )
CoD.CallingCards_Stickerbook_Master = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_Master.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Stickerbook_Master )
	self.id = "CallingCards_Stickerbook_Master"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 750 )
	CallingCardGrid:setTopBottom( true, false, 16, 496 )
	CallingCardGrid:setDataSource( "MasterCallingCardsSorted" )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 10 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
		end
		return f5_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsElementInState( f8_arg0, "Locked" ) then
			CallingCards_SetPlayerBackground( f8_arg1, f8_arg0, f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementInState( f9_arg0, "Locked" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_Master.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardProfiler:setTopBottom( true, true, 14, -22 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardGrid:close()
		element.CallingCardProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
