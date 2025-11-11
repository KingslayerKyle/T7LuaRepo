require( "ui.uieditor.widgets.CallingCards.CallingCards_CardWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_Master" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

DataSources.MasterCallingCardsSorted = DataSourceHelpers.ListSetup( "MasterCallingCardsSorted", function ( controller )
	local optionsTable = {}
	local challengeInfo = {}
	for f1_local0 = Enum.eModes.MODE_FIRST, Enum.eModes.MODE_COUNT - 1, 1 do
		local gameModeChallengeInfo = Engine.GetChallengeInfoForImages( controller, nil, f1_local0 )
		if gameModeChallengeInfo then
			for _, challenge in ipairs( gameModeChallengeInfo ) do
				challenge.gameMode = f1_local0
				table.insert( challengeInfo, challenge )
			end
		end
	end
	table.sort( challengeInfo, function ( a, b )
		if a.isMastery ~= b.isMastery then
			return b.isMastery
		elseif a.isLocked ~= b.isLocked then
			return b.isLocked
		elseif a.gameMode ~= b.gameMode then
			return b.gameMode < a.gameMode
		elseif a.challengeCategory ~= b.challengeCategory then
			local challengeCategoryTable = CoD.ChallengesUtility.ChallengeCategoryValues[a.gameMode]
			if challengeCategoryTable[a.challengeCategory] and challengeCategoryTable[b.challengeCategory] then
				return challengeCategoryTable[a.challengeCategory] < challengeCategoryTable[b.challengeCategory]
			else
				return challengeCategoryTable[a.challengeCategory] ~= nil
			end
		else
			return tonumber( a.challengeRow ) < tonumber( b.challengeRow )
		end
	end )
	local cardsByCategoryComplete = {}
	local cardsByCategoryTotal = {}
	for _, f1_local4 in ipairs( challengeInfo ) do
		local challengeRow = f1_local4.challengeRow
		local currentChallengeRow = f1_local4.currentChallengeRow
		local tableNumber = f1_local4.tableNum
		local isLockedByChallenge = f1_local4.isLocked
		local isMastery = f1_local4.isMastery
		local gameModeIndex = f1_local4.gameMode
		local challengeType = f1_local4.challengeType
		local f1_local8 = f1_local4.challengeCategory
		local currentVal = f1_local4.currChallengeStatValue
		local imageId = f1_local4.imageID
		local unlockRank = 0
		local unlockPLevel = 0
		local currentChallengeTier = 0
		local f1_local9 = ""
		local tierText, isTieredChallenge, isLockedByLevel, f1_local10, f1_local11 = nil
		if challengeRow ~= nil then
			local gameModeNameShort = ""
			local gameModeNameFull = ""
			local gameModeIcon = ""
			if gameModeIndex == Enum.eModes.MODE_CAMPAIGN then
				gameModeNameShort = "cp"
				gameModeNameFull = Engine.Localize( "MENU_CAMPAIGN" )
				gameModeIcon = CoD.ChallengesUtility.GameModeIcons.CP
			elseif gameModeIndex == Enum.eModes.MODE_MULTIPLAYER then
				gameModeNameShort = "mp"
				gameModeNameFull = Engine.Localize( "MENU_MULTIPLAYER" )
				gameModeIcon = CoD.ChallengesUtility.GameModeIcons.MP
			elseif gameModeIndex == Enum.eModes.MODE_ZOMBIES then
				gameModeNameShort = "zm"
				gameModeNameFull = Engine.Localize( "MENU_ZOMBIES" )
				gameModeIcon = CoD.ChallengesUtility.GameModeIcons.ZM
			end
			f1_local8 = gameModeNameShort .. "_" .. f1_local8
			local tableName = CoD.getStatsMilestoneTable( tableNumber + 1, gameModeIndex )
			local challengeNameStringRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol )
			local challengeDescStringRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			if not isMastery then
				if not cardsByCategoryComplete[f1_local8] or not cardsByCategoryTotal[f1_local8] then
					cardsByCategoryComplete[f1_local8] = 0
					cardsByCategoryTotal[f1_local8] = 0
				end
				cardsByCategoryTotal[f1_local8] = cardsByCategoryTotal[f1_local8] + 1
				if not isLockedByChallenge then
					cardsByCategoryComplete[f1_local8] = cardsByCategoryComplete[f1_local8] + 1
				end
			end
			if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
				f1_local9 = Engine.Localize( Engine.GetItemName( f1_local4.itemIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
				f1_local9 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( f1_local4.itemIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
				f1_local9 = Engine.Localize( Engine.GetAttachmentNameByIndex( f1_local4.itemIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
				f1_local9 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( f1_local4.itemIndex ) )
			end
			f1_local10 = Engine.Localize( challengeNameStringRef, "", f1_local9 )
			if not f1_local11 then
				f1_local11 = Engine.Localize( challengeDescStringRef, "", f1_local9 )
			end
			table.insert( optionsTable, {
				models = {
					title = f1_local10,
					description = f1_local11,
					iconId = imageId,
					percentComplete = cardsByCategoryComplete[f1_local8] / cardsByCategoryTotal[f1_local8],
					challengeCategory = f1_local4.challengeCategory,
					gameMode = gameModeIndex,
					gameModeName = gameModeNameFull,
					gameModeIcon = gameModeIcon,
					isLocked = not (cardsByCategoryComplete[f1_local8] == cardsByCategoryTotal[f1_local8])
				},
				properties = {}
			} )
		end
	end
	table.sort( optionsTable, function ( a, b )
		if a.models.isLocked ~= b.models.isLocked then
			return b.models.isLocked
		elseif a.models.gameMode ~= b.models.gameMode then
			return b.models.gameMode < a.models.gameMode
		else
			local challengeCategoryTable = CoD.ChallengesUtility.ChallengeCategoryValues[a.models.gameMode]
			return challengeCategoryTable[a.models.challengeCategory] < challengeCategoryTable[b.models.challengeCategory]
		end
	end )
	return optionsTable
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
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 15, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( 0, 0, 15, 1125 )
	CallingCardGrid:setTopBottom( 0, 0, 24, 744 )
	CallingCardGrid:setWidgetType( CoD.CallingCards_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 15 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "MasterCallingCardsSorted" )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			CallingCards_SetOld( element, controller )
		end
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "Locked" ) then
			CallingCards_SetPlayerBackground( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "Locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_Master.new( menu, controller )
	CallingCardProfiler:setLeftRight( 1, 1, -568.5, -43.5 )
	CallingCardProfiler:setTopBottom( 0, 1, 21, -33 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.navigation = {
		right = CallingCardProfiler
	}
	CallingCardProfiler.navigation = {
		left = CallingCardGrid
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CallingCardGrid.id = "CallingCardGrid"
	CallingCardProfiler.id = "CallingCardProfiler"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardGrid:close()
		self.CallingCardProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

