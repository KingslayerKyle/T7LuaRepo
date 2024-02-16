require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.CodCasterTeamLogoButton = InheritFrom( LUI.UIElement )
CoD.CodCasterTeamLogoButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterTeamLogoButton )
	self.id = "CodCasterTeamLogoButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 140 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local unfocused = LUI.UIImage.new()
	unfocused:setLeftRight( true, true, 0, 0 )
	unfocused:setTopBottom( true, true, 0, 0 )
	unfocused:linkToElementModel( self, "ref", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unfocused:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( unfocused )
	self.unfocused = unfocused
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8, 8 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FocusWidget.Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local Alert = LUI.UIImage.new()
	Alert:setLeftRight( true, false, 60, 80 )
	Alert:setTopBottom( true, false, 35, 55 )
	Alert:setRGB( ColorSet.CoreChaos.r, ColorSet.CoreChaos.g, ColorSet.CoreChaos.b )
	Alert:setImage( RegisterImage( "uie_t7_hud_cac_warning_20" ) )
	self:addElement( Alert )
	self.Alert = Alert
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 0, 0 )
				self.clipFinished( unfocused, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setAlpha( 0 )
				self.clipFinished( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setAlpha( 0 )
				self.clipFinished( Alert, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
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
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setAlpha( 0 )
				self.clipFinished( Alert, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Generalframe:setLeftRight( true, true, 0, 0 )
				Generalframe:setTopBottom( true, true, 15, 15 )
				Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				unfocused:setLeftRight( true, true, 0, 0 )
				unfocused:setTopBottom( true, true, 15, 15 )
				unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				FocusWidget:setLeftRight( true, true, -8, 8 )
				FocusWidget:setTopBottom( true, false, -10, 10 )
				FocusWidget:setAlpha( 1 )
				FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Alert:completeAnimation()
				self.Alert:setAlpha( 0 )
				self.clipFinished( Alert, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
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
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setAlpha( 0 )
				self.clipFinished( Alert, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 0, 0 )
				self.unfocused:setAlpha( 0.3 )
				self.clipFinished( unfocused, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setAlpha( 0 )
				self.clipFinished( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setAlpha( 1 )
				self.clipFinished( Alert, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
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
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 15, 15 )
					unfocused:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 0, 0 )
				self.unfocused:setAlpha( 0.3 )
				unfocusedFrame2( unfocused, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setAlpha( 1 )
				self.clipFinished( Alert, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Generalframe:setLeftRight( true, true, 0, 0 )
				Generalframe:setTopBottom( true, true, 15, 15 )
				Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 15, 15 )
					unfocused:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 15, 15 )
				self.unfocused:setAlpha( 0.3 )
				unfocusedFrame2( unfocused, {} )
				FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				FocusWidget:setLeftRight( true, true, -8, 8 )
				FocusWidget:setTopBottom( true, false, -10, 10 )
				FocusWidget:setAlpha( 1 )
				FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Alert:completeAnimation()
				self.Alert:setRGB( ColorSet.CoreChaos.r, ColorSet.CoreChaos.g, ColorSet.CoreChaos.b )
				self.clipFinished( Alert, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
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
				local unfocusedFrame2 = function ( unfocused, event )
					if not event.interrupted then
						unfocused:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					unfocused:setLeftRight( true, true, 0, 0 )
					unfocused:setTopBottom( true, true, 0, 0 )
					unfocused:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( unfocused, event )
					else
						unfocused:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 15, 15 )
				self.unfocused:setAlpha( 0.3 )
				unfocusedFrame2( unfocused, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
				Alert:completeAnimation()
				self.Alert:setRGB( ColorSet.CoreChaos.r, ColorSet.CoreChaos.g, ColorSet.CoreChaos.b )
				self.clipFinished( Alert, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Generalframe:close()
		self.FocusWidget:close()
		self.unfocused:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

