require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Minimap" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Utilities.ProgressBar_Rank" )
require( "ui.uieditor.widgets.NetworkStats.NetworkStatsRowWidgetContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ConnectionMeterContainer" )

local PostLoadFunc = function ( self, controller, menu )
	Engine.UserTestBuildPauseEvent( controller, true )
	Engine.PlaySound( "uin_main_pause" )
	local mapNameText = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	local mapNameLocalized = Engine.Localize( mapNameText .. "_CAPS" )
	self.mapName:setText( mapNameLocalized )
	local geographicTextLocalized = Engine.Localize( mapNameText .. "_LOC" )
	self.mapLocation:setText( geographicTextLocalized )
	self.GameTypeDesc:setText( "" )
	local gametype = Dvar.ui_gametype:get()
	if gametype ~= nil and gametype ~= "" then
		local gameTypeDescription = Engine.StructTableLookupString( "game_types", "name", gametype, "description" )
		self.GameTypeDesc:setText( Engine.Localize( gameTypeDescription ) )
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
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( false, false, -651, 651 )
	Fade:setTopBottom( false, false, -376, 372 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 12, 292 )
	buttonList:setTopBottom( true, false, 4.91, 172.91 )
	buttonList:setDataSource( "StartMenuGameOptions" )
	buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
	minimap:setLeftRight( true, false, 506.64, 1139.64 )
	minimap:setTopBottom( true, false, 35, 388.37 )
	self:addElement( minimap )
	self.minimap = minimap
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, false, 505.01, 1141.64 )
	TitleGlow1:setTopBottom( true, false, -2, 35 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local mapName = LUI.UIText.new()
	mapName:setLeftRight( true, false, 514.3, 925.7 )
	mapName:setTopBottom( true, false, 4.91, 33.91 )
	mapName:setRGB( 0, 0, 0 )
	mapName:setTTF( "fonts/escom.ttf" )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	mapName:subscribeToGlobalModel( controller, "MapInfo", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			mapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( mapName )
	self.mapName = mapName
	
	local mapLocation = LUI.UIText.new()
	mapLocation:setLeftRight( true, false, 802, 1118.39 )
	mapLocation:setTopBottom( true, false, 8, 28 )
	mapLocation:setRGB( 0, 0, 0 )
	mapLocation:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	mapLocation:subscribeToGlobalModel( controller, "MapInfo", "location", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			mapLocation:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( mapLocation )
	self.mapLocation = mapLocation
	
	local rankProgress = CoD.ProgressBar_Rank.new( menu, controller )
	rankProgress:setLeftRight( true, false, 4.87, 1147.87 )
	rankProgress:setTopBottom( true, false, 451, 517 )
	self:addElement( rankProgress )
	self.rankProgress = rankProgress
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, -36, 0 )
	Pixel2001:setTopBottom( true, false, 106, 110 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local NetworkStatsRowWidgetContainer0 = CoD.NetworkStatsRowWidgetContainer.new( menu, controller )
	NetworkStatsRowWidgetContainer0:setLeftRight( true, false, 5, 307 )
	NetworkStatsRowWidgetContainer0:setTopBottom( true, false, 341.37, 493.37 )
	NetworkStatsRowWidgetContainer0:setAlpha( 0 )
	self:addElement( NetworkStatsRowWidgetContainer0 )
	self.NetworkStatsRowWidgetContainer0 = NetworkStatsRowWidgetContainer0
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 597, 762 )
	GameType:setTopBottom( true, false, 404.37, 428.37 )
	GameType:setText( Engine.Localize( LocalizedGameType( "Domination" ) ) )
	GameType:setTTF( "fonts/default.ttf" )
	GameType:setLetterSpacing( 1 )
	self:addElement( GameType )
	self.GameType = GameType
	
	local GameTypeDesc = LUI.UIText.new()
	GameTypeDesc:setLeftRight( true, false, 598, 1140.64 )
	GameTypeDesc:setTopBottom( true, false, 428.88, 450.88 )
	GameTypeDesc:setText( Engine.Localize( "MENU_NEW" ) )
	GameTypeDesc:setTTF( "fonts/default.ttf" )
	GameTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTypeDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTypeDesc )
	self.GameTypeDesc = GameTypeDesc
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( true, false, 507.01, 588.01 )
	GameTypeIcon:setTopBottom( true, false, 395.37, 476.37 )
	GameTypeIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, -36.13, -0.13 )
	Pixel20:setTopBottom( true, false, 486, 490 )
	Pixel20:setYRot( -180 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( true, false, 1146.87, 1182.87 )
	Pixel200:setTopBottom( true, false, 486, 490 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local Pixel2000 = LUI.UIImage.new()
	Pixel2000:setLeftRight( true, false, 1145.87, 1181.87 )
	Pixel2000:setTopBottom( true, false, 34, 38 )
	Pixel2000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2000 )
	self.Pixel2000 = Pixel2000
	
	local Pixel2002 = LUI.UIImage.new()
	Pixel2002:setLeftRight( true, false, 1146.87, 1182.87 )
	Pixel2002:setTopBottom( true, false, 386, 390 )
	Pixel2002:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2002 )
	self.Pixel2002 = Pixel2002
	
	local StartMenuConnectionMeterContainer0 = CoD.StartMenu_ConnectionMeterContainer.new( menu, controller )
	StartMenuConnectionMeterContainer0:setLeftRight( true, false, 55.5, 404.5 )
	StartMenuConnectionMeterContainer0:setTopBottom( true, false, 206, 409.37 )
	self:addElement( StartMenuConnectionMeterContainer0 )
	self.StartMenuConnectionMeterContainer0 = StartMenuConnectionMeterContainer0
	
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
				self.mapName:setLeftRight( true, false, 514.3, 925.7 )
				self.mapName:setTopBottom( true, false, 4.91, 33.91 )
				self.mapName:setRGB( 0, 0, 0 )
				self.mapName:setAlpha( 1 )
				self.clipFinished( mapName, {} )
				mapLocation:completeAnimation()
				self.mapLocation:setLeftRight( true, false, 802, 1118.39 )
				self.mapLocation:setTopBottom( true, false, 8, 28 )
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
		CP_PauseMenu = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				minimap:completeAnimation()
				self.minimap:setAlpha( 0 )
				self.clipFinished( minimap, {} )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setAlpha( 0 )
				self.clipFinished( TitleGlow1, {} )
				mapName:completeAnimation()
				self.mapName:setLeftRight( true, false, 392.3, 803.7 )
				self.mapName:setTopBottom( true, false, 8, 75 )
				self.mapName:setRGB( 1, 1, 1 )
				self.clipFinished( mapName, {} )
				mapLocation:completeAnimation()
				self.mapLocation:setLeftRight( true, false, 392.3, 606.01 )
				self.mapLocation:setTopBottom( true, false, 75, 110 )
				self.mapLocation:setRGB( 1, 1, 1 )
				self.mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( mapLocation, {} )
				rankProgress:completeAnimation()
				self.rankProgress:setLeftRight( true, false, 12, 307 )
				self.rankProgress:setTopBottom( true, false, 172.91, 238.91 )
				self.clipFinished( rankProgress, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 0 )
				self.clipFinished( GameType, {} )
				GameTypeDesc:completeAnimation()
				self.GameTypeDesc:setAlpha( 0 )
				self.clipFinished( GameTypeDesc, {} )
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 0 )
				self.clipFinished( GameTypeIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonList:close()
		self.minimap:close()
		self.TitleGlow1:close()
		self.rankProgress:close()
		self.NetworkStatsRowWidgetContainer0:close()
		self.StartMenuConnectionMeterContainer0:close()
		self.mapName:close()
		self.mapLocation:close()
		self.GameTypeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

