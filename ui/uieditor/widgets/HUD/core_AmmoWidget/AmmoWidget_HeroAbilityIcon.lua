-- b09631952e4ccc856c8bdccd151fe1d3
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_HeroAbilityIcon = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityIcon )
	self.id = "AmmoWidget_HeroAbilityIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 37 )
	
	local ImgIcon = LUI.UIImage.new()
	ImgIcon:setLeftRight( true, true, 2, -2 )
	ImgIcon:setTopBottom( true, true, 2, -2 )
	ImgIcon:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local imageAvailable = Engine.GetModelValue( model )
		if imageAvailable then
			ImgIcon:setImage( RegisterImage( imageAvailable ) )
		end
	end )
	self:addElement( ImgIcon )
	self.ImgIcon = ImgIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 1 )
				self.clipFinished( ImgIcon, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 1 )

				local ImgIconFrame2 = function ( ImgIcon, event )
					local ImgIconFrame3 = function ( ImgIcon, event )
						local ImgIconFrame4 = function ( ImgIcon, event )
							local ImgIconFrame5 = function ( ImgIcon, event )
								local ImgIconFrame6 = function ( ImgIcon, event )
									local ImgIconFrame7 = function ( ImgIcon, event )
										local ImgIconFrame8 = function ( ImgIcon, event )
											local ImgIconFrame9 = function ( ImgIcon, event )
												local ImgIconFrame10 = function ( ImgIcon, event )
													if not event.interrupted then
														ImgIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													ImgIcon:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( ImgIcon, event )
													else
														ImgIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ImgIconFrame10( ImgIcon, event )
													return 
												else
													ImgIcon:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame10 )
												end
											end
											
											if event.interrupted then
												ImgIconFrame9( ImgIcon, event )
												return 
											else
												ImgIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ImgIcon:setAlpha( 0 )
												ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame9 )
											end
										end
										
										if event.interrupted then
											ImgIconFrame8( ImgIcon, event )
											return 
										else
											ImgIcon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame8 )
										end
									end
									
									if event.interrupted then
										ImgIconFrame7( ImgIcon, event )
										return 
									else
										ImgIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ImgIcon:setAlpha( 1 )
										ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame7 )
									end
								end
								
								if event.interrupted then
									ImgIconFrame6( ImgIcon, event )
									return 
								else
									ImgIcon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame6 )
								end
							end
							
							if event.interrupted then
								ImgIconFrame5( ImgIcon, event )
								return 
							else
								ImgIcon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ImgIcon:setAlpha( 0 )
								ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame5 )
							end
						end
						
						if event.interrupted then
							ImgIconFrame4( ImgIcon, event )
							return 
						else
							ImgIcon:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame4 )
						end
					end
					
					if event.interrupted then
						ImgIconFrame3( ImgIcon, event )
						return 
					else
						ImgIcon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						ImgIcon:setAlpha( 1 )
						ImgIcon:registerEventHandler( "transition_complete_keyframe", ImgIconFrame3 )
					end
				end
				
				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 0 )
				ImgIconFrame2( ImgIcon, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 0 )
				self.clipFinished( ImgIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsBlackMarketSpecialistAnyAbilityActive( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.rouletteStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.rouletteStatus"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.thiefStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.thiefStatus"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImgIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
