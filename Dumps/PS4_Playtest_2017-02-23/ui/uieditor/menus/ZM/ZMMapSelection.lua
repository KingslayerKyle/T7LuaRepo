require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.List1ButtonLarge_ZM" )
require( "ui.uieditor.widgets.ZMInventory.ZMMapSelection.ZMMissionTile" )

LUI.createMenu.ZMMapSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZMMapSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Bkg = LUI.UIImage.new()
	Bkg:setLeftRight( 0, 0, 0, 1920 )
	Bkg:setTopBottom( 0, 0, -25, 1080 )
	Bkg:setRGB( 0, 0, 0 )
	Bkg:setAlpha( 0.95 )
	self:addElement( Bkg )
	self.Bkg = Bkg
	
	local TitleBackground = LUI.UIImage.new()
	TitleBackground:setLeftRight( 0, 0, 0, 1920 )
	TitleBackground:setTopBottom( 0, 0, 0, 142 )
	TitleBackground:setRGB( 0.14, 0.12, 0.12 )
	TitleBackground:setAlpha( 0 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local FooterBackground = LUI.UIImage.new()
	FooterBackground:setLeftRight( 0, 1, 0, 0 )
	FooterBackground:setTopBottom( 1, 1, -86, 0 )
	FooterBackground:setRGB( 0.14, 0.12, 0.12 )
	FooterBackground:setAlpha( 0 )
	self:addElement( FooterBackground )
	self.FooterBackground = FooterBackground
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 1, 96, 0 )
	Title:setTopBottom( 0, 0, 57, 127 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local MapList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	MapList:makeFocusable()
	MapList:setLeftRight( 0, 0, 96, 516 )
	MapList:setTopBottom( 0, 0, 207, 805 )
	MapList:setWidgetType( CoD.List1ButtonLarge_ZM )
	MapList:setVerticalCount( 12 )
	MapList:setDataSource( "ZMMapsList" )
	MapList:linkToElementModel( MapList, "disabled", true, function ( model )
		local element = MapList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	MapList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MapList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( MapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and IsElementPropertyValue( element, "purchasable", true ) then
			OpenPurchaseMapPackConfirmation( controller, element, menu )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and not IsDisabled( element, controller ) then
			PlaylistSelected( menu, element, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsElementPropertyValue( element, "purchasable", true ) then
			OpenPurchaseMapPackConfirmation( controller, element, menu )
			return true
		elseif not IsDisabled( element, controller ) then
			ProcessZMMapSelectListAction( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and IsElementPropertyValue( element, "purchasable", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsPerControllerTablePropertyValue( controller, "choosingZMPlaylist", true ) and not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsElementPropertyValue( element, "purchasable", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( MapList )
	self.MapList = MapList
	
	local MapPreview = LUI.UIImage.new()
	MapPreview:setLeftRight( 0, 0, 676, 1824 )
	MapPreview:setTopBottom( 0, 0, 180, 663 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local MissionBriefTitle = LUI.UIText.new()
	MissionBriefTitle:setLeftRight( 0, 0, 704, 1203 )
	MissionBriefTitle:setTopBottom( 0, 0, 729, 765 )
	MissionBriefTitle:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	MissionBriefTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefTitle )
	self.MissionBriefTitle = MissionBriefTitle
	
	local MissionBriefText = LUI.UIText.new()
	MissionBriefText:setLeftRight( 0, 0, 704, 1754 )
	MissionBriefText:setTopBottom( 0, 0, 767, 800 )
	MissionBriefText:setAlpha( 0.85 )
	MissionBriefText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MissionBriefText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionBriefText )
	self.MissionBriefText = MissionBriefText
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( 0, 0, 676, 1824 )
	Banner:setTopBottom( 0, 0, 577, 663 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.85 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local PlayCount = LUI.UIText.new()
	PlayCount:setLeftRight( 0, 0, 1292, 1794 )
	PlayCount:setTopBottom( 0, 0, 603, 633 )
	PlayCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PlayCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayCount )
	self.PlayCount = PlayCount
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_MAPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ZMMissionTile = CoD.ZMMissionTile.new( self, controller )
	ZMMissionTile:setLeftRight( 0, 0, 695, 1136 )
	ZMMissionTile:setTopBottom( 0, 0, 590, 648 )
	self:addElement( ZMMissionTile )
	self.ZMMissionTile = ZMMissionTile
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( 0, 0, 631, 1820 )
	SecTitleBG0:setTopBottom( 0, 0, 706, 828 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( 0, 0, 636, 678 )
	LineDot:setTopBottom( 0, 0, 706, 714 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot1 = LUI.UIImage.new()
	LineDot1:setLeftRight( 0, 0, 638, 680 )
	LineDot1:setTopBottom( 0, 0, 825, 828 )
	LineDot1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot1 )
	self.LineDot1 = LineDot1
	
	local FETitleLineL = CoD.FE_TitleLine.new( self, controller )
	FETitleLineL:setLeftRight( 0, 1, 676, -96 )
	FETitleLineL:setTopBottom( 0.5, 0.5, 132, 140 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU:setLeftRight( 0, 1, 676, -96 )
	FETitleLineU:setTopBottom( 0.5, 0.5, -363, -359 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 76, 79 )
	LineSide0:setTopBottom( 0, 0, 114, 1012 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( 0, 0, 45, 87 )
	LineDot0:setTopBottom( 0, 0, 911, 917 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local LineDot00 = LUI.UIImage.new()
	LineDot00:setLeftRight( 0, 0, 45, 87 )
	LineDot00:setTopBottom( 0, 0, 168, 174 )
	LineDot00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot00 )
	self.LineDot00 = LineDot00
	
	local LineDot000 = LUI.UIImage.new()
	LineDot000:setLeftRight( 0, 0, 1843, 1885 )
	LineDot000:setTopBottom( 0, 0, 167, 173 )
	LineDot000:setYRot( 180 )
	LineDot000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot000 )
	self.LineDot000 = LineDot000
	
	local LineDot0000 = LUI.UIImage.new()
	LineDot0000:setLeftRight( 0, 0, 1843, 1885 )
	LineDot0000:setTopBottom( 0, 0, 673, 679 )
	LineDot0000:setYRot( 180 )
	LineDot0000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0000 )
	self.LineDot0000 = LineDot0000
	
	local LineDot00000 = LUI.UIImage.new()
	LineDot00000:setLeftRight( 0, 0, 1843, 1885 )
	LineDot00000:setTopBottom( 0, 0, 673, 679 )
	LineDot00000:setYRot( 180 )
	LineDot00000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot00000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot00000 )
	self.LineDot00000 = LineDot00000
	
	local LineDot000000 = LUI.UIImage.new()
	LineDot000000:setLeftRight( 0, 0, 1843, 1885 )
	LineDot000000:setTopBottom( 0, 0, 707, 713 )
	LineDot000000:setYRot( 180 )
	LineDot000000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot000000 )
	self.LineDot000000 = LineDot000000
	
	local LineDot0000000 = LUI.UIImage.new()
	LineDot0000000:setLeftRight( 0, 0, 1843, 1885 )
	LineDot0000000:setTopBottom( 0, 0, 827, 833 )
	LineDot0000000:setYRot( 180 )
	LineDot0000000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0000000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0000000 )
	self.LineDot0000000 = LineDot0000000
	
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
	ZMMissionTile:linkToElementModel( MapList, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ZMMissionTile.MapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		Banner:completeAnimation()
		Banner:setAlpha( 0.85 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.65 )
				self.clipFinished( Banner, {} )
			end
		},
		Playlists = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.65 )
				self.clipFinished( Banner, {} )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MapList:close()
		self.MenuFrame:close()
		self.ZMMissionTile:close()
		self.FETitleLineL:close()
		self.FETitleLineU:close()
		self.MapPreview:close()
		self.MissionBriefText:close()
		self.PlayCount:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMMapSelection.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

