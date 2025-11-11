require( "ui.uieditor.widgets.ArabicAlignTextBox" )
require( "ui.uieditor.widgets.FaceButtonThatHidesWithLabel" )

local PreLoadFunc = function ( self, controller )
	DataSources.MtxCommsMOTD.getModel( controller )
end

local PostLoadFunc = function ( self, controller, menu )
	self.updateTwitchFeed = function ( self, state )
		if state == "Twitch" and not self.twitchModelSubscription then
			local liveEventViewerModel = DataSources.LiveEventViewer.getModel( controller )
			if liveEventViewerModel then
				local streamModel = Engine.GetModel( liveEventViewerModel, "stream" )
				if streamModel then
					self.twitchModelSubscription = self:subscribeToModel( streamModel, function ( model )
						local modelValue = Engine.GetModelValue( model )
						if modelValue then
							TwitchStream0:setupTwitchStreamPlayback( modelValue )
						end
					end )
				end
			end
		elseif state == "DefaultState" and self.twitchModelSubscription then
			self:removeSubscription( self.twitchModelSubscription )
			self.twitchModelSubscription = nil
			TwitchStream0:setupTwitchStreamPlayback( "" )
		end
	end
	
	self:updateTwitchFeed( self.currentState )
end

CoD.MOTD_MainImgContainer = InheritFrom( LUI.UIElement )
CoD.MOTD_MainImgContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MOTD_MainImgContainer )
	self.id = "MOTD_MainImgContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 663 )
	self:setTopBottom( 0, 0, 0, 736 )
	self.anyChildUsesUpdateState = true
	
	local PopupImage = LUI.UIImage.new()
	PopupImage:setLeftRight( 0, 1, 0, 0 )
	PopupImage:setTopBottom( 0, 1, 0, 0 )
	PopupImage:setImage( RegisterImage( "uie_t7_motd_main_img" ) )
	self:addElement( PopupImage )
	self.PopupImage = PopupImage
	
	local TwitchStream0 = LUI.UIImage.new()
	TwitchStream0:setLeftRight( 0.5, 0.5, -331.5, 331.5 )
	TwitchStream0:setTopBottom( 0.5, 0.5, -199, 185 )
	TwitchStream0:setupTwitchStreamPlayback( "" )
	self:addElement( TwitchStream0 )
	self.TwitchStream0 = TwitchStream0
	
	local liveCircle = LUI.UIImage.new()
	liveCircle:setLeftRight( 1, 1, -83, -53 )
	liveCircle:setTopBottom( 0, 0, 181, 211 )
	liveCircle:setRGB( 1, 0, 0 )
	liveCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	liveCircle:setShaderVector( 0, 8, 2, 0, 0 )
	liveCircle:setShaderVector( 1, 20, 20, 0, 0 )
	liveCircle:setShaderVector( 2, 0.2, 0.2, 0, 0 )
	self:addElement( liveCircle )
	self.liveCircle = liveCircle
	
	local liveLabel = LUI.UITightText.new()
	liveLabel:setLeftRight( 1, 1, -48, -9 )
	liveLabel:setTopBottom( 0, 0, 177, 215 )
	liveLabel:setText( Engine.Localize( "MENU_LIVE_CAPS" ) )
	liveLabel:setTTF( "fonts/default.ttf" )
	self:addElement( liveLabel )
	self.liveLabel = liveLabel
	
	local twitchBacking = LUI.UIImage.new()
	twitchBacking:setLeftRight( 0, 1, 0, 0 )
	twitchBacking:setTopBottom( 0, 0, 494, 554 )
	twitchBacking:setRGB( 0, 0, 0 )
	twitchBacking:setAlpha( 0.6 )
	self:addElement( twitchBacking )
	self.twitchBacking = twitchBacking
	
	local twitchIcon = LUI.UIImage.new()
	twitchIcon:setLeftRight( 1, 1, -54, -16 )
	twitchIcon:setTopBottom( 0, 0, 505, 543 )
	twitchIcon:setImage( RegisterImage( "uie_twitch_icon_white" ) )
	self:addElement( twitchIcon )
	self.twitchIcon = twitchIcon
	
	local streamerCountIcon = LUI.UIImage.new()
	streamerCountIcon:setLeftRight( 1, 1, -285, -247 )
	streamerCountIcon:setTopBottom( 0, 0, 505, 543 )
	streamerCountIcon:setImage( RegisterImage( "uie_twitch_streamers_white" ) )
	self:addElement( streamerCountIcon )
	self.streamerCountIcon = streamerCountIcon
	
	local streamerCount = CoD.ArabicAlignTextBox.new( menu, controller )
	streamerCount:setLeftRight( 1, 1, -247, -49 )
	streamerCount:setTopBottom( 0, 0, 507.5, 540.5 )
	streamerCount.textBox:setTTF( "fonts/default.ttf" )
	streamerCount.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	streamerCount:subscribeToGlobalModel( controller, "LiveEventViewer", "viewers", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			streamerCount.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( streamerCount )
	self.streamerCount = streamerCount
	
	local Action = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	Action:mergeStateConditions( {
		{
			stateName = "HideButtonAndText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if Action.m_eventHandlers.input_source_changed then
		local currentEv = Action.m_eventHandlers.input_source_changed
		Action:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		Action:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	Action:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( Action, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	Action:setLeftRight( 0, 0, 9, 349 )
	Action:setTopBottom( 0, 0, 509, 539 )
	Action.ButtonLabel:setText( Engine.Localize( "MENU_WATCH_NOW" ) )
	Action:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Action.ButtonImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Action )
	self.Action = Action
	
	local currentEv = LUI.UIElement.new()
	currentEv:setLeftRight( 0, 0, 0, 663 )
	currentEv:setTopBottom( 0, 0, 0, 738 )
	currentEv:subscribeToGlobalModel( controller, "MtxCommsMOTD", "imageFileID", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentEv:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( currentEv )
	self.ImageViewer0 = currentEv
	
	self.resetProperties = function ()
		TwitchStream0:completeAnimation()
		liveCircle:completeAnimation()
		liveLabel:completeAnimation()
		twitchBacking:completeAnimation()
		twitchIcon:completeAnimation()
		streamerCountIcon:completeAnimation()
		streamerCount:completeAnimation()
		Action:completeAnimation()
		PopupImage:completeAnimation()
		TwitchStream0:setAlpha( 1 )
		liveCircle:setAlpha( 1 )
		liveLabel:setAlpha( 1 )
		twitchBacking:setAlpha( 0.6 )
		twitchIcon:setAlpha( 1 )
		streamerCountIcon:setAlpha( 1 )
		streamerCount:setAlpha( 1 )
		Action:setAlpha( 1 )
		PopupImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setAlpha( 0 )
				self.clipFinished( TwitchStream0, {} )
				liveCircle:completeAnimation()
				self.liveCircle:setAlpha( 0 )
				self.clipFinished( liveCircle, {} )
				liveLabel:completeAnimation()
				self.liveLabel:setAlpha( 0 )
				self.clipFinished( liveLabel, {} )
				twitchBacking:completeAnimation()
				self.twitchBacking:setAlpha( 0 )
				self.clipFinished( twitchBacking, {} )
				twitchIcon:completeAnimation()
				self.twitchIcon:setAlpha( 0 )
				self.clipFinished( twitchIcon, {} )
				streamerCountIcon:completeAnimation()
				self.streamerCountIcon:setAlpha( 0 )
				self.clipFinished( streamerCountIcon, {} )
				streamerCount:completeAnimation()
				self.streamerCount:setAlpha( 0 )
				self.clipFinished( streamerCount, {} )
				Action:completeAnimation()
				self.Action:setAlpha( 0 )
				self.clipFinished( Action, {} )
			end
		},
		Twitch = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PopupImage:completeAnimation()
				self.PopupImage:setAlpha( 0 )
				self.clipFinished( PopupImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Twitch",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "mtxCommsMOTD.type", "liveevent" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "mtxCommsMOTD.type" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "mtxCommsMOTD.type"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		CallCustomElementFunction_Self( self, "updateTwitchFeed", state )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.streamerCount:close()
		self.Action:close()
		self.ImageViewer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

