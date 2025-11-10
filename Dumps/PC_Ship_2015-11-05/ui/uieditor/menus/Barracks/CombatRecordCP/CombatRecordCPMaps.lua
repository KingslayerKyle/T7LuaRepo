require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.CPLevels.CP_FrameBox" )

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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCPMaps.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( false, false, -576, -265 )
	BlackTint:setTopBottom( true, true, 84, -58 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_arena" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 22, 82 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 79, 359 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setDataSource( "CPMapsList" )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( false, false, -559, -486 )
	WeaponLabel:setTopBottom( true, false, 123, 150.5 )
	WeaponLabel:setText( Engine.Localize( "CPUI_MISSION_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, false, -350.5, -281 )
	StatLabel:setTopBottom( true, false, 123, 150.5 )
	StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local HighestRound = CoD.CombatRecordStatHeader.new( self, controller )
	HighestRound:setLeftRight( false, false, -228.2, -104.2 )
	HighestRound:setTopBottom( true, false, 179.5, 235.5 )
	HighestRound.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	self:addElement( HighestRound )
	self.HighestRound = HighestRound
	
	local AverageRounds = CoD.CombatRecordStatHeader.new( self, controller )
	AverageRounds:setLeftRight( false, false, -104.2, 19.8 )
	AverageRounds:setTopBottom( true, false, 179.5, 235.5 )
	AverageRounds.StatLabel:setText( Engine.Localize( "CPUI_ACCOLADES" ) )
	self:addElement( AverageRounds )
	self.AverageRounds = AverageRounds
	
	local AverageDowns = CoD.CombatRecordStatHeader.new( self, controller )
	AverageDowns:setLeftRight( false, false, 19.8, 143.8 )
	AverageDowns:setTopBottom( true, false, 179.5, 235.5 )
	AverageDowns.StatLabel:setText( Engine.Localize( "CPUI_COLLECTIBLES_CAPS" ) )
	self:addElement( AverageDowns )
	self.AverageDowns = AverageDowns
	
	local MapNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	MapNameTitle:setLeftRight( false, false, -228, -82 )
	MapNameTitle:setTopBottom( true, false, 147.5, 177.5 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local CPFrameBox = CoD.CP_FrameBox.new( self, controller )
	CPFrameBox:setLeftRight( false, false, -229.2, 389.35 )
	CPFrameBox:setTopBottom( true, false, 242, 594.15 )
	self:addElement( CPFrameBox )
	self.CPFrameBox = CPFrameBox
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( false, false, -228.2, 388.35 )
	MapPreview:setTopBottom( true, false, 243.65, 593.15 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local CompletedDifficultyLabel = LUI.UIText.new()
	CompletedDifficultyLabel:setLeftRight( false, false, 394.75, 568.25 )
	CompletedDifficultyLabel:setTopBottom( true, false, 259.63, 281.63 )
	CompletedDifficultyLabel:setText( Engine.Localize( "MENU_DIFFICULTY_COMPLETED" ) )
	CompletedDifficultyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletedDifficultyLabel )
	self.CompletedDifficultyLabel = CompletedDifficultyLabel
	
	local difficulty = LUI.UIText.new()
	difficulty:setLeftRight( false, false, 444.75, 527.25 )
	difficulty:setTopBottom( true, false, 379.63, 399.63 )
	difficulty:setTTF( "fonts/default.ttf" )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( difficulty )
	self.difficulty = difficulty
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( false, false, -216.5, 376.5 )
	MapName:setTopBottom( true, false, 539.65, 561.65 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MapLocation = LUI.UIText.new()
	MapLocation:setLeftRight( false, false, -216.5, 376.5 )
	MapLocation:setTopBottom( true, false, 561.65, 579.65 )
	MapLocation:setTTF( "fonts/default.ttf" )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MapLocation )
	self.MapLocation = MapLocation
	
	local CompletedDifficultyImage = LUI.UIImage.new()
	CompletedDifficultyImage:setLeftRight( false, false, 444.75, 527.25 )
	CompletedDifficultyImage:setTopBottom( true, false, 295.63, 379.63 )
	self:addElement( CompletedDifficultyImage )
	self.CompletedDifficultyImage = CompletedDifficultyImage
	
	HighestRound:linkToElementModel( ItemList, "bestScore", true, function ( model )
		local bestScore = Engine.GetModelValue( model )
		if bestScore then
			HighestRound.StatValue:setText( Engine.Localize( bestScore ) )
		end
	end )
	AverageRounds:linkToElementModel( ItemList, "accoladesFound", true, function ( model )
		local accoladesFound = Engine.GetModelValue( model )
		if accoladesFound then
			AverageRounds.StatValue:setText( Engine.Localize( accoladesFound ) )
		end
	end )
	AverageDowns:linkToElementModel( ItemList, "collectiblesFound", true, function ( model )
		local collectiblesFound = Engine.GetModelValue( model )
		if collectiblesFound then
			AverageDowns.StatValue:setText( Engine.Localize( collectiblesFound ) )
		end
	end )
	MapNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			MapNameTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	MapPreview:linkToElementModel( ItemList, "Image", true, function ( model )
		local Image = Engine.GetModelValue( model )
		if Image then
			MapPreview:setImage( RegisterImage( Image ) )
		end
	end )
	CompletedDifficultyLabel:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			CompletedDifficultyLabel:setAlpha( completedDifficultyAlpha )
		end
	end )
	difficulty:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			difficulty:setAlpha( completedDifficultyAlpha )
		end
	end )
	difficulty:linkToElementModel( ItemList, "completedDifficultyText", true, function ( model )
		local completedDifficultyText = Engine.GetModelValue( model )
		if completedDifficultyText then
			difficulty:setText( Engine.Localize( completedDifficultyText ) )
		end
	end )
	MapName:linkToElementModel( ItemList, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapName:setText( Engine.Localize( mapName ) )
		end
	end )
	MapLocation:linkToElementModel( ItemList, "mapLocation", true, function ( model )
		local mapLocation = Engine.GetModelValue( model )
		if mapLocation then
			MapLocation:setText( Engine.Localize( mapLocation ) )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( ItemList, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			CompletedDifficultyImage:setAlpha( completedDifficultyAlpha )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( ItemList, "completedDifficulty", true, function ( model )
		local completedDifficulty = Engine.GetModelValue( model )
		if completedDifficulty then
			CompletedDifficultyImage:setImage( RegisterImage( completedDifficulty ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f15_local0 = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		if not f15_local0 then
			f15_local0 = self:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBarracks" )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.ItemList:close()
		element.HighestRound:close()
		element.AverageRounds:close()
		element.AverageDowns:close()
		element.MapNameTitle:close()
		element.CPFrameBox:close()
		element.MapPreview:close()
		element.CompletedDifficultyLabel:close()
		element.difficulty:close()
		element.MapName:close()
		element.MapLocation:close()
		element.CompletedDifficultyImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordCPMaps.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

