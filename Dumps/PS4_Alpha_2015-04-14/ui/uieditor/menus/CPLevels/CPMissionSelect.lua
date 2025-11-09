require( "ui.uieditor.widgets.ListButton" )

LUI.createMenu.CPMissionSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPMissionSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setRGB( 1, 1, 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 64, 0 )
	Title:setTopBottom( true, false, 38, 85 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "MPUI_MAP_CATEGORY_MISSIONS_DESC" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local MapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	MapList:makeFocusable()
	MapList:setLeftRight( true, false, 64, 424 )
	MapList:setTopBottom( true, false, 120, 562 )
	MapList:setRGB( 1, 1, 1 )
	MapList:setDataSource( "CPMapsList" )
	MapList:setWidgetType( CoD.ListButton )
	MapList:setVerticalCount( 12 )
	MapList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SetSelectedCPMission( self, element, controller )
		GoBack( self, controller )
		return retVal
	end )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( true, false, 450.38, 1216 )
	MapPreview:setTopBottom( true, false, 120, 442 )
	MapPreview:setRGB( 1, 1, 1 )
	MapPreview:setAlpha( 0 )
	MapPreview:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local MissionBriefTitle = LUI.UIText.new()
	MissionBriefTitle:setLeftRight( true, false, 450.38, 783.34 )
	MissionBriefTitle:setTopBottom( true, false, 466.84, 486.84 )
	MissionBriefTitle:setRGB( 1, 1, 1 )
	MissionBriefTitle:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	MissionBriefTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefTitle )
	self.MissionBriefTitle = MissionBriefTitle
	
	local MissionBriefText = LUI.UIText.new()
	MissionBriefText:setLeftRight( true, false, 450.38, 744.34 )
	MissionBriefText:setTopBottom( true, false, 493.84, 513.84 )
	MissionBriefText:setRGB( 1, 1, 1 )
	MissionBriefText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefText )
	self.MissionBriefText = MissionBriefText
	
	local MissionPerformanceRecordTitle = LUI.UIText.new()
	MissionPerformanceRecordTitle:setLeftRight( true, false, 783.34, 1216 )
	MissionPerformanceRecordTitle:setTopBottom( true, false, 466.84, 486.84 )
	MissionPerformanceRecordTitle:setRGB( 1, 1, 1 )
	MissionPerformanceRecordTitle:setText( Engine.Localize( "MISSION PERFORMANCE RECORD " ) )
	MissionPerformanceRecordTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MissionPerformanceRecordTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionPerformanceRecordTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionPerformanceRecordTitle )
	self.MissionPerformanceRecordTitle = MissionPerformanceRecordTitle
	
	local PersonalBestsHeader = LUI.UIImage.new()
	PersonalBestsHeader:setLeftRight( true, false, 783.34, 1045.34 )
	PersonalBestsHeader:setTopBottom( true, false, 491, 604 )
	PersonalBestsHeader:setRGB( 1, 1, 1 )
	PersonalBestsHeader:setAlpha( 0.49 )
	PersonalBestsHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( PersonalBestsHeader )
	self.PersonalBestsHeader = PersonalBestsHeader
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 783.34, 1045.34 )
	Image1:setTopBottom( true, false, 491, 515 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0.49 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1053, 1216 )
	Image2:setTopBottom( true, false, 491, 604 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setAlpha( 0.49 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 1053, 1216 )
	Image3:setTopBottom( true, false, 491, 515 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setAlpha( 0.49 )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 791.25, 909.25 )
	Image4:setTopBottom( true, false, 541, 588 )
	Image4:setRGB( 0, 0, 0 )
	Image4:setAlpha( 0.3 )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 921.25, 1039.26 )
	Image5:setTopBottom( true, false, 541, 588 )
	Image5:setRGB( 0, 0, 0 )
	Image5:setAlpha( 0.3 )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 1073, 1196 )
	Image6:setTopBottom( true, false, 541, 588 )
	Image6:setRGB( 0, 0, 0 )
	Image6:setAlpha( 0.3 )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 783.34, 1045.34 )
	TextBox0:setTopBottom( true, false, 492, 512 )
	TextBox0:setRGB( 0.31, 0.31, 0.31 )
	TextBox0:setText( Engine.Localize( "MPUI_PERSONAL_BESTS_CAPS" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 791.25, 909.25 )
	TextBox1:setTopBottom( true, false, 520, 541 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setText( Engine.Localize( "MENU_TIME" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 921.25, 1039.26 )
	TextBox2:setTopBottom( true, false, 520, 538 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "Individual Score" ) )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 921.25, 1039.26 )
	TextBox3:setTopBottom( true, false, 553, 576 )
	TextBox3:setRGB( 1, 1, 1 )
	TextBox3:setTTF( "fonts/escom.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 791.25, 909.26 )
	TextBox4:setTopBottom( true, false, 553, 576 )
	TextBox4:setRGB( 1, 1, 1 )
	TextBox4:setTTF( "fonts/escom.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local TextBox5 = LUI.UIText.new()
	TextBox5:setLeftRight( true, false, 1053, 1216 )
	TextBox5:setTopBottom( true, false, 493, 513 )
	TextBox5:setRGB( 0.31, 0.31, 0.31 )
	TextBox5:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	TextBox5:setTTF( "fonts/escom.ttf" )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox5 )
	self.TextBox5 = TextBox5
	
	local TextBox6 = LUI.UIText.new()
	TextBox6:setLeftRight( true, false, 1073, 1196 )
	TextBox6:setTopBottom( true, false, 520, 538 )
	TextBox6:setRGB( 1, 1, 1 )
	TextBox6:setText( Engine.Localize( "Found" ) )
	TextBox6:setTTF( "fonts/default.ttf" )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox6 )
	self.TextBox6 = TextBox6
	
	local TextBox7 = LUI.UIText.new()
	TextBox7:setLeftRight( true, false, 1073, 1196 )
	TextBox7:setTopBottom( true, false, 553, 576 )
	TextBox7:setRGB( 1, 1, 1 )
	TextBox7:setText( Engine.Localize( "2 of 6" ) )
	TextBox7:setTTF( "fonts/escom.ttf" )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox7 )
	self.TextBox7 = TextBox7
	
	MapPreview:linkToElementModel( MapList, "Image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapPreview:setImage( RegisterImage( modelValue ) )
		end
	end )
	MissionBriefText:linkToElementModel( MapList, "mapDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionBriefText:setText( Engine.Localize( modelValue ) )
		end
	end )
	TextBox3:linkToElementModel( MapList, "bestScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox3:setText( Engine.Localize( modelValue ) )
		end
	end )
	TextBox4:linkToElementModel( MapList, "bestTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox4:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	MapList.id = "MapList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MapList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.MapList:close()
		self.MapPreview:close()
		self.MissionBriefText:close()
		self.TextBox3:close()
		self.TextBox4:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

