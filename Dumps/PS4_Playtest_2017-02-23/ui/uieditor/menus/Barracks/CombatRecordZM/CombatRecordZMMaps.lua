require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

LUI.createMenu.CombatRecordZMMaps = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordZMMaps" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordZMMaps.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0.5, 0.5, -864, -398 )
	BlackTint:setTopBottom( 0.5, 0.5, -414, 453 )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_arena" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ItemList:makeFocusable()
	ItemList:setLeftRight( 0, 0, 118, 538 )
	ItemList:setTopBottom( 0, 0, 243, 931 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setDataSource( "CombatRecordZMMapsList" )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( 0, 0, 121, 231 )
	WeaponLabel:setTopBottom( 0, 0, 185, 226 )
	WeaponLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	WeaponLabel:setText( Engine.Localize( "ZMUI_MAP_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 0, 0, 406, 539 )
	StatLabel:setTopBottom( 0, 0, 185, 226 )
	StatLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	StatLabel:setText( Engine.Localize( "MENU_ROUND_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local HighestRound = CoD.CombatRecordStatHeader.new( self, controller )
	HighestRound:setLeftRight( 0.5, 0.5, -320, -83 )
	HighestRound:setTopBottom( 0.5, 0.5, -305, -221 )
	HighestRound.StatLabel:setText( Engine.Localize( "CPUI_HIGHEST_ROUND_CAPS" ) )
	HighestRound.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( HighestRound )
	self.HighestRound = HighestRound
	
	local AverageRounds = CoD.CombatRecordStatHeader.new( self, controller )
	AverageRounds:setLeftRight( 0.5, 0.5, -83, 103 )
	AverageRounds:setTopBottom( 0.5, 0.5, -305, -221 )
	AverageRounds.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_CAPS" ) )
	AverageRounds.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( AverageRounds )
	self.AverageRounds = AverageRounds
	
	local AverageDowns = CoD.CombatRecordStatHeader.new( self, controller )
	AverageDowns:setLeftRight( 0.5, 0.5, 103, 289 )
	AverageDowns:setTopBottom( 0.5, 0.5, -305, -221 )
	AverageDowns.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_DOWNS_CAPS" ) )
	AverageDowns.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( AverageDowns )
	self.AverageDowns = AverageDowns
	
	local MapNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	MapNameTitle:setLeftRight( 1, 1, -1280, -1061 )
	MapNameTitle:setTopBottom( 0, 0, 188, 233 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( 0, 0, 636, 1784 )
	MapPreview:setTopBottom( 0, 0, 344, 827 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	HighestRound:linkToElementModel( ItemList, "highestRound", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HighestRound.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	AverageRounds:linkToElementModel( ItemList, "avgRounds", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AverageRounds.StatValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	AverageDowns:linkToElementModel( ItemList, "avgDowns", true, function ( model )
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
	MapPreview:linkToElementModel( ItemList, "previewImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapPreview:setImage( RegisterImage( modelValue ) )
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
		self.MapPreview:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordZMMaps.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

