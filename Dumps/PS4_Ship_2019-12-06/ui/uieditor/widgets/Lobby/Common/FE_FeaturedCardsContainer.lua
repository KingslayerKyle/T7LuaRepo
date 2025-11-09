require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCard" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerController" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsTitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.FaceButtonThatHidesWithLabel" )
require( "ui.uieditor.widgets.FeaturedOfflineText" )
require( "ui.uieditor.widgets.Lobby.PlayGo.PlayGoDownloadProgressBar" )
require( "ui.uieditor.widgets.Lobby.PlayGo.PlayGoDownloadStatus" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true )
	Engine.CreateModel( f1_local0, "Enabled", true )
	Engine.CreateModel( f1_local0, "Update", true )
	Engine.CreateModel( f1_local0, "hasAction", true )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "CardSequence", false ), 0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not CoD.isPC then
		return 
	end
	f2_arg0:setForceMouseEventDispatch( true )
	local f2_local0 = function ( f3_arg0, f3_arg1 )
		if FeaturedCards_IsEnabled( f3_arg0, f2_arg1 ) then
			if f3_arg0.bumper then
				if f3_arg0.bumper == "left" then
					FeaturedCardsGetPreviousCard( f2_arg2, f3_arg0, f2_arg1, "", f2_arg2 )
				else
					FeaturedCardsGetNextCard( f2_arg2, f3_arg0, f2_arg1, "", f2_arg2 )
				end
			end
			FeaturedCardsResetTimer( f2_arg2, f3_arg0, f2_arg1, "", f2_arg2 )
		end
		return true
	end
	
	if f2_arg0.FEFeaturedCardsContainerController.RightBumperImage then
		f2_arg0.FEFeaturedCardsContainerController.RightBumperImage.bumper = "right"
		f2_arg0.FEFeaturedCardsContainerController.RightBumperImage:registerEventHandler( "leftmouseup", f2_local0 )
	end
	if f2_arg0.FEFeaturedCardsContainerController.LeftBumperImage then
		f2_arg0.FEFeaturedCardsContainerController.LeftBumperImage.bumper = "left"
		f2_arg0.FEFeaturedCardsContainerController.LeftBumperImage:registerEventHandler( "leftmouseup", f2_local0 )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local1( self, controller, menu )
	self.CardsList:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "CardSequence", function ( model )
		if self.CardsList.activeWidget ~= nil then
			local f5_local0 = self.CardsList:getDataSource()
			local f5_local1 = f5_local0.getCount( self.CardsList )
			local f5_local2 = Engine.GetModelValue( model )
			if f5_local1 <= f5_local2 then
				f5_local2 = 0
			elseif f5_local2 < 0 then
				f5_local2 = f5_local1 - 1
			end
			Engine.SetModelValue( model, f5_local2 )
			local f5_local3 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( controller ), "FeaturedCards" ), f5_local2 + 1 )
			if f5_local3 then
				local f5_local4 = CoD.SafeGetModelValue( f5_local3, "index" )
				local f5_local5 = Engine.CreateModel( f5_local3, "wasDisplayed" )
				local f5_local6 = CoD.SafeGetModelValue( f5_local3, "wasDisplayed" )
				if f5_local4 then
					local f5_local7 = Engine.GetFeaturedCard( f5_local4 )
					if f5_local7 ~= nil and f5_local7.type == Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
						Engine.FeaturedCardMarkRead( controller, f5_local7.messageID )
						if not f5_local6 then
							LUI.CoDMetrics.CRMMessageImpression( self, controller, "crm_featured" )
						end
						Engine.SetModelValue( f5_local5, 1 )
					end
				end
			end
			self.CardsList:setActiveIndex( 1, f5_local2 + 1, false )
			if IsMenuInState( menu, "Left" ) then
				self:playSound( "feature_update" )
			end
		end
	end )
	local f4_local0 = Engine.GetFeaturedCardsData()
	local f4_local1
	if f4_local0 then
		f4_local1 = f4_local0.timer
		if not f4_local1 then
		
		else
			if f4_local1 <= 0 then
				f4_local1 = 5000
			end
			local f4_local2 = LUI.UITimer.newElementTimer( f4_local1, false, function ()
				if FeaturedWidgetControllerVisible( controller ) then
					local f6_local0 = 1
					if self.CardsList.activeWidget ~= nil then
						FeaturedCardsGetNextCard()
					end
				end
			end, self )
			self.CarouselTimer = f4_local2
			self:addElement( f4_local2 )
		end
	end
	f4_local1 = 5000
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
	self:setLeftRight( true, false, 0, 335 )
	self:setTopBottom( true, false, 0, 166 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, false, 26, 332 )
	FEMemberBlurPanelContainer0:setTopBottom( true, false, 36, 152 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( true, false, 26, 332 )
	BlackBack:setTopBottom( true, false, 36, 152 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local CardsList = LUI.GridLayout.new( menu, controller, false, 0, 0, 1, 200, nil, nil, true, true, 0, 0, false, true )
	CardsList:setLeftRight( true, false, 26, 332 )
	CardsList:setTopBottom( true, false, 37.5, 124.5 )
	CardsList:setWidgetType( CoD.FE_FeaturedCard )
	CardsList:setSpacing( 1 )
	CardsList:setDataSource( "FeaturedCards" )
	CardsList:subscribeToGlobalModel( controller, "FeaturedCardsRoot", "Update", function ( model )
		UpdateDataSource( self, CardsList, controller )
	end )
	CardsList:subscribeToGlobalModel( controller, "MarketingRoot", "Updated", function ( model )
		UpdateDataSource( self, CardsList, controller )
	end )
	CardsList:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		UpdateDataSource( self, CardsList, controller )
	end )
	self:addElement( CardsList )
	self.CardsList = CardsList
	
	local FeaturedLabel = LUI.UITightText.new()
	FeaturedLabel:setLeftRight( true, false, 33, 96 )
	FeaturedLabel:setTopBottom( true, false, 4, 29 )
	FeaturedLabel:setAlpha( 0 )
	FeaturedLabel:setText( Engine.Localize( "MENU_FEATURED_CAPS" ) )
	FeaturedLabel:setTTF( "fonts/default.ttf" )
	self:addElement( FeaturedLabel )
	self.FeaturedLabel = FeaturedLabel
	
	local FEFeaturedCardsContainerController = CoD.FE_FeaturedCardsContainerController.new( menu, controller )
	FEFeaturedCardsContainerController:setLeftRight( false, true, -155, -19 )
	FEFeaturedCardsContainerController:setTopBottom( false, false, 42, 69 )
	FEFeaturedCardsContainerController:linkToElementModel( self, nil, false, function ( model )
		FEFeaturedCardsContainerController:setModel( model, controller )
	end )
	self:addElement( FEFeaturedCardsContainerController )
	self.FEFeaturedCardsContainerController = FEFeaturedCardsContainerController
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( true, false, 0, 28 )
	pixelLL:setTopBottom( false, false, 41, 45 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 28 )
	Image1:setTopBottom( false, false, -47, -43 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local pixelUR = LUI.UIImage.new()
	pixelUR:setLeftRight( false, false, 145, 181 )
	pixelUR:setTopBottom( false, false, -46.5, -43 )
	pixelUR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelUR )
	self.pixelUR = pixelUR
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, 145, 181 )
	Image2:setTopBottom( false, false, 42, 45.5 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( false, false, 158, 162 )
	emblemline0:setTopBottom( false, false, -46, 45 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( true, false, -4, 28 )
	pixelMiddle:setTopBottom( false, false, -28, 24 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local FEFeaturedCardsTitleBox0 = CoD.FE_FeaturedCardsTitleBox.new( menu, controller )
	FEFeaturedCardsTitleBox0:setLeftRight( true, false, 26, 332 )
	FEFeaturedCardsTitleBox0:setTopBottom( true, false, 14, 33 )
	FEFeaturedCardsTitleBox0.ScorestreaksLabel:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	self:addElement( FEFeaturedCardsTitleBox0 )
	self.FEFeaturedCardsTitleBox0 = FEFeaturedCardsTitleBox0
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 26, 332 )
	FEFeaturedFrame0:setTopBottom( true, false, 36, 126 )
	FEFeaturedFrame0:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 180, 184 )
	featlineleft:setTopBottom( true, false, -56, 261 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local Action = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	Action:setLeftRight( true, false, 41, 267.76 )
	Action:setTopBottom( true, false, 128, 148 )
	Action:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Action.ButtonImage.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( Action )
	self.Action = Action
	
	local FeaturedOfflineText0 = CoD.FeaturedOfflineText.new( menu, controller )
	FeaturedOfflineText0:setLeftRight( true, false, 33, 325.5 )
	FeaturedOfflineText0:setTopBottom( true, false, 40, 65 )
	self:addElement( FeaturedOfflineText0 )
	self.FeaturedOfflineText0 = FeaturedOfflineText0
	
	local OfflineAction = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	OfflineAction:setLeftRight( true, false, 41, 267.76 )
	OfflineAction:setTopBottom( true, false, 128, 148 )
	OfflineAction.ButtonLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	OfflineAction:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			OfflineAction.ButtonImage.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
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
		local PlayGoDownloadProgressBar0 = OfflineAction.m_eventHandlers.input_source_changed
		OfflineAction:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return PlayGoDownloadProgressBar0( element, event )
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
	self:addElement( OfflineAction )
	self.OfflineAction = OfflineAction
	
	local PlayGoDownloadProgressBar0 = CoD.PlayGoDownloadProgressBar.new( menu, controller )
	PlayGoDownloadProgressBar0:setLeftRight( true, false, 29.5, 329.5 )
	PlayGoDownloadProgressBar0:setTopBottom( true, false, 134, 154 )
	PlayGoDownloadProgressBar0:setAlpha( 0 )
	self:addElement( PlayGoDownloadProgressBar0 )
	self.PlayGoDownloadProgressBar0 = PlayGoDownloadProgressBar0
	
	local PlayGoDownloadStatus0 = CoD.PlayGoDownloadStatus.new( menu, controller )
	PlayGoDownloadStatus0:setLeftRight( true, false, 28, 228 )
	PlayGoDownloadStatus0:setTopBottom( true, false, 102.5, 122.5 )
	PlayGoDownloadStatus0:setAlpha( 0 )
	self:addElement( PlayGoDownloadStatus0 )
	self.PlayGoDownloadStatus0 = PlayGoDownloadStatus0
	
	Action:linkToElementModel( CardsList, "actionTitle", true, function ( model )
		local actionTitle = Engine.GetModelValue( model )
		if actionTitle then
			Action.ButtonLabel:setText( Engine.Localize( actionTitle ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setRGB( 0, 0, 0 )
				self.BlackBack:setAlpha( 0 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 0 )
				self.clipFinished( pixelLL, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				self.clipFinished( pixelUR, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				self.clipFinished( emblemline0, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				self.clipFinished( pixelMiddle, {} )
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
				PlayGoDownloadProgressBar0:completeAnimation()
				self.PlayGoDownloadProgressBar0:setAlpha( 0 )
				self.clipFinished( PlayGoDownloadProgressBar0, {} )
				PlayGoDownloadStatus0:completeAnimation()
				self.PlayGoDownloadStatus0:setAlpha( 0 )
				self.clipFinished( PlayGoDownloadStatus0, {} )
			end,
			FeaturedCardsVisible = function ()
				self:setupElementClipCounter( 17 )
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
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
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
				local pixelLLFrame2 = function ( pixelLL, event )
					local pixelLLFrame3 = function ( pixelLL, event )
						if not event.interrupted then
							pixelLL:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						pixelLL:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelLL, event )
						else
							pixelLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelLLFrame3( pixelLL, event )
						return 
					else
						pixelLL:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelLL:registerEventHandler( "transition_complete_keyframe", pixelLLFrame3 )
					end
				end
				
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 0 )
				pixelLLFrame2( pixelLL, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						Image1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local pixelURFrame2 = function ( pixelUR, event )
					local pixelURFrame3 = function ( pixelUR, event )
						if not event.interrupted then
							pixelUR:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						pixelUR:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelUR, event )
						else
							pixelUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelURFrame3( pixelUR, event )
						return 
					else
						pixelUR:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelUR:registerEventHandler( "transition_complete_keyframe", pixelURFrame3 )
					end
				end
				
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				pixelURFrame2( pixelUR, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						Image2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
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
				local pixelMiddleFrame2 = function ( pixelMiddle, event )
					local pixelMiddleFrame3 = function ( pixelMiddle, event )
						if not event.interrupted then
							pixelMiddle:beginAnimation( "keyframe", 290, true, false, CoD.TweenType.Bounce )
						end
						pixelMiddle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelMiddle, event )
						else
							pixelMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelMiddleFrame3( pixelMiddle, event )
						return 
					else
						pixelMiddle:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelMiddle:registerEventHandler( "transition_complete_keyframe", pixelMiddleFrame3 )
					end
				end
				
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				pixelMiddleFrame2( pixelMiddle, {} )
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
				self:setupElementClipCounter( 16 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setAlpha( 0.2 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 1 )
				self.clipFinished( CardsList, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 1 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 1 )
				self.clipFinished( pixelUR, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0.2 )
				self.clipFinished( emblemline0, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 1 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.7 )
				self.clipFinished( FEFeaturedFrame0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 1 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 1 )
				self.clipFinished( Action, {} )
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 1 )
				self.clipFinished( FeaturedOfflineText0, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 1 )
				self.clipFinished( OfflineAction, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
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
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
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
				local pixelLLFrame2 = function ( pixelLL, event )
					local pixelLLFrame3 = function ( pixelLL, event )
						if not event.interrupted then
							pixelLL:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						pixelLL:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( pixelLL, event )
						else
							pixelLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelLLFrame3( pixelLL, event )
						return 
					else
						pixelLL:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						pixelLL:setAlpha( 0 )
						pixelLL:registerEventHandler( "transition_complete_keyframe", pixelLLFrame3 )
					end
				end
				
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				pixelLLFrame2( pixelLL, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						Image1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 0 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				local pixelURFrame2 = function ( pixelUR, event )
					local pixelURFrame3 = function ( pixelUR, event )
						if not event.interrupted then
							pixelUR:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						pixelUR:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( pixelUR, event )
						else
							pixelUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelURFrame3( pixelUR, event )
						return 
					else
						pixelUR:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						pixelUR:setAlpha( 0 )
						pixelUR:registerEventHandler( "transition_complete_keyframe", pixelURFrame3 )
					end
				end
				
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 1 )
				pixelURFrame2( pixelUR, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						Image2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Image2:setAlpha( 0 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				Image2Frame2( Image2, {} )
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
				local pixelMiddleFrame2 = function ( pixelMiddle, event )
					local pixelMiddleFrame3 = function ( pixelMiddle, event )
						if not event.interrupted then
							pixelMiddle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						pixelMiddle:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( pixelMiddle, event )
						else
							pixelMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelMiddleFrame3( pixelMiddle, event )
						return 
					else
						pixelMiddle:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						pixelMiddle:setAlpha( 0 )
						pixelMiddle:registerEventHandler( "transition_complete_keyframe", pixelMiddleFrame3 )
					end
				end
				
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				pixelMiddleFrame2( pixelMiddle, {} )
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
				self:setupElementClipCounter( 17 )
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
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
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
				local pixelLLFrame2 = function ( pixelLL, event )
					local pixelLLFrame3 = function ( pixelLL, event )
						if not event.interrupted then
							pixelLL:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						pixelLL:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelLL, event )
						else
							pixelLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelLLFrame3( pixelLL, event )
						return 
					else
						pixelLL:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelLL:registerEventHandler( "transition_complete_keyframe", pixelLLFrame3 )
					end
				end
				
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 0 )
				pixelLLFrame2( pixelLL, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						Image1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local pixelURFrame2 = function ( pixelUR, event )
					local pixelURFrame3 = function ( pixelUR, event )
						if not event.interrupted then
							pixelUR:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						pixelUR:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelUR, event )
						else
							pixelUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelURFrame3( pixelUR, event )
						return 
					else
						pixelUR:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelUR:registerEventHandler( "transition_complete_keyframe", pixelURFrame3 )
					end
				end
				
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				pixelURFrame2( pixelUR, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						Image2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
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
				local pixelMiddleFrame2 = function ( pixelMiddle, event )
					local pixelMiddleFrame3 = function ( pixelMiddle, event )
						if not event.interrupted then
							pixelMiddle:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
						end
						pixelMiddle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelMiddle, event )
						else
							pixelMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelMiddleFrame3( pixelMiddle, event )
						return 
					else
						pixelMiddle:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						pixelMiddle:registerEventHandler( "transition_complete_keyframe", pixelMiddleFrame3 )
					end
				end
				
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				pixelMiddleFrame2( pixelMiddle, {} )
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
				self:setupElementClipCounter( 19 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 26, 332 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, 36, 126 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setLeftRight( true, false, 26, 332 )
				self.BlackBack:setTopBottom( true, false, 36, 126 )
				self.BlackBack:setAlpha( 0.2 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 1 )
				self.clipFinished( pixelUR, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0.25 )
				self.clipFinished( emblemline0, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 1 )
				self.clipFinished( FeaturedOfflineText0, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 1 )
				self.clipFinished( OfflineAction, {} )
				PlayGoDownloadProgressBar0:completeAnimation()
				self.PlayGoDownloadProgressBar0:setAlpha( 1 )
				self.clipFinished( PlayGoDownloadProgressBar0, {} )
				PlayGoDownloadStatus0:completeAnimation()
				self.PlayGoDownloadStatus0:setAlpha( 1 )
				self.clipFinished( PlayGoDownloadStatus0, {} )
			end
		},
		DownloadingState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setLeftRight( true, false, 26, 332 )
				self.FEMemberBlurPanelContainer0:setTopBottom( true, false, 36, 126 )
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				BlackBack:completeAnimation()
				self.BlackBack:setLeftRight( true, false, 26, 332 )
				self.BlackBack:setTopBottom( true, false, 36, 126 )
				self.BlackBack:setAlpha( 0.2 )
				self.clipFinished( BlackBack, {} )
				CardsList:completeAnimation()
				self.CardsList:setAlpha( 0 )
				self.clipFinished( CardsList, {} )
				FeaturedLabel:completeAnimation()
				self.FeaturedLabel:setAlpha( 0 )
				self.clipFinished( FeaturedLabel, {} )
				FEFeaturedCardsContainerController:completeAnimation()
				self.FEFeaturedCardsContainerController:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainerController, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 1 )
				self.clipFinished( pixelLL, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 1 )
				self.clipFinished( pixelUR, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0.25 )
				self.clipFinished( emblemline0, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )
				FEFeaturedCardsTitleBox0:completeAnimation()
				self.FEFeaturedCardsTitleBox0:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsTitleBox0, {} )
				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0.5 )
				self.clipFinished( FEFeaturedFrame0, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
				FeaturedOfflineText0:completeAnimation()
				self.FeaturedOfflineText0:setAlpha( 1 )
				self.clipFinished( FeaturedOfflineText0, {} )
				OfflineAction:completeAnimation()
				self.OfflineAction:setAlpha( 0 )
				self.clipFinished( OfflineAction, {} )
				PlayGoDownloadProgressBar0:completeAnimation()
				self.PlayGoDownloadProgressBar0:setAlpha( 1 )
				self.clipFinished( PlayGoDownloadProgressBar0, {} )
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
				local f118_local0 = FeaturedCards_IsEnabled( element, controller )
				if f118_local0 then
					f118_local0 = IsLive()
					if f118_local0 then
						if not PlayGoIsStillDownloading( controller ) then
							f118_local0 = not IsGameLobbyExcept( "ZMLobbyOnline" )
						else
							f118_local0 = false
						end
					end
				end
				return f118_local0
			end
		},
		{
			stateName = "OfflineState",
			condition = function ( menu, element, event )
				local f119_local0
				if not IsLive() and not PlayGoIsStillDownloading( controller ) then
					f119_local0 = not IsGameLobbyExcept( "ZMLobbyOnline" )
				else
					f119_local0 = false
				end
				return f119_local0
			end
		},
		{
			stateName = "DownloadingState",
			condition = function ( menu, element, event )
				return PlayGoIsStillDownloading( controller ) and not IsGameLobbyExcept( "ZMLobbyOnline" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
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
		FeaturedCardsUpdateCRMMessage( self, self, controller, "", menu )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
		element.CardsList:close()
		element.FEFeaturedCardsContainerController:close()
		element.FEFeaturedCardsTitleBox0:close()
		element.FEFeaturedFrame0:close()
		element.Action:close()
		element.FeaturedOfflineText0:close()
		element.OfflineAction:close()
		element.PlayGoDownloadProgressBar0:close()
		element.PlayGoDownloadStatus0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

