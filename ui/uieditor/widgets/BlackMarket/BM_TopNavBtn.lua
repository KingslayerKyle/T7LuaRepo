-- a11b8d59c501915e7c062bbfbeadb7e8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.FE_BlackMarketSpecialBreadcrumb" )

CoD.BM_TopNavBtn = InheritFrom( LUI.UIElement )
CoD.BM_TopNavBtn.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_TopNavBtn )
	self.id = "BM_TopNavBtn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 115 )
	self:setTopBottom( true, false, 0, 41 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local off = LUI.UIImage.new()
	off:setLeftRight( true, false, -8, 121.91 )
	off:setTopBottom( true, false, -21.38, 68 )
	off:setImage( RegisterImage( "uie_t7_blackmarket_bribe_header" ) )
	self:addElement( off )
	self.off = off
	
	local on = LUI.UIImage.new()
	on:setLeftRight( true, false, -8, 121.91 )
	on:setTopBottom( true, false, -21.38, 68 )
	on:setAlpha( 0 )
	on:setImage( RegisterImage( "uie_t7_blackmarket_bribe_header_hover" ) )
	self:addElement( on )
	self.on = on
	
	local btnDisplayTextStroke0 = LUI.UIText.new()
	btnDisplayTextStroke0:setLeftRight( false, false, -51.75, 53.75 )
	btnDisplayTextStroke0:setTopBottom( true, false, 13, 30 )
	btnDisplayTextStroke0:setRGB( 0.6, 1, 0.95 )
	btnDisplayTextStroke0:setAlpha( 0 )
	btnDisplayTextStroke0:setZoom( 10 )
	btnDisplayTextStroke0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	btnDisplayTextStroke0:setLetterSpacing( -0.6 )
	btnDisplayTextStroke0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	btnDisplayTextStroke0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke0, "setText", function ( element, controller )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke0 )
	self.btnDisplayTextStroke0 = btnDisplayTextStroke0
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( false, false, -51.75, 53.75 )
	btnDisplayTextStroke:setTopBottom( true, false, 13, 30 )
	btnDisplayTextStroke:setRGB( 0.6, 1, 0.95 )
	btnDisplayTextStroke:setZoom( 10 )
	btnDisplayTextStroke:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	btnDisplayTextStroke:setLetterSpacing( -0.6 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local FEBlackMarketSpecialBreadcrumb = CoD.FE_BlackMarketSpecialBreadcrumb.new( menu, controller )
	FEBlackMarketSpecialBreadcrumb:setLeftRight( false, true, -57.5, 25.5 )
	FEBlackMarketSpecialBreadcrumb:setTopBottom( false, false, -56.75, 7.75 )
	FEBlackMarketSpecialBreadcrumb:setScale( 0.5 )
	FEBlackMarketSpecialBreadcrumb.BMBreadlinker:setAlpha( 0 )
	self:addElement( FEBlackMarketSpecialBreadcrumb )
	self.FEBlackMarketSpecialBreadcrumb = FEBlackMarketSpecialBreadcrumb
	
	self.btnDisplayTextStroke0:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayTextStroke0:setText( Engine.Localize( displayText ) )
		end
	end )
	self.btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				off:completeAnimation()
				self.off:setAlpha( 1 )
				self.clipFinished( off, {} )

				on:completeAnimation()
				self.on:setAlpha( 0 )
				self.clipFinished( on, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 0.6, 1, 0.95 )
				self.clipFinished( btnDisplayTextStroke, {} )

				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				local offFrame2 = function ( off, event )
					local offFrame3 = function ( off, event )
						if not event.interrupted then
							off:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						off:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( off, event )
						else
							off:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						offFrame3( off, event )
						return 
					else
						off:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						off:registerEventHandler( "transition_complete_keyframe", offFrame3 )
					end
				end
				
				off:completeAnimation()
				self.off:setAlpha( 1 )
				offFrame2( off, {} )
				local onFrame2 = function ( on, event )
					local onFrame3 = function ( on, event )
						if not event.interrupted then
							on:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						on:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( on, event )
						else
							on:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						onFrame3( on, event )
						return 
					else
						on:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						on:setAlpha( 0.8 )
						on:registerEventHandler( "transition_complete_keyframe", onFrame3 )
					end
				end
				
				on:completeAnimation()
				self.on:setAlpha( 1 )
				onFrame2( on, {} )
				local btnDisplayTextStroke0Frame2 = function ( btnDisplayTextStroke0, event )
					local btnDisplayTextStroke0Frame3 = function ( btnDisplayTextStroke0, event )
						if not event.interrupted then
							btnDisplayTextStroke0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						btnDisplayTextStroke0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayTextStroke0, event )
						else
							btnDisplayTextStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextStroke0Frame3( btnDisplayTextStroke0, event )
						return 
					else
						btnDisplayTextStroke0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						btnDisplayTextStroke0:setAlpha( 1 )
						btnDisplayTextStroke0:registerEventHandler( "transition_complete_keyframe", btnDisplayTextStroke0Frame3 )
					end
				end
				
				btnDisplayTextStroke0:completeAnimation()
				self.btnDisplayTextStroke0:setAlpha( 0 )
				btnDisplayTextStroke0Frame2( btnDisplayTextStroke0, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					local btnDisplayTextStrokeFrame3 = function ( btnDisplayTextStroke, event )
						if not event.interrupted then
							btnDisplayTextStroke:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						btnDisplayTextStroke:setRGB( 1, 0.97, 0.75 )
						btnDisplayTextStroke:setAlpha( 1 )
						btnDisplayTextStroke:setZoom( 10 )
						if event.interrupted then
							self.clipFinished( btnDisplayTextStroke, event )
						else
							btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextStrokeFrame3( btnDisplayTextStroke, event )
						return 
					else
						btnDisplayTextStroke:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						btnDisplayTextStroke:setAlpha( 0.46 )
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", btnDisplayTextStrokeFrame3 )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 1, 0.97, 0.75 )
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )

				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )

				self.nextClip = "Focus"
			end
		},
		HaveNewBlackMarketPromo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				off:completeAnimation()
				self.off:setAlpha( 1 )
				self.clipFinished( off, {} )

				on:completeAnimation()
				self.on:setAlpha( 0 )
				self.clipFinished( on, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 0.6, 1, 0.95 )
				self.clipFinished( btnDisplayTextStroke, {} )

				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 1 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				local offFrame2 = function ( off, event )
					local offFrame3 = function ( off, event )
						if not event.interrupted then
							off:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						off:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( off, event )
						else
							off:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						offFrame3( off, event )
						return 
					else
						off:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						off:registerEventHandler( "transition_complete_keyframe", offFrame3 )
					end
				end
				
				off:completeAnimation()
				self.off:setAlpha( 1 )
				offFrame2( off, {} )
				local onFrame2 = function ( on, event )
					local onFrame3 = function ( on, event )
						if not event.interrupted then
							on:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						on:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( on, event )
						else
							on:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						onFrame3( on, event )
						return 
					else
						on:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						on:setAlpha( 0.45 )
						on:registerEventHandler( "transition_complete_keyframe", onFrame3 )
					end
				end
				
				on:completeAnimation()
				self.on:setAlpha( 1 )
				onFrame2( on, {} )
				local btnDisplayTextStroke0Frame2 = function ( btnDisplayTextStroke0, event )
					local btnDisplayTextStroke0Frame3 = function ( btnDisplayTextStroke0, event )
						if not event.interrupted then
							btnDisplayTextStroke0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						btnDisplayTextStroke0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayTextStroke0, event )
						else
							btnDisplayTextStroke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextStroke0Frame3( btnDisplayTextStroke0, event )
						return 
					else
						btnDisplayTextStroke0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						btnDisplayTextStroke0:setAlpha( 1 )
						btnDisplayTextStroke0:registerEventHandler( "transition_complete_keyframe", btnDisplayTextStroke0Frame3 )
					end
				end
				
				btnDisplayTextStroke0:completeAnimation()
				self.btnDisplayTextStroke0:setAlpha( 0 )
				btnDisplayTextStroke0Frame2( btnDisplayTextStroke0, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					local btnDisplayTextStrokeFrame3 = function ( btnDisplayTextStroke, event )
						if not event.interrupted then
							btnDisplayTextStroke:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						btnDisplayTextStroke:setRGB( 1, 0.97, 0.75 )
						btnDisplayTextStroke:setAlpha( 1 )
						btnDisplayTextStroke:setZoom( 10 )
						if event.interrupted then
							self.clipFinished( btnDisplayTextStroke, event )
						else
							btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextStrokeFrame3( btnDisplayTextStroke, event )
						return 
					else
						btnDisplayTextStroke:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						btnDisplayTextStroke:setAlpha( 0.46 )
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", btnDisplayTextStrokeFrame3 )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 1, 0.97, 0.75 )
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )

				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 1 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )

				self.nextClip = "Focus"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HaveNewBlackMarketPromo",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "showBreadcrumb" )
			end
		}
	} )
	self:linkToElementModel( self, "showBreadcrumb", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showBreadcrumb"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEBlackMarketSpecialBreadcrumb:close()
		element.btnDisplayTextStroke0:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

