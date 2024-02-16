require( "ui.uieditor.menus.CPLevels.CPConfirmSelection" )
require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyImagePreview" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CPLevels.CPDifficultyInGameChangeWarning" )

local PrepareDifficultySettings = function ( controller )
	local values = {
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
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -67, 38.33 )
	background:setTopBottom( true, true, -36, 17.38 )
	background:setAlpha( 0.74 )
	background:setImage( RegisterImage( "uie_t7_menu_cp_bg_image" ) )
	self:addElement( background )
	self.background = background
	
	local DifficultyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	DifficultyList:makeFocusable()
	DifficultyList:setLeftRight( true, false, 75, 355 )
	DifficultyList:setTopBottom( true, false, 140, 308 )
	DifficultyList:setDataSource( "DifficultySettingsList" )
	DifficultyList:setWidgetType( CoD.list1ButtonNewStyle )
	DifficultyList:setVerticalCount( 5 )
	DifficultyList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( DifficultyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
			SetDifficulty( self, element, controller )
			NavigateToMenu( self, "CPConfirmSelection", true, controller )
			return true
		else
			SetDifficulty( self, element, controller )
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( true, false, 343, 885.1 )
	SecTitleBG0:setTopBottom( true, false, 551.67, 599.89 )
	SecTitleBG0:setAlpha( 0.65 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( true, false, 347, 375 )
	Image31:setTopBottom( true, false, 550, 555 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 347, 375 )
	Image300:setTopBottom( true, false, 596, 599.89 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 384, 885.1 )
	Description:setTopBottom( true, false, 604.78, 623.78 )
	Description:setAlpha( 0.55 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( true, false, 384, 568 )
	BriefingHeading:setTopBottom( true, false, 566, 586 )
	BriefingHeading:setTTF( "fonts/escom.ttf" )
	BriefingHeading:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BriefingHeading:setShaderVector( 0, 0.06, 0, 0, 0 )
	BriefingHeading:setShaderVector( 1, 0.02, 0, 0, 0 )
	BriefingHeading:setShaderVector( 2, 1, 0, 0, 0 )
	BriefingHeading:setLetterSpacing( 1 )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	local CPDifficultyImagePreview = CoD.CPDifficultyImagePreview.new( menu, controller )
	CPDifficultyImagePreview:setLeftRight( true, false, 349, 854 )
	CPDifficultyImagePreview:setTopBottom( true, false, 141, 540 )
	self:addElement( CPDifficultyImagePreview )
	self.CPDifficultyImagePreview = CPDifficultyImagePreview
	
	local MenuFrame = CoD.GenericMenuFrame.new( menu, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_customgames" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CPDifficultyInGameChangeWarning = CoD.CPDifficultyInGameChangeWarning.new( menu, controller )
	CPDifficultyInGameChangeWarning:setLeftRight( true, false, 863, 1195 )
	CPDifficultyInGameChangeWarning:setTopBottom( true, false, 170, 250 )
	self:addElement( CPDifficultyInGameChangeWarning )
	self.CPDifficultyInGameChangeWarning = CPDifficultyInGameChangeWarning
	
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		ShowHeaderIconOnly( menu )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = menu
	} )
	if not self:restoreState() then
		self.DifficultyList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DifficultyList:close()
		self.CPDifficultyImagePreview:close()
		self.MenuFrame:close()
		self.FEMenuLeftGraphics:close()
		self.CPDifficultyInGameChangeWarning:close()
		self.Description:close()
		self.BriefingHeading:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPSelectDifficulty.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

