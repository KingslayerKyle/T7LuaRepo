require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Barracks.CombatRecordStatHeader" )
require( "ui.uieditor.widgets.Barracks.CombatRecordRightTitleWithBackground" )

LUI.createMenu.CombatRecordZMMaps = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordZMMaps" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordZMMaps.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( false, false, -576, -265 )
	BlackTint:setTopBottom( false, false, -276, 302 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_arena" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ItemList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ItemList:makeFocusable()
	ItemList:setLeftRight( true, false, 79, 359 )
	ItemList:setTopBottom( true, false, 157.5, 625.5 )
	ItemList:setWidgetType( CoD.CombatRecordStatListItem )
	ItemList:setVerticalCount( 10 )
	ItemList:setVerticalCounter( CoD.verticalCounter )
	ItemList:setDataSource( "CombatRecordZMMapsList" )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 81, 154 )
	WeaponLabel:setTopBottom( true, false, 123, 150.5 )
	WeaponLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	WeaponLabel:setText( Engine.Localize( "ZMUI_MAP_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, false, 270.5, 359 )
	StatLabel:setTopBottom( true, false, 123, 150.5 )
	StatLabel:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	StatLabel:setText( Engine.Localize( "MENU_ROUND_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local HighestRound = CoD.CombatRecordStatHeader.new( self, controller )
	HighestRound:setLeftRight( false, false, -213.14, -55.14 )
	HighestRound:setTopBottom( false, false, -203.5, -147.5 )
	HighestRound.StatLabel:setText( Engine.Localize( "CPUI_HIGHEST_ROUND_CAPS" ) )
	HighestRound.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( HighestRound )
	self.HighestRound = HighestRound
	
	local AverageRounds = CoD.CombatRecordStatHeader.new( self, controller )
	AverageRounds:setLeftRight( false, false, -55.14, 68.86 )
	AverageRounds:setTopBottom( false, false, -203.5, -147.5 )
	AverageRounds.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_ROUNDS_CAPS" ) )
	AverageRounds.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( AverageRounds )
	self.AverageRounds = AverageRounds
	
	local AverageDowns = CoD.CombatRecordStatHeader.new( self, controller )
	AverageDowns:setLeftRight( false, false, 68.86, 192.86 )
	AverageDowns:setTopBottom( false, false, -203.5, -147.5 )
	AverageDowns.StatLabel:setText( Engine.Localize( "MENU_AVERAGE_DOWNS_CAPS" ) )
	AverageDowns.ComparedStatValue:setText( Engine.Localize( "" ) )
	self:addElement( AverageDowns )
	self.AverageDowns = AverageDowns
	
	local MapNameTitle = CoD.CombatRecordRightTitleWithBackground.new( self, controller )
	MapNameTitle:setLeftRight( false, true, -853.14, -707.14 )
	MapNameTitle:setTopBottom( true, false, 125.5, 155.5 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( true, false, 423.86, 1189.48 )
	MapPreview:setTopBottom( true, false, 229.5, 551.5 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	HighestRound:linkToElementModel( ItemList, "highestRound", true, function ( model )
		local highestRound = Engine.GetModelValue( model )
		if highestRound then
			HighestRound.StatValue:setText( Engine.Localize( highestRound ) )
		end
	end )
	AverageRounds:linkToElementModel( ItemList, "avgRounds", true, function ( model )
		local avgRounds = Engine.GetModelValue( model )
		if avgRounds then
			AverageRounds.StatValue:setText( Engine.Localize( avgRounds ) )
		end
	end )
	AverageDowns:linkToElementModel( ItemList, "avgDowns", true, function ( model )
		local avgDowns = Engine.GetModelValue( model )
		if avgDowns then
			AverageDowns.StatValue:setText( Engine.Localize( avgDowns ) )
		end
	end )
	MapNameTitle:linkToElementModel( ItemList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			MapNameTitle.Label:setText( Engine.Localize( name ) )
		end
	end )
	MapPreview:linkToElementModel( ItemList, "previewImage", true, function ( model )
		local previewImage = Engine.GetModelValue( model )
		if previewImage then
			MapPreview:setImage( RegisterImage( previewImage ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f7_local0 = nil
		ShowHeaderKickerAndIcon( self )
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode( "" )
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f7_local0 then
			f7_local0 = self:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
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
		element.ItemList:close()
		element.HighestRound:close()
		element.AverageRounds:close()
		element.AverageDowns:close()
		element.MapNameTitle:close()
		element.MapPreview:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordZMMaps.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

