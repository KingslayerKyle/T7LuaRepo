-- 3d2b54db2d6b10081f215a2caa401e9a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Groups.GroupsListButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.hintText" )
require( "ui.uieditor.widgets.Groups.LeaderboardMakerProgressBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )

LUI.createMenu.LeaderboardMaker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LeaderboardMaker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LeaderboardMaker.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint00 = LUI.UIImage.new()
	BlackTint00:setLeftRight( true, false, 64, 395 )
	BlackTint00:setTopBottom( true, false, 85, 675 )
	BlackTint00:setRGB( 0, 0, 0 )
	BlackTint00:setAlpha( 0 )
	self:addElement( BlackTint00 )
	self.BlackTint00 = BlackTint00
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -275, -243 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setAlpha( 0.7 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local StartMenuframenoBG000 = CoD.StartMenu_frame_noBG.new( f1_local1, controller )
	StartMenuframenoBG000:setLeftRight( true, false, 112, 1188 )
	StartMenuframenoBG000:setTopBottom( true, false, 154, 639 )
	StartMenuframenoBG000:setAlpha( 0 )
	self:addElement( StartMenuframenoBG000 )
	self.StartMenuframenoBG000 = StartMenuframenoBG000
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_LEADERBOARD_MAKER" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_LEADERBOARD_MAKER" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 421.5, -513.5 )
	Border:setTopBottom( true, true, 172.38, -233.46 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.01, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( true, false, 91, 371 )
	SubTitle:setTopBottom( true, false, 133.5, 157.5 )
	SubTitle:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	SubTitle:setTTF( "fonts/escom.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local ButtonList = LUI.UIList.new( f1_local1, controller, 6, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 91, 371 )
	ButtonList:setTopBottom( true, false, 172.08, 614.08 )
	ButtonList:setWidgetType( CoD.GroupsListButton )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setSpacing( 6 )
	ButtonList:setVerticalCounter( CoD.verticalCounter )
	ButtonList:setDataSource( "LeaderboardMakerButtonList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		ListElementSelectFirstItemIfPossible( self, "ButtonList" )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = CoD.hintText.new( f1_local1, controller )
	HintText:setLeftRight( true, false, 421.5, 766.5 )
	HintText:setTopBottom( true, false, 541.83, 493.67 )
	HintText:setAlpha( 0 )
	self:addElement( HintText )
	self.HintText = HintText
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 421.5, 766.5 )
	Description:setTopBottom( true, false, 493.67, 512.67 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local LeaderboardMakerProgressBar = CoD.LeaderboardMakerProgressBar.new( f1_local1, controller )
	LeaderboardMakerProgressBar:setLeftRight( true, false, 66, 371 )
	LeaderboardMakerProgressBar:setTopBottom( true, false, 88.5, 113.5 )
	self:addElement( LeaderboardMakerProgressBar )
	self.LeaderboardMakerProgressBar = LeaderboardMakerProgressBar
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 448.25, 739.75 )
	Icon:setTopBottom( true, false, 188.79, 470.12 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GroupInvitesTitle = CoD.Challenges_Title.new( f1_local1, controller )
	GroupInvitesTitle:setLeftRight( true, false, 423.5, 570.5 )
	GroupInvitesTitle:setTopBottom( true, false, 129.38, 161.63 )
	self:addElement( GroupInvitesTitle )
	self.GroupInvitesTitle = GroupInvitesTitle
	
	SubTitle:linkToElementModel( ButtonList, "titleText", true, function ( model )
		local titleText = Engine.GetModelValue( model )
		if titleText then
			SubTitle:setText( Engine.Localize( titleText ) )
		end
	end )
	HintText:linkToElementModel( ButtonList, nil, false, function ( model )
		HintText:setModel( model, controller )
	end )
	Description:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			Description:setText( Engine.Localize( hintText ) )
		end
	end )
	Icon:linkToElementModel( ButtonList, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			Icon:setImage( RegisterImage( icon ) )
		end
	end )
	GroupInvitesTitle:linkToElementModel( ButtonList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			GroupInvitesTitle.weaponNameLabel:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Border:completeAnimation()
				self.Border:setAlpha( 0.43 )
				self.clipFinished( Border, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 1 )
				self.clipFinished( SubTitle, {} )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.clipFinished( HintText, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				LeaderboardMakerProgressBar:completeAnimation()
				self.LeaderboardMakerProgressBar:setAlpha( 1 )
				self.clipFinished( LeaderboardMakerProgressBar, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		Customizing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BlackTint00:completeAnimation()
				self.BlackTint00:setAlpha( 0.3 )
				self.clipFinished( BlackTint00, {} )
				HintText:completeAnimation()
				self.HintText:setAlpha( 0 )
				self.clipFinished( HintText, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				LeaderboardMakerProgressBar:completeAnimation()
				self.LeaderboardMakerProgressBar:setAlpha( 1 )
				self.clipFinished( LeaderboardMakerProgressBar, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Customizing",
			condition = function ( menu, element, event )
				return not IsGroupLeaderboardMakerState( controller, "SelectAction" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.leaderboardmaker.state" ), function ( model )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.leaderboardmaker.state"
		} )
	end )
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f15_local0 = nil
		SetHintText( self, element, controller )
		return f15_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		ProcessLeaderboardMakerBack( self, f16_arg0, f16_arg2 )
		ListElementSelectFirstItemIfPossible( self, "ButtonList" )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG000:close()
		element.MenuFrame:close()
		element.ButtonList:close()
		element.HintText:close()
		element.LeaderboardMakerProgressBar:close()
		element.FEMenuLeftGraphics:close()
		element.GroupInvitesTitle:close()
		element.SubTitle:close()
		element.Description:close()
		element.Icon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LeaderboardMaker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

