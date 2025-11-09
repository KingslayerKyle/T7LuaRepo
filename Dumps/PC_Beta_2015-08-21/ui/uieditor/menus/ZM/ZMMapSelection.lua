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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 95, -57 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleBackground = LUI.UIImage.new()
	TitleBackground:setLeftRight( true, false, 0, 1280 )
	TitleBackground:setTopBottom( true, false, 0, 95 )
	TitleBackground:setRGB( 0.14, 0.12, 0.12 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local FooterBackground = LUI.UIImage.new()
	FooterBackground:setLeftRight( true, true, 0, 0 )
	FooterBackground:setTopBottom( false, true, -57, 0 )
	FooterBackground:setRGB( 0.14, 0.12, 0.12 )
	self:addElement( FooterBackground )
	self.FooterBackground = FooterBackground
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 64, 0 )
	Title:setTopBottom( true, false, 38, 85 )
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
	MapList:setDataSource( "ZMMapsList" )
	MapList:setWidgetType( CoD.ListButton )
	MapList:setVerticalCount( 12 )
	MapList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	MapList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( MapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessZMMapSelectListAction( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( true, false, 450.38, 1216 )
	MapPreview:setTopBottom( true, false, 120, 442 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local MissionBriefTitle = LUI.UIText.new()
	MissionBriefTitle:setLeftRight( true, false, 450.38, 783.34 )
	MissionBriefTitle:setTopBottom( true, false, 466.84, 486.84 )
	MissionBriefTitle:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	MissionBriefTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefTitle )
	self.MissionBriefTitle = MissionBriefTitle
	
	local MissionBriefText = LUI.UIText.new()
	MissionBriefText:setLeftRight( true, false, 450.38, 744.34 )
	MissionBriefText:setTopBottom( true, false, 493.84, 513.84 )
	MissionBriefText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefText )
	self.MissionBriefText = MissionBriefText
	
	local PlayCount = LUI.UIText.new()
	PlayCount:setLeftRight( true, false, 883.04, 1216 )
	PlayCount:setTopBottom( true, false, 422, 442 )
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
		local Image = Engine.GetModelValue( model )
		if Image then
			MapPreview:setImage( RegisterImage( Image ) )
		end
	end )
	MissionBriefText:linkToElementModel( MapList, "mapDescription", true, function ( model )
		local mapDescription = Engine.GetModelValue( model )
		if mapDescription then
			MissionBriefText:setText( Engine.Localize( mapDescription ) )
		end
	end )
	PlayCount:linkToElementModel( MapList, "playingCount", true, function ( model )
		local playingCount = Engine.GetModelValue( model )
		if playingCount then
			PlayCount:setText( Engine.Localize( playingCount ) )
		end
	end )
	MapName:linkToElementModel( MapList, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapName:setText( Engine.Localize( mapName ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "BACK" )
		return true
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapList:close()
		element.MapPreview:close()
		element.MissionBriefText:close()
		element.PlayCount:close()
		element.MapName:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

