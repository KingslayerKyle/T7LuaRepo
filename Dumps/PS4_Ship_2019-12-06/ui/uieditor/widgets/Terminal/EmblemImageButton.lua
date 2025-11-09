require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.EmblemImageButton = InheritFrom( LUI.UIElement )
CoD.EmblemImageButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemImageButton )
	self.id = "EmblemImageButton"
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
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, true, 0, 0 )
	emblem:setTopBottom( true, true, 1, -1 )
	emblem:subscribeToGlobalModel( controller, "PerController", "identityBadge.xuid", function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			emblem:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8, 8 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( true, false, 38, 70 )
	lockedIcon:setTopBottom( true, false, 16, 48 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FocusWidget:completeAnimation()
				self.FocusWidget:setAlpha( 0 )
				self.clipFinished( FocusWidget, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
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
				local emblemFrame2 = function ( emblem, event )
					if not event.interrupted then
						emblem:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					emblem:setLeftRight( true, true, 0, 0 )
					emblem:setTopBottom( true, true, 16, 14 )
					if event.interrupted then
						self.clipFinished( emblem, event )
					else
						emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 1, -1 )
				emblemFrame2( emblem, {} )
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
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 16, 14 )
				self.clipFinished( emblem, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
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
				local emblemFrame2 = function ( emblem, event )
					if not event.interrupted then
						emblem:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					emblem:setLeftRight( true, true, 0, 0 )
					emblem:setTopBottom( true, true, 1, -1 )
					if event.interrupted then
						self.clipFinished( emblem, event )
					else
						emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 16, 14 )
				emblemFrame2( emblem, {} )
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
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setAlpha( 0 )
				self.clipFinished( FocusWidget, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 38, 70 )
				self.lockedIcon:setTopBottom( true, false, 16, 48 )
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
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
				local emblemFrame2 = function ( emblem, event )
					if not event.interrupted then
						emblem:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					emblem:setLeftRight( true, true, 0, 0 )
					emblem:setTopBottom( true, true, 16, 14 )
					emblem:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( emblem, event )
					else
						emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 1, -1 )
				self.emblem:setAlpha( 0 )
				emblemFrame2( emblem, {} )
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
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					lockedIcon:setLeftRight( true, false, 38, 70 )
					lockedIcon:setTopBottom( true, false, 31, 63 )
					lockedIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 38, 70 )
				self.lockedIcon:setTopBottom( true, false, 16, 48 )
				self.lockedIcon:setAlpha( 1 )
				lockedIconFrame2( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 16, 14 )
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 38, 70 )
				self.lockedIcon:setTopBottom( true, false, 31, 63 )
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
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
				local emblemFrame2 = function ( emblem, event )
					if not event.interrupted then
						emblem:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					emblem:setLeftRight( true, true, 0, 0 )
					emblem:setTopBottom( true, true, 1, -1 )
					emblem:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( emblem, event )
					else
						emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				emblem:completeAnimation()
				self.emblem:setLeftRight( true, true, 0, 0 )
				self.emblem:setTopBottom( true, true, 16, 14 )
				self.emblem:setAlpha( 0 )
				emblemFrame2( emblem, {} )
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
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					lockedIcon:setLeftRight( true, false, 38, 70 )
					lockedIcon:setTopBottom( true, false, 16, 48 )
					lockedIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, false, 38, 70 )
				self.lockedIcon:setTopBottom( true, false, 31, 63 )
				self.lockedIcon:setAlpha( 1 )
				lockedIconFrame2( lockedIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

