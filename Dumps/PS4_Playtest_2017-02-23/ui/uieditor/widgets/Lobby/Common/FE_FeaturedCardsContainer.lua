require( "ui.uieditor.widgets.FaceButtonThatHidesWithLabel" )
require( "ui.uieditor.widgets.FeaturedOfflineText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCard" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerController" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsTitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.PlayGo.PlayGoDownloadProgressBar" )
require( "ui.uieditor.widgets.Lobby.PlayGo.PlayGoDownloadStatus" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true )
	Engine.CreateModel( rootModel, "Enabled", true )
	Engine.CreateModel( rootModel, "Update", true )
	Engine.CreateModel( rootModel, "hasAction", true )
	Engine.SetModelValue( Engine.CreateModel( rootModel, "CardSequence", false ), 0 )
end

local MouseKeyboardHookUp = function ( self, controller, menu )
	if not CoD.isPC then
		return 
	end
	self:setForceMouseEventDispatch( true )
	local bumperLeftMouseUp = function ( element, event )
		if FeaturedCards_IsEnabled( element, controller ) then
			if element.bumper then
				if element.bumper == "left" then
					FeaturedCardsGetPreviousCard( menu, element, controller, "", menu )
				else
					FeaturedCardsGetNextCard( menu, element, controller, "", menu )
				end
			end
			FeaturedCardsResetTimer( menu, element, controller, "", menu )
		end
		return true
	end
	
	if self.FEFeaturedCardsContainerController.RightBumperImage then
		self.FEFeaturedCardsContainerController.RightBumperImage.bumper = "right"
		self.FEFeaturedCardsContainerController.RightBumperImage:registerEventHandler( "leftmouseup", bumperLeftMouseUp )
	end
	if self.FEFeaturedCardsContainerController.LeftBumperImage then
		self.FEFeaturedCardsContainerController.LeftBumperImage.bumper = "left"
		self.FEFeaturedCardsContainerController.LeftBumperImage:registerEventHandler( "leftmouseup", bumperLeftMouseUp )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	MouseKeyboardHookUp( self, controller, menu )
	self.CardsList:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "CardSequence", function ( model )
		if self.CardsList.activeWidget ~= nil then
			local datasource = self.CardsList:getDataSource()
			local cardCount = datasource.getCount( self.CardsList )
			local cardSequence = Engine.GetModelValue( model )
			if cardCount <= cardSequence then
				cardSequence = 0
			elseif cardSequence < 0 then
				cardSequence = cardCount - 1
			end
			Engine.SetModelValue( model, cardSequence )
			local cardDataModelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "FeaturedCards" )
			local cardDataModel = Engine.GetModel( cardDataModelRoot, cardSequence + 1 )
			if cardDataModel then
				local cardIndex = CoD.SafeGetModelValue( cardDataModel, "index" )
				if cardIndex then
					local card = Engine.GetFeaturedCard( cardIndex )
					if card ~= nil and card.type == Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
						Engine.FeaturedCardMarkRead( controller, card.messageID )
						CoD.MetricsUtility.CRMMessageImpression( self, controller, "crm_featured" )
					end
				end
			end
			self.CardsList:setActiveIndex( 1, cardSequence + 1, false )
			if IsMenuInState( menu, "Left" ) then
				self:playSound( "feature_update" )
			end
		end
	end )
	local cardsData = Engine.GetFeaturedCardsData()
	local f4_local0 = LUI.UITimer.newElementTimer
	local f4_local1
	if cardsData then
		f4_local1 = cardsData.timer
		if not f4_local1 then
		
		else
			local timer = f4_local0( f4_local1, false, function ()
				if FeaturedWidgetControllerVisible( controller ) then
					local x = 1
					if self.CardsList.activeWidget ~= nil then
						FeaturedCardsGetNextCard()
					end
				end
			end, self )
			self.CarouselTimer = timer
			self:addElement( timer )
		end
	end
	f4_local1 = 1000
end

