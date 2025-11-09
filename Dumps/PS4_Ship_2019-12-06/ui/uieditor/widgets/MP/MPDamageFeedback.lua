require( "ui.uieditor.widgets.MP.MPDamageFeedback_PerkFeedback" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if controller == "DefaultState" then
			if element.moveToDefaultTimer then
				element.moveToDefaultTimer:close()
				element.moveToDefaultTimer = nil
			end
		elseif element.moveToDefaultTimer then
			element.moveToDefaultTimer:reset()
		else
			element.moveToDefaultTimer = LUI.UITimer.newElementTimer( 200, true, function ()
				local f3_local0 = element:getModel( controller, "damageFeedbackState" )
				if f3_local0 then
					Engine.SetModelValue( f3_local0, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_NONE )
				end
			end )
			element:addElement( element.moveToDefaultTimer )
		end
	end )
end

CoD.MPDamageFeedback = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPDamageFeedback )
	self.id = "MPDamageFeedback"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local perkFeedback = CoD.MPDamageFeedback_PerkFeedback.new( menu, controller )
	perkFeedback:setLeftRight( false, false, -20, 20 )
	perkFeedback:setTopBottom( false, true, -40, 40 )
	perkFeedback:linkToElementModel( self, nil, false, function ( model )
		perkFeedback:setModel( model, controller )
	end )
	self:addElement( perkFeedback )
	self.perkFeedback = perkFeedback
	
	local damage = LUI.UIImage.new()
	damage:setLeftRight( true, true, 0, 0 )
	damage:setTopBottom( true, true, 0, 0 )
	damage:setImage( RegisterImage( "uie_t7_damage_feedback" ) )
	self:addElement( damage )
	self.damage = damage
	
	local death = LUI.UIImage.new()
	death:setLeftRight( true, true, 0, 0 )
	death:setTopBottom( true, true, 0, 0 )
	death:setImage( RegisterImage( "uie_t7_damage_feedback_glow_orange" ) )
	death:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( death )
	self.death = death
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 0 )
				self.clipFinished( perkFeedback, {} )
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, 0, 0 )
				self.damage:setTopBottom( true, true, 0, 0 )
				self.damage:setAlpha( 0 )
				self.clipFinished( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, 0, 0 )
				self.death:setTopBottom( true, true, 0, 0 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end
		},
		Stage1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					local damageFrame3 = function ( damage, event )
						if not event.interrupted then
							damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						damage:setLeftRight( true, true, -1, 1 )
						damage:setTopBottom( true, true, -1, 1 )
						damage:setRGB( 1, 1, 1 )
						damage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damage, event )
						else
							damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageFrame3( damage, event )
						return 
					else
						damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						damage:registerEventHandler( "transition_complete_keyframe", damageFrame3 )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -1, 1 )
				self.damage:setTopBottom( true, true, -1, 1 )
				self.damage:setRGB( 0.84, 0.99, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -1, 1 )
				self.death:setTopBottom( true, true, -1, 1 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -1, 1 )
					damage:setTopBottom( true, true, -1, 1 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -1, 1 )
				self.damage:setTopBottom( true, true, -1, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -1, 1 )
					death:setTopBottom( true, true, -1, 1 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -1, 1 )
				self.death:setTopBottom( true, true, -1, 1 )
				self.death:setAlpha( 0 )
				deathFrame2( death, {} )
			end
		},
		Stage2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					local damageFrame3 = function ( damage, event )
						if not event.interrupted then
							damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						damage:setLeftRight( true, true, -2, 2 )
						damage:setTopBottom( true, true, -2, 2 )
						damage:setRGB( 1, 1, 1 )
						damage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damage, event )
						else
							damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageFrame3( damage, event )
						return 
					else
						damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						damage:registerEventHandler( "transition_complete_keyframe", damageFrame3 )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -2, 2 )
				self.damage:setTopBottom( true, true, -2, 2 )
				self.damage:setRGB( 0.84, 0.99, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -2, 2 )
				self.death:setTopBottom( true, true, -2, 2 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -2, 2 )
					damage:setTopBottom( true, true, -2, 2 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -2, 2 )
				self.damage:setTopBottom( true, true, -2, 2 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -2, 2 )
					death:setTopBottom( true, true, -2, 2 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -2, 2 )
				self.death:setTopBottom( true, true, -2, 2 )
				self.death:setAlpha( 0 )
				deathFrame2( death, {} )
			end
		},
		Stage3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					local damageFrame3 = function ( damage, event )
						if not event.interrupted then
							damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						damage:setLeftRight( true, true, -3, 3 )
						damage:setTopBottom( true, true, -3, 3 )
						damage:setRGB( 1, 1, 1 )
						damage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damage, event )
						else
							damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageFrame3( damage, event )
						return 
					else
						damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						damage:registerEventHandler( "transition_complete_keyframe", damageFrame3 )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -3, 3 )
				self.damage:setTopBottom( true, true, -3, 3 )
				self.damage:setRGB( 0.84, 0.99, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -3, 3 )
				self.death:setTopBottom( true, true, -3, 3 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -3, 3 )
					damage:setTopBottom( true, true, -3, 3 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -3, 3 )
				self.damage:setTopBottom( true, true, -3, 3 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -3, 3 )
					death:setTopBottom( true, true, -3, 3 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -3, 3 )
				self.death:setTopBottom( true, true, -3, 3 )
				self.death:setAlpha( 0 )
				deathFrame2( death, {} )
			end
		},
		Stage4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					local damageFrame3 = function ( damage, event )
						if not event.interrupted then
							damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						damage:setLeftRight( true, true, -4, 4 )
						damage:setTopBottom( true, true, -4, 4 )
						damage:setRGB( 1, 1, 1 )
						damage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damage, event )
						else
							damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageFrame3( damage, event )
						return 
					else
						damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						damage:registerEventHandler( "transition_complete_keyframe", damageFrame3 )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -4, 4 )
				self.damage:setTopBottom( true, true, -4, 4 )
				self.damage:setRGB( 0.84, 0.99, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -4, 4 )
				self.death:setTopBottom( true, true, -4, 4 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -4, 4 )
					damage:setTopBottom( true, true, -4, 4 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -4, 4 )
				self.damage:setTopBottom( true, true, -4, 4 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -4, 4 )
					death:setTopBottom( true, true, -4, 4 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -4, 4 )
				self.death:setTopBottom( true, true, -4, 4 )
				self.death:setAlpha( 0 )
				deathFrame2( death, {} )
			end
		},
		Death = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -5, 5 )
				self.damage:setTopBottom( true, true, -5, 5 )
				self.damage:setAlpha( 0 )
				self.clipFinished( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -5, 5 )
				self.death:setTopBottom( true, true, -5, 5 )
				self.death:setAlpha( 1 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -5, 5 )
					damage:setTopBottom( true, true, -5, 5 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -5, 5 )
				self.damage:setTopBottom( true, true, -5, 5 )
				self.damage:setAlpha( 0 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -5, 5 )
					death:setTopBottom( true, true, -5, 5 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -5, 5 )
				self.death:setTopBottom( true, true, -5, 5 )
				self.death:setAlpha( 1 )
				deathFrame2( death, {} )
			end
		},
		Stage5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				self.clipFinished( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					local damageFrame3 = function ( damage, event )
						if not event.interrupted then
							damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						damage:setLeftRight( true, true, -5, 5 )
						damage:setTopBottom( true, true, -5, 5 )
						damage:setRGB( 1, 1, 1 )
						damage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damage, event )
						else
							damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageFrame3( damage, event )
						return 
					else
						damage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						damage:registerEventHandler( "transition_complete_keyframe", damageFrame3 )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -5, 5 )
				self.damage:setTopBottom( true, true, -5, 5 )
				self.damage:setRGB( 0.84, 0.99, 1 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				death:completeAnimation()
				self.death:setLeftRight( true, true, -5, 5 )
				self.death:setTopBottom( true, true, -5, 5 )
				self.death:setAlpha( 0 )
				self.clipFinished( death, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local perkFeedbackFrame2 = function ( perkFeedback, event )
					if not event.interrupted then
						perkFeedback:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					perkFeedback:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( perkFeedback, event )
					else
						perkFeedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perkFeedback:completeAnimation()
				self.perkFeedback:setAlpha( 1 )
				perkFeedbackFrame2( perkFeedback, {} )
				local damageFrame2 = function ( damage, event )
					if not event.interrupted then
						damage:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					damage:setLeftRight( true, true, -5, 5 )
					damage:setTopBottom( true, true, -5, 5 )
					damage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( damage, event )
					else
						damage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				damage:completeAnimation()
				self.damage:setLeftRight( true, true, -5, 5 )
				self.damage:setTopBottom( true, true, -5, 5 )
				self.damage:setAlpha( 1 )
				damageFrame2( damage, {} )
				local deathFrame2 = function ( death, event )
					if not event.interrupted then
						death:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					death:setLeftRight( true, true, -5, 5 )
					death:setTopBottom( true, true, -5, 5 )
					death:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( death, event )
					else
						death:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				death:completeAnimation()
				self.death:setLeftRight( true, true, -5, 5 )
				self.death:setTopBottom( true, true, -5, 5 )
				self.death:setAlpha( 0 )
				deathFrame2( death, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Stage1",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_1 )
			end
		},
		{
			stateName = "Stage2",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_2 )
			end
		},
		{
			stateName = "Stage3",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_3 )
			end
		},
		{
			stateName = "Stage4",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_4 )
			end
		},
		{
			stateName = "Death",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_5 ) and DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags.DAMAGE_FEEDBACK_FLAG_DEAD )
			end
		},
		{
			stateName = "Stage5",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState.DAMAGE_FEEDBACK_STATE_5 )
			end
		}
	} )
	self:linkToElementModel( self, "damageFeedbackState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "damageFeedbackState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perkFeedback:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

