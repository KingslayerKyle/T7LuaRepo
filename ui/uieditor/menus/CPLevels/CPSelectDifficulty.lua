-- 7bd41d9e08f36b50440bbee7638069de
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartGameFlow.CP_ConfirmSelection_Box" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyImagePreview" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyInGameChangeWarning" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )

DataSources.DifficultySettingsList = DataSourceHelpers.ListSetup( "DifficultySettingsList", function ( f1_arg0 )
	return {
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[0] .. "_CAPS" ),
				desc = Engine.Localize( CoD.DIFFICULTY_DESC[0] ),
				image = CoD.DIFFICULTY_ICON[0]
			},
			properties = {
				difficulty = 0
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[1] .. "_CAPS" ),
				desc = Engine.Localize( CoD.DIFFICULTY_DESC[1] ),
				image = CoD.DIFFICULTY_ICON[1]
			},
			properties = {
				difficulty = 1
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[2] .. "_CAPS" ),
				desc = Engine.Localize( CoD.DIFFICULTY_DESC[2] ),
				image = CoD.DIFFICULTY_ICON[2]
			},
			properties = {
				difficulty = 2
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[3] .. "_CAPS" ),
				desc = Engine.Localize( CoD.DIFFICULTY_DESC[3] ),
				image = CoD.DIFFICULTY_ICON[3]
			},
			properties = {
				difficulty = 3
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[4] .. "_CAPS" ),
				desc = Engine.Localize( CoD.DIFFICULTY_DESC[4] ),
				image = CoD.DIFFICULTY_ICON[4]
			},
			properties = {
				difficulty = 4
			}
		}
	}
end, true )
local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.DifficultyList:getItemAt( Engine.GetProfileVarInt( f2_arg1, "g_gameskill" ) + 1 )
	if f2_local0 then
		f2_arg0.DifficultyList:setActiveItem( f2_local0 )
	end
end

