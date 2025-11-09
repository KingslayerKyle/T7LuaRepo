require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.CodexApplet = InheritFrom( LUI.UIElement )
CoD.CodexApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodexApplet )
	self.id = "CodexApplet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 303 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0.21, 0.21 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local focus = LUI.UIImage.new()
	focus:setLeftRight( true, true, 0, 0 )
	focus:setTopBottom( true, true, 0.21, 0.21 )
	focus:setAlpha( 0.1 )
	self:addElement( focus )
	self.focus = focus
	
	local unfocused = LUI.UIImage.new()
	unfocused:setLeftRight( true, true, 0, 0 )
	unfocused:setTopBottom( true, true, 0.21, 0.21 )
	unfocused:setAlpha( 0 )
	self:addElement( unfocused )
	self.unfocused = unfocused
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -9, 7.71 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setRGB( 1, 0.92, 0.92 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local Logo = LUI.UIImage.new()
	Logo:setLeftRight( false, false, -52, 52 )
	Logo:setTopBottom( false, false, -52, 52 )
	Logo:setAlpha( 0.85 )
	Logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logobig" ) )
	self:addElement( Logo )
	self.Logo = Logo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
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
						focus:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
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
						unfocused:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
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
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					local FocusWidgetFrame3 = function ( FocusWidget, event )
						local FocusWidgetFrame4 = function ( FocusWidget, event )
							local FocusWidgetFrame5 = function ( FocusWidget, event )
								if not event.interrupted then
									FocusWidget:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								end
								FocusWidget:setLeftRight( true, true, -9, 7.71 )
								FocusWidget:setTopBottom( true, false, -10, 10 )
								FocusWidget:setAlpha( 0.85 )
								FocusWidget:setXRot( 0 )
								if event.interrupted then
									self.clipFinished( FocusWidget, event )
								else
									FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusWidgetFrame5( FocusWidget, event )
								return 
							else
								FocusWidget:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								FocusWidget:setTopBottom( true, false, -6.32, 13.68 )
								FocusWidget:setAlpha( 1 )
								FocusWidget:registerEventHandler( "transition_complete_keyframe", FocusWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							FocusWidgetFrame4( FocusWidget, event )
							return 
						else
							FocusWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FocusWidget:setTopBottom( true, false, -4.74, 15.26 )
							FocusWidget:setAlpha( 0 )
							FocusWidget:registerEventHandler( "transition_complete_keyframe", FocusWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						FocusWidgetFrame3( FocusWidget, event )
						return 
					else
						FocusWidget:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FocusWidget:setTopBottom( true, false, -4.21, 15.79 )
						FocusWidget:setAlpha( 0.42 )
						FocusWidget:registerEventHandler( "transition_complete_keyframe", FocusWidgetFrame3 )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				self.FocusWidget:setXRot( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				local LogoFrame2 = function ( Logo, event )
					if not event.interrupted then
						Logo:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					Logo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Logo, event )
					else
						Logo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Logo:completeAnimation()
				self.Logo:setAlpha( 0.85 )
				LogoFrame2( Logo, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 14.21, 14.21 )
				self.clipFinished( Generalframe, {} )
				focus:completeAnimation()
				self.focus:setLeftRight( true, true, 0, 0 )
				self.focus:setTopBottom( true, true, 14.21, 14.21 )
				self.clipFinished( focus, {} )
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 14.21, 14.21 )
				self.clipFinished( unfocused, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.clipFinished( FocusWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 0.21, 0.21 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 14.21, 14.21 )
				GeneralframeFrame2( Generalframe, {} )
				local focusFrame2 = function ( focus, event )
					if not event.interrupted then
						focus:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					focus:setLeftRight( true, true, 0, 0 )
					focus:setTopBottom( true, true, 0.21, 0.21 )
					if event.interrupted then
						self.clipFinished( focus, event )
					else
						focus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focus:completeAnimation()
				self.focus:setLeftRight( true, true, 0, 0 )
				self.focus:setTopBottom( true, true, 14.21, 14.21 )
				focusFrame2( focus, {} )
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 0.21, 0.21 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 14.21, 14.21 )
				unfocusedFrame2( unfocused, {} )
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
				local LogoFrame2 = function ( Logo, event )
					if not event.interrupted then
						Logo:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Logo:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( Logo, event )
					else
						Logo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Logo:completeAnimation()
				self.Logo:setAlpha( 1 )
				LogoFrame2( Logo, {} )
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

