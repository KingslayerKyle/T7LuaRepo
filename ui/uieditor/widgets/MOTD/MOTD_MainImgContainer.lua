-- 57d76634eacac026549da152f409e016
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ArabicAlignTextBox" )
require( "ui.uieditor.widgets.FaceButtonThatHidesWithLabel" )

local PreLoadFunc = function ( self, controller )
	DataSources.MtxCommsMOTD.getModel( controller )
end

local PostLoadFunc = function ( self, controller, menu )
	self.updateTwitchFeed = function ( f3_arg0, f3_arg1 )
		if f3_arg1 == "Twitch" and not f3_arg0.twitchModelSubscription then
			local f3_local0 = DataSources.LiveEventViewer.getModel( controller )
			if f3_local0 then
				local f3_local1 = Engine.GetModel( f3_local0, "stream" )
				if f3_local1 then
					f3_arg0.twitchModelSubscription = f3_arg0:subscribeToModel( f3_local1, function ( model )
						local modelValue = Engine.GetModelValue( model )
						if modelValue then
							TwitchStream0:setupTwitchStreamPlayback( modelValue )
						end
					end )
				end
			end
		elseif f3_arg1 == "DefaultState" and f3_arg0.twitchModelSubscription then
			f3_arg0:removeSubscription( f3_arg0.twitchModelSubscription )
			f3_arg0.twitchModelSubscription = nil
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
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 491 )
	self.anyChildUsesUpdateState = true
	
	local PopupImage = LUI.UIImage.new()
	PopupImage:setLeftRight( true, true, 0, 0 )
	PopupImage:setTopBottom( true, true, 0, 0 )
	PopupImage:setImage( RegisterImage( "uie_t7_motd_main_img" ) )
	self:addElement( PopupImage )
	self.PopupImage = PopupImage
	
	local TwitchStream0 = LUI.UIImage.new()
	TwitchStream0:setLeftRight( false, false, -221, 221 )
	TwitchStream0:setTopBottom( false, false, -132.5, 123.5 )
	TwitchStream0:setupTwitchStreamPlayback( "" )
	self:addElement( TwitchStream0 )
	self.TwitchStream0 = TwitchStream0
	
	local liveCircle = LUI.UIImage.new()
	liveCircle:setLeftRight( false, true, -55, -35 )
	liveCircle:setTopBottom( true, false, 120.5, 140.5 )
	liveCircle:setRGB( 1, 0, 0 )
	liveCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	liveCircle:setShaderVector( 0, 8, 2, 0, 0 )
	liveCircle:setShaderVector( 1, 20, 20, 0, 0 )
	liveCircle:setShaderVector( 2, 0.2, 0.2, 0, 0 )
	self:addElement( liveCircle )
	self.liveCircle = liveCircle
	
	local liveLabel = LUI.UITightText.new()
	liveLabel:setLeftRight( false, true, -32, -6 )
	liveLabel:setTopBottom( true, false, 118, 143 )
	liveLabel:setText( Engine.Localize( "MENU_LIVE_CAPS" ) )
	liveLabel:setTTF( "fonts/default.ttf" )
	self:addElement( liveLabel )
	self.liveLabel = liveLabel
	
	local twitchBacking = LUI.UIImage.new()
	twitchBacking:setLeftRight( true, true, 0, 0 )
	twitchBacking:setTopBottom( true, false, 329, 369 )
	twitchBacking:setRGB( 0, 0, 0 )
	twitchBacking:setAlpha( 0.6 )
	self:addElement( twitchBacking )
	self.twitchBacking = twitchBacking
	
	local twitchIcon = LUI.UIImage.new()
	twitchIcon:setLeftRight( false, true, -36, -11 )
	twitchIcon:setTopBottom( true, false, 337, 362 )
	twitchIcon:setImage( RegisterImage( "uie_twitch_icon_white" ) )
	self:addElement( twitchIcon )
	self.twitchIcon = twitchIcon
	
	local streamerCountIcon = LUI.UIImage.new()
	streamerCountIcon:setLeftRight( false, true, -190, -165 )
	streamerCountIcon:setTopBottom( true, false, 336.5, 362 )
	streamerCountIcon:setImage( RegisterImage( "uie_twitch_streamers_white" ) )
	self:addElement( streamerCountIcon )
	self.streamerCountIcon = streamerCountIcon
	
	local streamerCount = CoD.ArabicAlignTextBox.new( menu, controller )
	streamerCount:setLeftRight( false, true, -165, -33 )
	streamerCount:setTopBottom( true, false, 338.25, 360.25 )
	streamerCount.textBox:setTTF( "fonts/default.ttf" )
	streamerCount.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	streamerCount:subscribeToGlobalModel( controller, "LiveEventViewer", "viewers", function ( model )
		local viewers = Engine.GetModelValue( model )
		if viewers then
			streamerCount.textBox:setText( Engine.Localize( viewers ) )
		end
	end )
	self:addElement( streamerCount )
	self.streamerCount = streamerCount
	
	local Action = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	Action:setLeftRight( true, false, 6, 232.76 )
	Action:setTopBottom( true, false, 339.25, 359.25 )
	Action.ButtonLabel:setText( Engine.Localize( "MENU_WATCH_NOW" ) )
	Action:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Action.ButtonImage.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	Action:mergeStateConditions( {
		{
			stateName = "HideButtonAndText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if Action.m_eventHandlers.input_source_changed then
		local ImageViewer0 = Action.m_eventHandlers.input_source_changed
		Action:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return ImageViewer0( element, event )
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
	self:addElement( Action )
	self.Action = Action
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( true, false, 0, 442 )
	ImageViewer0:setTopBottom( true, false, 0, 492.15 )
	ImageViewer0:subscribeToGlobalModel( controller, "MtxCommsMOTD", "imageFileID", function ( model )
		local imageFileID = Engine.GetModelValue( model )
		if imageFileID then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", imageFileID ) )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				PopupImage:completeAnimation()
				self.PopupImage:setAlpha( 1 )
				self.clipFinished( PopupImage, {} )

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
				self:setupElementClipCounter( 9 )

				PopupImage:completeAnimation()
				self.PopupImage:setAlpha( 0 )
				self.clipFinished( PopupImage, {} )

				TwitchStream0:completeAnimation()
				self.TwitchStream0:setAlpha( 1 )
				self.clipFinished( TwitchStream0, {} )

				liveCircle:completeAnimation()
				self.liveCircle:setAlpha( 1 )
				self.clipFinished( liveCircle, {} )

				liveLabel:completeAnimation()
				self.liveLabel:setAlpha( 1 )
				self.clipFinished( liveLabel, {} )

				twitchBacking:completeAnimation()
				self.twitchBacking:setAlpha( 0.6 )
				self.clipFinished( twitchBacking, {} )

				twitchIcon:completeAnimation()
				self.twitchIcon:setAlpha( 1 )
				self.clipFinished( twitchIcon, {} )

				streamerCountIcon:completeAnimation()
				self.streamerCountIcon:setAlpha( 1 )
				self.clipFinished( streamerCountIcon, {} )

				streamerCount:completeAnimation()
				self.streamerCount:setAlpha( 1 )
				self.clipFinished( streamerCount, {} )

				Action:completeAnimation()
				self.Action:setAlpha( 1 )
				self.clipFinished( Action, {} )
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

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		CallCustomElementFunction_Self( self, "updateTwitchFeed", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.streamerCount:close()
		element.Action:close()
		element.ImageViewer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

