require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Minimap" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Utilities.ProgressBar_Rank" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Objectives" )

local PostLoadFunc = function ( self, controller, menu )
	Engine.UserTestBuildPauseEvent( controller, true )
	Engine.PlaySound( "uin_main_pause" )
	local mapNameText = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	local mapNameLocalized = Engine.Localize( mapNameText .. "_CAPS" )
	self.mapName:setText( mapNameLocalized )
	local geographicTextLocalized = Engine.Localize( mapNameText .. "_LOC" )
	self.mapLocation:setText( geographicTextLocalized )
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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 11, 291 )
	buttonList:setTopBottom( true, false, 2.91, 170.91 )
	buttonList:setRGB( 1, 1, 1 )
	buttonList:setDataSource( "StartMenuGameOptions" )
	buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	buttonList:setVerticalCount( 5 )
	buttonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local minimap = CoD.StartMenu_Minimap.new( menu, controller )
	minimap:setLeftRight( true, false, 11, 423 )
	minimap:setTopBottom( true, false, 218, 448 )
	minimap:setRGB( 1, 1, 1 )
	self:addElement( minimap )
	self.minimap = minimap
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, false, 10, 422.39 )
	TitleGlow1:setTopBottom( true, false, 178.71, 214.71 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local mapName = LUI.UIText.new()
	mapName:setLeftRight( true, false, 20.61, 432 )
	mapName:setTopBottom( true, false, 184.71, 213.71 )
	mapName:setRGB( 0, 0, 0 )
	mapName:setText( Engine.Localize( "SECTOR" ) )
	mapName:setTTF( "fonts/Entovo.ttf" )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	mapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( mapName )
	self.mapName = mapName
	
	local mapLocation = LUI.UIText.new()
	mapLocation:setLeftRight( true, false, 96, 412.39 )
	mapLocation:setTopBottom( true, false, 187.71, 207.71 )
	mapLocation:setRGB( 0, 0, 0 )
	mapLocation:setText( Engine.Localize( "JEBEL UWEINAT MOUNTAIN, EGYPT" ) )
	mapLocation:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	mapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( mapLocation )
	self.mapLocation = mapLocation
	
	local rankProgress = CoD.ProgressBar_Rank.new( menu, controller )
	rankProgress:setLeftRight( true, false, 5, 432 )
	rankProgress:setTopBottom( true, false, 449, 515 )
	rankProgress:setRGB( 1, 1, 1 )
	self:addElement( rankProgress )
	self.rankProgress = rankProgress
	
	local StartMenuObjectives0 = CoD.StartMenu_Objectives.new( menu, controller )
	StartMenuObjectives0:setLeftRight( true, false, 489.92, 1150 )
	StartMenuObjectives0:setTopBottom( true, false, 2.91, 302.91 )
	StartMenuObjectives0:setRGB( 1, 1, 1 )
	StartMenuObjectives0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		}
	} )
	self:addElement( StartMenuObjectives0 )
	self.StartMenuObjectives0 = StartMenuObjectives0
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, -27, 9 )
	Pixel2001:setTopBottom( true, false, 102, 106 )
	Pixel2001:setRGB( 1, 1, 1 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	local Pixel201002 = LUI.UIImage.new()
	Pixel201002:setLeftRight( false, false, -145.61, -109.61 )
	Pixel201002:setTopBottom( false, false, 224.5, 228.5 )
	Pixel201002:setRGB( 1, 1, 1 )
	Pixel201002:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201002 )
	self.Pixel201002 = Pixel201002
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( false, false, -145.61, -109.61 )
	Pixel2010001:setTopBottom( false, false, 248.5, 252.5 )
	Pixel2010001:setRGB( 1, 1, 1 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100001 = LUI.UIImage.new()
	Pixel20100001:setLeftRight( false, false, -606.61, -570.61 )
	Pixel20100001:setTopBottom( false, false, 182.5, 186.5 )
	Pixel20100001:setRGB( 1, 1, 1 )
	Pixel20100001:setZRot( -180 )
	Pixel20100001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100001 )
	self.Pixel20100001 = Pixel20100001
	
	local Pixel2010021 = LUI.UIImage.new()
	Pixel2010021:setLeftRight( false, false, -606.61, -570.61 )
	Pixel2010021:setTopBottom( false, false, 217.5, 221.5 )
	Pixel2010021:setRGB( 1, 1, 1 )
	Pixel2010021:setZRot( -180 )
	Pixel2010021:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010021:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010021 )
	self.Pixel2010021 = Pixel2010021
	
	local Pixel2010010 = LUI.UIImage.new()
	Pixel2010010:setLeftRight( false, false, -607, -571 )
	Pixel2010010:setTopBottom( false, false, -42.29, -38.29 )
	Pixel2010010:setRGB( 1, 1, 1 )
	Pixel2010010:setZRot( -180 )
	Pixel2010010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010010 )
	self.Pixel2010010 = Pixel2010010
	
	local Pixel2010020 = LUI.UIImage.new()
	Pixel2010020:setLeftRight( false, false, -145.61, -109.61 )
	Pixel2010020:setTopBottom( false, false, 217.5, 221.5 )
	Pixel2010020:setRGB( 1, 1, 1 )
	Pixel2010020:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010020:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010020 )
	self.Pixel2010020 = Pixel2010020
	
	local Pixel20100201 = LUI.UIImage.new()
	Pixel20100201:setLeftRight( false, false, -145.61, -109.61 )
	Pixel20100201:setTopBottom( false, false, 192.5, 196.5 )
	Pixel20100201:setRGB( 1, 1, 1 )
	Pixel20100201:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100201:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100201 )
	self.Pixel20100201 = Pixel20100201
	
	local Pixel20100210 = LUI.UIImage.new()
	Pixel20100210:setLeftRight( false, false, -606.61, -570.61 )
	Pixel20100210:setTopBottom( false, false, 222.5, 226.5 )
	Pixel20100210:setRGB( 1, 1, 1 )
	Pixel20100210:setZRot( -180 )
	Pixel20100210:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100210:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100210 )
	self.Pixel20100210 = Pixel20100210
	
	local Pixel20100211 = LUI.UIImage.new()
	Pixel20100211:setLeftRight( false, false, -606.61, -570.61 )
	Pixel20100211:setTopBottom( false, false, 191.5, 195.5 )
	Pixel20100211:setRGB( 1, 1, 1 )
	Pixel20100211:setZRot( -180 )
	Pixel20100211:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100211:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100211 )
	self.Pixel20100211 = Pixel20100211
	
	local Pixel201002010 = LUI.UIImage.new()
	Pixel201002010:setLeftRight( false, false, -145.61, -109.61 )
	Pixel201002010:setTopBottom( false, false, 183.5, 187.5 )
	Pixel201002010:setRGB( 1, 1, 1 )
	Pixel201002010:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201002010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201002010 )
	self.Pixel201002010 = Pixel201002010
	
	local Pixel2010020100 = LUI.UIImage.new()
	Pixel2010020100:setLeftRight( false, false, -145.61, -109.61 )
	Pixel2010020100:setTopBottom( false, false, -41.29, -37.29 )
	Pixel2010020100:setRGB( 1, 1, 1 )
	Pixel2010020100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010020100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010020100 )
	self.Pixel2010020100 = Pixel2010020100
	
	buttonList.navigation = {
		right = StartMenuObjectives0
	}
	StartMenuObjectives0.navigation = {
		left = buttonList
	}
	buttonList.id = "buttonList"
	StartMenuObjectives0.id = "StartMenuObjectives0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.buttonList:close()
		self.minimap:close()
		self.TitleGlow1:close()
		self.rankProgress:close()
		self.StartMenuObjectives0:close()
		CoD.StartMenu_GameOptions.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

