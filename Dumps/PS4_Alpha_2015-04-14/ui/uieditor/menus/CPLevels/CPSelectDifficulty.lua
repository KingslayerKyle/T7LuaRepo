require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CPLevels.CPConfirmSelection" )
require( "ui.uieditor.widgets.ListButton" )

local PrepareDifficultySettings = function ( controller )
	local values = {
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[0] .. "_CAPS" ),
				desc = Engine.Localize( "MENU_DIFF_RECRUIT_DESC" )
			},
			properties = {
				difficulty = 0
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[1] .. "_CAPS" ),
				desc = Engine.Localize( "MENU_DIFF_REGULAR_DESC" )
			},
			properties = {
				difficulty = 1
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[2] .. "_CAPS" ),
				desc = Engine.Localize( "MENU_DIFF_HARDENED_DESC" )
			},
			properties = {
				difficulty = 2
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[3] .. "_CAPS" ),
				desc = Engine.Localize( "MENU_DIFF_VETERAN_DESC" )
			},
			properties = {
				difficulty = 3
			}
		},
		{
			models = {
				displayText = Engine.Localize( CoD.DIFFICULTY[4] .. "_CAPS" ),
				desc = Engine.Localize( "MENU_DIFF_HEROIC_DESC" )
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
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setRGB( 1, 1, 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame:setRGB( 1, 1, 1 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SELECT_DIFFICULTY_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local DifficultyList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	DifficultyList:makeFocusable()
	DifficultyList:setLeftRight( true, false, 64, 424 )
	DifficultyList:setTopBottom( true, false, 144, 327 )
	DifficultyList:setRGB( 1, 1, 1 )
	DifficultyList:setDataSource( "DifficultySettingsList" )
	DifficultyList:setWidgetType( CoD.ListButton )
	DifficultyList:setVerticalCount( 5 )
	DifficultyList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if IsFirstTimeSetup( controller ) and not PropertyIsTrue( self, "disableConfirmSelection" ) then
			SetDifficulty( self, element, controller )
			NavigateToMenu( self, "CPConfirmSelection", true, controller )
		else
			SetDifficulty( self, element, controller )
			GoBack( self, controller )
		end
		return retVal
	end )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	local PreviewImage = LUI.UIImage.new()
	PreviewImage:setLeftRight( true, false, 587.5, 1216 )
	PreviewImage:setTopBottom( true, false, 135, 344 )
	PreviewImage:setRGB( 1, 1, 1 )
	PreviewImage:setAlpha( 0 )
	PreviewImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( PreviewImage )
	self.PreviewImage = PreviewImage
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 587.5, 1087.5 )
	Title:setTopBottom( true, false, 360, 437 )
	Title:setRGB( 1, 1, 1 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 587.5, 1087.5 )
	Desc:setTopBottom( true, false, 437, 461 )
	Desc:setRGB( 1, 1, 1 )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	PreviewImage:linkToElementModel( DifficultyList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	Title:linkToElementModel( DifficultyList, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	Desc:linkToElementModel( DifficultyList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	DifficultyList.id = "DifficultyList"
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
	self.close = function ( self )
		self.MenuFrame:close()
		self.DifficultyList:close()
		self.PreviewImage:close()
		self.Title:close()
		self.Desc:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