LUI.createMenu.CPSelectDifficulty = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPSelectDifficulty" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.85 )
	self:addElement( black )
	self.black = black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local DifficultyList = LUI.UIList.new( f3_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	DifficultyList:makeFocusable()
	DifficultyList:setLeftRight( false, false, -561, -329 )
	DifficultyList:setTopBottom( true, false, 144, 312 )
	DifficultyList:setDataSource( "DifficultySettingsList" )
	DifficultyList:setWidgetType( CoD.list1ButtonNewStyle )
	DifficultyList:setVerticalCount( 5 )
	DifficultyList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	DifficultyList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f3_local1:AddButtonCallbackFunction( DifficultyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if IsFirstTimeSetup( f6_arg2, Enum.eModes.MODE_CAMPAIGN ) and not IsCampaignZombies() then
			SetDifficulty( self, f6_arg0, f6_arg2 )
			NavigateToMenuNoDependency( self, "CPConfirmSelection", true, f6_arg2 )
			return true
		else
			SetDifficulty( self, f6_arg0, f6_arg2 )
			GoBack( self, f6_arg2 )
			return true
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( false, false, -218.29, 583 )
	SecTitleBG0:setTopBottom( true, false, 551.67, 599.89 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( false, false, -201, 571.21 )
	Description:setTopBottom( true, false, 604.78, 623.78 )
	Description:setAlpha( 0.85 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( false, false, -200, -16 )
	BriefingHeading:setTopBottom( true, false, 566, 586 )
	BriefingHeading:setTTF( "fonts/escom.ttf" )
	BriefingHeading:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BriefingHeading:setShaderVector( 0, 0.06, 0, 0, 0 )
	BriefingHeading:setShaderVector( 1, 0.02, 0, 0, 0 )
	BriefingHeading:setShaderVector( 2, 1, 0, 0, 0 )
	BriefingHeading:setLetterSpacing( 1 )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( false, false, -621, -569 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CPConfirmSelectionBox = CoD.CP_ConfirmSelection_Box.new( f3_local1, controller )
	CPConfirmSelectionBox:setLeftRight( false, false, -211.29, 572.21 )
	CPConfirmSelectionBox:setTopBottom( true, false, 130, 540 )
	self:addElement( CPConfirmSelectionBox )
	self.CPConfirmSelectionBox = CPConfirmSelectionBox
	
	local CPDifficultyImagePreview = CoD.CPDifficultyImagePreview.new( f3_local1, controller )
	CPDifficultyImagePreview:setLeftRight( false, false, -86, 419 )
	CPDifficultyImagePreview:setTopBottom( true, false, 135.5, 534.5 )
	self:addElement( CPDifficultyImagePreview )
	self.CPDifficultyImagePreview = CPDifficultyImagePreview
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( false, false, 565.87, 601.87 )
	Pixel200:setTopBottom( true, false, 652.75, 656.75 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( false, false, 576, 579 )
	LineSide:setTopBottom( true, true, 85, -38 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local CPDifficultyInGameChangeWarning = CoD.CPDifficultyInGameChangeWarning.new( f3_local1, controller )
	CPDifficultyInGameChangeWarning:setLeftRight( false, false, -576, -272 )
	CPDifficultyInGameChangeWarning:setTopBottom( true, false, 352.5, 468.5 )
	self:addElement( CPDifficultyInGameChangeWarning )
	self.CPDifficultyInGameChangeWarning = CPDifficultyInGameChangeWarning
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( f3_local1, controller )
	FETitleLineSingle:setLeftRight( true, true, 1164, 3.99 )
	FETitleLineSingle:setTopBottom( false, true, -1.75, 2.25 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( false, false, 565, 601 )
	pixelU:setTopBottom( true, false, 552.25, 555.75 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( false, false, -240, -204 )
	pixelU0:setTopBottom( true, false, 551.25, 554.75 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local FETitleLineSingle00 = CoD.FE_TitleLineSingle.new( f3_local1, controller )
	FETitleLineSingle00:setLeftRight( false, false, -211.29, 575.99 )
	FETitleLineSingle00:setTopBottom( true, false, 551, 555 )
	self:addElement( FETitleLineSingle00 )
	self.FETitleLineSingle00 = FETitleLineSingle00
	
	local pixelU1 = LUI.UIImage.new()
	pixelU1:setLeftRight( false, false, 565, 601 )
	pixelU1:setTopBottom( true, false, 596.25, 599.75 )
	pixelU1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU1 )
	self.pixelU1 = pixelU1
	
	local pixelU00 = LUI.UIImage.new()
	pixelU00:setLeftRight( false, false, -240, -204 )
	pixelU00:setTopBottom( true, false, 595.25, 598.75 )
	pixelU00:setZRot( 180 )
	pixelU00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU00 )
	self.pixelU00 = pixelU00
	
	local FETitleLineSingle000 = CoD.FE_TitleLineSingle.new( f3_local1, controller )
	FETitleLineSingle000:setLeftRight( false, false, -211.29, 575.99 )
	FETitleLineSingle000:setTopBottom( true, false, 595, 599 )
	self:addElement( FETitleLineSingle000 )
	self.FETitleLineSingle000 = FETitleLineSingle000
	
	Description:linkToElementModel( DifficultyList, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			Description:setText( Engine.Localize( desc ) )
		end
	end )
	BriefingHeading:linkToElementModel( DifficultyList, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			BriefingHeading:setText( Engine.Localize( displayText ) )
		end
	end )
	CPDifficultyImagePreview:linkToElementModel( DifficultyList, nil, false, function ( model )
		CPDifficultyImagePreview:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		cpzm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "cpzm",
			condition = function ( menu, element, event )
				return IsCampaignZombies()
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		ShowHeaderIconOnly( f3_local1 )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		GoBack( self, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	DifficultyList.id = "DifficultyList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.DifficultyList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DifficultyList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.CPConfirmSelectionBox:close()
		element.CPDifficultyImagePreview:close()
		element.CPDifficultyInGameChangeWarning:close()
		element.FETitleLineSingle:close()
		element.FETitleLineSingle00:close()
		element.FETitleLineSingle000:close()
		element.Description:close()
		element.BriefingHeading:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

