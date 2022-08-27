-- f46adc61660a355d25d1dc440ad567c3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_CategorySelector" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			local f2_local0 = CoD.FileshareUtility.GetPreviousCategory()
			if f2_local0 then
				CoD.FileshareUtility.SetCurrentCategory( f2_local0 )
			end
			CoD.FileshareUtility.SetCurrentFilter( "", "" )
			CoD.FileshareUtility.SetShowCreateButton( false )
			if CoD.FileshareUtility.GetCurrentCategory() ~= "screenshot" then
				CoD.FileshareUtility.SetDirty()
			end
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.Theater_SelectFilm = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Theater_SelectFilm" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Theater_SelectFilm.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f3_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:setAlpha( 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 64, 368 )
	BlackTint:setTopBottom( true, false, 78, 684 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setAlpha( 0 )
	TitleText:setText( Engine.Localize( "Menu" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 302, 332 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_THEATER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_THEATER_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f3_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local MyShowcaseCategorySelector = CoD.MyShowcase_CategorySelector.new( f3_local1, controller )
	MyShowcaseCategorySelector:setLeftRight( true, false, 63, 1213 )
	MyShowcaseCategorySelector:setTopBottom( true, false, 123, 672 )
	MyShowcaseCategorySelector.FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareMyTheaterCategoriesList" )
	self:addElement( MyShowcaseCategorySelector )
	self.MyShowcaseCategorySelector = MyShowcaseCategorySelector
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 77, 694.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MyShowcaseCategorySelector:completeAnimation()
				self.MyShowcaseCategorySelector:setAlpha( 1 )
				self.clipFinished( MyShowcaseCategorySelector, {} )
			end
		}
	}
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		ClearSavedState( self, f8_arg2 )
		ResetThumbnailViewer( f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	MyShowcaseCategorySelector.id = "MyShowcaseCategorySelector"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.MyShowcaseCategorySelector:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.MyShowcaseCategorySelector:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Theater_SelectFilm.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

