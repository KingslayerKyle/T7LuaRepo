require( "ui.uieditor.widgets.ListButton" )

LUI.createMenu.ZMMapSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZMMapSelection" )
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
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 95, -57 )
	Background:setRGB( 0, 0, 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local TitleBackground = LUI.UIImage.new()
	TitleBackground:setLeftRight( true, false, 0, 1280 )
	TitleBackground:setTopBottom( true, false, 0, 95 )
	TitleBackground:setRGB( 0.14, 0.12, 0.12 )
	TitleBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local FooterBackground = LUI.UIImage.new()
	FooterBackground:setLeftRight( true, true, 0, 0 )
	FooterBackground:setTopBottom( false, true, -57, 0 )
	FooterBackground:setRGB( 0.14, 0.12, 0.12 )
	FooterBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBackground )
	self.FooterBackground = FooterBackground
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 64, 0 )
	Title:setTopBottom( true, false, 38, 85 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
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
	MapList:setDataSource( "ZMMapsList" )
	MapList:setWidgetType( CoD.ListButton )
	MapList:setVerticalCount( 12 )
	MapList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessZMMapSelectListAction( self, element, controller, self )
		return retVal
	end )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( true, false, 450.38, 1216 )
	MapPreview:setTopBottom( true, false, 120, 442 )
	MapPreview:setRGB( 1, 1, 1 )
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
	
	local PlayCount = LUI.UIText.new()
	PlayCount:setLeftRight( true, false, 883.04, 1216 )
	PlayCount:setTopBottom( true, false, 422, 442 )
	PlayCount:setRGB( 1, 1, 1 )
	PlayCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayCount )
	self.PlayCount = PlayCount
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( true, false, 450.38, 950.38 )
	MapName:setTopBottom( true, false, 400, 442 )
	MapName:setRGB( 1, 0.43, 0 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MapName )
	self.MapName = MapName
	
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
	PlayCount:linkToElementModel( MapList, "playingCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	MapName:linkToElementModel( MapList, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( modelValue ) )
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
		self.PlayCount:close()
		self.MapName:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

