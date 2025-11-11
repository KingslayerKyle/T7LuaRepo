require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyImagePreview" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyInGameChangeWarning" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )
require( "ui.uieditor.widgets.StartGameFlow.CP_ConfirmSelection_Box" )

local PrepareDifficultySettings = function ( controller )
	local values = {
		{
			models = {
				displayText = Engine.Localize( CoD.CPUtility.DIFFICULTY[0] .. "_CAPS" ),
				desc = Engine.Localize( CoD.CPUtility.DIFFICULTY_DESC[0] ),
				image = CoD.CPUtility.DIFFICULTY_ICON[0]
			},
			properties = {
				difficulty = 0
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.CPUtility.DIFFICULTY[1] .. "_CAPS" ),
				desc = Engine.Localize( CoD.CPUtility.DIFFICULTY_DESC[1] ),
				image = CoD.CPUtility.DIFFICULTY_ICON[1]
			},
			properties = {
				difficulty = 1
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.CPUtility.DIFFICULTY[2] .. "_CAPS" ),
				desc = Engine.Localize( CoD.CPUtility.DIFFICULTY_DESC[2] ),
				image = CoD.CPUtility.DIFFICULTY_ICON[2]
			},
			properties = {
				difficulty = 2
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.CPUtility.DIFFICULTY[3] .. "_CAPS" ),
				desc = Engine.Localize( CoD.CPUtility.DIFFICULTY_DESC[3] ),
				image = CoD.CPUtility.DIFFICULTY_ICON[3]
			},
			properties = {
				difficulty = 3
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.CPUtility.DIFFICULTY[4] .. "_CAPS" ),
				desc = Engine.Localize( CoD.CPUtility.DIFFICULTY_DESC[4] ),
				image = CoD.CPUtility.DIFFICULTY_ICON[4]
			},
			properties = {
				difficulty = 4
			}
		}
	}
	return values
end

DataSources.DifficultySettingsList = DataSourceHelpers.ListSetup( "DifficultySettingsList", PrepareDifficultySettings, true )
local PostLoadFunc = function ( self, controller )
	local difficulty = Engine.GetProfileVarInt( controller, "g_gameskill" )
	local listItem = self.DifficultyList:getItemAt( difficulty + 1 )
	if listItem then
		self.DifficultyList:setActiveItem( listItem )
	end
end

