-- 414e6007ba59a8353678df8299ca7ac5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedStroke" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.collectibleItem = InheritFrom( LUI.UIElement )
CoD.collectibleItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.collectibleItem )
	self.id = "collectibleItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 200 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedStroke0 = CoD.BorderBakedStroke.new( menu, controller )
	BorderBakedStroke0:setLeftRight( true, true, 0, 0 )
	BorderBakedStroke0:setTopBottom( true, true, 0, 0 )
	BorderBakedStroke0:setZoom( -100 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 0, 0 )
	BorderBaked0:setTopBottom( true, true, 0, 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local FocusHeader = LUI.UIImage.new()
	FocusHeader:setLeftRight( false, false, -24, 21.34 )
	FocusHeader:setTopBottom( true, false, 0, 5.34 )
	FocusHeader:setRGB( 0.18, 0.24, 0.33 )
	FocusHeader:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusheader" ) )
	FocusHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FocusHeader )
	self.FocusHeader = FocusHeader
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2, 1 )
	LobbyMemberBackingFooter0:setTopBottom( false, true, -6, 0 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 1 )
				self.clipFinished( BorderBakedStroke0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )

				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )

				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, 0, 5.34 )
				self.FocusHeader:setRGB( 0.18, 0.24, 0.33 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )

				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setZoom( 100 )
				self.clipFinished( BorderBaked0, {} )

				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )

				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, -17, -11.66 )
				self.FocusHeader:setRGB( 0.93, 0.45, 0.05 )
				self.FocusHeader:setZoom( 100 )
				self.clipFinished( FocusHeader, {} )

				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 100 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )

				local BorderBakedStroke0Frame2 = function ( BorderBakedStroke0, event )
					if not event.interrupted then
						BorderBakedStroke0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedStroke0:setAlpha( 0 )
					BorderBakedStroke0:setZoom( -100 )
					if event.interrupted then
						self.clipFinished( BorderBakedStroke0, event )
					else
						BorderBakedStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 1 )
				self.BorderBakedStroke0:setZoom( -100 )
				BorderBakedStroke0Frame2( BorderBakedStroke0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setAlpha( 1 )
					BorderBaked0:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( false, false, -24, 21.34 )
					FocusHeader:setTopBottom( true, false, -17, -11.66 )
					FocusHeader:setRGB( 0.93, 0.45, 0.05 )
					FocusHeader:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, 0, 5.34 )
				self.FocusHeader:setRGB( 0.18, 0.24, 0.33 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )

				local BorderBakedStroke0Frame2 = function ( BorderBakedStroke0, event )
					if not event.interrupted then
						BorderBakedStroke0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BorderBakedStroke0:setAlpha( 1 )
					BorderBakedStroke0:setZoom( -100 )
					if event.interrupted then
						self.clipFinished( BorderBakedStroke0, event )
					else
						BorderBakedStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.BorderBakedStroke0:setZoom( -100 )
				BorderBakedStroke0Frame2( BorderBakedStroke0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setZoom( 100 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FocusHeader:setLeftRight( false, false, -24, 21.34 )
					FocusHeader:setTopBottom( true, false, 0, 5.34 )
					FocusHeader:setRGB( 0.18, 0.24, 0.33 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, -17, -11.66 )
				self.FocusHeader:setRGB( 0.93, 0.45, 0.05 )
				self.FocusHeader:setZoom( 100 )
				FocusHeaderFrame2( FocusHeader, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 100 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		},
		NoCollectible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 1 )
				self.clipFinished( BorderBakedStroke0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )

				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )

				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, 0, 5.34 )
				self.FocusHeader:setRGB( 0.18, 0.24, 0.33 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )

				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setZoom( 100 )
				self.clipFinished( BorderBaked0, {} )

				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )

				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, -17, -11.66 )
				self.FocusHeader:setRGB( 0.93, 0.45, 0.05 )
				self.FocusHeader:setZoom( 100 )
				self.clipFinished( FocusHeader, {} )

				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 100 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )

				local BorderBakedStroke0Frame2 = function ( BorderBakedStroke0, event )
					if not event.interrupted then
						BorderBakedStroke0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedStroke0:setAlpha( 0 )
					BorderBakedStroke0:setZoom( -100 )
					if event.interrupted then
						self.clipFinished( BorderBakedStroke0, event )
					else
						BorderBakedStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 1 )
				self.BorderBakedStroke0:setZoom( -100 )
				BorderBakedStroke0Frame2( BorderBakedStroke0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setAlpha( 1 )
					BorderBaked0:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( false, false, -24, 21.34 )
					FocusHeader:setTopBottom( true, false, -17, -11.66 )
					FocusHeader:setRGB( 0.93, 0.45, 0.05 )
					FocusHeader:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, 0, 5.34 )
				self.FocusHeader:setRGB( 0.18, 0.24, 0.33 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )

				local BorderBakedStroke0Frame2 = function ( BorderBakedStroke0, event )
					if not event.interrupted then
						BorderBakedStroke0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BorderBakedStroke0:setAlpha( 1 )
					BorderBakedStroke0:setZoom( -100 )
					if event.interrupted then
						self.clipFinished( BorderBakedStroke0, event )
					else
						BorderBakedStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.BorderBakedStroke0:setZoom( -100 )
				BorderBakedStroke0Frame2( BorderBakedStroke0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setZoom( 100 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					FocusHeader:setLeftRight( false, false, -24, 21.34 )
					FocusHeader:setTopBottom( true, false, 0, 5.34 )
					FocusHeader:setRGB( 0.18, 0.24, 0.33 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( false, false, -24, 21.34 )
				self.FocusHeader:setTopBottom( true, false, -17, -11.66 )
				self.FocusHeader:setRGB( 0.93, 0.45, 0.05 )
				self.FocusHeader:setZoom( 100 )
				FocusHeaderFrame2( FocusHeader, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 100 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoCollectible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isSet" )
			end
		}
	} )
	self:linkToElementModel( self, "isSet", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSet"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedStroke0:close()
		element.BorderBaked0:close()
		element.border:close()
		element.LobbyMemberBackingFooter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
