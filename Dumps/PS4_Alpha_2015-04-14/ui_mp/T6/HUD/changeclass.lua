require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.Menus.CACUtility" )
require( "ui.T6.SplitscreenClassPreview" )

CoD.T6ChangeClass = {}
CoD.T6ChangeClass.Width = 840
CoD.T6ChangeClass.Height = 600
CoD.T6ChangeClass.SelectedClassIndex = {}
CoD.T6ChangeClass.IsOnlineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.T6ChangeClass.SetProfileLoadoutChoice = function ( controller, selectedClassIndex )
	local loadout = "lastLoadoutSystemlink"
	if CoD.T6ChangeClass.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			loadout = "lastLoadoutLeague"
		else
			loadout = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( controller, loadout, selectedClassIndex )
	Engine.CommitProfileChanges( controller )
	CoD.T6ChangeClass.SelectedClassIndex[controller] = selectedClassIndex
end

CoD.T6ChangeClass.GetProfileLoadoutChoice = function ( controller )
	if Engine.DvarBool( nil, "rat_playback_enabled" ) then
		return 0
	end
	local loadout = "lastLoadoutSystemlink"
	if CoD.T6ChangeClass.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			loadout = "lastLoadoutLeague"
		else
			loadout = "lastLoadoutOnline"
		end
	end
	return Engine.GetProfileVarInt( controller, loadout )
end

CoD.T6ChangeClass.Button_RowGainFocus = function ( self, event )
	local retVal = CoD.CoD9Button.GainFocus( self, event )
	self:dispatchEventToParent( {
		name = "row_gain_focus",
		button = self
	} )
	return retVal
end

CoD.T6ChangeClass.RowGainFocus = function ( self, event )
	if event.button.disabled == nil then
		self.classPreview:update( event.button.controller, event.button.classIndex, event.button.className )
	else
		self.informationPane:animateToState( "hide", 0 )
	end
end

CoD.T6ChangeClass.Button_RowLoseFocus = function ( self, event )
	CoD.CoD9Button.LoseFocus( self, event )
end

CoD.T6ChangeClass.CheckFocus = function ( self )
	if self.buttonList:getFirstChild() then
		local f7_local0 = self.buttonList:getFirstChild()
		local focusedChild = f7_local0:getFirstInFocus()
		if not focusedChild then
			self.buttonList:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.T6ChangeClass.AddButton = function ( self, controller, buttonText, actionEventName, disable, className, classIndex, lastSelectedIndex )
	local button = self.buttonList:addButton( buttonText )
	button.classIndex = classIndex
	button.className = className
	button.controller = controller
	button:setActionEventName( actionEventName )
	button:registerEventHandler( "gain_focus", CoD.T6ChangeClass.Button_RowGainFocus )
	button:registerEventHandler( "lose_focus", CoD.T6ChangeClass.Button_RowLoseFocus )
	if className then
		classIndex = Engine.GetClassIndexFromName( className )
	else
		local class = Engine.GetCustomClass( controller, classIndex )
		if Engine.GetMaxAllocation( controller ) < class.allocationSpent then
			disable = true
		end
	end
	local class = Engine.GetCustomClass( controller, classIndex )
	local primaryWeaponIndex = class.primary
	local secondaryWeaponIndex = class.secondary
	if not (not primaryWeaponIndex or Engine.HasDLCForItem( controller, primaryWeaponIndex )) or secondaryWeaponIndex and not Engine.HasDLCForItem( controller, secondaryWeaponIndex ) then
		disable = true
	end
	if disable == true then
		button:disable()
		button:lock()
		button.lockImage:setLeftRight( true, false, -CoD.CoD9Button.Height, -6 )
		button:makeNotFocusable()
	elseif lastSelectedIndex == classIndex then
		button:processEvent( {
			name = "gain_focus"
		} )
	end
end

CoD.T6ChangeClass.CustomClassText = function ( index, controller )
	local f9_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, index )
	return f9_local0:get()
end

CoD.T6ChangeClass.SendMenuResponseCustomClassSelected = function ( self, event )
	self:saveState()
	self.menuResponseSent = true
	self:goBack( event.controller )
	local selectedClassIndex = nil
	if event.button.className ~= nil then
		Engine.SendMenuResponse( event.button.controller, "changeclass", event.button.className )
		selectedClassIndex = Engine.GetClassIndexFromName( event.button.className )
	else
		Engine.SendMenuResponse( event.button.controller, "changeclass", "custom" .. event.button.classIndex )
		selectedClassIndex = event.button.classIndex
	end
	CoD.T6ChangeClass.SetProfileLoadoutChoice( controller, selectedClassIndex )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( event.controller, event.button.classIndex )
