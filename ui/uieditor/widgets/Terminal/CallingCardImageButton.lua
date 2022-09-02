-- 0e022a50acf74e1c93fe19bf6fcf2d95
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.CallingCardImageButton = InheritFrom( LUI.UIElement )
CoD.CallingCardImageButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCardImageButton )
	self.id = "CallingCardImageButton"
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
	
	local CallingCard = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCard:setLeftRight( false, false, -240, 240 )
	CallingCard:setTopBottom( true, false, -29, 91 )
	CallingCard.CardIconFrame:setScale( 0.44 )
	CallingCard:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		CallingCard:setModel( model, controller )
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8, 8 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CallingCard:completeAnimation()
				self.CallingCard:setLeftRight( true, true, 0, 0 )
				self.CallingCard:setTopBottom( true, true, 0, 0 )
				self.clipFinished( CallingCard, {} )

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
				local CallingCardFrame2 = function ( CallingCard, event )
					if not event.interrupted then
						CallingCard:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCard:setLeftRight( false, false, -240, 240 )
					CallingCard:setTopBottom( true, false, -14, 106 )
					if event.interrupted then
						self.clipFinished( CallingCard, event )
					else
						CallingCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCard:completeAnimation()
				self.CallingCard:setLeftRight( false, false, -240, 240 )
				self.CallingCard:setTopBottom( true, false, -29, 91 )
				CallingCardFrame2( CallingCard, {} )
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

				CallingCard:completeAnimation()
				self.CallingCard:setLeftRight( false, false, -240, 240 )
				self.CallingCard:setTopBottom( true, false, -14, 106 )
				self.clipFinished( CallingCard, {} )

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
				local CallingCardFrame2 = function ( CallingCard, event )
					if not event.interrupted then
						CallingCard:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCard:setLeftRight( false, false, -240, 240 )
					CallingCard:setTopBottom( true, false, -29, 91 )
					if event.interrupted then
						self.clipFinished( CallingCard, event )
					else
						CallingCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCard:completeAnimation()
				self.CallingCard:setLeftRight( false, false, -240, 240 )
				self.CallingCard:setTopBottom( true, false, -14, 106 )
				CallingCardFrame2( CallingCard, {} )
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
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.CallingCard:close()
		element.FocusWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

