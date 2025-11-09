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
	DetectNearbyEnemiesCloseFront:setLeftRight( false, false, -124, 124 )
	DetectNearbyEnemiesCloseFront:setTopBottom( true, false, -12, 68 )
	DetectNearbyEnemiesCloseFront:setRGB( 1, 1, 1 )
	DetectNearbyEnemiesCloseFront:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "front", "close" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
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
	if DetectNearbyEnemiesCloseFront.m_eventHandlers.hud_update_refresh then
		local currentEv = DetectNearbyEnemiesCloseFront.m_eventHandlers.hud_update_refresh
		DetectNearbyEnemiesCloseFront:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		DetectNearbyEnemiesCloseFront:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	DetectNearbyEnemiesCloseFront:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( DetectNearbyEnemiesCloseFront, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( DetectNearbyEnemiesCloseFront )
	self.DetectNearbyEnemiesCloseFront = DetectNearbyEnemiesCloseFront
	
	local currentEv = CoD.DetectNearbyEnemies_CloseBack.new( menu, controller )
	currentEv:setLeftRight( false, false, -124, 124 )
	currentEv:setTopBottom( false, true, -67.5, 12.5 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "back", "close" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesCloseBack = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_CloseRight.new( menu, controller )
	currentEv:setLeftRight( false, true, -110, 2 )
	currentEv:setTopBottom( false, false, -79, 81 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "right", "close" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesCloseRight = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_CloseLeft.new( menu, controller )
	currentEv:setLeftRight( true, false, -2, 110 )
	currentEv:setTopBottom( false, false, -79, 81 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "left", "close" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesCloseLeft = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_FarFront.new( menu, controller )
	currentEv:setLeftRight( false, false, -128, 128 )
	currentEv:setTopBottom( true, false, -16, 0 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "front", "far" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesFarFront = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_FarBack.new( menu, controller )
	currentEv:setLeftRight( false, false, -127, 129 )
	currentEv:setTopBottom( false, true, 0, 16 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "back", "far" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesFarBack = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_FarLeft.new( menu, controller )
	currentEv:setLeftRight( true, false, -15, 1 )
	currentEv:setTopBottom( false, false, -79, 79 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "left", "far" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesFarLeft = currentEv
	
	local currentEv = CoD.DetectNearbyEnemies_FarRight.new( menu, controller )
	currentEv:setLeftRight( false, true, -1, 15 )
	currentEv:setTopBottom( false, false, -79, 79 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "EnemyDetected",
			condition = function ( menu, element, event )
				return IsEnemyDetected( controller, "right", "far" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.sixthsense" ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.sixthsense"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.DetectNearbyEnemiesFarRight = currentEv
	
	self.close = function ( self )
		self.DetectNearbyEnemiesCloseFront:close()
		self.DetectNearbyEnemiesCloseBack:close()
		self.DetectNearbyEnemiesCloseRight:close()
		self.DetectNearbyEnemiesCloseLeft:close()
		self.DetectNearbyEnemiesFarFront:close()
		self.DetectNearbyEnemiesFarBack:close()
		self.DetectNearbyEnemiesFarLeft:close()
		self.DetectNearbyEnemiesFarRight:close()
		CoD.Notification_SixthSense.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