end

local IsItemLocked = function ( controller, featureName )
	return Engine.IsItemLocked( controller, Engine.GetItemIndex( featureName ) ) and CoD.T6ChangeClass.IsOnlineGame() == true
end

local IsCACLocked = function ( controller )
	local f12_local0 = IsItemLocked( controller, "FEATURE_CREATE_A_CLASS" )
	if not f12_local0 then
		f12_local0 = Engine.GetGametypeSetting( "disableCAC" ) == 1
	end
	return f12_local0
end

CoD.T6ChangeClass.AddPrestigeClassButtons = function ( self, controller, lastSelectedClass )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		return 
	end
	local f13_local0 = IsCACLocked( controller ) == false
	local classCount = Engine.GetCustomClassCount( controller )
	if classCount == nil then
		return 
	end
	for i = 5, 9, 1 do
		if f13_local0 and CoD.T6ChangeClass.IsOnlineGame() == true and i < classCount then
			local f13_local3 = CoD.T6ChangeClass.AddButton
			local f13_local4 = self
			local f13_local5 = controller
			local f13_local6 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, i )
			f13_local3( f13_local4, f13_local5, f13_local6:get(), "sendMenuResponse_CustomClassSelected", nil, nil, i, lastSelectedClass )
		end
	end
end

CoD.T6ChangeClass.AddCustomClassButtons = function ( self, controller, lastSelectedClass )
	local CAClocked = IsCACLocked( controller )
	for i = 0, 4, 1 do
		CoD.T6ChangeClass.AddButton( self, controller, CoD.T6ChangeClass.CustomClassText( i, controller ), "sendMenuResponse_CustomClassSelected", CAClocked, nil, i, lastSelectedClass )
	end
	self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
end

CoD.T6ChangeClass.IsDefaultClassButtonDisabled = function ( controller, classNum )
	local classCount = Engine.GetCustomClassCount( controller )
	if classCount == nil then
		return false
	elseif CoD.T6ChangeClass.IsOnlineGame() == true and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and not IsCACLocked( controller ) and classNum < classCount then
		return true
	else
		return false
	end
end

CoD.T6ChangeClass.AddDefaultClassButtons = function ( self, controller, lastSelectedClass )
	local clientNum = Engine.GetClientNum( controller )
	local team = Enum.team_t.TEAM_FREE
	if Engine.GetGametypeSetting( "teamCount" ) >= 2 then
		team = Engine.GetTeamID( controller, clientNum )
	end
	CoD.CACUtility.SetGametypeSettingsCACRoot( self:getOwner(), team )
	local customClassNames = CoD.CACUtility.GetLoadoutNames( self:getOwner() )
	if not CoD.T6ChangeClass.IsDefaultClassButtonDisabled( controller, 5 ) then
		CoD.T6ChangeClass.AddButton( self, controller, Engine.Localize( customClassNames[0]:get() ), "sendMenuResponse_CustomClassSelected", nil, "class_smg", 10, lastSelectedClass )
	end
	if not CoD.T6ChangeClass.IsDefaultClassButtonDisabled( controller, 6 ) then
		CoD.T6ChangeClass.AddButton( self, controller, Engine.Localize( customClassNames[1]:get() ), "sendMenuResponse_CustomClassSelected", nil, "class_cqb", 11, lastSelectedClass )
	end
	if not CoD.T6ChangeClass.IsDefaultClassButtonDisabled( controller, 7 ) then
		CoD.T6ChangeClass.AddButton( self, controller, Engine.Localize( customClassNames[2]:get() ), "sendMenuResponse_CustomClassSelected", nil, "class_assault", 12, lastSelectedClass )
	end
	if not CoD.T6ChangeClass.IsDefaultClassButtonDisabled( controller, 8 ) then
		CoD.T6ChangeClass.AddButton( self, controller, Engine.Localize( customClassNames[3]:get() ), "sendMenuResponse_CustomClassSelected", IsItemLocked( controller, "FEATURE_CLOSEASSAULT" ), "class_lmg", 13, lastSelectedClass )
	end
	if not CoD.T6ChangeClass.IsDefaultClassButtonDisabled( controller, 9 ) then
		CoD.T6ChangeClass.AddButton( self, controller, Engine.Localize( customClassNames[4]:get() ), "sendMenuResponse_CustomClassSelected", IsItemLocked( controller, "FEATURE_SNIPER" ), "class_sniper", 14, lastSelectedClass )
	end
	CoD.CACUtility.SetDefaultCACRoot( self:getOwner() )
