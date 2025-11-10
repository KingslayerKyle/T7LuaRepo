require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.List1ButtonLarge_ZM" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.ZMMissionTile" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )

LUI.createMenu.ZMMapSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZMMapSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Bkg = LUI.UIImage.new()
	Bkg:setLeftRight( true, false, 0, 1280 )
	Bkg:setTopBottom( true, false, -16.5, 720 )
	Bkg:setRGB( 0, 0, 0 )
	Bkg:setAlpha( 0.95 )
	self:addElement( Bkg )
	self.Bkg = Bkg
	
	local TitleBackground = LUI.UIImage.new()
	TitleBackground:setLeftRight( true, false, 0, 1280 )
	TitleBackground:setTopBottom( true, false, 0, 95 )
	TitleBackground:setRGB( 0.14, 0.12, 0.12 )
	TitleBackground:setAlpha( 0 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local FooterBackground = LUI.UIImage.new()
	FooterBackground:setLeftRight( true, true, 0, 0 )
	FooterBackground:setTopBottom( false, true, -57, 0 )
	FooterBackground:setRGB( 0.14, 0.12, 0.12 )
	FooterBackground:setAlpha( 0 )
	self:addElement( FooterBackground )
	self.FooterBackground = FooterBackground
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 64, 0 )
	Title:setTopBottom( true, false, 38, 85 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local MapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	MapList:makeFocusable()
	MapList:setLeftRight( true, false, 64, 344 )
	MapList:setTopBottom( true, false, 134, 540 )
	MapList:setDataSource( "ZMMapsList" )
	MapList:setWidgetType( CoD.List1ButtonLarge_ZM )
	MapList:setVerticalCount( 12 )
	MapList:linkToElementModel( MapList, "disabled", true, function ( model )
		local f2_local0 = MapList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MapList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	MapList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( MapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and not IsDisabled( element, controller ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			ProcessZMMapSelectListAction( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and not IsDisabled( element, controller ) then
			return true
		elseif not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( true, false, 450.38, 1216 )
	MapPreview:setTopBottom( true, false, 120, 442 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local MissionBriefTitle = LUI.UIText.new()
	MissionBriefTitle:setLeftRight( true, false, 469.38, 802.34 )
	MissionBriefTitle:setTopBottom( true, false, 485.84, 509.84 )
	MissionBriefTitle:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	MissionBriefTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefTitle )
	self.MissionBriefTitle = MissionBriefTitle
	
	local MissionBriefText = LUI.UIText.new()
	MissionBriefText:setLeftRight( true, false, 469.38, 1169.34 )
	MissionBriefText:setTopBottom( true, false, 511.23, 533.23 )
	MissionBriefText:setAlpha( 0.85 )
	MissionBriefText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefText )
	self.MissionBriefText = MissionBriefText
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( true, false, 450.38, 1216 )
	Banner:setTopBottom( true, false, 384.5, 442 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.85 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local PlayCount = LUI.UIText.new()
	PlayCount:setLeftRight( true, false, 861.04, 1196 )
	PlayCount:setTopBottom( true, false, 402, 422 )
	PlayCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayCount )
	self.PlayCount = PlayCount
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ZMMissionTile = CoD.ZMMissionTile.new( self, controller )
	ZMMissionTile:setLeftRight( true, false, 463.38, 757.34 )
	ZMMissionTile:setTopBottom( true, false, 393, 432 )
	self:addElement( ZMMissionTile )
	self.ZMMissionTile = ZMMissionTile
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( true, false, 420.77, 1213.51 )
	SecTitleBG0:setTopBottom( true, false, 470.62, 551.84 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( true, false, 423.77, 451.77 )
	LineDot:setTopBottom( true, false, 470.62, 475.84 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot1 = LUI.UIImage.new()
	LineDot1:setLeftRight( true, false, 425.38, 453.38 )
	LineDot1:setTopBottom( true, false, 549.84, 551.84 )
	LineDot1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot1 )
	self.LineDot1 = LineDot1
	
	local FETitleLineL = CoD.FE_TitleLine.new( self, controller )
	FETitleLineL:setLeftRight( true, true, 450.38, -64 )
	FETitleLineL:setTopBottom( false, false, 87.77, 93 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU:setLeftRight( true, true, 450.38, -64 )
	FETitleLineU:setTopBottom( false, false, -242, -239 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 51, 53 )
	LineSide0:setTopBottom( true, false, 76, 675 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( true, false, 30, 58 )
	LineDot0:setTopBottom( true, false, 607, 611 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local LineDot00 = LUI.UIImage.new()
	LineDot00:setLeftRight( true, false, 30, 58 )
	LineDot00:setTopBottom( true, false, 112, 116 )
	LineDot00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot00 )
	self.LineDot00 = LineDot00
	
	local LineDot000 = LUI.UIImage.new()
	LineDot000:setLeftRight( true, false, 1228.77, 1256.77 )
	LineDot000:setTopBottom( true, false, 111, 115 )
	LineDot000:setYRot( 180 )
	LineDot000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot000 )
	self.LineDot000 = LineDot000
	
	local LineDot0000 = LUI.UIImage.new()
	LineDot0000:setLeftRight( true, false, 1228.77, 1256.77 )
	LineDot0000:setTopBottom( true, false, 449, 453 )
	LineDot0000:setYRot( 180 )
	LineDot0000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0000 )
	self.LineDot0000 = LineDot0000
	
	local LineDot00000 = LUI.UIImage.new()
	LineDot00000:setLeftRight( true, false, 1228.77, 1256.77 )
	LineDot00000:setTopBottom( true, false, 449, 453 )
	LineDot00000:setYRot( 180 )
	LineDot00000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot00000 )
	self.LineDot00000 = LineDot00000
	
	local LineDot000000 = LUI.UIImage.new()
	LineDot000000:setLeftRight( true, false, 1228.77, 1256.77 )
	LineDot000000:setTopBottom( true, false, 471, 475 )
	LineDot000000:setYRot( 180 )
	LineDot000000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot000000 )
	self.LineDot000000 = LineDot000000
	
	local LineDot0000000 = LUI.UIImage.new()
	LineDot0000000:setLeftRight( true, false, 1228.77, 1256.77 )
	LineDot0000000:setTopBottom( true, false, 551, 555 )
	LineDot0000000:setYRot( 180 )
	LineDot0000000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0000000 )
	self.LineDot0000000 = LineDot0000000
	
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
	ZMMissionTile:linkToElementModel( MapList, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			ZMMissionTile.MapName:setText( Engine.Localize( mapName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.65 )
				self.clipFinished( Banner, {} )
				PlayCount:completeAnimation()
				self.PlayCount:setAlpha( 1 )
				self.clipFinished( PlayCount, {} )
			end
		},
		Playlists = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.65 )
				self.clipFinished( Banner, {} )
				PlayCount:completeAnimation()
				self.PlayCount:setAlpha( 1 )
				self.clipFinished( PlayCount, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Playlists",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true )
			end
		}
	} )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MapList.id = "MapList"
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.MenuFrame:close()
		element.ZMMissionTile:close()
		element.FETitleLineL:close()
		element.FETitleLineU:close()
		element.MapPreview:close()
		element.MissionBriefText:close()
		element.PlayCount:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

