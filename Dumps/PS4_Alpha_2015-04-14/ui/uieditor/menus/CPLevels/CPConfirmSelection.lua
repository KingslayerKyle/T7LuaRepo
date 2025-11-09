require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.ListButton" )

local PrepareConfirmCharacterList = function ( controller )
	local values = {
		{
			models = {
				displayText = Engine.Localize( "MENU_BEGIN_GAME" ),
				desc = Engine.Localize( "MENU_DIFF_RECRUIT_DESC" )
			},
			properties = {
				difficulty = 0,
				action = function ( self, element, controller, actionParam, menu )
					SetFirstTimeSetupComplete( self, element, controller )
					StartNewGame( self, element, controller )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_GENDER" ),
				desc = Engine.Localize( "MENU_DIFF_REGULAR_DESC" )
			},
			properties = {
				difficulty = 1,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "ChooseGender", true, controller )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_FACE" ),
				desc = Engine.Localize( "MENU_DIFF_HARDENED_DESC" )
			},
			properties = {
				difficulty = 2,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "ChooseHead", true, controller )
				end
			}
		},
		{
			models = {
				displayText = Engine.Localize( "MENU_CHANGE_DIFFICULTY" ),
				desc = Engine.Localize( "MENU_DIFF_VETERAN_DESC" )
			},
			properties = {
				difficulty = 3,
				action = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "CPSelectDifficulty", true, controller )
				end
			}
		}
	}
	return values
end

DataSources.ConfirmCharacterList = DataSourceHelpers.ListSetup( "ConfirmCharacterList", PrepareConfirmCharacterList, true )
LUI.createMenu.CPConfirmSelection = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPConfirmSelection" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame:setRGB( 1, 1, 1 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CONFIRM_SELECTION_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Buttons = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 64, 424 )
	Buttons:setTopBottom( true, false, 144, 327 )
	Buttons:setRGB( 1, 1, 1 )
	Buttons:setDataSource( "ConfirmCharacterList" )
	Buttons:setWidgetType( CoD.ListButton )
	Buttons:setVerticalCount( 5 )
	Buttons:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 1021.5, 1153.5 )
	Image:setTopBottom( true, false, 118.5, 327.5 )
	Image:setRGB( 1, 1, 1 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image )
	self.Image = Image
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 1021.5, 1216 )
	Title:setTopBottom( true, false, 327.5, 404.5 )
	Title:setRGB( 1, 1, 1 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( true, false, 1021.5, 1216 )
	SubTitle:setTopBottom( true, false, 404.5, 428.5 )
	SubTitle:setRGB( 1, 1, 1 )
	SubTitle:setTTF( "fonts/default.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	Image:linkToElementModel( Buttons, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	Title:linkToElementModel( Buttons, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	SubTitle:linkToElementModel( Buttons, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SubTitle:setText( Engine.Localize( modelValue ) )
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
	self:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	Buttons.id = "Buttons"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Buttons:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.MenuFrame:close()
		self.Buttons:close()
		self.Image:close()
		self.Title:close()
		self.SubTitle:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