end

CoD.T6ChangeClass.PrepareButtonList = function ( controller, self )
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.45 )
	buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	self:addElement( buttonListScaleContainer )
	local buttonListLeftOffset = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		buttonListLeftOffset = CoD.Menu.SplitscreenSideOffset
	end
	self.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeftOffset,
		right = buttonListLeftOffset + 250,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	buttonListScaleContainer:addElement( self.buttonList )
	if not Engine.IsSplitscreen() and Engine.SessionModeIsMode( CoD.SESSIONMODE_ONLINE ) then
		local numClassSets = Engine.GetNumberOfClassSetsOwned( controller )
		if numClassSets and numClassSets > 0 then
			local classSetName = LUI.UIText.new()
			classSetName:setLeftRight( true, false, 0, 0 )
			classSetName:setTopBottom( true, false, 0, CoD.textSize.Condensed )
			classSetName:setFont( CoD.fonts.Condensed )
			self.buttonList:addElement( classSetName )
			local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
			local classSetNameString = Engine.GetClassSetName( controller, currentClassSetIndex )
			classSetName:setText( classSetNameString )
			self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
		end
	end
	local lastSelected = CoD.T6ChangeClass.GetProfileLoadoutChoice( controller )
	CoD.T6ChangeClass.AddCustomClassButtons( self, controller, lastSelected )
	if not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		CoD.T6ChangeClass.AddPrestigeClassButtons( self, controller, lastSelected )
	end
	CoD.T6ChangeClass.AddDefaultClassButtons( self, controller, lastSelected )
	CoD.T6ChangeClass.CheckFocus( self )
	LUI.UIVerticalList.UpdateNavigation( self.buttonList )
end

CoD.T6ChangeClass.TouchWeaponTextures = function ( self, event )
	Engine.StreamTouchWeaponTextures( self:getOwner() )
end

local CoD_ChangeClass_close = function ( self )
	if self.menuResponseSent ~= true then
		Engine.SendMenuResponse( self:getOwner(), "changeclass", "back" )
	end
	LUI.UIElement.close( self )
end

LUI.createMenu.changeclass = function ( controller )
	local titleText = Engine.ToUpper( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	local ChangeClass = CoD.InGameMenu.New( "changeclass", controller, titleText )
	local fullscreenSizeAdjustment = 20
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		ChangeClass:sizeToSafeArea( controller )
		fullscreenSizeAdjustment = 0
		ChangeClass:updateTitleForSplitscreen()
		ChangeClass:updateButtonPromptBarsForSplitscreen()
	end
	CoD.CACUtility.SetDefaultCACRoot( controller )
	ChangeClass:setOwner( controller )
	ChangeClass:addButtonPrompts()
	local previewScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	previewScaleContainer:setLeftRight( false, true, 0, 0 )
	previewScaleContainer:setTopBottom( true, false, CoD.Menu.TitleHeight, 0 )
	ChangeClass:addElement( previewScaleContainer )
	local previewRight = 0
	local classPreviewWidth = CoD.Menu.Width - CoD.ButtonList.DefaultWidth + 110 - fullscreenSizeAdjustment
	if Engine.IsSplitscreen() then
		previewRight = -CoD.Menu.SplitscreenSideOffset
		classPreviewWidth = CoD.Menu.Width - CoD.ButtonList.DefaultWidth * 1.5
		ChangeClass.classPreview = CoD.SplitscreenClassPreview.New( controller, classPreviewWidth )
	else
		ChangeClass.classPreview = CoD.ClassPreview.New( controller, classPreviewWidth )
	end
	ChangeClass.classPreview:setLeftRight( false, true, previewRight - classPreviewWidth, previewRight )
	ChangeClass.classPreview:setTopBottom( true, true, 0, 0 )
	ChangeClass.classPreview:setAlpha( 1 )
	previewScaleContainer:addElement( ChangeClass.classPreview )
	ChangeClass:registerEventHandler( "row_gain_focus", CoD.T6ChangeClass.RowGainFocus )
	ChangeClass:registerEventHandler( "sendMenuResponse_CustomClassSelected", CoD.T6ChangeClass.SendMenuResponseCustomClassSelected )
	ChangeClass:registerEventHandler( "changeclass_streamtextures", CoD.T6ChangeClass.TouchWeaponTextures )
	ChangeClass:addElement( LUI.UITimer.new( 50, "changeclass_streamtextures", false, ChangeClass ) )
	CoD.T6ChangeClass.PrepareButtonList( controller, ChangeClass )
	ChangeClass.close = CoD_ChangeClass_close
	return ChangeClass
end

