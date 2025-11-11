require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.LiveEventViewerMovieAndBackground = InheritFrom( LUI.UIElement )
CoD.LiveEventViewerMovieAndBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LiveEventViewerMovieAndBackground )
	self.id = "LiveEventViewerMovieAndBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, -192, 192 )
	background:setTopBottom( 0, 1, -108, 108 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.7 )
	self:addElement( background )
	self.background = background
	
	local FEButtonPanel00 = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel00:setLeftRight( 0, 1, -192, 192 )
	FEButtonPanel00:setTopBottom( 0, 1, -34, 30 )
	FEButtonPanel00:setAlpha( 0.25 )
	FEButtonPanel00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	FEButtonPanel00:setShaderVector( 0, 0, 40, 0, 0 )
	self:addElement( FEButtonPanel00 )
	self.FEButtonPanel00 = FEButtonPanel00
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( 0.5, 0.5, -96, 96 )
	Spinner:setTopBottom( 0.5, 0.5, -96, 96 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 1, -192, 192 )
	scorestreakVignetteContainer:setTopBottom( 0, 1, -108, 108 )
	scorestreakVignetteContainer:setAlpha( 0.25 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local OpaqueBackground = LUI.UIImage.new()
	OpaqueBackground:setLeftRight( 0, 1, 0, 0 )
	OpaqueBackground:setTopBottom( 0, 1, 0, 0 )
	OpaqueBackground:setRGB( 0, 0, 0 )
	self:addElement( OpaqueBackground )
	self.OpaqueBackground = OpaqueBackground
	
	local TwitchStream0 = LUI.UIImage.new()
	TwitchStream0:setLeftRight( 0, 1, 0, 0 )
	TwitchStream0:setTopBottom( 0, 1, 0, 0 )
	TwitchStream0:subscribeToGlobalModel( controller, "LiveEventViewer", "stream", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TwitchStream0:setupTwitchStreamPlayback( modelValue )
		end
	end )
	self:addElement( TwitchStream0 )
	self.TwitchStream0 = TwitchStream0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	self.resetProperties = function ()
		StartMenuframenoBG00:completeAnimation()
		scorestreakVignetteContainer:completeAnimation()
		TwitchStream0:completeAnimation()
		OpaqueBackground:completeAnimation()
		Spinner:completeAnimation()
		StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
		StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
		StartMenuframenoBG00:setAlpha( 0 )
		StartMenuframenoBG00:setScale( 1 )
		scorestreakVignetteContainer:setLeftRight( 0, 1, -192, 192 )
		scorestreakVignetteContainer:setTopBottom( 0, 1, -108, 108 )
		scorestreakVignetteContainer:setAlpha( 0.25 )
		TwitchStream0:setLeftRight( 0, 1, 0, 0 )
		TwitchStream0:setTopBottom( 0, 1, 0, 0 )
		TwitchStream0:setScale( 1 )
		OpaqueBackground:setLeftRight( 0, 1, 0, 0 )
		OpaqueBackground:setTopBottom( 0, 1, 0, 0 )
		OpaqueBackground:setScale( 1 )
		Spinner:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setAlpha( 0.5 )
				self.clipFinished( scorestreakVignetteContainer, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
			end,
			Windowed = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local scorestreakVignetteContainerFrame2 = function ( scorestreakVignetteContainer, event )
					if not event.interrupted then
						scorestreakVignetteContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					scorestreakVignetteContainer:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( scorestreakVignetteContainer, event )
					else
						scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setAlpha( 0.5 )
				scorestreakVignetteContainerFrame2( scorestreakVignetteContainer, {} )
				local OpaqueBackgroundFrame2 = function ( OpaqueBackground, event )
					if not event.interrupted then
						OpaqueBackground:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					OpaqueBackground:setLeftRight( 0, 1, 320, -320 )
					OpaqueBackground:setTopBottom( 0, 1, 180, -180 )
					OpaqueBackground:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( OpaqueBackground, event )
					else
						OpaqueBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( 0, 1, 0, 0 )
				self.OpaqueBackground:setTopBottom( 0, 1, 0, 0 )
				self.OpaqueBackground:setScale( 1 )
				OpaqueBackgroundFrame2( OpaqueBackground, {} )
				local TwitchStream0Frame2 = function ( TwitchStream0, event )
					if not event.interrupted then
						TwitchStream0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TwitchStream0:setLeftRight( 0, 1, 250, -250 )
					TwitchStream0:setTopBottom( 0, 1, 141, -141 )
					TwitchStream0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( TwitchStream0, event )
					else
						TwitchStream0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( 0, 1, 0, 0 )
				self.TwitchStream0:setTopBottom( 0, 1, 0, 0 )
				self.TwitchStream0:setScale( 1 )
				TwitchStream0Frame2( TwitchStream0, {} )
				local StartMenuframenoBG00Frame2 = function ( StartMenuframenoBG00, event )
					if not event.interrupted then
						StartMenuframenoBG00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					StartMenuframenoBG00:setLeftRight( 0, 1, 250, -250 )
					StartMenuframenoBG00:setTopBottom( 0, 1, 141, -141 )
					StartMenuframenoBG00:setAlpha( 1 )
					StartMenuframenoBG00:setScale( 1 )
					if event.interrupted then
						self.clipFinished( StartMenuframenoBG00, event )
					else
						StartMenuframenoBG00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
				self.StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.StartMenuframenoBG00:setScale( 1 )
				StartMenuframenoBG00Frame2( StartMenuframenoBG00, {} )
			end
		},
		Windowed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setLeftRight( 0, 1, -192, 192 )
				self.scorestreakVignetteContainer:setTopBottom( 0, 1, -106, 106 )
				self.scorestreakVignetteContainer:setAlpha( 1 )
				self.clipFinished( scorestreakVignetteContainer, {} )
				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( 0, 1, 320, -320 )
				self.OpaqueBackground:setTopBottom( 0, 1, 180, -180 )
				self.clipFinished( OpaqueBackground, {} )
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( 0, 1, 258, -258 )
				self.TwitchStream0:setTopBottom( 0, 1, 146, -146 )
				self.clipFinished( TwitchStream0, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( 0, 1, 258, -258 )
				self.StartMenuframenoBG00:setTopBottom( 0, 1, 146, -146 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local SpinnerFrame2 = function ( Spinner, event )
					if not event.interrupted then
						Spinner:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Spinner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Spinner, event )
					else
						Spinner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				SpinnerFrame2( Spinner, {} )
				local OpaqueBackgroundFrame2 = function ( OpaqueBackground, event )
					if not event.interrupted then
						OpaqueBackground:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					OpaqueBackground:setLeftRight( 0, 1, 0, 0 )
					OpaqueBackground:setTopBottom( 0, 1, 0, 0 )
					OpaqueBackground:setScale( 1 )
					if event.interrupted then
						self.clipFinished( OpaqueBackground, event )
					else
						OpaqueBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( 0, 1, 258, -258 )
				self.OpaqueBackground:setTopBottom( 0, 1, 146, -146 )
				self.OpaqueBackground:setScale( 1 )
				OpaqueBackgroundFrame2( OpaqueBackground, {} )
				local TwitchStream0Frame2 = function ( TwitchStream0, event )
					if not event.interrupted then
						TwitchStream0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TwitchStream0:setLeftRight( 0, 1, 0, 0 )
					TwitchStream0:setTopBottom( 0, 1, 0, 0 )
					TwitchStream0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( TwitchStream0, event )
					else
						TwitchStream0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( 0, 1, 259, -263 )
				self.TwitchStream0:setTopBottom( 0, 1, 146, -146 )
				self.TwitchStream0:setScale( 1 )
				TwitchStream0Frame2( TwitchStream0, {} )
				local StartMenuframenoBG00Frame2 = function ( StartMenuframenoBG00, event )
					if not event.interrupted then
						StartMenuframenoBG00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
					StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
					StartMenuframenoBG00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( StartMenuframenoBG00, event )
					else
						StartMenuframenoBG00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( 0, 1, 258, -258 )
				self.StartMenuframenoBG00:setTopBottom( 0, 1, 146, -146 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				StartMenuframenoBG00Frame2( StartMenuframenoBG00, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel00:close()
		self.scorestreakVignetteContainer:close()
		self.StartMenuframenoBG00:close()
		self.TwitchStream0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

