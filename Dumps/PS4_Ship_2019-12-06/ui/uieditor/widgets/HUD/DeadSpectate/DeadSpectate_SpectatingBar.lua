CoD.DeadSpectate_SpectatingBar = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DeadSpectate_SpectatingBar )
	self.id = "DeadSpectate_SpectatingBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 67 )
	self:setTopBottom( true, false, 0, 25 )
	
	local leftButton = LUI.UIImage.new()
	leftButton:setLeftRight( false, false, -60.5, -35.5 )
	leftButton:setTopBottom( false, false, -9, 9 )
	leftButton:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			leftButton:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( leftButton )
	self.leftButton = leftButton
	
	local spectatingLabel0 = LUI.UITightText.new()
	spectatingLabel0:setLeftRight( false, false, -33.5, 33.5 )
	spectatingLabel0:setTopBottom( true, false, 1.5, 23.5 )
	spectatingLabel0:setRGB( 0, 0, 0 )
	spectatingLabel0:setAlpha( 0.65 )
	spectatingLabel0:setText( Engine.Localize( "MPUI_SPECTATING" ) )
	spectatingLabel0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	spectatingLabel0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	spectatingLabel0:setShaderVector( 0, 0.11, 0, 0, 0 )
	spectatingLabel0:setShaderVector( 1, 0.5, 0, 0, 0 )
	spectatingLabel0:setShaderVector( 2, 2, 0, 0, 0 )
	self:addElement( spectatingLabel0 )
	self.spectatingLabel0 = spectatingLabel0
	
	local spectatingLabel00 = LUI.UITightText.new()
	spectatingLabel00:setLeftRight( false, false, -33.5, 33.5 )
	spectatingLabel00:setTopBottom( true, false, 1.5, 23.5 )
	spectatingLabel00:setText( Engine.Localize( "MPUI_SPECTATING" ) )
	spectatingLabel00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	spectatingLabel00:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	spectatingLabel00:setShaderVector( 0, 0, 0, 0, 0 )
	spectatingLabel00:setShaderVector( 1, 0, 0, 0, 0 )
	spectatingLabel00:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( spectatingLabel00 )
	self.spectatingLabel00 = spectatingLabel00
	
	local rightButton = LUI.UIImage.new()
	rightButton:setLeftRight( false, false, 35.5, 60.5 )
	rightButton:setTopBottom( false, false, -9, 9 )
	rightButton:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			rightButton:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	self:addElement( rightButton )
	self.rightButton = rightButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 0 )
				self.clipFinished( leftButton, {} )
				spectatingLabel0:completeAnimation()
				self.spectatingLabel0:setAlpha( 0 )
				self.clipFinished( spectatingLabel0, {} )
				spectatingLabel00:completeAnimation()
				self.spectatingLabel00:setAlpha( 0 )
				self.clipFinished( spectatingLabel00, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 0 )
				self.clipFinished( rightButton, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 1 )
				self.clipFinished( leftButton, {} )
				spectatingLabel0:completeAnimation()
				self.spectatingLabel0:setAlpha( 0.65 )
				self.clipFinished( spectatingLabel0, {} )
				spectatingLabel00:completeAnimation()
				self.spectatingLabel00:setAlpha( 1 )
				self.clipFinished( spectatingLabel00, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 1 )
				self.clipFinished( rightButton, {} )
			end
		},
		VisibleLastPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 0 )
				self.clipFinished( leftButton, {} )
				spectatingLabel0:completeAnimation()
				self.spectatingLabel0:setAlpha( 0.65 )
				self.clipFinished( spectatingLabel0, {} )
				spectatingLabel00:completeAnimation()
				self.spectatingLabel00:setAlpha( 1 )
				self.clipFinished( spectatingLabel00, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 0 )
				self.clipFinished( rightButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VisibleLastPlayer",
			condition = function ( menu, element, event )
				local f7_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) then
					f7_local0 = IsGamepad( controller )
					if f7_local0 then
						f7_local0 = IsModelValueEqualToEitherValue( controller, "gameScore.alliesAlive", 0, 1 )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) then
					f8_local0 = IsGamepad( controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f1_local5 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local5( self, event )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.alliesAlive" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.alliesAlive"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftButton:close()
		element.rightButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

