-- cbbd5814f7b4212f2de59c5f3b3ca5a5
-- This hash is used for caching, delete to decompile the file again

CoD.tauntBindsWidget = InheritFrom( LUI.UIElement )
CoD.tauntBindsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.tauntBindsWidget )
	self.id = "tauntBindsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 533 )
	self:setTopBottom( true, false, 0, 167 )
	
	local right = LUI.UIText.new()
	right:setLeftRight( false, false, -81, 266.5 )
	right:setTopBottom( false, false, -25, 0 )
	right:setText( Engine.Localize( "HEROES_GESTURES_BOAST_BIND" ) )
	right:setTTF( "fonts/default.ttf" )
	right:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	right:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( right )
	self.right = right
	
	local left = LUI.UIText.new()
	left:setLeftRight( false, false, -81, 266.5 )
	left:setTopBottom( false, false, 0, 25 )
	left:setText( Engine.Localize( "HEROES_GESTURES_THREATEN_BIND" ) )
	left:setTTF( "fonts/default.ttf" )
	left:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	left:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( left )
	self.left = left
	
	local up = LUI.UIText.new()
	up:setLeftRight( false, false, -81, 266.5 )
	up:setTopBottom( false, false, -50, -25 )
	up:setText( Engine.Localize( "HEROES_GESTURES_GOOD_GAME_BIND" ) )
	up:setTTF( "fonts/default.ttf" )
	up:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	up:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( up )
	self.up = up
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				up:completeAnimation()
				self.up:setAlpha( 0 )
				self.clipFinished( up, {} )
			end,
			GesturesOn = function ()
				self:setupElementClipCounter( 3 )

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
			end
		},
		NoGestures = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				up:completeAnimation()
				self.up:setAlpha( 0 )
				self.clipFinished( up, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoGestures",
			condition = function ( menu, element, event )
				return not CurrentPlayerHasAnyGesture( controller )
			end
		}
	} )
	self:subscribeToGlobalModel( controller, "TopScorerMenuData", "showGestures", function ( model )
		local f9_local0 = self
		if IsParamModelEqualTo( model, true ) then
			PlayClip( self, "GesturesOn", controller )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
