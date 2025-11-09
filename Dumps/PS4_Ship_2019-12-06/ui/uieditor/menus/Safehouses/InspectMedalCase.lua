require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.Safehouse.medalCaseListItem" )
require( "ui.uieditor.widgets.Safehouse.medalInspectionArea" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Safehouse.ElemssidelistLines_Medals" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

DataSources.MedalCaseList = DataSourceHelpers.ListSetup( "MedalCaseList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "safehouse.inClientBunk" )
	if f1_local1 then
		local f1_local2 = Engine.GetModelValue( f1_local1 )
		for f1_local6, f1_local7 in ipairs( Engine.GetAssetList( "cp_medals" ) ) do
			table.insert( f1_local0, {
				models = {
					name = f1_local7.displayName,
					requirement = f1_local7.requirements,
					smallIcon = f1_local7.smallIcon,
					largeIcon = f1_local7.largeIcon,
					xpBonus = f1_local7.XPBonus,
					unlocked = Engine.IsMedalUnlocked( f1_local2, f1_local6 - 1 )
				}
			} )
		end
	end
	return f1_local0
end, true )
LUI.createMenu.InspectMedalCase = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InspectMedalCase" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InspectMedalCase.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, -18, -18 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	blackImage:setAlpha( 0.5 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( false, false, -140, 640 )
	Texture:setTopBottom( true, false, 134, 655 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local background0 = LUI.UIImage.new()
	background0:setLeftRight( true, true, 1310, -1323.65 )
	background0:setTopBottom( true, true, -17.84, 17.84 )
	background0:setAlpha( 0 )
	background0:setImage( RegisterImage( "uie_t7_menu_cp_bg_image" ) )
	self:addElement( background0 )
	self.background0 = background0
	
	local Bkg = LUI.UIImage.new()
	Bkg:setLeftRight( true, true, -43.65, 30 )
	Bkg:setTopBottom( true, true, -17.84, 17.84 )
	Bkg:setRGB( 0, 0, 0 )
	Bkg:setAlpha( 0 )
	self:addElement( Bkg )
	self.Bkg = Bkg
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, true, 0, 0 )
	ImgVignetteFull:setTopBottom( true, true, 0, 0 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local medalList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, false )
	medalList:makeFocusable()
	medalList:setLeftRight( false, false, -571, -11 )
	medalList:setTopBottom( true, false, 122, 652 )
	medalList:setDataSource( "MedalCaseList" )
	medalList:setWidgetType( CoD.medalCaseListItem )
	medalList:setHorizontalCount( 3 )
	medalList:setVerticalCount( 4 )
	medalList:setSpacing( 10 )
	self:addElement( medalList )
	self.medalList = medalList
	
	local medalInspectionArea0 = CoD.medalInspectionArea.new( self, controller )
	medalInspectionArea0:setLeftRight( false, false, 34, 530 )
	medalInspectionArea0:setTopBottom( true, false, 134, 684 )
	self:addElement( medalInspectionArea0 )
	self.medalInspectionArea0 = medalInspectionArea0
	
	local FETitleLineU = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU:setLeftRight( true, true, 62, 30 )
	FETitleLineU:setTopBottom( true, false, 121, 125 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local ElemssidelistLinesMedals0 = CoD.ElemssidelistLines_Medals.new( self, controller )
	ElemssidelistLinesMedals0:setLeftRight( true, false, 16, 69 )
	ElemssidelistLinesMedals0:setTopBottom( true, true, -1, -51 )
	self:addElement( ElemssidelistLinesMedals0 )
	self.ElemssidelistLinesMedals0 = ElemssidelistLinesMedals0
	
	local FETitleLineU0 = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU0:setLeftRight( true, true, 62, 30 )
	FETitleLineU0:setTopBottom( true, false, 517, 521 )
	self:addElement( FETitleLineU0 )
	self.FETitleLineU0 = FETitleLineU0
	
	local FETitleLineU00 = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU00:setLeftRight( true, true, 62, 30 )
	FETitleLineU00:setTopBottom( true, false, 652, 656 )
	self:addElement( FETitleLineU00 )
	self.FETitleLineU00 = FETitleLineU00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MPUI_MEDALS_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_MEDALS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_medals" ) )
	GenericMenuFrame0:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		ShowHeaderIconOnly( self )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	medalInspectionArea0:linkToElementModel( medalList, nil, false, function ( model )
		medalInspectionArea0:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f5_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_medalcase" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_MEDALCASE", "MENU_FIRSTTIME_MEDALCASE2", "com_firsttime_medalcase_image", "MENU_FIRSTTIME_MEDALCASE_BUTTONTEXT", "", "" )
		end
		if not f5_local0 then
			f5_local0 = self:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f6_local0 = nil
		PrepareOpenMenuInSafehouse( controller )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f6_local0 then
			f6_local0 = self:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		PrepareCloseMenuInSafehouse( controller )
		SendOwnMenuResponse( menu, controller, "closed" )
		ClearSavedState( self, controller )
		PlaySoundSetSound( self, "menu_go_back" )
		Close( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		PrepareCloseMenuInSafehouse( controller )
		SendOwnMenuResponse( self, controller, "closed" )
		ClearSavedState( self, controller )
	end )
	medalList.id = "medalList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.medalList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Texture:close()
		element.medalList:close()
		element.medalInspectionArea0:close()
		element.FETitleLineU:close()
		element.ElemssidelistLinesMedals0:close()
		element.FETitleLineU0:close()
		element.FETitleLineU00:close()
		element.GenericMenuFrame0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InspectMedalCase.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