LUI.createMenu.CPSelectDifficulty = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPSelectDifficulty" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 0, 0 )
	black:setTopBottom( 0, 1, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.85 )
	self:addElement( black )
	self.black = black
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local DifficultyList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	DifficultyList:makeFocusable()
	DifficultyList:setLeftRight( 0.5, 0.5, -842, -494 )
	DifficultyList:setTopBottom( 0, 0, 218, 466 )
	DifficultyList:setWidgetType( CoD.list1ButtonNewStyle )
	DifficultyList:setVerticalCount( 5 )
	DifficultyList:setDataSource( "DifficultySettingsList" )
	DifficultyList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DifficultyList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( DifficultyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and not IsCampaignZombies() then
			SetDifficulty( self, element, controller )
			NavigateToMenuNoDependency( self, "CPConfirmSelection", true, controller )
			return true
		else
			SetDifficulty( self, element, controller )
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( 0.5, 0.5, -327, 875 )
	SecTitleBG0:setTopBottom( 0, 0, 828, 900 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0.5, 0.5, -301, 857 )
	Description:setTopBottom( 0, 0, 907, 935 )
	Description:setAlpha( 0.85 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( 0.5, 0.5, -300, -24 )
	BriefingHeading:setTopBottom( 0, 0, 849, 879 )
	BriefingHeading:setTTF( "fonts/escom.ttf" )
	BriefingHeading:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	BriefingHeading:setShaderVector( 0, 0.06, 0, 0, 0 )
	BriefingHeading:setShaderVector( 1, 0.02, 0, 0, 0 )
	BriefingHeading:setShaderVector( 2, 1, 0, 0, 0 )
	BriefingHeading:setLetterSpacing( 1 )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0.5, 0.5, -931, -853 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CPConfirmSelectionBox = CoD.CP_ConfirmSelection_Box.new( self, controller )
	CPConfirmSelectionBox:setLeftRight( 0.5, 0.5, -317, 858 )
	CPConfirmSelectionBox:setTopBottom( 0, 0, 195, 810 )
	self:addElement( CPConfirmSelectionBox )
	self.CPConfirmSelectionBox = CPConfirmSelectionBox
	
	local CPDifficultyImagePreview = CoD.CPDifficultyImagePreview.new( self, controller )
	CPDifficultyImagePreview:setLeftRight( 0.5, 0.5, -129, 628 )
	CPDifficultyImagePreview:setTopBottom( 0, 0, 203, 801 )
	self:addElement( CPDifficultyImagePreview )
	self.CPDifficultyImagePreview = CPDifficultyImagePreview
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( 0.5, 0.5, 849, 903 )
	Pixel200:setTopBottom( 0, 0, 979, 985 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0.5, 0.5, 864, 868 )
	LineSide:setTopBottom( 0, 1, 127, -57 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local CPDifficultyInGameChangeWarning = CoD.CPDifficultyInGameChangeWarning.new( self, controller )
	CPDifficultyInGameChangeWarning:setLeftRight( 0.5, 0.5, -864, -408 )
	CPDifficultyInGameChangeWarning:setTopBottom( 0, 0, 529, 703 )
	self:addElement( CPDifficultyInGameChangeWarning )
	self.CPDifficultyInGameChangeWarning = CPDifficultyInGameChangeWarning
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( self, controller )
	FETitleLineSingle:setLeftRight( 0, 1, 1746, 6 )
	FETitleLineSingle:setTopBottom( 1, 1, -3, 3 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( 0.5, 0.5, 847, 901 )
	pixelU:setTopBottom( 0, 0, 829, 834 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 0.5, 0.5, -360, -306 )
	pixelU0:setTopBottom( 0, 0, 827, 832 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local FETitleLineSingle00 = CoD.FE_TitleLineSingle.new( self, controller )
	FETitleLineSingle00:setLeftRight( 0.5, 0.5, -317, 864 )
	FETitleLineSingle00:setTopBottom( 0, 0, 827, 833 )
	self:addElement( FETitleLineSingle00 )
	self.FETitleLineSingle00 = FETitleLineSingle00
	
	local pixelU1 = LUI.UIImage.new()
	pixelU1:setLeftRight( 0.5, 0.5, 847, 901 )
	pixelU1:setTopBottom( 0, 0, 895, 900 )
	pixelU1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU1 )
	self.pixelU1 = pixelU1
	
	local pixelU00 = LUI.UIImage.new()
	pixelU00:setLeftRight( 0.5, 0.5, -360, -306 )
	pixelU00:setTopBottom( 0, 0, 893, 898 )
	pixelU00:setZRot( 180 )
	pixelU00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU00 )
	self.pixelU00 = pixelU00
	
	local FETitleLineSingle000 = CoD.FE_TitleLineSingle.new( self, controller )
	FETitleLineSingle000:setLeftRight( 0.5, 0.5, -317, 864 )
	FETitleLineSingle000:setTopBottom( 0, 0, 893, 899 )
	self:addElement( FETitleLineSingle000 )
	self.FETitleLineSingle000 = FETitleLineSingle000
	
	Description:linkToElementModel( DifficultyList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	BriefingHeading:linkToElementModel( DifficultyList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BriefingHeading:setText( Engine.Localize( modelValue ) )
		end
	end )
	CPDifficultyImagePreview:linkToElementModel( DifficultyList, nil, false, function ( model )
		CPDifficultyImagePreview:setModel( model, controller )
	end )
	self.resetProperties = function ()
		Description:completeAnimation()
		Description:setAlpha( 0.85 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		cpzm = {
			DefaultClip = function ()
				self.resetProperties()
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
		local retVal = nil
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.DifficultyList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DifficultyList:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics:close()
		self.CPConfirmSelectionBox:close()
		self.CPDifficultyImagePreview:close()
		self.CPDifficultyInGameChangeWarning:close()
		self.FETitleLineSingle:close()
		self.FETitleLineSingle00:close()
		self.FETitleLineSingle000:close()
		self.Description:close()
		self.BriefingHeading:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

