require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Minimap" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Utilities.ProgressBar_Rank" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ConnectionMeterContainer" )

local PostLoadFunc = function ( self, controller, menu )
	Engine.UserTestBuildPauseEvent( controller, true )
	Engine.PlaySound( "uin_main_pause" )
	local f1_local0 = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	self.mapName:setText( Engine.Localize( f1_local0 .. "_CAPS" ) )
	self.mapLocation:setText( Engine.Localize( f1_local0 .. "_LOC" ) )
	self.GameTypeDesc:setText( "" )
	local f1_local1 = Dvar.ui_gametype:get()
	if f1_local1 ~= nil and f1_local1 ~= "" then
		self.GameTypeDesc:setText( Engine.Localize( Engine.StructTableLookupString( "game_types", "name", f1_local1, "description" ) ) )
	end
	if LuaUtils.IsGamescomBuild() then
		self.NetworkStatsRowWidgetContainer0:setAlpha( 0 )
	end
end

CoD.StartMenu_GameOptions = InheritFrom( LUI.UIElement )
CoD.StartMenu_GameOptions.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_GameOptions )
	self.id = "StartMenu_GameOptions"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 12, 292 )
	buttonList:setTopBottom( true, false, 5, 173 )
	buttonList:setDataSource( "StartMenuGameOptions" )
	buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local minimap = CoD.StartMenu_Minimap.new( menu, controller )
	minimap:setLeftRight( true, false, 429.64, 1062.64 )
	minimap:setTopBottom( true, false, 14.41, 367.78 )
	minimap:setAlpha( 0.25 )
	minimap:setScale( 0.9 )
	self:addElement( minimap )
	self.minimap = minimap
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, false, 460.01, 1033.64 )
	TitleGlow1:setTopBottom( true, false, -2, 35 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local mapName = LUI.UIText.new()
	mapName:setLeftRight( true, false, 469.3, 1025.7 )
	mapName:setTopBottom( true, false, 5, 30 )
	mapName:setRGB( 0, 0, 0 )
	mapName:setTTF( "fonts/escom.ttf" )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	mapName:subscribeToGlobalModel( controller, "MapInfo", "mapName", function ( model )
		local _mapName = Engine.GetModelValue( model )
		if _mapName then
			mapName:setText( Engine.Localize( _mapName ) )
		end
	end )
	self:addElement( mapName )
	self.mapName = mapName
	
	local mapLocation = LUI.UIText.new()
	mapLocation:setLeftRight( true, false, 470, 1018.39 )
	mapLocation:setTopBottom( true, false, 9.41, 29.41 )
	mapLocation:setRGB( 0, 0, 0 )
	mapLocation:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	mapLocation:subscribeToGlobalModel( controller, "MapInfo", "location", function ( model )
		local location = Engine.GetModelValue( model )
		if location then
			mapLocation:setText( Engine.Localize( location ) )
		end
	end )
	self:addElement( mapLocation )
	self.mapLocation = mapLocation
	
	local rankProgress = CoD.ProgressBar_Rank.new( menu, controller )
	rankProgress:setLeftRight( true, false, 4.87, 1147.87 )
	rankProgress:setTopBottom( true, false, 451, 517 )
	rankProgress:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsPublicOrLeagueGame( controller )
			end
		}
	} )
	rankProgress:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "XPProgressionBar.nextRank" ), function ( model )
		menu:updateElementState( rankProgress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "XPProgressionBar.nextRank"
		} )
	end )
	rankProgress:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( rankProgress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( rankProgress )
	self.rankProgress = rankProgress
	
	local GameType = LUI.UIText.new()
	GameType:setLeftRight( true, false, 558.23, 1033.64 )
	GameType:setTopBottom( true, false, 378.87, 402.87 )
	GameType:setText( Engine.Localize( LocalizedGameType( "Domination" ) ) )
	GameType:setTTF( "fonts/default.ttf" )
	GameType:setLetterSpacing( 1 )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameType )
	self.GameType = GameType
	
	local GameTypeDesc = LUI.UIText.new()
	GameTypeDesc:setLeftRight( true, false, 559.23, 1033.64 )
	GameTypeDesc:setTopBottom( true, false, 403.37, 425.37 )
	GameTypeDesc:setText( Engine.Localize( "MENU_NEW" ) )
	GameTypeDesc:setTTF( "fonts/default.ttf" )
	GameTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTypeDesc )
	self.GameTypeDesc = GameTypeDesc
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 460.01, 547.14 )
	GameTypeIcon:setTopBottom( true, false, 372.78, 459.91 )
	GameTypeIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			GameTypeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 1023.87, 1059.87 )
	Pixel2000:setTopBottom( true, false, 30.91, 34.91 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel2002 = LUI.UIImage.new()
	Pixel2002:setLeftRight( true, false, 1023.87, 1059.87 )
	Pixel2002:setTopBottom( true, false, 348, 352 )
	Pixel2002:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2002 )
	self.Pixel2002 = Pixel2002
	
	local Pixel20000 = LUI.UIImage.new()
	Pixel20000:setLeftRight( true, false, 433.3, 469.3 )
	Pixel20000:setTopBottom( true, false, 30.91, 34.91 )
	Pixel20000:setYRot( 180 )
	Pixel20000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20000 )
	self.Pixel20000 = Pixel20000
	
	local Pixel20020 = LUI.UIImage.new()
	Pixel20020:setLeftRight( true, false, 433.3, 469.3 )
	Pixel20020:setTopBottom( true, false, 348, 352 )
	Pixel20020:setYRot( 180 )
	Pixel20020:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20020:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20020 )
	self.Pixel20020 = Pixel20020
	
	local StartMenuConnectionMeterContainer0 = CoD.StartMenu_ConnectionMeterContainer.new( menu, controller )
	StartMenuConnectionMeterContainer0:setLeftRight( true, false, 55.5, 404.5 )
	StartMenuConnectionMeterContainer0:setTopBottom( true, false, 206, 409.37 )
	self:addElement( StartMenuConnectionMeterContainer0 )
	self.StartMenuConnectionMeterContainer0 = StartMenuConnectionMeterContainer0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 433.3, 469.3 )
	Image0:setTopBottom( true, false, 0, 4 )
	Image0:setYRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 1023.87, 1059.87 )
	Image1:setTopBottom( true, false, 0, 4 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				minimap:completeAnimation()
				self.minimap:setAlpha( 1 )
				self.clipFinished( minimap, {} )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setAlpha( 1 )
				self.clipFinished( TitleGlow1, {} )
				mapName:completeAnimation()
				self.mapName:setLeftRight( true, false, 469.3, 1023.87 )
				self.mapName:setTopBottom( true, false, 5, 30 )
				self.mapName:setRGB( 0, 0, 0 )
				self.mapName:setAlpha( 1 )
				self.clipFinished( mapName, {} )
				mapLocation:completeAnimation()
				self.mapLocation:setLeftRight( true, false, 469.3, 1018.39 )
				self.mapLocation:setTopBottom( true, false, 9.41, 29.41 )
				self.mapLocation:setRGB( 0, 0, 0 )
				self.mapLocation:setAlpha( 1 )
				self.mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( mapLocation, {} )
				rankProgress:completeAnimation()
				self.rankProgress:setLeftRight( true, false, 4.87, 1147.87 )
				self.rankProgress:setTopBottom( true, false, 451, 517 )
				self.clipFinished( rankProgress, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 1 )
				self.clipFinished( GameType, {} )
				GameTypeDesc:completeAnimation()
				self.GameTypeDesc:setAlpha( 1 )
				self.clipFinished( GameTypeDesc, {} )
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 1 )
				self.clipFinished( GameTypeIcon, {} )
			end
		},
		FreeRun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				minimap:completeAnimation()
				self.minimap:setAlpha( 0 )
				self.clipFinished( minimap, {} )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setAlpha( 1 )
				self.clipFinished( TitleGlow1, {} )
				mapName:completeAnimation()
				self.mapName:setLeftRight( true, false, 469.3, 1023.87 )
				self.mapName:setTopBottom( true, false, 5, 30 )
				self.mapName:setRGB( 0, 0, 0 )
				self.mapName:setAlpha( 1 )
				self.clipFinished( mapName, {} )
				mapLocation:completeAnimation()
				self.mapLocation:setLeftRight( true, false, 469.3, 1018.39 )
				self.mapLocation:setTopBottom( true, false, 9.41, 29.41 )
				self.mapLocation:setRGB( 0, 0, 0 )
				self.mapLocation:setAlpha( 1 )
				self.mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( mapLocation, {} )
				rankProgress:completeAnimation()
				self.rankProgress:setLeftRight( true, false, 4.87, 1147.87 )
				self.rankProgress:setTopBottom( true, false, 451, 517 )
				self.clipFinished( rankProgress, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 1 )
				self.clipFinished( GameType, {} )
				GameTypeDesc:completeAnimation()
				self.GameTypeDesc:setAlpha( 1 )
				self.clipFinished( GameTypeDesc, {} )
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 1 )
				self.clipFinished( GameTypeIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FreeRun",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "fr" )
			end
		}
	} )
	buttonList.id = "buttonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonList:close()
		element.minimap:close()
		element.TitleGlow1:close()
		element.rankProgress:close()
		element.StartMenuConnectionMeterContainer0:close()
		element.mapName:close()
		element.mapLocation:close()
		element.GameTypeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

