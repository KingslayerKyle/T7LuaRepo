require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.CPLevels.CP_FrameBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	SetGlobalModelValueTrue( "inBarracks" )
end

LUI.createMenu.CombatRecordCPMaps = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordCPMaps" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCPMaps.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0.5, 0.5, -864, -398 )
	BlackTint:setTopBottom( 0, 1, 126, -86 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_arena" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0, 0, 118, 538 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CPMapsList" )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( 0.5, 0.5, -839, -729 )
	WeaponLabel:setTopBottom( 0, 0, 185, 226 )
	WeaponLabel:setText( Engine.Localize( "CPUI_MISSION_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0.5, 0.5, -631, -422 )
	StatLabel:setTopBottom( 0, 0, 185, 226 )
	StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local HighestRound = CoD.CombatRecordStatHeader.new( self, controller )
	HighestRound:setLeftRight( 0.5, 0.5, -342, -156 )
	HighestRound:setTopBottom( 0, 0, 269, 353 )
	HighestRound.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	HighestRound.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( HighestRound )
	self.HighestRound = HighestRound
	
	local AverageRounds = CoD.CombatRecordStatHeader.new( self, controller )
	AverageRounds:setLeftRight( 0.5, 0.5, -156, 30 )
	AverageRounds:setTopBottom( 0, 0, 269, 353 )
	AverageRounds.StatLabel:setText( Engine.Localize( "CPUI_ACCOLADES" ) )
	AverageRounds.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( AverageRounds )
	self.AverageRounds = AverageRounds
	
	local AverageDowns = CoD.CombatRecordStatHeader.new( self, controller )
	AverageDowns:setLeftRight( 0.5, 0.5, 30, 216 )
	AverageDowns:setTopBottom( 0, 0, 269, 353 )
	AverageDowns.StatLabel:setText( Engine.Localize( "CPUI_COLLECTIBLES_CAPS" ) )
	AverageDowns.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( AverageDowns )
	self.AverageDowns = AverageDowns
	
	local MapNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	MapNameTitle:setLeftRight( 0.5, 0.5, -342, -123 )
	MapNameTitle:setTopBottom( 0, 0, 221, 266 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local CPFrameBox = CoD.CP_FrameBox.new( self, controller )
	CPFrameBox:setLeftRight( 0.5, 0.5, -344, 584 )
	CPFrameBox:setTopBottom( 0, 0, 363, 891 )
	self:addElement( CPFrameBox )
	self.CPFrameBox = CPFrameBox
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( 0.5, 0.5, -342, 583 )
	MapPreview:setTopBottom( 0, 0, 366, 890 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local CompletedDifficultyLabel = LUI.UIText.new()
	CompletedDifficultyLabel:setLeftRight( 0.5, 0.5, 592, 852 )
	CompletedDifficultyLabel:setTopBottom( 0, 0, 389, 422 )
	CompletedDifficultyLabel:setText( Engine.Localize( "MENU_DIFFICULTY_COMPLETED" ) )
	CompletedDifficultyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletedDifficultyLabel )
	self.CompletedDifficultyLabel = CompletedDifficultyLabel
	
	local difficulty = LUI.UIText.new()
	difficulty:setLeftRight( 0.5, 0.5, 667, 791 )
	difficulty:setTopBottom( 0, 0, 569, 599 )
	difficulty:setTTF( "fonts/default.ttf" )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( difficulty )
	self.difficulty = difficulty
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( 0.5, 0.5, -325, 565 )
	MapName:setTopBottom( 0, 0, 809, 842 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MapLocation = LUI.UIText.new()
	MapLocation:setLeftRight( 0.5, 0.5, -325, 565 )
	MapLocation:setTopBottom( 0, 0, 842, 869 )
	MapLocation:setTTF( "fonts/default.ttf" )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MapLocation )
	self.MapLocation = MapLocation
	
	local CompletedDifficultyImage = LUI.UIImage.new()
	CompletedDifficultyImage:setLeftRight( 0.5, 0.5, 667, 791 )
	CompletedDifficultyImage:setTopBottom( 0, 0, 443, 569 )
	self:addElement( CompletedDifficultyImage )
	self.CompletedDifficultyImage = CompletedDifficultyImage
	
	HighestRound:linkToElementModel( ItemList, "bestScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HighestRound.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	AverageRounds:linkToElementModel( ItemList, "accoladesFound", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AverageRounds.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	AverageDowns:linkToElementModel( ItemList, "collectiblesFound", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AverageDowns.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapNameTitle.Label:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapPreview:linkToElementModel( ItemList, "Image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapPreview:setImage( RegisterImage( modelValue ) )
		end
	end )
	CompletedDifficultyLabel:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyLabel:setAlpha( modelValue )
		end
	end )
	difficulty:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			difficulty:setAlpha( modelValue )
		end
	end )
	difficulty:linkToElementModel( ItemList, "completedDifficultyText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			difficulty:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapName:linkToElementModel( ItemList, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapLocation:linkToElementModel( ItemList, "mapLocation", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapLocation:setText( Engine.Localize( modelValue ) )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyImage:setAlpha( modelValue )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( ItemList, "completedDifficulty", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	MenuFrame.navigation = {
		left = ItemList,
		down = ItemList
	}
	ItemList.navigation = {
		up = MenuFrame,
		right = MenuFrame
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBarracks" )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	ItemList.id = "ItemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ItemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.ItemList:close()
		self.HighestRound:close()
		self.AverageRounds:close()
		self.AverageDowns:close()
		self.MapNameTitle:close()
		self.CPFrameBox:close()
		self.MapPreview:close()
		self.CompletedDifficultyLabel:close()
		self.difficulty:close()
		self.MapName:close()
		self.MapLocation:close()
		self.CompletedDifficultyImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordCPMaps.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

