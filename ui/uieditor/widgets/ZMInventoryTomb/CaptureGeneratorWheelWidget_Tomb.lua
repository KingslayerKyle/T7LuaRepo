-- 4baa473d64b4aff2c127fde052c30d67
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryTomb.CaptureGeneratorWedgeWidget" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.CaptureGeneratorWheelWidget_Tomb = InheritFrom( LUI.UIElement )
CoD.CaptureGeneratorWheelWidget_Tomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CaptureGeneratorWheelWidget_Tomb )
	self.id = "CaptureGeneratorWheelWidget_Tomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_capturemeter_back" ) )
	self:addElement( bg )
	self.bg = bg
	
	local generator6Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator6Indicator:setLeftRight( true, true, -2, -2 )
	generator6Indicator:setTopBottom( true, true, -7, -7 )
	generator6Indicator:setZRot( 180 )
	generator6Indicator:setScale( 0.95 )
	generator6Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_6" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_6" )
			end
		}
	} )
	generator6Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_6" ), function ( model )
		menu:updateElementState( generator6Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_6"
		} )
	end )
	self:addElement( generator6Indicator )
	self.generator6Indicator = generator6Indicator
	
	local generator5Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator5Indicator:setLeftRight( true, true, -6, -6 )
	generator5Indicator:setTopBottom( true, true, -3, -3 )
	generator5Indicator:setZRot( 240 )
	generator5Indicator:setScale( 0.95 )
	generator5Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_5" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_5" )
			end
		}
	} )
	generator5Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_5" ), function ( model )
		menu:updateElementState( generator5Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_5"
		} )
	end )
	self:addElement( generator5Indicator )
	self.generator5Indicator = generator5Indicator
	
	local generator4Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator4Indicator:setLeftRight( true, true, -4, -4 )
	generator4Indicator:setTopBottom( true, true, 2, 2 )
	generator4Indicator:setZRot( 300 )
	generator4Indicator:setScale( 0.95 )
	generator4Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_4" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_4" )
			end
		}
	} )
	generator4Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_4" ), function ( model )
		menu:updateElementState( generator4Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_4"
		} )
	end )
	self:addElement( generator4Indicator )
	self.generator4Indicator = generator4Indicator
	
	local generator3Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator3Indicator:setLeftRight( true, true, 1, 1 )
	generator3Indicator:setTopBottom( true, true, 3, 3 )
	generator3Indicator:setScale( 0.95 )
	generator3Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_3" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_3" )
			end
		}
	} )
	generator3Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_3" ), function ( model )
		menu:updateElementState( generator3Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_3"
		} )
	end )
	self:addElement( generator3Indicator )
	self.generator3Indicator = generator3Indicator
	
	local generator2Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator2Indicator:setLeftRight( true, true, 5, 5 )
	generator2Indicator:setTopBottom( true, true, -1, -1 )
	generator2Indicator:setZRot( 60 )
	generator2Indicator:setScale( 0.95 )
	generator2Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_2" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_2" )
			end
		}
	} )
	generator2Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_2" ), function ( model )
		menu:updateElementState( generator2Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_2"
		} )
	end )
	self:addElement( generator2Indicator )
	self.generator2Indicator = generator2Indicator
	
	local generator1Indicator = CoD.CaptureGeneratorWedgeWidget.new( menu, controller )
	generator1Indicator:setLeftRight( true, true, 3, 3 )
	generator1Indicator:setTopBottom( true, true, -6, -6 )
	generator1Indicator:setZRot( 120 )
	generator1Indicator:setScale( 0.95 )
	generator1Indicator:mergeStateConditions( {
		{
			stateName = "CapturedScoreboard",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_1" ) and PropertyIsTrue( self, "scoreboard_widget" )
			end
		},
		{
			stateName = "Captured",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "zone_capture_hud_generator_1" )
			end
		}
	} )
	generator1Indicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.zone_capture_hud_generator_1" ), function ( model )
		menu:updateElementState( generator1Indicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.zone_capture_hud_generator_1"
		} )
	end )
	self:addElement( generator1Indicator )
	self.generator1Indicator = generator1Indicator
	
	local dial = LUI.UIImage.new()
	dial:setLeftRight( true, true, 0, 0 )
	dial:setTopBottom( true, true, 0, 0 )
	dial:setImage( RegisterImage( "uie_t7_zm_hd_capturemeter_dial" ) )
	self:addElement( dial )
	self.dial = dial
	
	local eyesOnOff = CoD.onOffImage.new( menu, controller )
	eyesOnOff:setLeftRight( true, true, 62, -62 )
	eyesOnOff:setTopBottom( true, true, 68, -76 )
	eyesOnOff.image:setImage( RegisterImage( "uie_t7_zm_hd_capturemeter_eyes" ) )
	eyesOnOff:subscribeToGlobalModel( controller, "ZMTombInventory", nil, function ( model )
		eyesOnOff:setModel( model, controller )
	end )
	eyesOnOff:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				local f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_1", 1 )
				if f21_local0 then
					f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_2", 1 )
					if f21_local0 then
						f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_3", 1 )
						if f21_local0 then
							f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_4", 1 )
							if f21_local0 then
								f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_5", 1 )
								if f21_local0 then
									f21_local0 = IsSelfModelValueEqualTo( element, controller, "zone_capture_hud_generator_6", 1 )
								end
							end
						end
					end
				end
				return f21_local0
			end
		}
	} )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_1", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_1"
		} )
	end )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_2", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_2"
		} )
	end )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_3", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_3"
		} )
	end )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_4", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_4"
		} )
	end )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_5", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_5"
		} )
	end )
	eyesOnOff:linkToElementModel( eyesOnOff, "zone_capture_hud_generator_6", true, function ( model )
		menu:updateElementState( eyesOnOff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zone_capture_hud_generator_6"
		} )
	end )
	self:addElement( eyesOnOff )
	self.eyesOnOff = eyesOnOff
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				generator6Indicator:completeAnimation()
				self.generator6Indicator:setAlpha( 0 )
				self.clipFinished( generator6Indicator, {} )

				generator5Indicator:completeAnimation()
				self.generator5Indicator:setAlpha( 0 )
				self.clipFinished( generator5Indicator, {} )

				generator4Indicator:completeAnimation()
				self.generator4Indicator:setAlpha( 0 )
				self.clipFinished( generator4Indicator, {} )

				generator3Indicator:completeAnimation()
				self.generator3Indicator:setAlpha( 0 )
				self.clipFinished( generator3Indicator, {} )

				generator2Indicator:completeAnimation()
				self.generator2Indicator:setAlpha( 0 )
				self.clipFinished( generator2Indicator, {} )

				generator1Indicator:completeAnimation()
				self.generator1Indicator:setAlpha( 0 )
				self.clipFinished( generator1Indicator, {} )

				dial:completeAnimation()
				self.dial:setAlpha( 0 )
				self.clipFinished( dial, {} )

				eyesOnOff:completeAnimation()
				self.eyesOnOff:setAlpha( 0 )
				self.clipFinished( eyesOnOff, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 9 )

				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					bg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				local generator6IndicatorFrame2 = function ( generator6Indicator, event )
					if not event.interrupted then
						generator6Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator6Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator6Indicator, event )
					else
						generator6Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator6Indicator:completeAnimation()
				self.generator6Indicator:setAlpha( 0 )
				generator6IndicatorFrame2( generator6Indicator, {} )
				local generator5IndicatorFrame2 = function ( generator5Indicator, event )
					if not event.interrupted then
						generator5Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator5Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator5Indicator, event )
					else
						generator5Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator5Indicator:completeAnimation()
				self.generator5Indicator:setAlpha( 0 )
				generator5IndicatorFrame2( generator5Indicator, {} )
				local generator4IndicatorFrame2 = function ( generator4Indicator, event )
					if not event.interrupted then
						generator4Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator4Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator4Indicator, event )
					else
						generator4Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator4Indicator:completeAnimation()
				self.generator4Indicator:setAlpha( 0 )
				generator4IndicatorFrame2( generator4Indicator, {} )
				local generator3IndicatorFrame2 = function ( generator3Indicator, event )
					if not event.interrupted then
						generator3Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator3Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator3Indicator, event )
					else
						generator3Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator3Indicator:completeAnimation()
				self.generator3Indicator:setAlpha( 0 )
				generator3IndicatorFrame2( generator3Indicator, {} )
				local generator2IndicatorFrame2 = function ( generator2Indicator, event )
					if not event.interrupted then
						generator2Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator2Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator2Indicator, event )
					else
						generator2Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator2Indicator:completeAnimation()
				self.generator2Indicator:setAlpha( 0 )
				generator2IndicatorFrame2( generator2Indicator, {} )
				local generator1IndicatorFrame2 = function ( generator1Indicator, event )
					if not event.interrupted then
						generator1Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator1Indicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( generator1Indicator, event )
					else
						generator1Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator1Indicator:completeAnimation()
				self.generator1Indicator:setAlpha( 0 )
				generator1IndicatorFrame2( generator1Indicator, {} )
				local dialFrame2 = function ( dial, event )
					if not event.interrupted then
						dial:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					dial:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( dial, event )
					else
						dial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dial:completeAnimation()
				self.dial:setAlpha( 0 )
				dialFrame2( dial, {} )
				local eyesOnOffFrame2 = function ( eyesOnOff, event )
					if not event.interrupted then
						eyesOnOff:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					eyesOnOff:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( eyesOnOff, event )
					else
						eyesOnOff:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				eyesOnOff:completeAnimation()
				self.eyesOnOff:setAlpha( 0 )
				eyesOnOffFrame2( eyesOnOff, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				generator6Indicator:completeAnimation()
				self.generator6Indicator:setAlpha( 1 )
				self.clipFinished( generator6Indicator, {} )

				generator5Indicator:completeAnimation()
				self.generator5Indicator:setAlpha( 1 )
				self.clipFinished( generator5Indicator, {} )

				generator4Indicator:completeAnimation()
				self.generator4Indicator:setAlpha( 1 )
				self.clipFinished( generator4Indicator, {} )

				generator3Indicator:completeAnimation()
				self.generator3Indicator:setAlpha( 1 )
				self.clipFinished( generator3Indicator, {} )

				generator2Indicator:completeAnimation()
				self.generator2Indicator:setAlpha( 1 )
				self.clipFinished( generator2Indicator, {} )

				generator1Indicator:completeAnimation()
				self.generator1Indicator:setAlpha( 1 )
				self.clipFinished( generator1Indicator, {} )

				dial:completeAnimation()
				self.dial:setAlpha( 1 )
				self.clipFinished( dial, {} )

				eyesOnOff:completeAnimation()
				self.eyesOnOff:setAlpha( 1 )
				self.clipFinished( eyesOnOff, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 9 )

				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					bg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				bgFrame2( bg, {} )
				local generator6IndicatorFrame2 = function ( generator6Indicator, event )
					if not event.interrupted then
						generator6Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator6Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator6Indicator, event )
					else
						generator6Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator6Indicator:completeAnimation()
				self.generator6Indicator:setAlpha( 1 )
				generator6IndicatorFrame2( generator6Indicator, {} )
				local generator5IndicatorFrame2 = function ( generator5Indicator, event )
					if not event.interrupted then
						generator5Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator5Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator5Indicator, event )
					else
						generator5Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator5Indicator:completeAnimation()
				self.generator5Indicator:setAlpha( 1 )
				generator5IndicatorFrame2( generator5Indicator, {} )
				local generator4IndicatorFrame2 = function ( generator4Indicator, event )
					if not event.interrupted then
						generator4Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator4Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator4Indicator, event )
					else
						generator4Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator4Indicator:completeAnimation()
				self.generator4Indicator:setAlpha( 1 )
				generator4IndicatorFrame2( generator4Indicator, {} )
				local generator3IndicatorFrame2 = function ( generator3Indicator, event )
					if not event.interrupted then
						generator3Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator3Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator3Indicator, event )
					else
						generator3Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator3Indicator:completeAnimation()
				self.generator3Indicator:setAlpha( 1 )
				generator3IndicatorFrame2( generator3Indicator, {} )
				local generator2IndicatorFrame2 = function ( generator2Indicator, event )
					if not event.interrupted then
						generator2Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator2Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator2Indicator, event )
					else
						generator2Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator2Indicator:completeAnimation()
				self.generator2Indicator:setAlpha( 1 )
				generator2IndicatorFrame2( generator2Indicator, {} )
				local generator1IndicatorFrame2 = function ( generator1Indicator, event )
					if not event.interrupted then
						generator1Indicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					generator1Indicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( generator1Indicator, event )
					else
						generator1Indicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				generator1Indicator:completeAnimation()
				self.generator1Indicator:setAlpha( 1 )
				generator1IndicatorFrame2( generator1Indicator, {} )
				local dialFrame2 = function ( dial, event )
					if not event.interrupted then
						dial:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					dial:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( dial, event )
					else
						dial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dial:completeAnimation()
				self.dial:setAlpha( 1 )
				dialFrame2( dial, {} )
				local eyesOnOffFrame2 = function ( eyesOnOff, event )
					if not event.interrupted then
						eyesOnOff:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					eyesOnOff:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( eyesOnOff, event )
					else
						eyesOnOff:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				eyesOnOff:completeAnimation()
				self.eyesOnOff:setAlpha( 1 )
				eyesOnOffFrame2( eyesOnOff, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "capture_generator_wheel_widget" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.capture_generator_wheel_widget" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.capture_generator_wheel_widget"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.generator6Indicator:close()
		element.generator5Indicator:close()
		element.generator4Indicator:close()
		element.generator3Indicator:close()
		element.generator2Indicator:close()
		element.generator1Indicator:close()
		element.eyesOnOff:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

