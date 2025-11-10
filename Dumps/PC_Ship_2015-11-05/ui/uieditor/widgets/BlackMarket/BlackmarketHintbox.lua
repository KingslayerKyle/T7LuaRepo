require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "hintText", true, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller,
			menu = menu
		} )
		self:completeAnimation()
		local f2_local0 = Engine.GetModelValue( model )
		if f2_local0 then
			local f2_local1 = 0
			local f2_local2 = 20
			if self.currentState == "LeftAlign" then
				self.textLeftAlign:setText( f2_local0 )
				self:setLeftRight( true, false, -f2_local1, self.textLeftAlign:getTextWidth() + f2_local2 )
			elseif self.currentState == "RightAlign" then
				self.textRightAlign:setText( f2_local0 )
				self:setLeftRight( false, true, -self.textRightAlign:getTextWidth() - f2_local1, f2_local2 )
			elseif self.currentState == "CenterAlign" then
				self.textCenterAlign:setText( f2_local0 )
				local f2_local3 = self.textCenterAlign:getTextWidth()
				self:setLeftRight( false, false, -f2_local3 / 2 - f2_local1, f2_local3 / 2 + f2_local2 )
			end
		end
	end )
end

CoD.BlackmarketHintbox = InheritFrom( LUI.UIElement )
CoD.BlackmarketHintbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackmarketHintbox )
	self.id = "BlackmarketHintbox"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 2, -2 )
	black:setTopBottom( true, true, 2, -2 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.6 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, -1, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setAlpha( 0.4 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.13, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textLeftAlign = LUI.UIText.new()
	textLeftAlign:setLeftRight( true, true, 6, -6 )
	textLeftAlign:setTopBottom( false, false, -8, 8 )
	textLeftAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textLeftAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textLeftAlign:setLetterSpacing( 0.5 )
	textLeftAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textLeftAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textLeftAlign, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 50 )
	end )
	self:addElement( textLeftAlign )
	self.textLeftAlign = textLeftAlign
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 4, -4 )
	textCenterAlign:setTopBottom( false, false, -8, 8 )
	textCenterAlign:setAlpha( 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local textRightAlign = LUI.UIText.new()
	textRightAlign:setLeftRight( true, true, 0, -8 )
	textRightAlign:setTopBottom( false, false, -8, 8 )
	textRightAlign:setAlpha( 0 )
	textRightAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textRightAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textRightAlign:setLetterSpacing( 0.5 )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textRightAlign )
	self.textRightAlign = textRightAlign
	
	local hintArrow00 = CoD.HintTextArrow.new( menu, controller )
	hintArrow00:setLeftRight( true, false, 76, 86 )
	hintArrow00:setTopBottom( true, false, -12, -2 )
	hintArrow00:setAlpha( 0 )
	hintArrow00:linkToElementModel( self, nil, false, function ( model )
		hintArrow00:setModel( model, controller )
	end )
	self:addElement( hintArrow00 )
	self.hintArrow00 = hintArrow00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local blackFrame2 = function ( black, event )
					local blackFrame3 = function ( black, event )
						if not event.interrupted then
							black:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						black:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( black, event )
						else
							black:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blackFrame3( black, event )
						return 
					else
						black:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						black:registerEventHandler( "transition_complete_keyframe", blackFrame3 )
					end
				end
				
				black:completeAnimation()
				self.black:setAlpha( 0.6 )
				blackFrame2( black, {} )
				local cachitBG0Frame2 = function ( cachitBG0, event )
					local cachitBG0Frame3 = function ( cachitBG0, event )
						if not event.interrupted then
							cachitBG0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						cachitBG0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( cachitBG0, event )
						else
							cachitBG0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cachitBG0Frame3( cachitBG0, event )
						return 
					else
						cachitBG0:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						cachitBG0:registerEventHandler( "transition_complete_keyframe", cachitBG0Frame3 )
					end
				end
				
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.4 )
				cachitBG0Frame2( cachitBG0, {} )
				local textLeftAlignFrame2 = function ( textLeftAlign, event )
					local textLeftAlignFrame3 = function ( textLeftAlign, event )
						if not event.interrupted then
							textLeftAlign:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						textLeftAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textLeftAlign, event )
						else
							textLeftAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textLeftAlignFrame3( textLeftAlign, event )
						return 
					else
						textLeftAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textLeftAlign:registerEventHandler( "transition_complete_keyframe", textLeftAlignFrame3 )
					end
				end
				
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 1 )
				textLeftAlignFrame2( textLeftAlign, {} )
				local textCenterAlignFrame2 = function ( textCenterAlign, event )
					local textCenterAlignFrame3 = function ( textCenterAlign, event )
						if not event.interrupted then
							textCenterAlign:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						textCenterAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textCenterAlign, event )
						else
							textCenterAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textCenterAlignFrame3( textCenterAlign, event )
						return 
					else
						textCenterAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textCenterAlign:registerEventHandler( "transition_complete_keyframe", textCenterAlignFrame3 )
					end
				end
				
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				textCenterAlignFrame2( textCenterAlign, {} )
				local textRightAlignFrame2 = function ( textRightAlign, event )
					local textRightAlignFrame3 = function ( textRightAlign, event )
						if not event.interrupted then
							textRightAlign:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						textRightAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textRightAlign, event )
						else
							textRightAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textRightAlignFrame3( textRightAlign, event )
						return 
					else
						textRightAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textRightAlign:registerEventHandler( "transition_complete_keyframe", textRightAlignFrame3 )
					end
				end
				
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				textRightAlignFrame2( textRightAlign, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local blackFrame2 = function ( black, event )
					local blackFrame3 = function ( black, event )
						if not event.interrupted then
							black:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						black:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( black, event )
						else
							black:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blackFrame3( black, event )
						return 
					else
						black:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						black:registerEventHandler( "transition_complete_keyframe", blackFrame3 )
					end
				end
				
				black:completeAnimation()
				self.black:setAlpha( 0.6 )
				blackFrame2( black, {} )
				local cachitBG0Frame2 = function ( cachitBG0, event )
					local cachitBG0Frame3 = function ( cachitBG0, event )
						if not event.interrupted then
							cachitBG0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						cachitBG0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( cachitBG0, event )
						else
							cachitBG0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cachitBG0Frame3( cachitBG0, event )
						return 
					else
						cachitBG0:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						cachitBG0:registerEventHandler( "transition_complete_keyframe", cachitBG0Frame3 )
					end
				end
				
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0.4 )
				cachitBG0Frame2( cachitBG0, {} )
				local textLeftAlignFrame2 = function ( textLeftAlign, event )
					local textLeftAlignFrame3 = function ( textLeftAlign, event )
						if not event.interrupted then
							textLeftAlign:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						textLeftAlign:setLeftRight( true, true, 5, -3 )
						textLeftAlign:setTopBottom( false, false, -8, 8 )
						textLeftAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textLeftAlign, event )
						else
							textLeftAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textLeftAlignFrame3( textLeftAlign, event )
						return 
					else
						textLeftAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textLeftAlign:registerEventHandler( "transition_complete_keyframe", textLeftAlignFrame3 )
					end
				end
				
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setLeftRight( true, true, 5, -3 )
				self.textLeftAlign:setTopBottom( false, false, -8, 8 )
				self.textLeftAlign:setAlpha( 1 )
				textLeftAlignFrame2( textLeftAlign, {} )
				local textCenterAlignFrame2 = function ( textCenterAlign, event )
					local textCenterAlignFrame3 = function ( textCenterAlign, event )
						if not event.interrupted then
							textCenterAlign:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						textCenterAlign:setLeftRight( true, true, 11, 3 )
						textCenterAlign:setTopBottom( false, false, -8, 8 )
						textCenterAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textCenterAlign, event )
						else
							textCenterAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textCenterAlignFrame3( textCenterAlign, event )
						return 
					else
						textCenterAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textCenterAlign:registerEventHandler( "transition_complete_keyframe", textCenterAlignFrame3 )
					end
				end
				
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 11, 3 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
				self.textCenterAlign:setAlpha( 0 )
				textCenterAlignFrame2( textCenterAlign, {} )
				local textRightAlignFrame2 = function ( textRightAlign, event )
					local textRightAlignFrame3 = function ( textRightAlign, event )
						if not event.interrupted then
							textRightAlign:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						textRightAlign:setLeftRight( true, true, 7, -1 )
						textRightAlign:setTopBottom( false, false, -8, 8 )
						textRightAlign:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( textRightAlign, event )
						else
							textRightAlign:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textRightAlignFrame3( textRightAlign, event )
						return 
					else
						textRightAlign:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						textRightAlign:registerEventHandler( "transition_complete_keyframe", textRightAlignFrame3 )
					end
				end
				
				textRightAlign:completeAnimation()
				self.textRightAlign:setLeftRight( true, true, 7, -1 )
				self.textRightAlign:setTopBottom( false, false, -8, 8 )
				self.textRightAlign:setAlpha( 0 )
				textRightAlignFrame2( textRightAlign, {} )
				local hintArrow00Frame2 = function ( hintArrow00, event )
					local hintArrow00Frame3 = function ( hintArrow00, event )
						if not event.interrupted then
							hintArrow00:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						hintArrow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( hintArrow00, event )
						else
							hintArrow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						hintArrow00Frame3( hintArrow00, event )
						return 
					else
						hintArrow00:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
						hintArrow00:registerEventHandler( "transition_complete_keyframe", hintArrow00Frame3 )
					end
				end
				
				hintArrow00:completeAnimation()
				self.hintArrow00:setAlpha( 1 )
				hintArrow00Frame2( hintArrow00, {} )
			end
		},
		RightAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 1 )
				self.clipFinished( textRightAlign, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				cachitBG0:completeAnimation()
				self.cachitBG0:setLeftRight( true, true, 0, 0 )
				self.cachitBG0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( cachitBG0, {} )
				textLeftAlign:completeAnimation()
				self.textLeftAlign:setAlpha( 0 )
				self.clipFinished( textLeftAlign, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasHintText( element )
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return IsHintTextLeftAlign( element, controller )
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return IsHintTextRightAlign( element, controller )
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintArrow00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

