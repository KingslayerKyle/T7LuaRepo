-- 766459e9760f35c1eadcefb6a9154e84
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.WeaponsApplet = InheritFrom( LUI.UIElement )
CoD.WeaponsApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponsApplet )
	self.id = "WeaponsApplet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 332 )
	self:setTopBottom( true, false, 0, 182 )
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
	
	local GunContainer = LUI.UIImage.new()
	GunContainer:setLeftRight( false, false, -131.47, 131.47 )
	GunContainer:setTopBottom( true, false, 31, 164.87 )
	GunContainer:setAlpha( 0.85 )
	GunContainer:setImage( RegisterImage( "uie_t7_menu_cp_datavault_gun" ) )
	self:addElement( GunContainer )
	self.GunContainer = GunContainer
	
	local CallingCardLines0000 = LUI.UIImage.new()
	CallingCardLines0000:setLeftRight( true, true, -2, 0 )
	CallingCardLines0000:setTopBottom( false, true, 1, 19.12 )
	CallingCardLines0000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_gun_bottombar" ) )
	self:addElement( CallingCardLines0000 )
	self.CallingCardLines0000 = CallingCardLines0000
	
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
				local GunContainerFrame2 = function ( GunContainer, event )
					if not event.interrupted then
						GunContainer:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					GunContainer:setLeftRight( false, false, -142.58, 142.58 )
					GunContainer:setTopBottom( true, false, 38.23, 170.25 )
					GunContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GunContainer, event )
					else
						GunContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GunContainer:completeAnimation()
				self.GunContainer:setLeftRight( false, false, -142.58, 142.58 )
				self.GunContainer:setTopBottom( true, false, 23.23, 155.25 )
				self.GunContainer:setAlpha( 0.85 )
				GunContainerFrame2( GunContainer, {} )
				local CallingCardLines0000Frame2 = function ( CallingCardLines0000, event )
					if not event.interrupted then
						CallingCardLines0000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines0000:setLeftRight( true, true, -2, 0 )
					CallingCardLines0000:setTopBottom( false, true, 16, 34.12 )
					if event.interrupted then
						self.clipFinished( CallingCardLines0000, event )
					else
						CallingCardLines0000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines0000:completeAnimation()
				self.CallingCardLines0000:setLeftRight( true, true, -2, 0 )
				self.CallingCardLines0000:setTopBottom( false, true, 1, 19.12 )
				CallingCardLines0000Frame2( CallingCardLines0000, {} )
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
				unfocused:completeAnimation()
				self.unfocused:setLeftRight( true, true, 0, 0 )
				self.unfocused:setTopBottom( true, true, 15, 15 )
				self.clipFinished( unfocused, {} )
				GunContainer:completeAnimation()
				self.GunContainer:setLeftRight( false, false, -142.58, 142.58 )
				self.GunContainer:setTopBottom( true, false, 38.23, 170.25 )
				self.clipFinished( GunContainer, {} )
				CallingCardLines0000:completeAnimation()
				self.CallingCardLines0000:setLeftRight( true, true, -2, 0 )
				self.CallingCardLines0000:setTopBottom( false, true, 16, 34.12 )
				self.clipFinished( CallingCardLines0000, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
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
				local GunContainerFrame2 = function ( GunContainer, event )
					if not event.interrupted then
						GunContainer:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					GunContainer:setLeftRight( false, false, -142.58, 142.58 )
					GunContainer:setTopBottom( true, false, 23.23, 155.25 )
					GunContainer:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( GunContainer, event )
					else
						GunContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GunContainer:completeAnimation()
				self.GunContainer:setLeftRight( false, false, -142.58, 142.58 )
				self.GunContainer:setTopBottom( true, false, 38.23, 170.25 )
				self.GunContainer:setAlpha( 1 )
				GunContainerFrame2( GunContainer, {} )
				local CallingCardLines0000Frame2 = function ( CallingCardLines0000, event )
					if not event.interrupted then
						CallingCardLines0000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines0000:setLeftRight( true, true, -2, 0 )
					CallingCardLines0000:setTopBottom( false, true, 1, 19.12 )
					if event.interrupted then
						self.clipFinished( CallingCardLines0000, event )
					else
						CallingCardLines0000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines0000:completeAnimation()
				self.CallingCardLines0000:setLeftRight( true, true, -2, 0 )
				self.CallingCardLines0000:setTopBottom( false, true, 16, 34.12 )
				CallingCardLines0000Frame2( CallingCardLines0000, {} )
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

