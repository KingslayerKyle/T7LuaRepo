require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.oldTeamBased = CoDShared.IsGametypeTeamBased()
end

LUI.createMenu.CustomGamesLoadFileshareItem = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomGamesLoadFileshareItem" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomGamesLoadFileshareItem.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate:setLeftRight( true, false, -3.04, 1280.96 )
	FullscreenPopupTemplate:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate.RedLine:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	FullscreenPopupTemplate.ButtonList:setDataSource( "CustomGamesLoadOptionsButtonList" )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_LOAD" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOMGAMES_LOAD" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_LOAD_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_ERROR" ) )
	FullscreenPopupTemplate:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return FileshareIsPublishing()
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return FileshareIsPublishingInError()
			end
		}
	} )
	FullscreenPopupTemplate:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isPublishing" ), function ( model )
		self:updateElementState( FullscreenPopupTemplate, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isPublishing"
		} )
	end )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_LOAD" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
			end
		},
		Working = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_WAITING" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
			end
		},
		CannotLoad = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FullscreenPopupTemplate:completeAnimation()
				FullscreenPopupTemplate.WorkingTitle:completeAnimation()
				FullscreenPopupTemplate.Title:completeAnimation()
				FullscreenPopupTemplate.Subtitle:completeAnimation()
				self.FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_CANNOT_VIEW" ) )
				self.FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOMGAMES_CANNOT_VIEW" ) )
				self.FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_CANNOT_VIEW_DESC" ) )
				self.clipFinished( FullscreenPopupTemplate, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Working",
			condition = function ( menu, element, event )
				return not FileshareIsReadyToPublish( controller )
			end
		},
		{
			stateName = "CannotLoad",
			condition = function ( menu, element, event )
				return not IsInCustomGames( "" )
			end
		}
	} )
	self:registerEventHandler( "customgames_load_success", function ( self, event )
		local f11_local0 = nil
		SetPrimaryControllerPerControllerTableProperty( "gamesettingsUpdated", true )
		GameModeSelectedCommunity( self, self, controller )
		CustomGamesShowLoadSuccessToast( self, controller, CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ) )
		GoBack( self, controller )
		if not f11_local0 then
			f11_local0 = self:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:registerEventHandler( "customgames_load_failure", function ( self, event )
		local f12_local0 = nil
		CustomGamesShowLoadFailureToast( self, controller, CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ) )
		GoBack( self, controller )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomGamesLoadFileshareItem.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

