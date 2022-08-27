-- b89fff7c8d6dd1f29ecb66a5291adc97
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
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
	local f2_local1 = self
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_arena" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 79, 359 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CPMapsList" )
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
	StatLabel:setLeftRight( false, false, -420.5, -281 )
	StatLabel:setTopBottom( true, false, 123, 150.5 )
	StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local HighestRound = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	HighestRound:setLeftRight( false, false, -228.2, -104.2 )
	HighestRound:setTopBottom( true, false, 179.5, 235.5 )
	HighestRound.StatLabel:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	HighestRound.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( HighestRound )
	self.HighestRound = HighestRound
	
	local AverageRounds = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	AverageRounds:setLeftRight( false, false, -104.2, 19.8 )
	AverageRounds:setTopBottom( true, false, 179.5, 235.5 )
	AverageRounds.StatLabel:setText( Engine.Localize( "CPUI_ACCOLADES" ) )
	AverageRounds.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( AverageRounds )
	self.AverageRounds = AverageRounds
	
	local AverageDowns = CoD.CombatRecordStatHeader.new( f2_local1, controller )
	AverageDowns:setLeftRight( false, false, 19.8, 143.8 )
	AverageDowns:setTopBottom( true, false, 179.5, 235.5 )
	AverageDowns.StatLabel:setText( Engine.Localize( "CPUI_COLLECTIBLES_CAPS" ) )
	AverageDowns.ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	self:addElement( AverageDowns )
	self.AverageDowns = AverageDowns
	
	local MapNameTitle = CoD.CombatRecordRightTitleWithBackground.new( f2_local1, controller )
	MapNameTitle:setLeftRight( false, false, -228, -82 )
	MapNameTitle:setTopBottom( true, false, 147.5, 177.5 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local CPFrameBox = CoD.CP_FrameBox.new( f2_local1, controller )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		ShowHeaderKickerAndIcon( f2_local1 )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		GoBack( self, f16_arg2 )
		ClearMenuSavedState( f16_arg1 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
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

