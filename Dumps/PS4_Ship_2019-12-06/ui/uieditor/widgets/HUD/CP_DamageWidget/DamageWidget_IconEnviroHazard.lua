require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_IconEnviroHazardType" )

CoD.DamageWidget_IconEnviroHazard = InheritFrom( LUI.UIElement )
CoD.DamageWidget_IconEnviroHazard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_IconEnviroHazard )
	self.id = "DamageWidget_IconEnviroHazard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 23 )
	self:setTopBottom( true, false, 0, 21 )
	self.anyChildUsesUpdateState = true
	
	local DamageWidgetIconEnviroHazardType0 = CoD.DamageWidget_IconEnviroHazardType.new( menu, controller )
	DamageWidgetIconEnviroHazardType0:setLeftRight( true, false, 0, 23 )
	DamageWidgetIconEnviroHazardType0:setTopBottom( true, false, 0, 21 )
	DamageWidgetIconEnviroHazardType0:linkToElementModel( self, nil, false, function ( model )
		DamageWidgetIconEnviroHazardType0:setModel( model, controller )
	end )
	DamageWidgetIconEnviroHazardType0:mergeStateConditions( {
		{
			stateName = "Heat",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", 1 )
			end
		},
		{
			stateName = "Filter",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", 2 )
			end
		},
		{
			stateName = "O2",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", 3 )
			end
		},
		{
			stateName = "Radiation",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", 4 )
			end
		},
		{
			stateName = "Bio",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", 5 )
			end
		}
	} )
	DamageWidgetIconEnviroHazardType0:linkToElementModel( DamageWidgetIconEnviroHazardType0, "type", true, function ( model )
		menu:updateElementState( DamageWidgetIconEnviroHazardType0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )
	self:addElement( DamageWidgetIconEnviroHazardType0 )
	self.DamageWidgetIconEnviroHazardType0 = DamageWidgetIconEnviroHazardType0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DamageWidgetIconEnviroHazardType0:completeAnimation()
				self.DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
				self.DamageWidgetIconEnviroHazardType0:setAlpha( 1 )
				self.clipFinished( DamageWidgetIconEnviroHazardType0, {} )
			end
		},
		Normal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DamageWidgetIconEnviroHazardType0:completeAnimation()
				self.DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
				self.clipFinished( DamageWidgetIconEnviroHazardType0, {} )
			end,
			Critical = function ()
				self:setupElementClipCounter( 1 )
				local DamageWidgetIconEnviroHazardType0Frame2 = function ( DamageWidgetIconEnviroHazardType0, event )
					local DamageWidgetIconEnviroHazardType0Frame3 = function ( DamageWidgetIconEnviroHazardType0, event )
						local DamageWidgetIconEnviroHazardType0Frame4 = function ( DamageWidgetIconEnviroHazardType0, event )
							local DamageWidgetIconEnviroHazardType0Frame5 = function ( DamageWidgetIconEnviroHazardType0, event )
								local DamageWidgetIconEnviroHazardType0Frame6 = function ( DamageWidgetIconEnviroHazardType0, event )
									if not event.interrupted then
										DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									DamageWidgetIconEnviroHazardType0:setRGB( 1, 0, 0 )
									if event.interrupted then
										self.clipFinished( DamageWidgetIconEnviroHazardType0, event )
									else
										DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									DamageWidgetIconEnviroHazardType0Frame6( DamageWidgetIconEnviroHazardType0, event )
									return 
								else
									DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetIconEnviroHazardType0Frame5( DamageWidgetIconEnviroHazardType0, event )
								return 
							else
								DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
								DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetIconEnviroHazardType0Frame4( DamageWidgetIconEnviroHazardType0, event )
							return 
						else
							DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetIconEnviroHazardType0Frame3( DamageWidgetIconEnviroHazardType0, event )
						return 
					else
						DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						DamageWidgetIconEnviroHazardType0:setRGB( 0.97, 0.38, 0 )
						DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame3 )
					end
				end
				
				DamageWidgetIconEnviroHazardType0:completeAnimation()
				self.DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
				DamageWidgetIconEnviroHazardType0Frame2( DamageWidgetIconEnviroHazardType0, {} )
			end
		},
		Critical = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local f17_local0 = function ( f18_arg0, f18_arg1 )
					local f18_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f20_arg0, f20_arg1 )
							local f20_local0 = function ( f21_arg0, f21_arg1 )
								if not f21_arg1.interrupted then
									f21_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								end
								f21_arg0:setRGB( 1, 0, 0 )
								if f21_arg1.interrupted then
									self.clipFinished( f21_arg0, f21_arg1 )
								else
									f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f20_arg1.interrupted then
								f20_local0( f20_arg0, f20_arg1 )
								return 
							else
								f20_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								f20_arg0:setRGB( 1, 0.53, 0 )
								f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							f19_arg0:setRGB( 1, 0, 0 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f18_arg1.interrupted then
						f18_local0( f18_arg0, f18_arg1 )
						return 
					else
						f18_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f18_arg0:setRGB( 1, 0.71, 0.4 )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
				end
				
				DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				self.DamageWidgetIconEnviroHazardType0:setRGB( 1, 0, 0 )
				DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
				self.nextClip = "DefaultClip"
			end,
			Normal = function ()
				self:setupElementClipCounter( 1 )
				local DamageWidgetIconEnviroHazardType0Frame2 = function ( DamageWidgetIconEnviroHazardType0, event )
					local DamageWidgetIconEnviroHazardType0Frame3 = function ( DamageWidgetIconEnviroHazardType0, event )
						local DamageWidgetIconEnviroHazardType0Frame4 = function ( DamageWidgetIconEnviroHazardType0, event )
							local DamageWidgetIconEnviroHazardType0Frame5 = function ( DamageWidgetIconEnviroHazardType0, event )
								local DamageWidgetIconEnviroHazardType0Frame6 = function ( DamageWidgetIconEnviroHazardType0, event )
									local DamageWidgetIconEnviroHazardType0Frame7 = function ( DamageWidgetIconEnviroHazardType0, event )
										local DamageWidgetIconEnviroHazardType0Frame8 = function ( DamageWidgetIconEnviroHazardType0, event )
											local DamageWidgetIconEnviroHazardType0Frame9 = function ( DamageWidgetIconEnviroHazardType0, event )
												if not event.interrupted then
													DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												end
												DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
												DamageWidgetIconEnviroHazardType0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( DamageWidgetIconEnviroHazardType0, event )
												else
													DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												DamageWidgetIconEnviroHazardType0Frame9( DamageWidgetIconEnviroHazardType0, event )
												return 
											else
												DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DamageWidgetIconEnviroHazardType0:setAlpha( 0 )
												DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame9 )
											end
										end
										
										if event.interrupted then
											DamageWidgetIconEnviroHazardType0Frame8( DamageWidgetIconEnviroHazardType0, event )
											return 
										else
											DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame8 )
										end
									end
									
									if event.interrupted then
										DamageWidgetIconEnviroHazardType0Frame7( DamageWidgetIconEnviroHazardType0, event )
										return 
									else
										DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										DamageWidgetIconEnviroHazardType0:setRGB( 1, 1, 1 )
										DamageWidgetIconEnviroHazardType0:setAlpha( 1 )
										DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame7 )
									end
								end
								
								if event.interrupted then
									DamageWidgetIconEnviroHazardType0Frame6( DamageWidgetIconEnviroHazardType0, event )
									return 
								else
									DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetIconEnviroHazardType0Frame5( DamageWidgetIconEnviroHazardType0, event )
								return 
							else
								DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DamageWidgetIconEnviroHazardType0:setAlpha( 0 )
								DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetIconEnviroHazardType0Frame4( DamageWidgetIconEnviroHazardType0, event )
							return 
						else
							DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							DamageWidgetIconEnviroHazardType0:setRGB( 1, 0, 0 )
							DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetIconEnviroHazardType0Frame3( DamageWidgetIconEnviroHazardType0, event )
						return 
					else
						DamageWidgetIconEnviroHazardType0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						DamageWidgetIconEnviroHazardType0:setRGB( 1, 0.32, 0 )
						DamageWidgetIconEnviroHazardType0:registerEventHandler( "transition_complete_keyframe", DamageWidgetIconEnviroHazardType0Frame3 )
					end
				end
				
				DamageWidgetIconEnviroHazardType0:completeAnimation()
				self.DamageWidgetIconEnviroHazardType0:setRGB( 1, 0, 0 )
				self.DamageWidgetIconEnviroHazardType0:setAlpha( 1 )
				DamageWidgetIconEnviroHazardType0Frame2( DamageWidgetIconEnviroHazardType0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DamageWidgetIconEnviroHazardType0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

