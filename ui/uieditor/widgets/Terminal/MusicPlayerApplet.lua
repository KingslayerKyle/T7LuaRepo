-- 333fe39d635bc35dac35446748a545e0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )
require( "ui.uieditor.widgets.Terminal.MusicPlayerAppletDisplay" )

CoD.MusicPlayerApplet = InheritFrom( LUI.UIElement )
CoD.MusicPlayerApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MusicPlayerApplet )
	self.id = "MusicPlayerApplet"
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
	focus:setAlpha( 0.1 )
	self:addElement( focus )
	self.focus = focus
	
	local unfocused = LUI.UIImage.new()
	unfocused:setLeftRight( true, true, 0, 0 )
	unfocused:setTopBottom( true, true, 0, 0 )
	unfocused:setAlpha( 0 )
	self:addElement( unfocused )
	self.unfocused = unfocused
	
	local CallingCardLines0 = LUI.UIImage.new()
	CallingCardLines0:setLeftRight( true, false, -3, 212 )
	CallingCardLines0:setTopBottom( true, false, 75, 87 )
	CallingCardLines0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_musicplay_bottombar" ) )
	self:addElement( CallingCardLines0 )
	self.CallingCardLines0 = CallingCardLines0
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8.36, 8.36 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local MusicPlayerAppletDisplay0 = CoD.MusicPlayerAppletDisplay.new( menu, controller )
	MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
	MusicPlayerAppletDisplay0:setTopBottom( true, false, 6, 72 )
	self:addElement( MusicPlayerAppletDisplay0 )
	self.MusicPlayerAppletDisplay0 = MusicPlayerAppletDisplay0
	
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
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 0, 0 )
				unfocusedFrame2( unfocused, {} )
				local CallingCardLines0Frame2 = function ( CallingCardLines0, event )
					if not event.interrupted then
						CallingCardLines0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines0:setLeftRight( true, false, -3, 212 )
					CallingCardLines0:setTopBottom( true, false, 90, 102 )
					if event.interrupted then
						self.clipFinished( CallingCardLines0, event )
					else
						CallingCardLines0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines0:completeAnimation()
				self.CallingCardLines0:setLeftRight( true, false, -3, 212 )
				self.CallingCardLines0:setTopBottom( true, false, 75, 87 )
				CallingCardLines0Frame2( CallingCardLines0, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, -10.22, 9.78 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -0.22, 19.78 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				local MusicPlayerAppletDisplay0Frame2 = function ( MusicPlayerAppletDisplay0, event )
					if not event.interrupted then
						MusicPlayerAppletDisplay0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
					MusicPlayerAppletDisplay0:setTopBottom( true, false, 21, 87 )
					if event.interrupted then
						self.clipFinished( MusicPlayerAppletDisplay0, event )
					else
						MusicPlayerAppletDisplay0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MusicPlayerAppletDisplay0:completeAnimation()
				self.MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
				self.MusicPlayerAppletDisplay0:setTopBottom( true, false, 6, 72 )
				MusicPlayerAppletDisplay0Frame2( MusicPlayerAppletDisplay0, {} )
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
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 15, 15 )
				self.clipFinished( unfocused, {} )
				CallingCardLines0:completeAnimation()
				self.CallingCardLines0:setLeftRight( true, false, -3, 212 )
				self.CallingCardLines0:setTopBottom( true, false, 90, 102 )
				self.clipFinished( CallingCardLines0, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10.22, 9.78 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
				MusicPlayerAppletDisplay0:completeAnimation()
				self.MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
				self.MusicPlayerAppletDisplay0:setTopBottom( true, false, 21, 87 )
				self.clipFinished( MusicPlayerAppletDisplay0, {} )
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
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 15, 15 )
				unfocusedFrame2( unfocused, {} )
				local CallingCardLines0Frame2 = function ( CallingCardLines0, event )
					if not event.interrupted then
						CallingCardLines0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines0:setLeftRight( true, false, -3, 212 )
					CallingCardLines0:setTopBottom( true, false, 75, 87 )
					if event.interrupted then
						self.clipFinished( CallingCardLines0, event )
					else
						CallingCardLines0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines0:completeAnimation()
				self.CallingCardLines0:setLeftRight( true, false, -3, 212 )
				self.CallingCardLines0:setTopBottom( true, false, 90, 102 )
				CallingCardLines0Frame2( CallingCardLines0, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, -0.22, 19.78 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10.22, 9.78 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
				local MusicPlayerAppletDisplay0Frame2 = function ( MusicPlayerAppletDisplay0, event )
					if not event.interrupted then
						MusicPlayerAppletDisplay0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
					MusicPlayerAppletDisplay0:setTopBottom( true, false, 6, 72 )
					if event.interrupted then
						self.clipFinished( MusicPlayerAppletDisplay0, event )
					else
						MusicPlayerAppletDisplay0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MusicPlayerAppletDisplay0:completeAnimation()
				self.MusicPlayerAppletDisplay0:setLeftRight( true, false, 0, 209 )
				self.MusicPlayerAppletDisplay0:setTopBottom( true, false, 21, 87 )
				MusicPlayerAppletDisplay0Frame2( MusicPlayerAppletDisplay0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
		element.MusicPlayerAppletDisplay0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

