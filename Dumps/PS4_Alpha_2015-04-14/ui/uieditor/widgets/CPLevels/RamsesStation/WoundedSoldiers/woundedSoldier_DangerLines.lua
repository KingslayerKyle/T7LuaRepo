CoD.woundedSoldier_DangerLines = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_DangerLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_DangerLines )
	self.id = "woundedSoldier_DangerLines"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 27 )
	
	local LinesDanger = LUI.UIImage.new()
	LinesDanger:setLeftRight( true, false, 1, 75.67 )
	LinesDanger:setTopBottom( true, false, 0, 26.67 )
	LinesDanger:setRGB( 1, 1, 1 )
	LinesDanger:setZoom( 2 )
	LinesDanger:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_linesdanger" ) )
	LinesDanger:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LinesDanger )
	self.LinesDanger = LinesDanger
	
	local TextDanger = LUI.UITightText.new()
	TextDanger:setLeftRight( false, false, -31.76, 30.25 )
	TextDanger:setTopBottom( false, true, -19.34, -5.33 )
	TextDanger:setRGB( 1, 1, 1 )
	TextDanger:setZoom( -1 )
	TextDanger:setText( Engine.Localize( "WARNING" ) )
	TextDanger:setTTF( "fonts/Entovo.ttf" )
	TextDanger:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextDanger:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	TextDanger:setShaderVector( 1, 0, 0, 0, 0 )
	TextDanger:setShaderVector( 2, 0, 0, 0, 0 )
	TextDanger:setShaderVector( 3, 0, 0, 0, 0 )
	TextDanger:setShaderVector( 4, 0, 0, 0, 0 )
	TextDanger:setLetterSpacing( 1.5 )
	self:addElement( TextDanger )
	self.TextDanger = TextDanger
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LinesDanger:completeAnimation()
				self.LinesDanger:setAlpha( 0 )
				self.clipFinished( LinesDanger, {} )
				TextDanger:completeAnimation()
				self.TextDanger:setAlpha( 0 )
				self.clipFinished( TextDanger, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local LinesDangerFrame2 = function ( LinesDanger, event )
					local LinesDangerFrame3 = function ( LinesDanger, event )
						local LinesDangerFrame4 = function ( LinesDanger, event )
							local LinesDangerFrame5 = function ( LinesDanger, event )
								local LinesDangerFrame6 = function ( LinesDanger, event )
									local LinesDangerFrame7 = function ( LinesDanger, event )
										local LinesDangerFrame8 = function ( LinesDanger, event )
											if not event.interrupted then
												LinesDanger:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											LinesDanger:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( LinesDanger, event )
											else
												LinesDanger:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											LinesDangerFrame8( LinesDanger, event )
											return 
										else
											LinesDanger:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame8 )
										end
									end
									
									if event.interrupted then
										LinesDangerFrame7( LinesDanger, event )
										return 
									else
										LinesDanger:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										LinesDanger:setAlpha( 0 )
										LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame7 )
									end
								end
								
								if event.interrupted then
									LinesDangerFrame6( LinesDanger, event )
									return 
								else
									LinesDanger:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame6 )
								end
							end
							
							if event.interrupted then
								LinesDangerFrame5( LinesDanger, event )
								return 
							else
								LinesDanger:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LinesDanger:setAlpha( 0.5 )
								LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame5 )
							end
						end
						
						if event.interrupted then
							LinesDangerFrame4( LinesDanger, event )
							return 
						else
							LinesDanger:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
							LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame4 )
						end
					end
					
					if event.interrupted then
						LinesDangerFrame3( LinesDanger, event )
						return 
					else
						LinesDanger:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						LinesDanger:setAlpha( 0 )
						LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame3 )
					end
				end
				
				LinesDanger:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				LinesDanger:setAlpha( 1 )
				LinesDanger:registerEventHandler( "transition_complete_keyframe", LinesDangerFrame2 )
				local TextDangerFrame2 = function ( TextDanger, event )
					local TextDangerFrame3 = function ( TextDanger, event )
						local TextDangerFrame4 = function ( TextDanger, event )
							local TextDangerFrame5 = function ( TextDanger, event )
								local TextDangerFrame6 = function ( TextDanger, event )
									local TextDangerFrame7 = function ( TextDanger, event )
										local TextDangerFrame8 = function ( TextDanger, event )
											local TextDangerFrame9 = function ( TextDanger, event )
												if not event.interrupted then
													TextDanger:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												end
												TextDanger:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( TextDanger, event )
												else
													TextDanger:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												TextDangerFrame9( TextDanger, event )
												return 
											else
												TextDanger:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
												TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame9 )
											end
										end
										
										if event.interrupted then
											TextDangerFrame8( TextDanger, event )
											return 
										else
											TextDanger:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											TextDanger:setAlpha( 1 )
											TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame8 )
										end
									end
									
									if event.interrupted then
										TextDangerFrame7( TextDanger, event )
										return 
									else
										TextDanger:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame7 )
									end
								end
								
								if event.interrupted then
									TextDangerFrame6( TextDanger, event )
									return 
								else
									TextDanger:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									TextDanger:setAlpha( 0 )
									TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame6 )
								end
							end
							
							if event.interrupted then
								TextDangerFrame5( TextDanger, event )
								return 
							else
								TextDanger:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame5 )
							end
						end
						
						if event.interrupted then
							TextDangerFrame4( TextDanger, event )
							return 
						else
							TextDanger:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TextDanger:setAlpha( 0.5 )
							TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame4 )
						end
					end
					
					if event.interrupted then
						TextDangerFrame3( TextDanger, event )
						return 
					else
						TextDanger:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						TextDanger:registerEventHandler( "transition_complete_keyframe", TextDangerFrame3 )
					end
				end
				
				TextDanger:completeAnimation()
				self.TextDanger:setAlpha( 0 )
				TextDangerFrame2( TextDanger, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "woundType", Enum.WoundedSoldierType.WOUNDED_SOLDIER_TYPE_CRITICAL ) and IsSelfModelValueEqualToEnum( element, controller, "view_state", Enum.WaypointState.WAYPOINT_STATE_LINE_OF_SIGHT )
			end
		}
	} )
	self:linkToElementModel( self, "woundType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "woundType"
		} )
	end )
	self:linkToElementModel( self, "view_state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "view_state"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

