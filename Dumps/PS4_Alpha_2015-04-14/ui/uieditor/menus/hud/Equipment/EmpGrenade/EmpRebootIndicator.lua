require( "ui.uieditor.widgets.HUD.Equipment.EMP.EmpRebootIndicatorWidget" )

local PostLoadFunc = function ( self )
	self.EmpRebootIndicatorWidget.ProgressBar:subscribeToElementModel( self, "startTime", function ( model )
		local endTimeModel = Engine.GetModel( self:getModel(), "endTime" )
		local startTime = Engine.GetModelValue( model )
		local endTime = Engine.GetModelValue( endTimeModel )
		local duration = endTime - startTime
		local currentTime = Engine.CurrentGameTime() - Engine.SnapshotDeltaTime()
		local progress = (currentTime - startTime) / duration
		self.EmpRebootIndicatorWidget.ProgressBar:setShaderVector( 0, progress, 0, 0, 0 )
		self.EmpRebootIndicatorWidget.ProgressBar:beginAnimation( "updateProgress", duration )
		self.EmpRebootIndicatorWidget.ProgressBar:setShaderVector( 0, 1, 0, 0, 0 )
	end )
end

LUI.createMenu.EmpRebootIndicator = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmpRebootIndicator" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local EmpRebootIndicatorWidget = CoD.EmpRebootIndicatorWidget.new( menu, controller )
	EmpRebootIndicatorWidget:setLeftRight( true, false, 585.12, 694.88 )
	EmpRebootIndicatorWidget:setTopBottom( true, false, 399.75, 427.48 )
	EmpRebootIndicatorWidget:setRGB( 1, 1, 1 )
	self:addElement( EmpRebootIndicatorWidget )
	self.EmpRebootIndicatorWidget = EmpRebootIndicatorWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 1 )
				self.clipFinished( EmpRebootIndicatorWidget, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 0 )
				self.clipFinished( EmpRebootIndicatorWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
				if not f6_local0 then
					f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					if not f6_local0 then
						f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
					end
				end
				return f6_local0
			end
		}
	} )
	if self.m_eventHandlers.hud_update_refresh then
		local currentEv = self.m_eventHandlers.hud_update_refresh
		self:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.EmpRebootIndicatorWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

