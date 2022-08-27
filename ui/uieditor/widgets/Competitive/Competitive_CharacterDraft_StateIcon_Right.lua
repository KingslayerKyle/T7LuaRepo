-- 760d22dbcda10950757721aa5c3d96e6
-- This hash is used for caching, delete to decompile the file again

CoD.Competitive_CharacterDraft_StateIcon_Right = InheritFrom( LUI.UIElement )
CoD.Competitive_CharacterDraft_StateIcon_Right.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_CharacterDraft_StateIcon_Right )
	self.id = "Competitive_CharacterDraft_StateIcon_Right"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 27 )
	self:setTopBottom( true, false, 0, 27 )
	
	local Arrow0 = LUI.UIImage.new()
	Arrow0:setLeftRight( true, false, -3.22, 31.32 )
	Arrow0:setTopBottom( true, false, -2, 28 )
	Arrow0:setRGB( 0, 0, 0 )
	Arrow0:setAlpha( 0 )
	Arrow0:setYRot( 180 )
	Arrow0:setImage( RegisterImage( "uie_t7_icon_pregame_arrow" ) )
	self:addElement( Arrow0 )
	self.Arrow0 = Arrow0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -3.22, 31.32 )
	Arrow:setTopBottom( true, false, -2, 28 )
	Arrow:setYRot( 180 )
	Arrow:setImage( RegisterImage( "uie_t7_icon_pregame_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local checkmark = LUI.UIImage.new()
	checkmark:setLeftRight( true, false, -6.45, 30.55 )
	checkmark:setTopBottom( true, false, -2, 28 )
	checkmark:setImage( RegisterImage( "uie_t7_icon_pregame_checkmark" ) )
	self:addElement( checkmark )
	self.checkmark = checkmark
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Arrow0:completeAnimation()
				self.Arrow0:setAlpha( 0 )
				self.clipFinished( Arrow0, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				checkmark:completeAnimation()
				self.checkmark:setAlpha( 0 )
				self.clipFinished( checkmark, {} )
			end,
			Choosing = function ()
				self:setupElementClipCounter( 3 )
				local Arrow0Frame2 = function ( Arrow0, event )
					if not event.interrupted then
						Arrow0:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
					end
					Arrow0:setLeftRight( true, false, -3.22, 31.32 )
					Arrow0:setTopBottom( true, false, -2, 28 )
					Arrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow0, event )
					else
						Arrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow0:completeAnimation()
				self.Arrow0:setLeftRight( true, false, -34.54, 0 )
				self.Arrow0:setTopBottom( true, false, -2, 28 )
				self.Arrow0:setAlpha( 0 )
				Arrow0Frame2( Arrow0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( true, false, -3.22, 31.32 )
					Arrow:setTopBottom( true, false, -2, 28 )
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -34.54, 0 )
				self.Arrow:setTopBottom( true, false, -2, 28 )
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
				checkmark:completeAnimation()
				self.checkmark:setAlpha( 0 )
				self.clipFinished( checkmark, {} )
			end
		},
		Choosing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Arrow0:completeAnimation()
				self.Arrow0:setRGB( 0, 0, 0 )
				self.Arrow0:setAlpha( 1 )
				self.clipFinished( Arrow0, {} )
				Arrow:completeAnimation()
				self.Arrow:setRGB( 1, 1, 1 )
				self.clipFinished( Arrow, {} )
				checkmark:completeAnimation()
				self.checkmark:setAlpha( 0 )
				self.clipFinished( checkmark, {} )
			end,
			Complete = function ()
				self:setupElementClipCounter( 3 )
				local Arrow0Frame2 = function ( Arrow0, event )
					if not event.interrupted then
						Arrow0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					Arrow0:setRGB( 0, 0, 0 )
					Arrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow0, event )
					else
						Arrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow0:completeAnimation()
				self.Arrow0:setRGB( 0, 0, 0 )
				self.Arrow0:setAlpha( 0 )
				Arrow0Frame2( Arrow0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					Arrow:setRGB( 0.66, 0.85, 0.16 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setRGB( 1, 1, 1 )
				ArrowFrame2( Arrow, {} )
				local checkmarkFrame2 = function ( checkmark, event )
					if not event.interrupted then
						checkmark:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					checkmark:setRGB( 0.66, 0.85, 0.16 )
					checkmark:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( checkmark, event )
					else
						checkmark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkmark:completeAnimation()
				self.checkmark:setRGB( 1, 1, 1 )
				self.checkmark:setAlpha( 0 )
				checkmarkFrame2( checkmark, {} )
			end,
			Forced = function ()
				self:setupElementClipCounter( 3 )
				local Arrow0Frame2 = function ( Arrow0, event )
					if not event.interrupted then
						Arrow0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Arrow0:setRGB( 0, 0, 0 )
					Arrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow0, event )
					else
						Arrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow0:completeAnimation()
				self.Arrow0:setRGB( 0, 0, 0 )
				self.Arrow0:setAlpha( 0 )
				Arrow0Frame2( Arrow0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Arrow:setRGB( 1, 0.17, 0.23 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setRGB( 1, 1, 1 )
				ArrowFrame2( Arrow, {} )
				local checkmarkFrame2 = function ( checkmark, event )
					if not event.interrupted then
						checkmark:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					checkmark:setRGB( 1, 0.17, 0.23 )
					checkmark:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( checkmark, event )
					else
						checkmark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkmark:completeAnimation()
				self.checkmark:setRGB( 1, 1, 1 )
				self.checkmark:setAlpha( 0 )
				checkmarkFrame2( checkmark, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Arrow0:completeAnimation()
				self.Arrow0:setAlpha( 1 )
				self.clipFinished( Arrow0, {} )
				Arrow:completeAnimation()
				self.Arrow:setRGB( 0.66, 0.85, 0.16 )
				self.clipFinished( Arrow, {} )
				checkmark:completeAnimation()
				self.checkmark:setRGB( 0.66, 0.85, 0.16 )
				self.checkmark:setAlpha( 1 )
				self.clipFinished( checkmark, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local Arrow0Frame2 = function ( Arrow0, event )
					if not event.interrupted then
						Arrow0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					Arrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow0, event )
					else
						Arrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow0:completeAnimation()
				self.Arrow0:setAlpha( 1 )
				Arrow0Frame2( Arrow0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
				local checkmarkFrame2 = function ( checkmark, event )
					if not event.interrupted then
						checkmark:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					checkmark:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( checkmark, event )
					else
						checkmark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkmark:completeAnimation()
				self.checkmark:setAlpha( 1 )
				checkmarkFrame2( checkmark, {} )
			end
		},
		Forced = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Arrow0:completeAnimation()
				self.Arrow0:setRGB( 0, 0, 0 )
				self.Arrow0:setAlpha( 1 )
				self.clipFinished( Arrow0, {} )
				Arrow:completeAnimation()
				self.Arrow:setRGB( 1, 0.17, 0.23 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
				checkmark:completeAnimation()
				self.checkmark:setRGB( 1, 0.17, 0.23 )
				self.checkmark:setAlpha( 1 )
				self.clipFinished( checkmark, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local Arrow0Frame2 = function ( Arrow0, event )
					if not event.interrupted then
						Arrow0:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
					end
					Arrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow0, event )
					else
						Arrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow0:completeAnimation()
				self.Arrow0:setAlpha( 1 )
				Arrow0Frame2( Arrow0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
					end
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
				local checkmarkFrame2 = function ( checkmark, event )
					if not event.interrupted then
						checkmark:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
					end
					checkmark:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( checkmark, event )
					else
						checkmark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkmark:completeAnimation()
				self.checkmark:setAlpha( 1 )
				checkmarkFrame2( checkmark, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Choosing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTED )
			end
		},
		{
			stateName = "Forced",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "clientState", Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTION_FORCED )
			end
		}
	} )
	self:linkToElementModel( self, "clientState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientState"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

