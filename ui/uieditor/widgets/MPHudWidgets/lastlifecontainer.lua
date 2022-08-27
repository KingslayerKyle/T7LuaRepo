-- f37c8374c95fa888fb0296dd60a18cae
-- This hash is used for caching, delete to decompile the file again

CoD.LastLifeContainer = InheritFrom( LUI.UIElement )
CoD.LastLifeContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LastLifeContainer )
	self.id = "LastLifeContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 60 )
	
	local LastLife = LUI.UIText.new()
	LastLife:setLeftRight( true, false, 64, 1216 )
	LastLife:setTopBottom( true, false, 0, 57 )
	LastLife:setText( Engine.Localize( "MPUI_LAST_LIFE" ) )
	LastLife:setTTF( "fonts/default.ttf" )
	LastLife:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LastLife:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LastLife )
	self.LastLife = LastLife
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LastLife:completeAnimation()
				self.LastLife:setAlpha( 0 )
				self.clipFinished( LastLife, {} )
			end
		},
		Poup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local LastLifeFrame2 = function ( LastLife, event )
					local LastLifeFrame3 = function ( LastLife, event )
						local LastLifeFrame4 = function ( LastLife, event )
							local LastLifeFrame5 = function ( LastLife, event )
								local LastLifeFrame6 = function ( LastLife, event )
									local LastLifeFrame7 = function ( LastLife, event )
										local LastLifeFrame8 = function ( LastLife, event )
											local LastLifeFrame9 = function ( LastLife, event )
												local LastLifeFrame10 = function ( LastLife, event )
													local LastLifeFrame11 = function ( LastLife, event )
														if not event.interrupted then
															LastLife:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														LastLife:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( LastLife, event )
														else
															LastLife:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														LastLifeFrame11( LastLife, event )
														return 
													else
														LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
														LastLife:setAlpha( 1 )
														LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame11 )
													end
												end
												
												if event.interrupted then
													LastLifeFrame10( LastLife, event )
													return 
												else
													LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
													LastLife:setAlpha( 0.5 )
													LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame10 )
												end
											end
											
											if event.interrupted then
												LastLifeFrame9( LastLife, event )
												return 
											else
												LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
												LastLife:setAlpha( 1 )
												LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame9 )
											end
										end
										
										if event.interrupted then
											LastLifeFrame8( LastLife, event )
											return 
										else
											LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											LastLife:setAlpha( 0.5 )
											LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame8 )
										end
									end
									
									if event.interrupted then
										LastLifeFrame7( LastLife, event )
										return 
									else
										LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
										LastLife:setAlpha( 1 )
										LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame7 )
									end
								end
								
								if event.interrupted then
									LastLifeFrame6( LastLife, event )
									return 
								else
									LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									LastLife:setAlpha( 0.5 )
									LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame6 )
								end
							end
							
							if event.interrupted then
								LastLifeFrame5( LastLife, event )
								return 
							else
								LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								LastLife:setAlpha( 1 )
								LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame5 )
							end
						end
						
						if event.interrupted then
							LastLifeFrame4( LastLife, event )
							return 
						else
							LastLife:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							LastLife:setAlpha( 0.5 )
							LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame4 )
						end
					end
					
					if event.interrupted then
						LastLifeFrame3( LastLife, event )
						return 
					else
						LastLife:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						LastLife:setAlpha( 1 )
						LastLife:registerEventHandler( "transition_complete_keyframe", LastLifeFrame3 )
					end
				end
				
				LastLife:completeAnimation()
				self.LastLife:setAlpha( 0 )
				LastLifeFrame2( LastLife, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Poup",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.livesLeft", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.livesLeft" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.livesLeft"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

