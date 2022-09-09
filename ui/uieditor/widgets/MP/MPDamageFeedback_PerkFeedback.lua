-- a4992c9d6055e64091e901ec3bb1aeee
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self.ignoreCurrentStateCheck = true
end

CoD.MPDamageFeedback_PerkFeedback = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback_PerkFeedback.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MPDamageFeedback_PerkFeedback )
	self.id = "MPDamageFeedback_PerkFeedback"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 128 )
	
	local flak = LUI.UIImage.new()
	flak:setLeftRight( true, true, 0, 0 )
	flak:setTopBottom( true, true, 0, 0 )
	flak:setAlpha( 0 )
	flak:setImage( RegisterImage( "uie_damage_feedback_flak" ) )
	flak:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( flak )
	self.flak = flak
	
	local armor = LUI.UIImage.new()
	armor:setLeftRight( true, true, 0, 0 )
	armor:setTopBottom( true, true, 0, 0 )
	armor:setAlpha( 0 )
	armor:setImage( RegisterImage( "uie_damage_feedback_uplink_shield" ) )
	armor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( armor )
	self.armor = armor
	
	local tacMask = LUI.UIImage.new()
	tacMask:setLeftRight( true, true, 0, 0 )
	tacMask:setTopBottom( true, true, 0, 0 )
	tacMask:setAlpha( 0 )
	tacMask:setImage( RegisterImage( "uie_damage_feedback_tac" ) )
	tacMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( tacMask )
	self.tacMask = tacMask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		FlakJacket = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				flak:completeAnimation()
				self.flak:setAlpha( 1 )
				self.clipFinished( flak, {} )

				armor:completeAnimation()
				self.armor:setAlpha( 0 )
				self.clipFinished( armor, {} )

				tacMask:completeAnimation()
				self.tacMask:setAlpha( 0 )
				self.clipFinished( tacMask, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local flakFrame2 = function ( flak, event )
					if not event.interrupted then
						flak:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					flak:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( flak, event )
					else
						flak:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				flak:completeAnimation()
				self.flak:setAlpha( 1 )
				flakFrame2( flak, {} )
			end
		},
		Armor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				flak:completeAnimation()
				self.flak:setAlpha( 0 )
				self.clipFinished( flak, {} )

				armor:completeAnimation()
				self.armor:setAlpha( 1 )
				self.clipFinished( armor, {} )

				tacMask:completeAnimation()
				self.tacMask:setAlpha( 0 )
				self.clipFinished( tacMask, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local armorFrame2 = function ( armor, event )
					if not event.interrupted then
						armor:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					armor:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( armor, event )
					else
						armor:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				armor:completeAnimation()
				self.armor:setAlpha( 1 )
				armorFrame2( armor, {} )
			end
		},
		TacMask = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				flak:completeAnimation()
				self.flak:setAlpha( 0 )
				self.clipFinished( flak, {} )

				armor:completeAnimation()
				self.armor:setAlpha( 0 )
				self.clipFinished( armor, {} )

				tacMask:completeAnimation()
				self.tacMask:setAlpha( 1 )
				self.clipFinished( tacMask, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local tacMaskFrame2 = function ( tacMask, event )
					if not event.interrupted then
						tacMask:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					tacMask:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tacMask, event )
					else
						tacMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tacMask:completeAnimation()
				self.tacMask:setAlpha( 1 )
				tacMaskFrame2( tacMask, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "FlakJacket",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags.DAMAGE_FEEDBACK_FLAG_FLAK )
			end
		},
		{
			stateName = "Armor",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags.DAMAGE_FEEDBACK_FLAG_ARMOR )
			end
		},
		{
			stateName = "TacMask",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags.DAMAGE_FEEDBACK_FLAG_TAC_MASK )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
