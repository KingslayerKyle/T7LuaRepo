require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.VideoPlayerApplet = InheritFrom( LUI.UIElement )
CoD.VideoPlayerApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VideoPlayerApplet )
	self.id = "VideoPlayerApplet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 209 )
	self:setTopBottom( true, false, 0, 72 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local focus = LUI.UIImage.new()
	focus:setLeftRight( true, true, 0, 0 )
	focus:setTopBottom( true, true, 0, 0 )
	focus:setAlpha( 0 )
	self:addElement( focus )
	self.focus = focus
	
	local unfocused = LUI.UIImage.new()
	unfocused:setLeftRight( true, true, 0, 0 )
	unfocused:setTopBottom( true, true, 0, 0 )
	unfocused:setAlpha( 0 )
	self:addElement( unfocused )
	self.unfocused = unfocused
	
	local playerimage = LUI.UIImage.new()
	playerimage:setLeftRight( true, true, -1.5, 1.5 )
	playerimage:setTopBottom( true, true, -5.45, 4.45 )
	playerimage:setAlpha( 0.45 )
	playerimage:setImage( RegisterImage( "uie_t7_menu_cp_datavault_videoplayerimage" ) )
	self:addElement( playerimage )
	self.playerimage = playerimage
	
	local player = LUI.UIImage.new()
	player:setLeftRight( true, false, 55.89, 153.39 )
	player:setTopBottom( true, false, 22, 48 )
	player:setImage( RegisterImage( "uie_t7_menu_cp_datavault_videoplayer" ) )
	self:addElement( player )
	self.player = player
	
	local CallingCardLines00 = LUI.UIImage.new()
	CallingCardLines00:setLeftRight( true, true, -2.92, 3 )
	CallingCardLines00:setTopBottom( false, true, 5, 17.05 )
	CallingCardLines00:setImage( RegisterImage( "uie_t7_menu_cp_datavault_videoplayer_bottombar" ) )
	self:addElement( CallingCardLines00 )
	self.CallingCardLines00 = CallingCardLines00
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -9, 7.71 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 0, 0 )
				GeneralframeFrame2( Generalframe, {} )
				local focusFrame2 = function ( focus, event )
					if not event.interrupted then
						focus:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					focus:setLeftRight( true, true, 0, 0 )
					focus:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( focus, event )
					else
						focus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focus:completeAnimation()
				self.focus:setLeftRight( true, true, 0, 0 )
				self.focus:setTopBottom( true, true, 0, 0 )
				focusFrame2( focus, {} )
				local playerimageFrame2 = function ( playerimage, event )
					if not event.interrupted then
						playerimage:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					playerimage:setLeftRight( true, true, -1.5, 1.5 )
					playerimage:setTopBottom( true, true, 9.55, 19.45 )
					playerimage:setAlpha( 0.65 )
					if event.interrupted then
						self.clipFinished( playerimage, event )
					else
						playerimage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				playerimage:completeAnimation()
				self.playerimage:setLeftRight( true, true, -1.5, 1.5 )
				self.playerimage:setTopBottom( true, true, -5.45, 4.45 )
				self.playerimage:setAlpha( 0.45 )
				playerimageFrame2( playerimage, {} )
				local playerFrame2 = function ( player, event )
					if not event.interrupted then
						player:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					player:setLeftRight( true, false, 55.89, 153.39 )
					player:setTopBottom( true, false, 37, 63 )
					if event.interrupted then
						self.clipFinished( player, event )
					else
						player:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				player:completeAnimation()
				self.player:setLeftRight( true, false, 55.89, 153.39 )
				self.player:setTopBottom( true, false, 22, 48 )
				playerFrame2( player, {} )
				local CallingCardLines00Frame2 = function ( CallingCardLines00, event )
					if not event.interrupted then
						CallingCardLines00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines00:setLeftRight( false, false, -107.42, 107.5 )
					CallingCardLines00:setTopBottom( false, false, 53, 65.05 )
					if event.interrupted then
						self.clipFinished( CallingCardLines00, event )
					else
						CallingCardLines00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines00:completeAnimation()
				self.CallingCardLines00:setLeftRight( false, false, -107.42, 107.5 )
				self.CallingCardLines00:setTopBottom( false, false, 41, 53.05 )
				CallingCardLines00Frame2( CallingCardLines00, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )
				focus:completeAnimation()
				self.focus:setLeftRight( true, true, 0, 0 )
				self.focus:setTopBottom( true, true, 15, 15 )
				self.clipFinished( focus, {} )
				playerimage:completeAnimation()
				self.playerimage:setLeftRight( true, true, -1.5, 1.5 )
				self.playerimage:setTopBottom( true, true, 9.55, 19.45 )
				self.playerimage:setAlpha( 0.65 )
				self.clipFinished( playerimage, {} )
				player:completeAnimation()
				self.player:setLeftRight( true, false, 55.89, 153.39 )
				self.player:setTopBottom( true, false, 37, 63 )
				self.clipFinished( player, {} )
				CallingCardLines00:completeAnimation()
				self.CallingCardLines00:setLeftRight( false, false, -107.42, 107.5 )
				self.CallingCardLines00:setTopBottom( false, false, 53, 65.05 )
				self.clipFinished( CallingCardLines00, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				GeneralframeFrame2( Generalframe, {} )
				local focusFrame2 = function ( focus, event )
					if not event.interrupted then
						focus:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					focus:setLeftRight( true, true, 0, 0 )
					focus:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( focus, event )
					else
						focus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focus:completeAnimation()
				self.focus:setLeftRight( true, true, 0, 0 )
				self.focus:setTopBottom( true, true, 15, 15 )
				focusFrame2( focus, {} )
				local playerimageFrame2 = function ( playerimage, event )
					if not event.interrupted then
						playerimage:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					playerimage:setLeftRight( true, true, -1.5, 1.5 )
					playerimage:setTopBottom( true, true, -5.45, 4.45 )
					playerimage:setAlpha( 0.45 )
					if event.interrupted then
						self.clipFinished( playerimage, event )
					else
						playerimage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				playerimage:completeAnimation()
				self.playerimage:setLeftRight( true, true, -1.5, 1.5 )
				self.playerimage:setTopBottom( true, true, 9.55, 19.45 )
				self.playerimage:setAlpha( 0.65 )
				playerimageFrame2( playerimage, {} )
				local playerFrame2 = function ( player, event )
					if not event.interrupted then
						player:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					player:setLeftRight( true, false, 55.89, 153.39 )
					player:setTopBottom( true, false, 22, 48 )
					if event.interrupted then
						self.clipFinished( player, event )
					else
						player:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				player:completeAnimation()
				self.player:setLeftRight( true, false, 55.89, 153.39 )
				self.player:setTopBottom( true, false, 37, 63 )
				playerFrame2( player, {} )
				local CallingCardLines00Frame2 = function ( CallingCardLines00, event )
					if not event.interrupted then
						CallingCardLines00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines00:setLeftRight( false, false, -107.42, 107.5 )
					CallingCardLines00:setTopBottom( false, false, 41, 53.05 )
					if event.interrupted then
						self.clipFinished( CallingCardLines00, event )
					else
						CallingCardLines00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines00:completeAnimation()
				self.CallingCardLines00:setLeftRight( false, false, -107.42, 107.5 )
				self.CallingCardLines00:setTopBottom( false, false, 53, 65.05 )
				CallingCardLines00Frame2( CallingCardLines00, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

