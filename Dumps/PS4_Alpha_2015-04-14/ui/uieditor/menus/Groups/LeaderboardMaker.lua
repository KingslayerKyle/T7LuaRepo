require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.Groups.GroupsListButton" )
require( "ui.uieditor.widgets.hintText" )
require( "ui.uieditor.widgets.Groups.LeaderboardMakerProgressBar" )
require( "ui.uieditor.widgets.Groups.LeaderboardMakerChosenInformation" )

LUI.createMenu.LeaderboardMaker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LeaderboardMaker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground = CoD.GroupsBackground.new( self, controller )
	GroupsBackground:setLeftRight( true, false, 0, 1280 )
	GroupsBackground:setTopBottom( true, false, 0, 720 )
	GroupsBackground:setRGB( 1, 1, 1 )
	GroupsBackground.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( GroupsBackground )
	self.GroupsBackground = GroupsBackground
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 122, 1158 )
	Background:setTopBottom( true, false, 181, 642 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0.1 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 122, 494 )
	Title:setTopBottom( true, false, 139.5, 169.5 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "GROUPS_LEADERBOARD_MAKER" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( true, false, 140, 561.75 )
	SubTitle:setTopBottom( true, false, 228.5, 258.5 )
	SubTitle:setRGB( 1, 1, 1 )
	SubTitle:setTTF( "fonts/default.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 122, 482 )
	ButtonList:setTopBottom( true, false, 275, 606 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "LeaderboardMakerButtonList" )
	ButtonList:setWidgetType( CoD.GroupsListButton )
	ButtonList:setVerticalCount( 9 )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = CoD.hintText.new( self, controller )
	HintText:setLeftRight( true, false, 140, 482 )
	HintText:setTopBottom( true, false, 367, 387 )
	HintText:setRGB( 1, 1, 1 )
	HintText:setAlpha( 0 )
	self:addElement( HintText )
	self.HintText = HintText
	
	local LeaderboardMakerProgressBar = CoD.LeaderboardMakerProgressBar.new( self, controller )
	LeaderboardMakerProgressBar:setLeftRight( true, false, 140, 302 )
	LeaderboardMakerProgressBar:setTopBottom( true, false, 193.5, 218.5 )
	LeaderboardMakerProgressBar:setRGB( 1, 1, 1 )
	LeaderboardMakerProgressBar:mergeStateConditions( {
		{
			stateName = "StepTwo",
			condition = function ( menu, element, event )
				return IsGroupLeaderboardMakerState( controller, "ChooseDefaultSort" )
			end
		},
		{
			stateName = "StepThree",
			condition = function ( menu, element, event )
				return IsGroupLeaderboardMakerState( controller, "ChooseTimeFrame" )
			end
		}
	} )
	LeaderboardMakerProgressBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.leaderboardmaker.state" ), function ( model )
		self:updateElementState( LeaderboardMakerProgressBar, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.leaderboardmaker.state"
		} )
	end )
	self:addElement( LeaderboardMakerProgressBar )
	self.LeaderboardMakerProgressBar = LeaderboardMakerProgressBar
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 500, 806 )
	Description:setTopBottom( true, false, 275, 300 )
	Description:setRGB( 1, 1, 1 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 903.5, 1075.5 )
	Icon:setTopBottom( true, false, 335.5, 501.5 )
	Icon:setRGB( 1, 1, 1 )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local LeaderboardMakerChosenInformation = CoD.LeaderboardMakerChosenInformation.new( self, controller )
	LeaderboardMakerChosenInformation:setLeftRight( true, false, 500, 647.5 )
	LeaderboardMakerChosenInformation:setTopBottom( true, false, 218.5, 243.5 )
	LeaderboardMakerChosenInformation:setRGB( 1, 1, 1 )
	LeaderboardMakerChosenInformation:mergeStateConditions( {
		{
			stateName = "StepTwo",
			condition = function ( menu, element, event )
				return IsGroupLeaderboardMakerState( controller, "ChooseDefaultSort" )
			end
		},
		{
			stateName = "StepThree",
			condition = function ( menu, element, event )
				return IsGroupLeaderboardMakerState( controller, "ChooseTimeFrame" )
			end
		}
	} )
	LeaderboardMakerChosenInformation:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.leaderboardmaker.state" ), function ( model )
		self:updateElementState( LeaderboardMakerChosenInformation, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.leaderboardmaker.state"
		} )
	end )
	self:addElement( LeaderboardMakerChosenInformation )
	self.LeaderboardMakerChosenInformation = LeaderboardMakerChosenInformation
	
	SubTitle:linkToElementModel( ButtonList, "titleText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	HintText:linkToElementModel( ButtonList, nil, false, function ( model )
		HintText:setModel( model, controller )
	end )
	Description:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	Icon:linkToElementModel( ButtonList, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	LeaderboardMakerChosenInformation:linkToElementModel( ButtonList, "baseLeaderboard", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderboardMakerChosenInformation.BaseLeaderboard:setText( Engine.Localize( modelValue ) )
		end
	end )
	LeaderboardMakerChosenInformation:linkToElementModel( ButtonList, "sortColumn", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderboardMakerChosenInformation.DefaultSort:setText( Engine.Localize( modelValue ) )
		end
	end )
	LeaderboardMakerChosenInformation:linkToElementModel( ButtonList, "timeFrame", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeaderboardMakerChosenInformation.TimeFrame:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.clipFinished( HintText, {} )
				LeaderboardMakerProgressBar:completeAnimation()
				self.LeaderboardMakerProgressBar:setAlpha( 0 )
				self.clipFinished( LeaderboardMakerProgressBar, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				LeaderboardMakerChosenInformation:completeAnimation()
				self.LeaderboardMakerChosenInformation:setAlpha( 0 )
				self.clipFinished( LeaderboardMakerChosenInformation, {} )
			end
		},
		Customizing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				HintText:completeAnimation()
				self.HintText:setAlpha( 0 )
				self.clipFinished( HintText, {} )
				LeaderboardMakerProgressBar:completeAnimation()
				self.LeaderboardMakerProgressBar:setAlpha( 1 )
				self.clipFinished( LeaderboardMakerProgressBar, {} )
				Description:completeAnimation()
				self.Description:setAlpha( 1 )
				self.clipFinished( Description, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
				LeaderboardMakerChosenInformation:completeAnimation()
				self.LeaderboardMakerChosenInformation:setAlpha( 1 )
				self.clipFinished( LeaderboardMakerChosenInformation, {} )
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
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.leaderboardmaker.state"
		} )
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
			ProcessLeaderboardMakerBack( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetHintText( self, element, controller )
		return retVal
	end )
	self:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "GroupsBackground", controller, "SelectedGroup" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ButtonList.id = "ButtonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GroupsBackground:close()
		self.ButtonList:close()
		self.HintText:close()
		self.LeaderboardMakerProgressBar:close()
		self.LeaderboardMakerChosenInformation:close()
		self.SubTitle:close()
		self.Description:close()
		self.Icon:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

