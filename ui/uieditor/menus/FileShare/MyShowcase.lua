-- 76edbe1566419a4468f715d76b9c43c8
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
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
		UpdateAllMenuButtonPrompts( element, f1_arg1 )
	end )
end

local PreLoadFunc = function ( self, controller )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
end

LUI.createMenu.MyShowcase = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f4_local1, controller )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( FileshareGetShowcaseTitle( controller, "MENU_MEDIA_MYSHOWCASE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( FileshareGetShowcaseTitle( controller, "MENU_MEDIA_MYSHOWCASE" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f4_local1, controller )
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
	
	local MyShowcaseCategorySelector = CoD.MyShowcase_CategorySelector.new( f4_local1, controller )
	MyShowcaseCategorySelector:setLeftRight( true, false, 63, 1213 )
	MyShowcaseCategorySelector:setTopBottom( true, false, 123, 672 )
	self:addElement( MyShowcaseCategorySelector )
	self.MyShowcaseCategorySelector = MyShowcaseCategorySelector
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f4_local1, true )
		MediaManagerClearDisplay( self, element, controller )
		SetIsInFileshare( controller, "true" )
		ShowcaseUpdateSelfIdentityWidget( self, controller )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		GoBack( self, f10_arg2 )
		ClearSavedState( self, f10_arg2 )
		SendClientScriptMenuChangeNotify( f10_arg2, f10_arg1, false )
		ResetThumbnailViewer( f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetIsInFileshare( controller, "false" )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	MyShowcaseCategorySelector.id = "MyShowcaseCategorySelector"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

