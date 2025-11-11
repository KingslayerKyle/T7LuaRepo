require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.Groups.GroupsListButton" )
require( "ui.uieditor.widgets.Groups.LeaderboardMakerChosenInformation" )
require( "ui.uieditor.widgets.Groups.LeaderboardMakerProgressBar" )
require( "ui.uieditor.widgets.hintText" )

LUI.createMenu.LeaderboardMaker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LeaderboardMaker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LeaderboardMaker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground = CoD.GroupsBackground.new( self, controller )
	GroupsBackground:setLeftRight( 0, 0, 0, 1920 )
	GroupsBackground:setTopBottom( 0, 0, 0, 1080 )
	GroupsBackground.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( GroupsBackground )
	self.GroupsBackground = GroupsBackground
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 183, 1737 )
	Background:setTopBottom( 0, 0, 271, 963 )
	Background:setAlpha( 0.1 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 183, 741 )
	Title:setTopBottom( 0, 0, 209, 254 )
	Title:setText( Engine.Localize( "GROUPS_LEADERBOARD_MAKER" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( 0, 0, 210, 843 )
	SubTitle:setTopBottom( 0, 0, 343, 388 )
	SubTitle:setTTF( "fonts/default.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 183, 723 )
	ButtonList:setTopBottom( 0, 0, 419, 903 )
	ButtonList:setWidgetType( CoD.GroupsListButton )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setDataSource( "LeaderboardMakerButtonList" )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = CoD.hintText.new( self, controller )
	HintText:setLeftRight( 0, 0, 210, 723 )
	HintText:setTopBottom( 0, 0, 551, 581 )
	HintText:setAlpha( 0 )
	self:addElement( HintText )
	self.HintText = HintText
	
	local LeaderboardMakerProgressBar = CoD.LeaderboardMakerProgressBar.new( self, controller )
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
	LeaderboardMakerProgressBar:setLeftRight( 0, 0, 210.5, 453.5 )
	LeaderboardMakerProgressBar:setTopBottom( 0, 0, 290, 328 )
	self:addElement( LeaderboardMakerProgressBar )
	self.LeaderboardMakerProgressBar = LeaderboardMakerProgressBar
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 750, 1209 )
	Description:setTopBottom( 0, 0, 412, 450 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 1355, 1613 )
	Icon:setTopBottom( 0, 0, 503, 752 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local LeaderboardMakerChosenInformation = CoD.LeaderboardMakerChosenInformation.new( self, controller )
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
	LeaderboardMakerChosenInformation:setLeftRight( 0, 0, 750, 971 )
	LeaderboardMakerChosenInformation:setTopBottom( 0, 0, 327, 365 )
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
	self.resetProperties = function ()
		HintText:completeAnimation()
		LeaderboardMakerProgressBar:completeAnimation()
		Icon:completeAnimation()
		Description:completeAnimation()
		LeaderboardMakerChosenInformation:completeAnimation()
		HintText:setAlpha( 0 )
		LeaderboardMakerProgressBar:setAlpha( 1 )
		Icon:setAlpha( 1 )
		Description:setAlpha( 1 )
		LeaderboardMakerChosenInformation:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetHintText( self, element, controller )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ProcessLeaderboardMakerBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsBackground:close()
		self.ButtonList:close()
		self.HintText:close()
		self.LeaderboardMakerProgressBar:close()
		self.LeaderboardMakerChosenInformation:close()
		self.SubTitle:close()
		self.Description:close()
		self.Icon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LeaderboardMaker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

