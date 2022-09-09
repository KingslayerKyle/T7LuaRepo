-- 5a05238efeba67109f16be466438307e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutBlur1" )

CoD.bleedOutBlurContainer = InheritFrom( LUI.UIElement )
CoD.bleedOutBlurContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.bleedOutBlurContainer )
	self.id = "bleedOutBlurContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 98 )
	self:setTopBottom( true, false, 0, 98 )
	
	local bleedOutBlur10 = CoD.bleedOutBlur1.new( menu, controller )
	bleedOutBlur10:setLeftRight( false, false, 49, -51 )
	bleedOutBlur10:setTopBottom( false, false, 49, -51 )
	bleedOutBlur10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	bleedOutBlur10:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( bleedOutBlur10 )
	self.bleedOutBlur10 = bleedOutBlur10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bleedOutBlur10:completeAnimation()
				self.bleedOutBlur10:setAlpha( 0 )
				self.clipFinished( bleedOutBlur10, {} )
			end,
			BleedingOut = function ()
				self:setupElementClipCounter( 1 )

				local bleedOutBlur10Frame2 = function ( bleedOutBlur10, event )
					local bleedOutBlur10Frame3 = function ( bleedOutBlur10, event )
						local bleedOutBlur10Frame4 = function ( bleedOutBlur10, event )
							local bleedOutBlur10Frame5 = function ( bleedOutBlur10, event )
								if not event.interrupted then
									bleedOutBlur10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								end
								bleedOutBlur10:setRGB( 1, 1, 1 )
								bleedOutBlur10:setAlpha( 0.7 )
								bleedOutBlur10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
								bleedOutBlur10:setShaderVector( 0, 5, 5, 0, 0 )
								if event.interrupted then
									self.clipFinished( bleedOutBlur10, event )
								else
									bleedOutBlur10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bleedOutBlur10Frame5( bleedOutBlur10, event )
								return 
							else
								bleedOutBlur10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								bleedOutBlur10:setAlpha( 0 )
								bleedOutBlur10:registerEventHandler( "transition_complete_keyframe", bleedOutBlur10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedOutBlur10Frame4( bleedOutBlur10, event )
							return 
						else
							bleedOutBlur10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							bleedOutBlur10:setAlpha( 1 )
							bleedOutBlur10:registerEventHandler( "transition_complete_keyframe", bleedOutBlur10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedOutBlur10Frame3( bleedOutBlur10, event )
						return 
					else
						bleedOutBlur10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedOutBlur10:registerEventHandler( "transition_complete_keyframe", bleedOutBlur10Frame3 )
					end
				end
				
				bleedOutBlur10:completeAnimation()
				self.bleedOutBlur10:setRGB( 1, 1, 1 )
				self.bleedOutBlur10:setAlpha( 0 )
				self.bleedOutBlur10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
				self.bleedOutBlur10:setShaderVector( 0, 5, 5, 0, 0 )
				bleedOutBlur10Frame2( bleedOutBlur10, {} )
			end
		},
		BleedingOut = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			BleedingOut_Low = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		BleedingOut_Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" ) and IsSelfModelValueGreaterThan( element, controller, "clockPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" )
			end
		},
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "beingRevived" )
			end
		}
	} )
	self:linkToElementModel( self, "bleedingOut", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedingOut"
		} )
	end )
	self:linkToElementModel( self, "clockPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clockPercent"
		} )
	end )
	self:linkToElementModel( self, "beingRevived", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "beingRevived"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bleedOutBlur10:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
