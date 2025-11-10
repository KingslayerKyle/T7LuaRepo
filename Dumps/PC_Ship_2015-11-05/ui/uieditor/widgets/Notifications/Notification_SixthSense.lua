require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_CloseFront" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_CloseBack" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_CloseRight" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_CloseLeft" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_FarFront" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_FarBack" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_FarLeft" )
require( "ui.uieditor.widgets.MPHudWidgets.DetectNearbyEnemies_FarRight" )

CoD.Notification_SixthSense = InheritFrom( LUI.UIElement )
CoD.Notification_SixthSense.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_SixthSense )
	self.id = "Notification_SixthSense"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 142 )
	self.anyChildUsesUpdateState = true
	
	local DetectNearbyEnemiesCloseFront = CoD.DetectNearbyEnemies_CloseFront.new( menu, controller )
	DetectNearbyEnemiesCloseFront:setLeftRight( true, true, 0, 0.5 )
	DetectNearbyEnemiesCloseFront:setTopBottom( true, false, -2, 66 )
	DetectNearbyEnemiesCloseFront:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f2_local0 = IsEnemyDetected( controller, "front", "close" )
				if f2_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f2_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		}
	} )
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesCloseFront )
	self.DetectNearbyEnemiesCloseFront = DetectNearbyEnemiesCloseFront
	
	local DetectNearbyEnemiesCloseBack = CoD.DetectNearbyEnemies_CloseBack.new( menu, controller )
	DetectNearbyEnemiesCloseBack:setLeftRight( true, true, 0, 0.5 )
	DetectNearbyEnemiesCloseBack:setTopBottom( false, true, -65.5, 2 )
	DetectNearbyEnemiesCloseBack:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f8_local0 = IsEnemyDetected( controller, "back", "close" )
				if f8_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f8_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f8_local0 = false
					end
				end
				return f8_local0
			end
		}
	} )
	DetectNearbyEnemiesCloseBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesCloseBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesCloseBack )
	self.DetectNearbyEnemiesCloseBack = DetectNearbyEnemiesCloseBack
	
	local DetectNearbyEnemiesCloseRight = CoD.DetectNearbyEnemies_CloseRight.new( menu, controller )
	DetectNearbyEnemiesCloseRight:setLeftRight( false, true, -113.5, 0.5 )
	DetectNearbyEnemiesCloseRight:setTopBottom( true, true, 3.5, -2 )
	DetectNearbyEnemiesCloseRight:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f14_local0 = IsEnemyDetected( controller, "right", "close" )
				if f14_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f14_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f14_local0 = false
					end
				end
				return f14_local0
			end
		}
	} )
	DetectNearbyEnemiesCloseRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesCloseRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesCloseRight )
	self.DetectNearbyEnemiesCloseRight = DetectNearbyEnemiesCloseRight
	
	local DetectNearbyEnemiesCloseLeft = CoD.DetectNearbyEnemies_CloseLeft.new( menu, controller )
	DetectNearbyEnemiesCloseLeft:setLeftRight( true, false, 0, 114 )
	DetectNearbyEnemiesCloseLeft:setTopBottom( true, true, 3.5, -2 )
	DetectNearbyEnemiesCloseLeft:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f20_local0 = IsEnemyDetected( controller, "left", "close" )
				if f20_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f20_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f20_local0 = false
					end
				end
				return f20_local0
			end
		}
	} )
	DetectNearbyEnemiesCloseLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesCloseLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesCloseLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesCloseLeft )
	self.DetectNearbyEnemiesCloseLeft = DetectNearbyEnemiesCloseLeft
	
	local DetectNearbyEnemiesFarFront = CoD.DetectNearbyEnemies_FarFront.new( menu, controller )
	DetectNearbyEnemiesFarFront:setLeftRight( true, true, -2, 2 )
	DetectNearbyEnemiesFarFront:setTopBottom( true, false, -12.5, 3 )
	DetectNearbyEnemiesFarFront:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f26_local0 = IsEnemyDetected( controller, "front", "far" )
				if f26_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f26_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f26_local0 = false
					end
				end
				return f26_local0
			end
		}
	} )
	DetectNearbyEnemiesFarFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesFarFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesFarFront )
	self.DetectNearbyEnemiesFarFront = DetectNearbyEnemiesFarFront
	
	local DetectNearbyEnemiesFarBack = CoD.DetectNearbyEnemies_FarBack.new( menu, controller )
	DetectNearbyEnemiesFarBack:setLeftRight( true, true, 0, 0 )
	DetectNearbyEnemiesFarBack:setTopBottom( false, true, -3, 12.5 )
	DetectNearbyEnemiesFarBack:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f32_local0 = IsEnemyDetected( controller, "back", "far" )
				if f32_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f32_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f32_local0 = false
					end
				end
				return f32_local0
			end
		}
	} )
	DetectNearbyEnemiesFarBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesFarBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarBack:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarBack, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesFarBack )
	self.DetectNearbyEnemiesFarBack = DetectNearbyEnemiesFarBack
	
	local DetectNearbyEnemiesFarLeft = CoD.DetectNearbyEnemies_FarLeft.new( menu, controller )
	DetectNearbyEnemiesFarLeft:setLeftRight( true, false, -11, 3 )
	DetectNearbyEnemiesFarLeft:setTopBottom( true, true, -6, 6.75 )
	DetectNearbyEnemiesFarLeft:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f38_local0 = IsEnemyDetected( controller, "left", "far" )
				if f38_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f38_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f38_local0 = false
					end
				end
				return f38_local0
			end
		}
	} )
	DetectNearbyEnemiesFarLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesFarLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarLeft:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesFarLeft )
	self.DetectNearbyEnemiesFarLeft = DetectNearbyEnemiesFarLeft
	
	local DetectNearbyEnemiesFarRight = CoD.DetectNearbyEnemies_FarRight.new( menu, controller )
	DetectNearbyEnemiesFarRight:setLeftRight( false, true, -2, 13 )
	DetectNearbyEnemiesFarRight:setTopBottom( true, true, -6, 6.75 )
	DetectNearbyEnemiesFarRight:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				local f44_local0 = IsEnemyDetected( controller, "right", "far" )
				if f44_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ) then
						f44_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					else
						f44_local0 = false
					end
				end
				return f44_local0
			end
		}
	} )
	DetectNearbyEnemiesFarRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	DetectNearbyEnemiesFarRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TOTAL_COVERAGE_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )
	DetectNearbyEnemiesFarRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesFarRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:addElement( DetectNearbyEnemiesFarRight )
	self.DetectNearbyEnemiesFarRight = DetectNearbyEnemiesFarRight
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DetectNearbyEnemiesCloseFront:close()
		element.DetectNearbyEnemiesCloseBack:close()
		element.DetectNearbyEnemiesCloseRight:close()
		element.DetectNearbyEnemiesCloseLeft:close()
		element.DetectNearbyEnemiesFarFront:close()
		element.DetectNearbyEnemiesFarBack:close()
		element.DetectNearbyEnemiesFarLeft:close()
		element.DetectNearbyEnemiesFarRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

