-- 16ef16410cad4b1657f0cc62c4eaf804
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolCenterFrame" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )
require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolLandHint" )
require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolAimHint" )

CoD.vtolHUD_Internal = InheritFrom( LUI.UIElement )
CoD.vtolHUD_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vtolHUD_Internal )
	self.id = "vtolHUD_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local centerFrame = CoD.vtolCenterFrame.new( menu, controller )
	centerFrame:setLeftRight( true, true, 0, 0 )
	centerFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( centerFrame )
	self.centerFrame = centerFrame
	
	local vhudgenericbuttonlayout0 = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudgenericbuttonlayout0:setLeftRight( true, true, 0, 0 )
	vhudgenericbuttonlayout0:setTopBottom( true, true, 0, 0 )
	vhudgenericbuttonlayout0:linkToElementModel( self, "bindings", false, function ( model )
		vhudgenericbuttonlayout0:setModel( model, controller )
	end )
	self:addElement( vhudgenericbuttonlayout0 )
	self.vhudgenericbuttonlayout0 = vhudgenericbuttonlayout0
	
	local altimeterRight = LUI.UIImage.new()
	altimeterRight:setLeftRight( false, true, -273.5, -185.5 )
	altimeterRight:setTopBottom( false, false, -166.67, 166.67 )
	altimeterRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_altimeter" ) )
	self:addElement( altimeterRight )
	self.altimeterRight = altimeterRight
	
	local altimeterLeft = LUI.UIImage.new()
	altimeterLeft:setLeftRight( true, false, 273.5, 185.5 )
	altimeterLeft:setTopBottom( false, false, -166.67, 166.67 )
	altimeterLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_altimeter" ) )
	self:addElement( altimeterLeft )
	self.altimeterLeft = altimeterLeft
	
	local vtolLandHint = CoD.vtolLandHint.new( menu, controller )
	vtolLandHint:setLeftRight( false, false, -155, 155 )
	vtolLandHint:setTopBottom( false, false, 166.67, 216.67 )
	vtolLandHint:linkToElementModel( self, nil, false, function ( model )
		vtolLandHint:setModel( model, controller )
	end )
	self:addElement( vtolLandHint )
	self.vtolLandHint = vtolLandHint
	
	local vtolMode = LUI.UIImage.new()
	vtolMode:setLeftRight( false, false, 166.5, 366.5 )
	vtolMode:setTopBottom( false, false, 43, 171.67 )
	vtolMode:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_mode_engaged" ) )
	self:addElement( vtolMode )
	self.vtolMode = vtolMode
	
	local vtolModeText = LUI.UIText.new()
	vtolModeText:setLeftRight( false, false, 166.5, 366.5 )
	vtolModeText:setTopBottom( false, false, 71.33, 110.33 )
	vtolModeText:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_VTOL_MODE" ) )
	vtolModeText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	vtolModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	vtolModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( vtolModeText )
	self.vtolModeText = vtolModeText
	
	local engagedText = LUI.UIText.new()
	engagedText:setLeftRight( false, false, 166.5, 366.5 )
	engagedText:setTopBottom( false, false, 111, 136 )
	engagedText:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_ENGAGED" ) )
	engagedText:setTTF( "fonts/default.ttf" )
	engagedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	engagedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	self:addElement( engagedText )
	self.engagedText = engagedText
	
	local vtolAimHint = CoD.vtolAimHint.new( menu, controller )
	vtolAimHint:setLeftRight( false, false, -200, 200 )
	vtolAimHint:setTopBottom( false, false, -216.67, -166.67 )
	vtolAimHint:linkToElementModel( self, nil, false, function ( model )
		vtolAimHint:setModel( model, controller )
	end )
	self:addElement( vtolAimHint )
	self.vtolAimHint = vtolAimHint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				centerFrame:completeAnimation()
				self.centerFrame:setAlpha( 1 )
				self.clipFinished( centerFrame, {} )

				vtolLandHint:completeAnimation()
				self.vtolLandHint:setAlpha( 1 )
				self.clipFinished( vtolLandHint, {} )

				vtolMode:completeAnimation()
				self.vtolMode:setAlpha( 0.1 )
				self.vtolMode:setScale( 0.75 )
				self.clipFinished( vtolMode, {} )

				vtolModeText:completeAnimation()
				self.vtolModeText:setAlpha( 0 )
				self.clipFinished( vtolModeText, {} )

				engagedText:completeAnimation()
				self.engagedText:setAlpha( 0 )
				self.clipFinished( engagedText, {} )
			end
		},
		Dogfight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local centerFrameFrame2 = function ( centerFrame, event )
					if not event.interrupted then
						centerFrame:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					centerFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( centerFrame, event )
					else
						centerFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerFrame:completeAnimation()
				self.centerFrame:setAlpha( 0 )
				centerFrameFrame2( centerFrame, {} )
				local altimeterRightFrame2 = function ( altimeterRight, event )
					if not event.interrupted then
						altimeterRight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					altimeterRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( altimeterRight, event )
					else
						altimeterRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				altimeterRight:completeAnimation()
				self.altimeterRight:setAlpha( 0 )
				altimeterRightFrame2( altimeterRight, {} )
				local altimeterLeftFrame2 = function ( altimeterLeft, event )
					if not event.interrupted then
						altimeterLeft:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					altimeterLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( altimeterLeft, event )
					else
						altimeterLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				altimeterLeft:completeAnimation()
				self.altimeterLeft:setAlpha( 0 )
				altimeterLeftFrame2( altimeterLeft, {} )

				vtolLandHint:completeAnimation()
				self.vtolLandHint:setAlpha( 0 )
				self.clipFinished( vtolLandHint, {} )

				vtolMode:completeAnimation()
				self.vtolMode:setAlpha( 0.1 )
				self.vtolMode:setScale( 0.75 )
				self.clipFinished( vtolMode, {} )

				vtolModeText:completeAnimation()
				self.vtolModeText:setAlpha( 0 )
				self.clipFinished( vtolModeText, {} )

				engagedText:completeAnimation()
				self.engagedText:setAlpha( 0 )
				self.clipFinished( engagedText, {} )
			end
		},
		VTOL = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local centerFrameFrame2 = function ( centerFrame, event )
					if not event.interrupted then
						centerFrame:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					centerFrame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( centerFrame, event )
					else
						centerFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				centerFrame:completeAnimation()
				self.centerFrame:setAlpha( 0 )
				centerFrameFrame2( centerFrame, {} )
				local altimeterRightFrame2 = function ( altimeterRight, event )
					if not event.interrupted then
						altimeterRight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					altimeterRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( altimeterRight, event )
					else
						altimeterRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				altimeterRight:completeAnimation()
				self.altimeterRight:setAlpha( 0 )
				altimeterRightFrame2( altimeterRight, {} )
				local altimeterLeftFrame2 = function ( altimeterLeft, event )
					if not event.interrupted then
						altimeterLeft:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					altimeterLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( altimeterLeft, event )
					else
						altimeterLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				altimeterLeft:completeAnimation()
				self.altimeterLeft:setAlpha( 0 )
				altimeterLeftFrame2( altimeterLeft, {} )

				vtolLandHint:completeAnimation()
				self.vtolLandHint:setAlpha( 1 )
				self.clipFinished( vtolLandHint, {} )
				local vtolModeFrame2 = function ( vtolMode, event )
					local vtolModeFrame3 = function ( vtolMode, event )
						local vtolModeFrame4 = function ( vtolMode, event )
							if not event.interrupted then
								vtolMode:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							vtolMode:setAlpha( 0 )
							vtolMode:setScale( 1 )
							if event.interrupted then
								self.clipFinished( vtolMode, event )
							else
								vtolMode:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vtolModeFrame4( vtolMode, event )
							return 
						else
							vtolMode:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							vtolMode:registerEventHandler( "transition_complete_keyframe", vtolModeFrame4 )
						end
					end
					
					if event.interrupted then
						vtolModeFrame3( vtolMode, event )
						return 
					else
						vtolMode:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						vtolMode:setAlpha( 1 )
						vtolMode:setScale( 1 )
						vtolMode:registerEventHandler( "transition_complete_keyframe", vtolModeFrame3 )
					end
				end
				
				vtolMode:completeAnimation()
				self.vtolMode:setAlpha( 0 )
				self.vtolMode:setScale( 0.75 )
				vtolModeFrame2( vtolMode, {} )
				local vtolModeTextFrame2 = function ( vtolModeText, event )
					local vtolModeTextFrame3 = function ( vtolModeText, event )
						local vtolModeTextFrame4 = function ( vtolModeText, event )
							if not event.interrupted then
								vtolModeText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							vtolModeText:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( vtolModeText, event )
							else
								vtolModeText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vtolModeTextFrame4( vtolModeText, event )
							return 
						else
							vtolModeText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							vtolModeText:registerEventHandler( "transition_complete_keyframe", vtolModeTextFrame4 )
						end
					end
					
					if event.interrupted then
						vtolModeTextFrame3( vtolModeText, event )
						return 
					else
						vtolModeText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						vtolModeText:setAlpha( 0.7 )
						vtolModeText:registerEventHandler( "transition_complete_keyframe", vtolModeTextFrame3 )
					end
				end
				
				vtolModeText:completeAnimation()
				self.vtolModeText:setAlpha( 0 )
				vtolModeTextFrame2( vtolModeText, {} )
				local engagedTextFrame2 = function ( engagedText, event )
					local engagedTextFrame3 = function ( engagedText, event )
						local engagedTextFrame4 = function ( engagedText, event )
							if not event.interrupted then
								engagedText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							engagedText:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( engagedText, event )
							else
								engagedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							engagedTextFrame4( engagedText, event )
							return 
						else
							engagedText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							engagedText:registerEventHandler( "transition_complete_keyframe", engagedTextFrame4 )
						end
					end
					
					if event.interrupted then
						engagedTextFrame3( engagedText, event )
						return 
					else
						engagedText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						engagedText:setAlpha( 0.5 )
						engagedText:registerEventHandler( "transition_complete_keyframe", engagedTextFrame3 )
					end
				end
				
				engagedText:completeAnimation()
				self.engagedText:setAlpha( 0 )
				engagedTextFrame2( engagedText, {} )
			end
		},
		AutoPilot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				centerFrame:completeAnimation()
				self.centerFrame:setAlpha( 0 )
				self.clipFinished( centerFrame, {} )

				altimeterRight:completeAnimation()
				self.altimeterRight:setAlpha( 0 )
				self.clipFinished( altimeterRight, {} )

				altimeterLeft:completeAnimation()
				self.altimeterLeft:setAlpha( 0 )
				self.clipFinished( altimeterLeft, {} )

				vtolLandHint:completeAnimation()
				self.vtolLandHint:setAlpha( 0 )
				self.clipFinished( vtolLandHint, {} )

				vtolMode:completeAnimation()
				self.vtolMode:setAlpha( 0.1 )
				self.vtolMode:setScale( 0.75 )
				self.clipFinished( vtolMode, {} )

				vtolModeText:completeAnimation()
				self.vtolModeText:setAlpha( 0 )
				self.clipFinished( vtolModeText, {} )

				engagedText:completeAnimation()
				self.engagedText:setAlpha( 0 )
				self.clipFinished( engagedText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Dogfight",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "weaponIndex", 2 )
			end
		},
		{
			stateName = "VTOL",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "weaponIndex", 1 )
			end
		},
		{
			stateName = "AutoPilot",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "weaponIndex", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "weaponIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponIndex"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.centerFrame:close()
		element.vhudgenericbuttonlayout0:close()
		element.vtolLandHint:close()
		element.vtolAimHint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
