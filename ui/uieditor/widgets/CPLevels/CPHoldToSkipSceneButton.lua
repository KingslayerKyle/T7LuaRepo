-- 4a90ad7c0dd79bf9312b337a0bfd26fa
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "update_scene_skip_progress", function ( element )
		self.progressMeter:setShaderVector( 0, (Engine.CurrentGameTime() - self._progressStartTime) / (self._progressEndTime - self._progressStartTime), 0, 0, 0 )
	end )
	self:linkToElementModel( menu, "sceneSkipEndTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == 0 then
			if self._sceneSkipUpdateTimer then
				self._sceneSkipUpdateTimer:close()
				self._sceneSkipUpdateTimer = nil
			end
			self.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
		else
			self._progressStartTime = Engine.CurrentGameTime()
			self._progressEndTime = modelValue
			if not self._sceneSkipUpdateTimer then
				self._sceneSkipUpdateTimer = LUI.UITimer.new( 1, "update_scene_skip_progress", false )
				self:addElement( self._sceneSkipUpdateTimer )
			end
		end
	end )
end

CoD.CPHoldToSkipSceneButton = InheritFrom( LUI.UIElement )
CoD.CPHoldToSkipSceneButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPHoldToSkipSceneButton )
	self.id = "CPHoldToSkipSceneButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( false, false, -11.5, 11.5 )
	progressMeter:setTopBottom( false, false, -11.5, 11.5 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_thick" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local Button = LUI.UIImage.new()
	Button:setLeftRight( false, false, -10, 10 )
	Button:setTopBottom( false, false, -10, 10 )
	Button:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Button:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	local Mouse = LUI.UIImage.new()
	Mouse:setLeftRight( false, false, -10, 10 )
	Mouse:setTopBottom( false, false, -10, 10 )
	Mouse:setAlpha( 0 )
	Mouse:subscribeToGlobalModel( controller, "Controller", "mouse_left_button_image", function ( model )
		local mouseLeftButtonImage = Engine.GetModelValue( model )
		if mouseLeftButtonImage then
			Mouse:setImage( RegisterImage( mouseLeftButtonImage ) )
		end
	end )
	self:addElement( Mouse )
	self.Mouse = Mouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Button:completeAnimation()
				self.Button:setAlpha( 1 )
				self.clipFinished( Button, {} )

				Mouse:completeAnimation()
				self.Mouse:setAlpha( 0 )
				self.clipFinished( Mouse, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Button:completeAnimation()
				self.Button:setAlpha( 0 )
				self.clipFinished( Button, {} )

				Mouse:completeAnimation()
				self.Mouse:setAlpha( 1 )
				self.clipFinished( Mouse, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f4_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f4_local4( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Button:close()
		element.Mouse:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

