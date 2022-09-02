-- d7584bf6fa91b8c6f136b28d9b2fa9ce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolCenterMissilesLocked" )

CoD.vtolCenterMissiles = InheritFrom( LUI.UIElement )
CoD.vtolCenterMissiles.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vtolCenterMissiles )
	self.id = "vtolCenterMissiles"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local missilesCenter = LUI.UIImage.new()
	missilesCenter:setLeftRight( false, false, -181, 181 )
	missilesCenter:setTopBottom( false, false, -181, 181 )
	missilesCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_missilescenter" ) )
	self:addElement( missilesCenter )
	self.missilesCenter = missilesCenter
	
	local centerGradient = LUI.UIImage.new()
	centerGradient:setLeftRight( false, false, -181, 181 )
	centerGradient:setTopBottom( false, false, -181, 181 )
	centerGradient:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_centergradient" ) )
	self:addElement( centerGradient )
	self.centerGradient = centerGradient
	
	local bracketLeft = LUI.UIImage.new()
	bracketLeft:setLeftRight( false, false, -194.66, -109.33 )
	bracketLeft:setTopBottom( false, false, -86.67, 94.66 )
	bracketLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_centerbracket" ) )
	self:addElement( bracketLeft )
	self.bracketLeft = bracketLeft
	
	local bracketRight = LUI.UIImage.new()
	bracketRight:setLeftRight( false, false, 194.66, 109.33 )
	bracketRight:setTopBottom( false, false, -86.67, 94.67 )
	bracketRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_centerbracket" ) )
	self:addElement( bracketRight )
	self.bracketRight = bracketRight
	
	local centerCircle = LUI.UIImage.new()
	centerCircle:setLeftRight( false, false, -85.33, 85.33 )
	centerCircle:setTopBottom( false, false, -85.33, 85.33 )
	centerCircle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_centercircle" ) )
	self:addElement( centerCircle )
	self.centerCircle = centerCircle
	
	local rollBars = LUI.UIImage.new()
	rollBars:setLeftRight( false, false, -85.33, 85.33 )
	rollBars:setTopBottom( false, false, -85.33, 85.33 )
	rollBars:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_rollbars" ) )
	self:addElement( rollBars )
	self.rollBars = rollBars
	
	local missilesReticle = LUI.UIImage.new()
	missilesReticle:setLeftRight( false, false, -85.34, 85.34 )
	missilesReticle:setTopBottom( false, false, -82.33, 88.33 )
	missilesReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_minigunreticle" ) )
	self:addElement( missilesReticle )
	self.missilesReticle = missilesReticle
	
	local lockOn = LUI.UIImage.new()
	lockOn:setLeftRight( false, false, -32, 32 )
	lockOn:setTopBottom( false, false, -32, 32 )
	lockOn:setAlpha( 0 )
	lockOn:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_lockonprogress" ) )
	lockOn:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	lockOn:setShaderVector( 1, 0.5, 0, 0, 0 )
	lockOn:setShaderVector( 2, 0.5, 0, 0, 0 )
	lockOn:setShaderVector( 3, 0, 0, 0, 0 )
	lockOn:linkToElementModel( self, "lockOn", true, function ( model )
		local _lockOn = Engine.GetModelValue( model )
		if _lockOn then
			lockOn:setShaderVector( 0, CoD.GetVectorComponentFromString( _lockOn, 1 ), CoD.GetVectorComponentFromString( _lockOn, 2 ), CoD.GetVectorComponentFromString( _lockOn, 3 ), CoD.GetVectorComponentFromString( _lockOn, 4 ) )
		end
	end )
	self:addElement( lockOn )
	self.lockOn = lockOn
	
	local lockArrow = LUI.UIImage.new()
	lockArrow:setLeftRight( false, false, -8, 8 )
	lockArrow:setTopBottom( false, false, -47, -33.67 )
	lockArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_lockonarrow" ) )
	self:addElement( lockArrow )
	self.lockArrow = lockArrow
	
	local locked = CoD.vtolCenterMissilesLocked.new( menu, controller )
	locked:setLeftRight( false, false, -148.33, 287.67 )
	locked:setTopBottom( false, false, -274.95, -194.95 )
	locked:linkToElementModel( self, nil, false, function ( model )
		locked:setModel( model, controller )
	end )
	self:addElement( locked )
	self.locked = locked
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				missilesCenter:completeAnimation()
				self.missilesCenter:setRGB( 1, 1, 1 )
				self.missilesCenter:setAlpha( 1 )
				self.clipFinished( missilesCenter, {} )

				lockArrow:completeAnimation()
				self.lockArrow:setAlpha( 0 )
				self.clipFinished( lockArrow, {} )

				locked:completeAnimation()
				self.locked:setAlpha( 0 )
				self.clipFinished( locked, {} )
			end
		},
		NoLock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				missilesCenter:completeAnimation()
				self.missilesCenter:setRGB( 1, 1, 1 )
				self.missilesCenter:setAlpha( 1 )
				self.clipFinished( missilesCenter, {} )

				lockArrow:completeAnimation()
				self.lockArrow:setAlpha( 0 )
				self.clipFinished( lockArrow, {} )

				locked:completeAnimation()
				self.locked:setAlpha( 0 )
				self.clipFinished( locked, {} )
			end
		},
		Locking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				missilesCenter:completeAnimation()
				self.missilesCenter:setRGB( 1, 1, 1 )
				self.missilesCenter:setAlpha( 1 )
				self.clipFinished( missilesCenter, {} )

				lockArrow:completeAnimation()
				self.lockArrow:setAlpha( 1 )
				self.clipFinished( lockArrow, {} )

				locked:completeAnimation()
				self.locked:setAlpha( 0 )
				self.clipFinished( locked, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				missilesCenter:completeAnimation()
				self.missilesCenter:setRGB( 1, 1, 1 )
				self.missilesCenter:setAlpha( 1 )
				self.clipFinished( missilesCenter, {} )

				lockArrow:completeAnimation()
				self.lockArrow:setAlpha( 1 )
				self.clipFinished( lockArrow, {} )
				local lockedFrame2 = function ( locked, event )
					local lockedFrame3 = function ( locked, event )
						local lockedFrame4 = function ( locked, event )
							local lockedFrame5 = function ( locked, event )
								local lockedFrame6 = function ( locked, event )
									local lockedFrame7 = function ( locked, event )
										local lockedFrame8 = function ( locked, event )
											if not event.interrupted then
												locked:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											end
											locked:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( locked, event )
											else
												locked:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											lockedFrame8( locked, event )
											return 
										else
											locked:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											locked:setAlpha( 0 )
											locked:registerEventHandler( "transition_complete_keyframe", lockedFrame8 )
										end
									end
									
									if event.interrupted then
										lockedFrame7( locked, event )
										return 
									else
										locked:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										locked:setAlpha( 1 )
										locked:registerEventHandler( "transition_complete_keyframe", lockedFrame7 )
									end
								end
								
								if event.interrupted then
									lockedFrame6( locked, event )
									return 
								else
									locked:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									locked:setAlpha( 0 )
									locked:registerEventHandler( "transition_complete_keyframe", lockedFrame6 )
								end
							end
							
							if event.interrupted then
								lockedFrame5( locked, event )
								return 
							else
								locked:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								locked:setAlpha( 1 )
								locked:registerEventHandler( "transition_complete_keyframe", lockedFrame5 )
							end
						end
						
						if event.interrupted then
							lockedFrame4( locked, event )
							return 
						else
							locked:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							locked:setAlpha( 0 )
							locked:registerEventHandler( "transition_complete_keyframe", lockedFrame4 )
						end
					end
					
					if event.interrupted then
						lockedFrame3( locked, event )
						return 
					else
						locked:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						locked:setAlpha( 1 )
						locked:registerEventHandler( "transition_complete_keyframe", lockedFrame3 )
					end
				end
				
				locked:completeAnimation()
				self.locked:setAlpha( 0 )
				lockedFrame2( locked, {} )
			end
		},
		aimHint = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local missilesCenterFrame2 = function ( missilesCenter, event )
					local missilesCenterFrame3 = function ( missilesCenter, event )
						if not event.interrupted then
							missilesCenter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						missilesCenter:setRGB( 1, 0, 0 )
						missilesCenter:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( missilesCenter, event )
						else
							missilesCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						missilesCenterFrame3( missilesCenter, event )
						return 
					else
						missilesCenter:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						missilesCenter:setAlpha( 0.25 )
						missilesCenter:registerEventHandler( "transition_complete_keyframe", missilesCenterFrame3 )
					end
				end
				
				missilesCenter:completeAnimation()
				self.missilesCenter:setRGB( 1, 0, 0 )
				self.missilesCenter:setAlpha( 1 )
				missilesCenterFrame2( missilesCenter, {} )

				lockArrow:completeAnimation()
				self.lockArrow:setAlpha( 0 )
				self.clipFinished( lockArrow, {} )

				locked:completeAnimation()
				self.locked:setAlpha( 0 )
				self.clipFinished( locked, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoLock",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "lockOn", 0 ) and IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
			end
		},
		{
			stateName = "Locking",
			condition = function ( menu, element, event )
				local f19_local0 = IsSelfModelValueGreaterThan( element, controller, "lockOn", 0 )
				if f19_local0 then
					f19_local0 = IsSelfModelValueLessThan( element, controller, "lockOn", 1 )
					if f19_local0 then
						f19_local0 = IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
					end
				end
				return f19_local0
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "lockOn", 1 ) and IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
			end
		},
		{
			stateName = "aimHint",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
			end
		}
	} )
	self:linkToElementModel( self, "lockOn", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lockOn"
		} )
	end )
	self:linkToElementModel( self, "showAimHint", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showAimHint"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.locked:close()
		element.lockOn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

