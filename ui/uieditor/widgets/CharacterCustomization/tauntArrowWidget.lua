-- 9411ed135538a6057056bf6d1fd95463
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffArabicAlignTextBox" )

CoD.tauntArrowWidget = InheritFrom( LUI.UIElement )
CoD.tauntArrowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.tauntArrowWidget )
	self.id = "tauntArrowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 533 )
	self:setTopBottom( true, false, 0, 167 )
	self.anyChildUsesUpdateState = true
	
	local dpad = LUI.UIImage.new()
	dpad:setLeftRight( false, false, -25, 25 )
	dpad:setTopBottom( false, false, -25, 25 )
	dpad:subscribeToGlobalModel( controller, "Controller", "dpad_all_button_image", function ( model )
		local dpadAllButtonImage = Engine.GetModelValue( model )
		if dpadAllButtonImage then
			dpad:setImage( RegisterImage( dpadAllButtonImage ) )
		end
	end )
	self:addElement( dpad )
	self.dpad = dpad
	
	local left = CoD.onOffArabicAlignTextBox.new( menu, controller )
	left:setLeftRight( false, false, -342.5, -42.5 )
	left:setTopBottom( false, false, -11, 11 )
	left:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	left.text.textBox:setText( Engine.Localize( "HEROES_GESTURES_THREATEN" ) )
	left.text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	left:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShouldShowPromptForGesture( controller, Enum.CharacterGestureTypes.GESTURE_TYPE_THREATEN )
			end
		}
	} )
	self:addElement( left )
	self.left = left
	
	local up = CoD.onOffArabicAlignTextBox.new( menu, controller )
	up:setLeftRight( false, false, -150, 150 )
	up:setTopBottom( false, false, -59.5, -37.5 )
	up:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	up.text.textBox:setText( Engine.Localize( "HEROES_GESTURES_GOOD_GAME" ) )
	up.text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	up:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShouldShowPromptForGesture( controller, Enum.CharacterGestureTypes.GESTURE_TYPE_GOOD_GAME )
			end
		}
	} )
	self:addElement( up )
	self.up = up
	
	local right = CoD.onOffArabicAlignTextBox.new( menu, controller )
	right:setLeftRight( false, false, 43.5, 343.5 )
	right:setTopBottom( false, false, -11, 11 )
	right:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	right.text.textBox:setText( Engine.Localize( "HEROES_GESTURES_BOAST" ) )
	right.text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	right:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShouldShowPromptForGesture( controller, Enum.CharacterGestureTypes.GESTURE_TYPE_BOAST )
			end
		}
	} )
	self:addElement( right )
	self.right = right
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				dpad:completeAnimation()
				self.dpad:setAlpha( 0 )
				self.clipFinished( dpad, {} )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				up:completeAnimation()
				self.up:setAlpha( 0 )
				self.clipFinished( up, {} )

				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end,
			GesturesOn = function ()
				self:setupElementClipCounter( 4 )

				local dpadFrame2 = function ( dpad, event )
					if not event.interrupted then
						dpad:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					dpad:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( dpad, event )
					else
						dpad:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dpad:completeAnimation()
				self.dpad:setAlpha( 0 )
				dpadFrame2( dpad, {} )
				local leftFrame2 = function ( left, event )
					if not event.interrupted then
						left:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					left:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( left, event )
					else
						left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				left:completeAnimation()
				self.left:setAlpha( 0 )
				leftFrame2( left, {} )
				local upFrame2 = function ( up, event )
					if not event.interrupted then
						up:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					up:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( up, event )
					else
						up:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				up:completeAnimation()
				self.up:setAlpha( 0 )
				upFrame2( up, {} )
				local rightFrame2 = function ( right, event )
					if not event.interrupted then
						right:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					right:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( right, event )
					else
						right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				right:completeAnimation()
				self.right:setAlpha( 0 )
				rightFrame2( right, {} )
			end
		},
		NoGestures = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				dpad:completeAnimation()
				self.dpad:setAlpha( 0 )
				self.clipFinished( dpad, {} )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				up:completeAnimation()
				self.up:setAlpha( 0 )
				self.clipFinished( up, {} )

				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoGestures",
			condition = function ( menu, element, event )
				return not ShouldShowGesturePrompt( controller )
			end
		}
	} )
	self:subscribeToGlobalModel( controller, "TopScorerMenuData", "showGestures", function ( model )
		local f14_local0 = self
		if IsParamModelEqualTo( model, true ) then
			PlayClip( self, "GesturesOn", controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.left:close()
		element.up:close()
		element.right:close()
		element.dpad:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