CoD.FE_FeaturedCardsContainer = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedCardsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedCardsContainer )
	self.id = "FE_FeaturedCardsContainer"
	self.soundSet = "Special_widgets"
	self:setLeftRight( 0, 0, 0, 502 )
	self:setTopBottom( 0, 0, 0, 249 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 39, 498 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 54, 228 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( 0, 0, 39, 498 )
	BlackBack:setTopBottom( 0, 0, 54, 228 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local CardsList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 200, nil, nil, true, true, 0, 0, false, false )
	CardsList:setLeftRight( 0, 0, 39, 498 )
	CardsList:setTopBottom( 0, 0, 57, 187 )
	CardsList:setWidgetType( CoD.FE_FeaturedCard )
	CardsList:setDataSource( "FeaturedCards" )
	CardsList:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "Update", function ( model )
		local element = CardsList
		UpdateDataSource( self, element, controller )
	end )
	CardsList:subscribeToGlobalModel( controller, "MarketingRoot", "Updated", function ( model )
		local element = CardsList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( CardsList )
	self.CardsList = CardsList
	
	local FeaturedLabel = LUI.UITightText.new()
	FeaturedLabel:setLeftRight( 0, 0, 50, 144 )
	FeaturedLabel:setTopBottom( 0, 0, 6, 44 )
	FeaturedLabel:setAlpha( 0 )
	FeaturedLabel:setText( Engine.Localize( "MENU_FEATURED_CAPS" ) )
	FeaturedLabel:setTTF( "fonts/default.ttf" )
	self:addElement( FeaturedLabel )
	self.FeaturedLabel = FeaturedLabel
	
	local FEFeaturedCardsContainerController = CoD.FE_FeaturedCardsContainerController.new( menu, controller )
	FEFeaturedCardsContainerController:setLeftRight( 1, 1, -232, -28 )
	FEFeaturedCardsContainerController:setTopBottom( 0.5, 0.5, 63, 103 )
	FEFeaturedCardsContainerController:linkToElementModel( self, nil, false, function ( model )
		FEFeaturedCardsContainerController:setModel( model, controller )
	end )
	self:addElement( FEFeaturedCardsContainerController )
	self.FEFeaturedCardsContainerController = FEFeaturedCardsContainerController
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( 0.5, 0.5, 237, 243 )
	emblemline0:setTopBottom( 0.5, 0.5, -69, 67 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local FEFeaturedCardsTitleBox0 = CoD.FE_FeaturedCardsTitleBox.new( menu, controller )
	FEFeaturedCardsTitleBox0:setLeftRight( 0, 0, 39, 498 )
	FEFeaturedCardsTitleBox0:setTopBottom( 0, 0, 21, 49 )
	FEFeaturedCardsTitleBox0.ScorestreaksLabel:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	self:addElement( FEFeaturedCardsTitleBox0 )
	self.FEFeaturedCardsTitleBox0 = FEFeaturedCardsTitleBox0
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( 0, 0, 39, 498 )
	FEFeaturedFrame0:setTopBottom( 0, 0, 54, 189 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 270, 276 )
	featlineleft:setTopBottom( 0, 0, -84, 392 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local Action = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	Action:setLeftRight( 0, 0, 62, 402 )
	Action:setTopBottom( 0, 0, 192, 222 )
	Action:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Action.ButtonImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Action )
	self.Action = Action
	
	local FeaturedOfflineText0 = CoD.FeaturedOfflineText.new( menu, controller )
	FeaturedOfflineText0:setLeftRight( 0, 0, 49, 488 )
	FeaturedOfflineText0:setTopBottom( 0, 0, 60, 98 )
	self:addElement( FeaturedOfflineText0 )
	self.FeaturedOfflineText0 = FeaturedOfflineText0
	
	local OfflineAction = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	OfflineAction:mergeStateConditions( {
		{
			stateName = "HideButtonAndText",
			condition = function ( menu, element, event )
				return ShouldHideOfflineNetworkPrompt( controller )
			end
		}
	} )
	OfflineAction:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( OfflineAction, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	OfflineAction:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( OfflineAction, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if OfflineAction.m_eventHandlers.input_source_changed then
		local currentEv = OfflineAction.m_eventHandlers.input_source_changed
		OfflineAction:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		OfflineAction:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	OfflineAction:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( OfflineAction, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	OfflineAction:setLeftRight( 0, 0, 62, 402 )
	OfflineAction:setTopBottom( 0, 0, 192, 222 )
	OfflineAction.ButtonLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	OfflineAction:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OfflineAction.ButtonImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( OfflineAction )
	self.OfflineAction = OfflineAction
	
	local currentEv = CoD.PlayGoDownloadProgressBar.new( menu, controller )
	currentEv:setLeftRight( 0, 0, 44, 494 )
	currentEv:setTopBottom( 0, 0, 201, 231 )
	currentEv:setAlpha( 0 )
	self:addElement( currentEv )
	self.PlayGoDownloadProgressBar0 = currentEv
	
	local PlayGoDownloadStatus0 = CoD.PlayGoDownloadStatus.new( menu, controller )
	PlayGoDownloadStatus0:setLeftRight( 0, 0, 42, 342 )
	PlayGoDownloadStatus0:setTopBottom( 0, 0, 154, 184 )
	PlayGoDownloadStatus0:setAlpha( 0 )
	self:addElement( PlayGoDownloadStatus0 )
	self.PlayGoDownloadStatus0 = PlayGoDownloadStatus0
	
	Action:linkToElementModel( CardsList, "actionTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Action.ButtonLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		CardsList:completeAnimation()
		BlackBack:completeAnimation()
		FEFeaturedCardsContainerController:completeAnimation()
		emblemline0:completeAnimation()
		FEFeaturedCardsTitleBox0:completeAnimation()
		FEFeaturedFrame0:completeAnimation()
		featlineleft:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		Action:completeAnimation()
		FeaturedOfflineText0:completeAnimation()
		OfflineAction:completeAnimation()
		currentEv:completeAnimation()
		PlayGoDownloadStatus0:completeAnimation()
		CardsList:setAlpha( 1 )
		BlackBack:setLeftRight( 0, 0, 39, 498 )
		BlackBack:setTopBottom( 0, 0, 54, 228 )
		BlackBack:setRGB( 0, 0, 0 )
		BlackBack:setAlpha( 0.2 )
		FEFeaturedCardsContainerController:setAlpha( 1 )
		emblemline0:setAlpha( 0.25 )
		FEFeaturedCardsTitleBox0:setAlpha( 1 )
		FEFeaturedFrame0:setAlpha( 0.5 )
		featlineleft:setAlpha( 1 )
		FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 39, 498 )
		FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 54, 228 )
		FEMemberBlurPanelContainer0:setAlpha( 1 )
		Action:setAlpha( 1 )
		FeaturedOfflineText0:setAlpha( 1 )
		OfflineAction:setAlpha( 1 )
		currentEv:setAlpha( 0 )
		PlayGoDownloadStatus0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setAlpha( 0 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				self.clipFinished( emblemline0, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 0 )
				self.clipFinished( FeaturedOfflineText0, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				self.clipFinished( OfflineAction, {} )
			end,
			FeaturedCardsVisible = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					local FEMemberBlurPanelContainer0Frame3 = function ( FEMemberBlurPanelContainer0, event )
						if not event.interrupted then
							FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Bounce )
						end
						FEMemberBlurPanelContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEMemberBlurPanelContainer0, event )
						else
							FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEMemberBlurPanelContainer0Frame3( FEMemberBlurPanelContainer0, event )
						return 
					else
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", FEMemberBlurPanelContainer0Frame3 )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local BlackBackFrame2 = function ( BlackBack, event )
					local BlackBackFrame3 = function ( BlackBack, event )
						if not event.interrupted then
							BlackBack:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Bounce )
						end
						BlackBack:setRGB( 0, 0, 0 )
						BlackBack:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( BlackBack, event )
						else
							BlackBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackBackFrame3( BlackBack, event )
						return 
					else
						BlackBack:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BlackBack:registerEventHandler( "transition_complete_keyframe", BlackBackFrame3 )
					end
				end
				
				BlackBack:completeAnimation()
				self.BlackBack:setRGB( 0, 0, 0 )
				self.BlackBack:setAlpha( 0 )
				BlackBackFrame2( BlackBack, {} )
				local CardsListFrame2 = function ( CardsList, event )
					local CardsListFrame3 = function ( CardsList, event )
						if not event.interrupted then
							CardsList:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Bounce )
						end
						CardsList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CardsList, event )
						else
							CardsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CardsListFrame3( CardsList, event )
						return 
					else
						CardsList:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						CardsList:registerEventHandler( "transition_complete_keyframe", CardsListFrame3 )
					end
				end
				
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				CardsListFrame2( CardsList, {} )
				local FEFeaturedCardsContainerControllerFrame2 = function ( FEFeaturedCardsContainerController, event )
					local FEFeaturedCardsContainerControllerFrame3 = function ( FEFeaturedCardsContainerController, event )
						if not event.interrupted then
							FEFeaturedCardsContainerController:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedCardsContainerController:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainerController, event )
						else
							FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerControllerFrame3( FEFeaturedCardsContainerController, event )
						return 
					else
						FEFeaturedCardsContainerController:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerControllerFrame3 )
					end
				end
				
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				FEFeaturedCardsContainerControllerFrame2( FEFeaturedCardsContainerController, {} )
				local emblemline0Frame2 = function ( emblemline0, event )
					local emblemline0Frame3 = function ( emblemline0, event )
						if not event.interrupted then
							emblemline0:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						emblemline0:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( emblemline0, event )
						else
							emblemline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						emblemline0Frame3( emblemline0, event )
						return 
					else
						emblemline0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						emblemline0:registerEventHandler( "transition_complete_keyframe", emblemline0Frame3 )
					end
				end
				
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				emblemline0Frame2( emblemline0, {} )
				local FEFeaturedCardsTitleBox0Frame2 = function ( FEFeaturedCardsTitleBox0, event )
					local FEFeaturedCardsTitleBox0Frame3 = function ( FEFeaturedCardsTitleBox0, event )
						if not event.interrupted then
							FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsTitleBox0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsTitleBox0, event )
						else
							FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsTitleBox0Frame3( FEFeaturedCardsTitleBox0, event )
						return 
					else
						FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsTitleBox0Frame3 )
					end
				end
				
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				FEFeaturedCardsTitleBox0Frame2( FEFeaturedCardsTitleBox0, {} )
				local FEFeaturedFrame0Frame2 = function ( FEFeaturedFrame0, event )
					local FEFeaturedFrame0Frame3 = function ( FEFeaturedFrame0, event )
						if not event.interrupted then
							FEFeaturedFrame0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedFrame0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( FEFeaturedFrame0, event )
						else
							FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedFrame0Frame3( FEFeaturedFrame0, event )
						return 
					else
						FEFeaturedFrame0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", FEFeaturedFrame0Frame3 )
					end
				end
				
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				FEFeaturedFrame0Frame2( FEFeaturedFrame0, {} )
				local featlineleftFrame2 = function ( featlineleft, event )
					local featlineleftFrame3 = function ( featlineleft, event )
						if not event.interrupted then
							featlineleft:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Bounce )
						end
						featlineleft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( featlineleft, event )
						else
							featlineleft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						featlineleftFrame3( featlineleft, event )
						return 
					else
						featlineleft:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						featlineleft:registerEventHandler( "transition_complete_keyframe", featlineleftFrame3 )
					end
				end
				
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				featlineleftFrame2( featlineleft, {} )
				local ActionFrame2 = function ( Action, event )
					if not event.interrupted then
						Action:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Action:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Action, event )
					else
						Action:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				ActionFrame2( Action, {} )
				local FeaturedOfflineText0Frame2 = function ( FeaturedOfflineText0, event )
					local FeaturedOfflineText0Frame3 = function ( FeaturedOfflineText0, event )
						if not event.interrupted then
							FeaturedOfflineText0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						FeaturedOfflineText0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FeaturedOfflineText0, event )
						else
							FeaturedOfflineText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FeaturedOfflineText0Frame3( FeaturedOfflineText0, event )
						return 
					else
						FeaturedOfflineText0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FeaturedOfflineText0:registerEventHandler( "transition_complete_keyframe", FeaturedOfflineText0Frame3 )
					end
				end
				
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 0 )
				FeaturedOfflineText0Frame2( FeaturedOfflineText0, {} )
				local OfflineActionFrame2 = function ( OfflineAction, event )
					local OfflineActionFrame3 = function ( OfflineAction, event )
						if not event.interrupted then
							OfflineAction:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						OfflineAction:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OfflineAction, event )
						else
							OfflineAction:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OfflineActionFrame3( OfflineAction, event )
						return 
					else
						OfflineAction:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						OfflineAction:registerEventHandler( "transition_complete_keyframe", OfflineActionFrame3 )
					end
				end
				
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				OfflineActionFrame2( OfflineAction, {} )
			end
		},
		FeaturedCardsVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0.2 )
				self.clipFinished( emblemline0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.7 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					if not event.interrupted then
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanelContainer0, event )
					else
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local BlackBackFrame2 = function ( BlackBack, event )
					local BlackBackFrame3 = function ( BlackBack, event )
						if not event.interrupted then
							BlackBack:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						BlackBack:setRGB( 0, 0, 0 )
						BlackBack:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackBack, event )
						else
							BlackBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackBackFrame3( BlackBack, event )
						return 
					else
						BlackBack:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						BlackBack:setAlpha( 0 )
						BlackBack:registerEventHandler( "transition_complete_keyframe", BlackBackFrame3 )
					end
				end
				
				BlackBack:completeAnimation()
				self.BlackBack:setRGB( 0, 0, 0 )
				self.BlackBack:setAlpha( 0.2 )
				BlackBackFrame2( BlackBack, {} )
				local CardsListFrame2 = function ( CardsList, event )
					local CardsListFrame3 = function ( CardsList, event )
						if not event.interrupted then
							CardsList:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						CardsList:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CardsList, event )
						else
							CardsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CardsListFrame3( CardsList, event )
						return 
					else
						CardsList:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						CardsList:setAlpha( 0 )
						CardsList:registerEventHandler( "transition_complete_keyframe", CardsListFrame3 )
					end
				end
				
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 1 )
				CardsListFrame2( CardsList, {} )
				local FEFeaturedCardsContainerControllerFrame2 = function ( FEFeaturedCardsContainerController, event )
					local FEFeaturedCardsContainerControllerFrame3 = function ( FEFeaturedCardsContainerController, event )
						if not event.interrupted then
							FEFeaturedCardsContainerController:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedCardsContainerController:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainerController, event )
						else
							FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerControllerFrame3( FEFeaturedCardsContainerController, event )
						return 
					else
						FEFeaturedCardsContainerController:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainerController:setAlpha( 0 )
						FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerControllerFrame3 )
					end
				end
				
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 1 )
				FEFeaturedCardsContainerControllerFrame2( FEFeaturedCardsContainerController, {} )
				local emblemline0Frame2 = function ( emblemline0, event )
					local emblemline0Frame3 = function ( emblemline0, event )
						if not event.interrupted then
							emblemline0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						emblemline0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( emblemline0, event )
						else
							emblemline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						emblemline0Frame3( emblemline0, event )
						return 
					else
						emblemline0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						emblemline0:setAlpha( 0 )
						emblemline0:registerEventHandler( "transition_complete_keyframe", emblemline0Frame3 )
					end
				end
				
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0.2 )
				emblemline0Frame2( emblemline0, {} )
				local FEFeaturedCardsTitleBox0Frame2 = function ( FEFeaturedCardsTitleBox0, event )
					local FEFeaturedCardsTitleBox0Frame3 = function ( FEFeaturedCardsTitleBox0, event )
						if not event.interrupted then
							FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedCardsTitleBox0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsTitleBox0, event )
						else
							FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsTitleBox0Frame3( FEFeaturedCardsTitleBox0, event )
						return 
					else
						FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsTitleBox0:setAlpha( 0 )
						FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsTitleBox0Frame3 )
					end
				end
				
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 1 )
				FEFeaturedCardsTitleBox0Frame2( FEFeaturedCardsTitleBox0, {} )
				local FEFeaturedFrame0Frame2 = function ( FEFeaturedFrame0, event )
					local FEFeaturedFrame0Frame3 = function ( FEFeaturedFrame0, event )
						if not event.interrupted then
							FEFeaturedFrame0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedFrame0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedFrame0, event )
						else
							FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedFrame0Frame3( FEFeaturedFrame0, event )
						return 
					else
						FEFeaturedFrame0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", FEFeaturedFrame0Frame3 )
					end
				end
				
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.7 )
				FEFeaturedFrame0Frame2( FEFeaturedFrame0, {} )
				local featlineleftFrame2 = function ( featlineleft, event )
					local featlineleftFrame3 = function ( featlineleft, event )
						if not event.interrupted then
							featlineleft:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						featlineleft:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( featlineleft, event )
						else
							featlineleft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						featlineleftFrame3( featlineleft, event )
						return 
					else
						featlineleft:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						featlineleft:registerEventHandler( "transition_complete_keyframe", featlineleftFrame3 )
					end
				end
				
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 1 )
				featlineleftFrame2( featlineleft, {} )
				local ActionFrame2 = function ( Action, event )
					if not event.interrupted then
						Action:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Action:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Action, event )
					else
						Action:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Action:completeAnimation()
				self.Action:setAlpha( 1 )
				ActionFrame2( Action, {} )
				local FeaturedOfflineText0Frame2 = function ( FeaturedOfflineText0, event )
					if not event.interrupted then
						FeaturedOfflineText0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					FeaturedOfflineText0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FeaturedOfflineText0, event )
					else
						FeaturedOfflineText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 1 )
				FeaturedOfflineText0Frame2( FeaturedOfflineText0, {} )
				local OfflineActionFrame2 = function ( OfflineAction, event )
					if not event.interrupted then
						OfflineAction:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					OfflineAction:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OfflineAction, event )
					else
						OfflineAction:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 1 )
				OfflineActionFrame2( OfflineAction, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEMemberBlurPanelContainer0Frame2 = function ( FEMemberBlurPanelContainer0, event )
					local FEMemberBlurPanelContainer0Frame3 = function ( FEMemberBlurPanelContainer0, event )
						if not event.interrupted then
							FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 219, true, false, CoD.TweenType.Bounce )
						end
						FEMemberBlurPanelContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEMemberBlurPanelContainer0, event )
						else
							FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEMemberBlurPanelContainer0Frame3( FEMemberBlurPanelContainer0, event )
						return 
					else
						FEMemberBlurPanelContainer0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FEMemberBlurPanelContainer0:registerEventHandler( "transition_complete_keyframe", FEMemberBlurPanelContainer0Frame3 )
					end
				end
				
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				FEMemberBlurPanelContainer0Frame2( FEMemberBlurPanelContainer0, {} )
				local BlackBackFrame2 = function ( BlackBack, event )
					local BlackBackFrame3 = function ( BlackBack, event )
						if not event.interrupted then
							BlackBack:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						BlackBack:setRGB( 0, 0, 0 )
						BlackBack:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( BlackBack, event )
						else
							BlackBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackBackFrame3( BlackBack, event )
						return 
					else
						BlackBack:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BlackBack:registerEventHandler( "transition_complete_keyframe", BlackBackFrame3 )
					end
				end
				
				BlackBack:completeAnimation()
				self.BlackBack:setRGB( 0, 0, 0 )
				self.BlackBack:setAlpha( 0 )
				BlackBackFrame2( BlackBack, {} )
				local CardsListFrame2 = function ( CardsList, event )
					local CardsListFrame3 = function ( CardsList, event )
						if not event.interrupted then
							CardsList:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						CardsList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CardsList, event )
						else
							CardsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CardsListFrame3( CardsList, event )
						return 
					else
						CardsList:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						CardsList:registerEventHandler( "transition_complete_keyframe", CardsListFrame3 )
					end
				end
				
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				CardsListFrame2( CardsList, {} )
				local FEFeaturedCardsContainerControllerFrame2 = function ( FEFeaturedCardsContainerController, event )
					local FEFeaturedCardsContainerControllerFrame3 = function ( FEFeaturedCardsContainerController, event )
						if not event.interrupted then
							FEFeaturedCardsContainerController:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedCardsContainerController:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainerController, event )
						else
							FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerControllerFrame3( FEFeaturedCardsContainerController, event )
						return 
					else
						FEFeaturedCardsContainerController:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainerController:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerControllerFrame3 )
					end
				end
				
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				FEFeaturedCardsContainerControllerFrame2( FEFeaturedCardsContainerController, {} )
				local emblemline0Frame2 = function ( emblemline0, event )
					local emblemline0Frame3 = function ( emblemline0, event )
						if not event.interrupted then
							emblemline0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						emblemline0:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( emblemline0, event )
						else
							emblemline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						emblemline0Frame3( emblemline0, event )
						return 
					else
						emblemline0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						emblemline0:registerEventHandler( "transition_complete_keyframe", emblemline0Frame3 )
					end
				end
				
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				emblemline0Frame2( emblemline0, {} )
				local FEFeaturedCardsTitleBox0Frame2 = function ( FEFeaturedCardsTitleBox0, event )
					local FEFeaturedCardsTitleBox0Frame3 = function ( FEFeaturedCardsTitleBox0, event )
						if not event.interrupted then
							FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedCardsTitleBox0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsTitleBox0, event )
						else
							FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsTitleBox0Frame3( FEFeaturedCardsTitleBox0, event )
						return 
					else
						FEFeaturedCardsTitleBox0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsTitleBox0:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsTitleBox0Frame3 )
					end
				end
				
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				FEFeaturedCardsTitleBox0Frame2( FEFeaturedCardsTitleBox0, {} )
				local FEFeaturedFrame0Frame2 = function ( FEFeaturedFrame0, event )
					local FEFeaturedFrame0Frame3 = function ( FEFeaturedFrame0, event )
						if not event.interrupted then
							FEFeaturedFrame0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						FEFeaturedFrame0:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( FEFeaturedFrame0, event )
						else
							FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedFrame0Frame3( FEFeaturedFrame0, event )
						return 
					else
						FEFeaturedFrame0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FEFeaturedFrame0:registerEventHandler( "transition_complete_keyframe", FEFeaturedFrame0Frame3 )
					end
				end
				
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				FEFeaturedFrame0Frame2( FEFeaturedFrame0, {} )
				local featlineleftFrame2 = function ( featlineleft, event )
					local featlineleftFrame3 = function ( featlineleft, event )
						if not event.interrupted then
							featlineleft:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						featlineleft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( featlineleft, event )
						else
							featlineleft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						featlineleftFrame3( featlineleft, event )
						return 
					else
						featlineleft:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						featlineleft:registerEventHandler( "transition_complete_keyframe", featlineleftFrame3 )
					end
				end
				
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				featlineleftFrame2( featlineleft, {} )
				local ActionFrame2 = function ( Action, event )
					local ActionFrame3 = function ( Action, event )
						if not event.interrupted then
							Action:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
						end
						Action:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Action, event )
						else
							Action:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ActionFrame3( Action, event )
						return 
					else
						Action:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Action:registerEventHandler( "transition_complete_keyframe", ActionFrame3 )
					end
				end
				
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				ActionFrame2( Action, {} )
				local FeaturedOfflineText0Frame2 = function ( FeaturedOfflineText0, event )
					local FeaturedOfflineText0Frame3 = function ( FeaturedOfflineText0, event )
						if not event.interrupted then
							FeaturedOfflineText0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						FeaturedOfflineText0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FeaturedOfflineText0, event )
						else
							FeaturedOfflineText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FeaturedOfflineText0Frame3( FeaturedOfflineText0, event )
						return 
					else
						FeaturedOfflineText0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						FeaturedOfflineText0:registerEventHandler( "transition_complete_keyframe", FeaturedOfflineText0Frame3 )
					end
				end
				
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 0 )
				FeaturedOfflineText0Frame2( FeaturedOfflineText0, {} )
				local OfflineActionFrame2 = function ( OfflineAction, event )
					local OfflineActionFrame3 = function ( OfflineAction, event )
						if not event.interrupted then
							OfflineAction:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
						end
						OfflineAction:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OfflineAction, event )
						else
							OfflineAction:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OfflineActionFrame3( OfflineAction, event )
						return 
					else
						OfflineAction:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						OfflineAction:registerEventHandler( "transition_complete_keyframe", OfflineActionFrame3 )
					end
				end
				
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				OfflineActionFrame2( OfflineAction, {} )
			end
		},
		OfflineState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 39, 498 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 54.5, 189.5 )
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setLeftRight( 0, 0, 39, 498 )
				self.BlackBack:setTopBottom( 0, 0, 54.5, 189.5 )
				self.BlackBack:setAlpha( 0 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				self.clipFinished( emblemline0, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 0 )
				self.clipFinished( FeaturedOfflineText0, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				self.clipFinished( OfflineAction, {} )
				currentEv:completeAnimation()
				self.PlayGoDownloadProgressBar0:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				PlayGoDownloadStatus0:completeAnimation()
				self.PlayGoDownloadStatus0:setAlpha( 0 )
				self.clipFinished( PlayGoDownloadStatus0, {} )
			end
		},
		DownloadingState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( 0, 0, 39, 498 )
				self.FEMemberBlurPanelContainer0:setTopBottom( 0, 0, 54.5, 189.5 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setLeftRight( 0, 0, 39, 498 )
				self.BlackBack:setTopBottom( 0, 0, 54.5, 189.5 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				self.clipFinished( OfflineAction, {} )
				currentEv:completeAnimation()
				self.PlayGoDownloadProgressBar0:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
				PlayGoDownloadStatus0:completeAnimation()
				self.PlayGoDownloadStatus0:setAlpha( 1 )
				self.clipFinished( PlayGoDownloadStatus0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FeaturedCardsVisible",
			condition = function ( menu, element, event )
				local f88_local0 = FeaturedCards_IsEnabled( element, controller )
				if f88_local0 then
					if not IsGameLobby() then
						f88_local0 = IsLive()
						if f88_local0 then
							f88_local0 = not PlayGoIsStillDownloading( controller )
						end
					else
						f88_local0 = false
					end
				end
				return f88_local0
			end
		},
		{
			stateName = "OfflineState",
			condition = function ( menu, element, event )
				local f89_local0
				if not IsGameLobby() and not IsLive() then
					f89_local0 = not PlayGoIsStillDownloading( controller )
				else
					f89_local0 = false
				end
				return f89_local0
			end
		},
		{
			stateName = "DownloadingState",
			condition = function ( menu, element, event )
				local f90_local0
				if not IsGameLobby() then
					f90_local0 = PlayGoIsStillDownloading( controller )
				else
					f90_local0 = false
				end
				return f90_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.Enabled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.Enabled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.stream" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.stream"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		} )
	end )
	self:subscribeToGlobalModel( controller, "MarketingRoot", "Updated", function ( model )
		local element = self
		FeaturedCardsUpdateCRMMessage( self, element, controller, "", menu )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
		self.CardsList:close()
		self.FEFeaturedCardsContainerController:close()
		self.FEFeaturedCardsTitleBox0:close()
		self.FEFeaturedFrame0:close()
		self.Action:close()
		self.FeaturedOfflineText0:close()
		self.OfflineAction:close()
		self.PlayGoDownloadProgressBar0:close()
		self.PlayGoDownloadStatus0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

