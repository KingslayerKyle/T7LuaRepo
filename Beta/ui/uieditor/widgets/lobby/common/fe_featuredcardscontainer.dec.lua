require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCard" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainerController" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsTitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true )
	Engine.CreateModel( rootModel, "Enabled", true )
	Engine.CreateModel( rootModel, "Update", true )
	Engine.SetModelValue( Engine.CreateModel( rootModel, "CardSequence", false ), 0 )
end

local PostLoadFunc = function ( self, controller, menu )
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
			self.CardsList:setActiveIndex( 1, cardSequence + 1, false )
			if IsMenuInState( menu, "Left" ) then
				self:playSound( "feature_update" )
			end
		end
	end )
	local cardsData = Engine.GetFeaturedCardsData()
	if cardsData ~= nil and cardsData.enabled == true then
		local timer = LUI.UITimer.newElementTimer( cardsData.timer, false, function ()
			local x = 1
			if self.CardsList.activeWidget ~= nil then
				FeaturedCardsGetNextCard()
			end
		end, self )
		self.CarouselTimer = timer
		self:addElement( timer )
	end
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
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 10, 10, 0, 0 )
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
	CardsList:setTopBottom( true, false, 29, 164 )
	CardsList:setDataSource( "FeaturedCards" )
	CardsList:setWidgetType( CoD.FE_FeaturedCard )
	CardsList:setSpacing( 1 )
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
	FeaturedLabel:setLeftRight( true, false, 33, 96 )
	FeaturedLabel:setTopBottom( true, false, 4, 29 )
	FeaturedLabel:setAlpha( 0 )
	FeaturedLabel:setText( Engine.Localize( "MENU_FEATURED_CAPS" ) )
	FeaturedLabel:setTTF( "fonts/default.ttf" )
	self:addElement( FeaturedLabel )
	self.FeaturedLabel = FeaturedLabel
	
	local FEFeaturedCardsContainerController = CoD.FE_FeaturedCardsContainerController.new( menu, controller )
	FEFeaturedCardsContainerController:setLeftRight( false, false, 26, 157 )
	FEFeaturedCardsContainerController:setTopBottom( false, false, 40, 73 )
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
	FEFeaturedCardsTitleBox0:setLeftRight( true, false, 26, 124 )
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
	
	local CardActionTitle = LUI.UITightText.new()
	CardActionTitle:setLeftRight( true, false, 54.76, 254.76 )
	CardActionTitle:setTopBottom( true, false, 128, 148 )
	CardActionTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CardActionTitle:setLetterSpacing( 0.5 )
	self:addElement( CardActionTitle )
	self.CardActionTitle = CardActionTitle
	
	local CardActionButtonImage = LUI.UIImage.new()
	CardActionButtonImage:setLeftRight( true, false, 30, 50 )
	CardActionButtonImage:setTopBottom( true, false, 128, 148 )
	CardActionButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardActionButtonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CardActionButtonImage )
	self.CardActionButtonImage = CardActionButtonImage
	
	CardActionTitle:linkToElementModel( CardsList, "actionTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardActionTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
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
				CardActionTitle:completeAnimation()
				self.CardActionTitle:setAlpha( 0 )
				self.clipFinished( CardActionTitle, {} )
				CardActionButtonImage:completeAnimation()
				self.CardActionButtonImage:setAlpha( 0 )
				self.clipFinished( CardActionButtonImage, {} )
			end,
			FeaturedCardsVisible = function ()
				self:setupElementClipCounter( 14 )
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
							FEFeaturedCardsContainerController:beginAnimation( "keyframe", 190, true, false, CoD.TweenType.Bounce )
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
			end
		},
		FeaturedCardsVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
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
				CardActionTitle:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
				CardActionTitle:setAlpha( 1 )
				CardActionTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				CardActionButtonImage:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
				CardActionButtonImage:setAlpha( 1 )
				CardActionButtonImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 15 )
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
				CardActionTitle:completeAnimation()
				self.CardActionTitle:setAlpha( 1 )
				self.clipFinished( CardActionTitle, {} )
				CardActionButtonImage:completeAnimation()
				self.CardActionButtonImage:setAlpha( 1 )
				self.clipFinished( CardActionButtonImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 14 )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FeaturedCardsVisible",
			condition = function ( menu, element, event )
				local f116_local0 = FeaturedCards_IsEnabled( element, controller )
				if f116_local0 then
					if not IsGameLobby() then
						f116_local0 = not IsLobbyNetworkModeLAN()
					else
						f116_local0 = false
					end
				end
				return f116_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
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
		self.CardActionTitle:close()
		self.CardActionButtonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

