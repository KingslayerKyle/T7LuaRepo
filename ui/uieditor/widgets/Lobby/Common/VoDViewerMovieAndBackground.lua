-- b0a882d911072c36a51c5082ceeac3b5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.VoDViewerMovieAndBackground = InheritFrom( LUI.UIElement )
CoD.VoDViewerMovieAndBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VoDViewerMovieAndBackground )
	self.id = "VoDViewerMovieAndBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -128, 128 )
	background:setTopBottom( true, true, -72, 72 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.7 )
	self:addElement( background )
	self.background = background
	
	local FEButtonPanel00 = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel00:setLeftRight( true, true, -128, 128 )
	FEButtonPanel00:setTopBottom( true, true, -22, 20 )
	FEButtonPanel00:setAlpha( 0.25 )
	FEButtonPanel00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel00:setShaderVector( 0, 0, 40, 0, 0 )
	self:addElement( FEButtonPanel00 )
	self.FEButtonPanel00 = FEButtonPanel00
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( false, false, -64, 64 )
	Spinner:setTopBottom( false, false, -64, 64 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, -128, 128 )
	scorestreakVignetteContainer:setTopBottom( true, true, -72, 72 )
	scorestreakVignetteContainer:setAlpha( 0.25 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local OpaqueBackground = LUI.UIImage.new()
	OpaqueBackground:setLeftRight( true, true, 0, 0 )
	OpaqueBackground:setTopBottom( true, true, 0, 0 )
	OpaqueBackground:setRGB( 0, 0, 0 )
	self:addElement( OpaqueBackground )
	self.OpaqueBackground = OpaqueBackground
	
	local TwitchStream0 = LUI.UIImage.new()
	TwitchStream0:setLeftRight( true, true, 0, 0 )
	TwitchStream0:setTopBottom( true, true, 0, 0 )
	TwitchStream0:subscribeToGlobalModel( controller, "VoDViewer", "stream", function ( model )
		local stream = Engine.GetModelValue( model )
		if stream then
			TwitchStream0:setupTwitchStreamPlayback( stream )
		end
	end )
	self:addElement( TwitchStream0 )
	self.TwitchStream0 = TwitchStream0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	StartMenuframenoBG00:setAlpha( 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setAlpha( 0.5 )
				self.clipFinished( scorestreakVignetteContainer, {} )

				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( true, true, 0, 0 )
				self.OpaqueBackground:setTopBottom( true, true, 0, 0 )
				self.clipFinished( OpaqueBackground, {} )

				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( true, true, 0, 0 )
				self.TwitchStream0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( TwitchStream0, {} )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
			end,
			Windowed = function ()
				self:setupElementClipCounter( 4 )

				local scorestreakVignetteContainerFrame2 = function ( scorestreakVignetteContainer, event )
					if not event.interrupted then
						scorestreakVignetteContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					scorestreakVignetteContainer:setLeftRight( true, true, -128, 128 )
					scorestreakVignetteContainer:setTopBottom( true, true, -72, 72 )
					scorestreakVignetteContainer:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( scorestreakVignetteContainer, event )
					else
						scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setLeftRight( true, true, -128, 128 )
				self.scorestreakVignetteContainer:setTopBottom( true, true, -72, 72 )
				self.scorestreakVignetteContainer:setAlpha( 0.5 )
				scorestreakVignetteContainerFrame2( scorestreakVignetteContainer, {} )
				local OpaqueBackgroundFrame2 = function ( OpaqueBackground, event )
					if not event.interrupted then
						OpaqueBackground:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					OpaqueBackground:setLeftRight( true, true, 213.33, -213.33 )
					OpaqueBackground:setTopBottom( true, true, 120, -120 )
					OpaqueBackground:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( OpaqueBackground, event )
					else
						OpaqueBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( true, true, 0, 0 )
				self.OpaqueBackground:setTopBottom( true, true, 0, 0 )
				self.OpaqueBackground:setScale( 1 )
				OpaqueBackgroundFrame2( OpaqueBackground, {} )
				local TwitchStream0Frame2 = function ( TwitchStream0, event )
					if not event.interrupted then
						TwitchStream0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TwitchStream0:setLeftRight( true, true, 166.67, -166.67 )
					TwitchStream0:setTopBottom( true, true, 94, -94 )
					TwitchStream0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( TwitchStream0, event )
					else
						TwitchStream0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( true, true, 0, 0 )
				self.TwitchStream0:setTopBottom( true, true, 0, 0 )
				self.TwitchStream0:setScale( 1 )
				TwitchStream0Frame2( TwitchStream0, {} )
				local StartMenuframenoBG00Frame2 = function ( StartMenuframenoBG00, event )
					if not event.interrupted then
						StartMenuframenoBG00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					StartMenuframenoBG00:setLeftRight( true, true, 166.67, -166.67 )
					StartMenuframenoBG00:setTopBottom( true, true, 94, -94 )
					StartMenuframenoBG00:setAlpha( 1 )
					StartMenuframenoBG00:setScale( 1 )
					if event.interrupted then
						self.clipFinished( StartMenuframenoBG00, event )
					else
						StartMenuframenoBG00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
				self.StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.StartMenuframenoBG00:setScale( 1 )
				StartMenuframenoBG00Frame2( StartMenuframenoBG00, {} )
			end
		},
		Windowed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				FEButtonPanel00:completeAnimation()
				self.FEButtonPanel00:setLeftRight( true, true, -128, 128 )
				self.FEButtonPanel00:setTopBottom( true, true, -22, 20 )
				self.clipFinished( FEButtonPanel00, {} )

				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setLeftRight( true, true, -128, 128 )
				self.scorestreakVignetteContainer:setTopBottom( true, true, -71, 71 )
				self.scorestreakVignetteContainer:setAlpha( 1 )
				self.clipFinished( scorestreakVignetteContainer, {} )

				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( true, true, 213.33, -213.33 )
				self.OpaqueBackground:setTopBottom( true, true, 120, -120 )
				self.clipFinished( OpaqueBackground, {} )

				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( true, true, 172.33, -172.33 )
				self.TwitchStream0:setTopBottom( true, true, 97, -97 )
				self.TwitchStream0:setScale( 1 )
				self.clipFinished( TwitchStream0, {} )

				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, true, 172.33, -172.33 )
				self.StartMenuframenoBG00:setTopBottom( true, true, 97, -97 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.StartMenuframenoBG00:setScale( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
			end,
			DefaultState = function ()
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
					OpaqueBackground:setLeftRight( true, true, 0, 0 )
					OpaqueBackground:setTopBottom( true, true, 0, 0 )
					OpaqueBackground:setScale( 1 )
					if event.interrupted then
						self.clipFinished( OpaqueBackground, event )
					else
						OpaqueBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OpaqueBackground:completeAnimation()
				self.OpaqueBackground:setLeftRight( true, true, 172.33, -172.33 )
				self.OpaqueBackground:setTopBottom( true, true, 97, -97 )
				self.OpaqueBackground:setScale( 1 )
				OpaqueBackgroundFrame2( OpaqueBackground, {} )
				local TwitchStream0Frame2 = function ( TwitchStream0, event )
					if not event.interrupted then
						TwitchStream0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TwitchStream0:setLeftRight( true, true, 0, 0 )
					TwitchStream0:setTopBottom( true, true, 0, 0 )
					TwitchStream0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( TwitchStream0, event )
					else
						TwitchStream0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TwitchStream0:completeAnimation()
				self.TwitchStream0:setLeftRight( true, true, 172.33, -175.33 )
				self.TwitchStream0:setTopBottom( true, true, 97, -97 )
				self.TwitchStream0:setScale( 1 )
				TwitchStream0Frame2( TwitchStream0, {} )
				local StartMenuframenoBG00Frame2 = function ( StartMenuframenoBG00, event )
					if not event.interrupted then
						StartMenuframenoBG00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
					StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
					StartMenuframenoBG00:setAlpha( 1 )
					StartMenuframenoBG00:setScale( 1 )
					if event.interrupted then
						self.clipFinished( StartMenuframenoBG00, event )
					else
						StartMenuframenoBG00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setLeftRight( true, true, 172.33, -172.33 )
				self.StartMenuframenoBG00:setTopBottom( true, true, 97, -97 )
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.StartMenuframenoBG00:setScale( 1 )
				StartMenuframenoBG00Frame2( StartMenuframenoBG00, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel00:close()
		element.scorestreakVignetteContainer:close()
		element.StartMenuframenoBG00:close()
		element.TwitchStream0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

