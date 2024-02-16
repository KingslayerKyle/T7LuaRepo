-- 15ab764589f2cd7bee6c1e4b5c882f49
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.Health = InheritFrom( LUI.UIElement )
CoD.Health.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Health )
	self.id = "Health"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 222 )
	self:setTopBottom( true, false, 0, 172 )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, false, 0, 222 )
	white:setTopBottom( true, false, 0, 172 )
	white:setAlpha( 0.1 )
	self:addElement( white )
	self.white = white
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -9, 7.71 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local EKGStable = LUI.UIImage.new()
	EKGStable:setLeftRight( true, false, 11.29, 209.42 )
	EKGStable:setTopBottom( true, false, 19, 48.33 )
	EKGStable:setRGB( 1, 0.06, 0 )
	EKGStable:setImage( RegisterImage( "uie_ekg_signal" ) )
	EKGStable:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_ekg" ) )
	EKGStable:setShaderVector( 0, 4.76, 7.22, 4, 0.6 )
	EKGStable:setShaderVector( 1, 1.01, 2, -0.32, 0 )
	self:addElement( EKGStable )
	self.EKGStable = EKGStable
	
	local EKGStable0 = LUI.UIImage.new()
	EKGStable0:setLeftRight( true, false, 11.29, 209.42 )
	EKGStable0:setTopBottom( true, false, 73, 102.33 )
	EKGStable0:setRGB( 0.15, 0.75, 1 )
	EKGStable0:setImage( RegisterImage( "uie_ekg_signal" ) )
	EKGStable0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_ekg" ) )
	EKGStable0:setShaderVector( 0, 1.33, 7.57, 1.58, 0.6 )
	EKGStable0:setShaderVector( 1, 1.01, 2, -0.32, 0 )
	self:addElement( EKGStable0 )
	self.EKGStable0 = EKGStable0
	
	local EKGStable00 = LUI.UIImage.new()
	EKGStable00:setLeftRight( true, false, 11.29, 209.42 )
	EKGStable00:setTopBottom( true, false, 126, 153 )
	EKGStable00:setImage( RegisterImage( "uie_ekg_signal2" ) )
	EKGStable00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_ekg" ) )
	EKGStable00:setShaderVector( 0, 1.4, 8.03, 1.86, 0.48 )
	EKGStable00:setShaderVector( 1, 0.29, 1.74, -0.32, 0 )
	self:addElement( EKGStable00 )
	self.EKGStable00 = EKGStable00
	
	local barHR = LUI.UIImage.new()
	barHR:setLeftRight( true, false, 20.29, 54.4 )
	barHR:setTopBottom( true, false, 118.33, 162.09 )
	barHR:setImage( RegisterImage( "uie_t7_menu_cp_datavault_heath_bars" ) )
	self:addElement( barHR )
	self.barHR = barHR
	
	local barHR0 = LUI.UIImage.new()
	barHR0:setLeftRight( true, false, 15.46, 59.23 )
	barHR0:setTopBottom( true, false, 65.78, 109.54 )
	barHR0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_heath_bars2" ) )
	self:addElement( barHR0 )
	self.barHR0 = barHR0
	
	local barHR00 = LUI.UIImage.new()
	barHR00:setLeftRight( true, false, 19.46, 33.09 )
	barHR00:setTopBottom( true, false, 18.19, 31.81 )
	barHR00:setImage( RegisterImage( "uie_t7_menu_cp_datavault_heath_bars3" ) )
	self:addElement( barHR00 )
	self.barHR00 = barHR00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )

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
				local whiteFrame2 = function ( white, event )
					if not event.interrupted then
						white:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					white:setLeftRight( true, false, 0, 222 )
					white:setTopBottom( true, false, 15, 187 )
					if event.interrupted then
						self.clipFinished( white, event )
					else
						white:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				white:completeAnimation()
				self.white:setLeftRight( true, false, 0, 222 )
				self.white:setTopBottom( true, false, 0, 172 )
				whiteFrame2( white, {} )
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
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				local EKGStableFrame2 = function ( EKGStable, event )
					if not event.interrupted then
						EKGStable:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable:setTopBottom( true, false, 34, 63.33 )
					if event.interrupted then
						self.clipFinished( EKGStable, event )
					else
						EKGStable:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable:completeAnimation()
				self.EKGStable:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable:setTopBottom( true, false, 19, 48.33 )
				EKGStableFrame2( EKGStable, {} )
				local EKGStable0Frame2 = function ( EKGStable0, event )
					if not event.interrupted then
						EKGStable0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable0:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable0:setTopBottom( true, false, 88, 117.33 )
					if event.interrupted then
						self.clipFinished( EKGStable0, event )
					else
						EKGStable0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable0:completeAnimation()
				self.EKGStable0:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable0:setTopBottom( true, false, 73, 102.33 )
				EKGStable0Frame2( EKGStable0, {} )
				local EKGStable00Frame2 = function ( EKGStable00, event )
					if not event.interrupted then
						EKGStable00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable00:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable00:setTopBottom( true, false, 141, 168 )
					if event.interrupted then
						self.clipFinished( EKGStable00, event )
					else
						EKGStable00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable00:completeAnimation()
				self.EKGStable00:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable00:setTopBottom( true, false, 126, 153 )
				EKGStable00Frame2( EKGStable00, {} )
				local barHRFrame2 = function ( barHR, event )
					if not event.interrupted then
						barHR:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR:setLeftRight( true, false, 20.29, 54.4 )
					barHR:setTopBottom( true, false, 133.33, 177.09 )
					if event.interrupted then
						self.clipFinished( barHR, event )
					else
						barHR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR:completeAnimation()
				self.barHR:setLeftRight( true, false, 20.29, 54.4 )
				self.barHR:setTopBottom( true, false, 118.33, 162.09 )
				barHRFrame2( barHR, {} )
				local barHR0Frame2 = function ( barHR0, event )
					if not event.interrupted then
						barHR0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR0:setLeftRight( true, false, 15.46, 59.23 )
					barHR0:setTopBottom( true, false, 80.78, 124.54 )
					if event.interrupted then
						self.clipFinished( barHR0, event )
					else
						barHR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR0:completeAnimation()
				self.barHR0:setLeftRight( true, false, 15.46, 59.23 )
				self.barHR0:setTopBottom( true, false, 65.78, 109.54 )
				barHR0Frame2( barHR0, {} )
				local barHR00Frame2 = function ( barHR00, event )
					if not event.interrupted then
						barHR00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR00:setLeftRight( true, false, 19.46, 33.09 )
					barHR00:setTopBottom( true, false, 33.19, 46.81 )
					if event.interrupted then
						self.clipFinished( barHR00, event )
					else
						barHR00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR00:completeAnimation()
				self.barHR00:setLeftRight( true, false, 19.46, 33.09 )
				self.barHR00:setTopBottom( true, false, 18.19, 31.81 )
				barHR00Frame2( barHR00, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )

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
				local whiteFrame2 = function ( white, event )
					if not event.interrupted then
						white:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					white:setLeftRight( true, false, 0, 222 )
					white:setTopBottom( true, false, 0, 172 )
					if event.interrupted then
						self.clipFinished( white, event )
					else
						white:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				white:completeAnimation()
				self.white:setLeftRight( true, false, 0, 222 )
				self.white:setTopBottom( true, false, 15, 187 )
				whiteFrame2( white, {} )
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
				local EKGStableFrame2 = function ( EKGStable, event )
					if not event.interrupted then
						EKGStable:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable:setTopBottom( true, false, 19, 48.33 )
					if event.interrupted then
						self.clipFinished( EKGStable, event )
					else
						EKGStable:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable:completeAnimation()
				self.EKGStable:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable:setTopBottom( true, false, 34, 63.33 )
				EKGStableFrame2( EKGStable, {} )
				local EKGStable0Frame2 = function ( EKGStable0, event )
					if not event.interrupted then
						EKGStable0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable0:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable0:setTopBottom( true, false, 73, 102.33 )
					if event.interrupted then
						self.clipFinished( EKGStable0, event )
					else
						EKGStable0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable0:completeAnimation()
				self.EKGStable0:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable0:setTopBottom( true, false, 88, 117.33 )
				EKGStable0Frame2( EKGStable0, {} )
				local EKGStable00Frame2 = function ( EKGStable00, event )
					if not event.interrupted then
						EKGStable00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					EKGStable00:setLeftRight( true, false, 11.29, 209.42 )
					EKGStable00:setTopBottom( true, false, 126, 153 )
					if event.interrupted then
						self.clipFinished( EKGStable00, event )
					else
						EKGStable00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EKGStable00:completeAnimation()
				self.EKGStable00:setLeftRight( true, false, 11.29, 209.42 )
				self.EKGStable00:setTopBottom( true, false, 141, 168 )
				EKGStable00Frame2( EKGStable00, {} )
				local barHRFrame2 = function ( barHR, event )
					if not event.interrupted then
						barHR:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR:setLeftRight( true, false, 20.29, 54.4 )
					barHR:setTopBottom( true, false, 118.33, 162.09 )
					if event.interrupted then
						self.clipFinished( barHR, event )
					else
						barHR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR:completeAnimation()
				self.barHR:setLeftRight( true, false, 20.29, 54.4 )
				self.barHR:setTopBottom( true, false, 133.33, 177.09 )
				barHRFrame2( barHR, {} )
				local barHR0Frame2 = function ( barHR0, event )
					if not event.interrupted then
						barHR0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR0:setLeftRight( true, false, 15.46, 59.23 )
					barHR0:setTopBottom( true, false, 65.78, 109.54 )
					if event.interrupted then
						self.clipFinished( barHR0, event )
					else
						barHR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR0:completeAnimation()
				self.barHR0:setLeftRight( true, false, 15.46, 59.23 )
				self.barHR0:setTopBottom( true, false, 80.78, 124.54 )
				barHR0Frame2( barHR0, {} )
				local barHR00Frame2 = function ( barHR00, event )
					if not event.interrupted then
						barHR00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					barHR00:setLeftRight( true, false, 19.46, 33.09 )
					barHR00:setTopBottom( true, false, 18.19, 31.81 )
					if event.interrupted then
						self.clipFinished( barHR00, event )
					else
						barHR00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				barHR00:completeAnimation()
				self.barHR00:setLeftRight( true, false, 19.46, 33.09 )
				self.barHR00:setTopBottom( true, false, 33.19, 46.81 )
				barHR00Frame2( barHR00, {} )
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
