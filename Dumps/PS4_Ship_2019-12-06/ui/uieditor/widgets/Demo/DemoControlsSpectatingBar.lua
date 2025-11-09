local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
	local f1_local1 = "DEMO_FREE_CAMERA"
	if f1_local0 ~= Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
		f1_local1 = GetClientNameAndClanTag( f1_arg1, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.clientNum" ) ) )
	elseif IsDemoContextObjectLinkMode() and IsFreeCameraLockedOnEntity( f1_arg1 ) then
		f1_local1 = "DEMO_LINKED_TO_OBJECT"
	end
	f1_arg0.PlayerName:setText( Engine.Localize( f1_local1 ) )
end

local PostLoadFunc = function ( self, controller, menu )
	self.PlayerName:subscribeToGlobalModel( controller, "Demo", "cameraMode", function ( model )
		f0_local0( self, controller )
	end )
	self.PlayerName:subscribeToGlobalModel( controller, "Demo", "contextMode", function ( model )
		f0_local0( self, controller )
	end )
	self.PlayerName:subscribeToGlobalModel( controller, "Demo", "isFreeCameraLockedOnEntity", function ( model )
		f0_local0( self, controller )
	end )
end

CoD.DemoControlsSpectatingBar = InheritFrom( LUI.UIElement )
CoD.DemoControlsSpectatingBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 4
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsSpectatingBar )
	self.id = "DemoControlsSpectatingBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 25 )
	
	local leftButton = LUI.UIImage.new()
	leftButton:setLeftRight( false, false, -143.5, -118.5 )
	leftButton:setTopBottom( false, false, -8.5, 9.5 )
	leftButton:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			leftButton:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( leftButton )
	self.leftButton = leftButton
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( true, false, 35.5, 264.5 )
	PlayerName:setTopBottom( true, false, 3, 23 )
	PlayerName:setTTF( "fonts/default.ttf" )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerName:subscribeToGlobalModel( controller, "Demo", "clientNum", function ( model )
		local clientNum = Engine.GetModelValue( model )
		if clientNum then
			PlayerName:setText( Engine.Localize( GetClientNameAndClanTag( controller, clientNum ) ) )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local rightButton = LUI.UIImage.new()
	rightButton:setLeftRight( false, false, 118.5, 143.5 )
	rightButton:setTopBottom( false, false, -8.5, 9.5 )
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
				self:setupElementClipCounter( 2 )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 0 )
				self.clipFinished( leftButton, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 0 )
				self.clipFinished( rightButton, {} )
			end
		},
		WithButtonPrompts = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 1 )
				self.clipFinished( leftButton, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 1 )
				self.clipFinished( rightButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithButtonPrompts",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) then
					f12_local0 = not IsGameTypeEqualToString( "fr" )
				else
					f12_local0 = false
				end
				return f12_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.cameraMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftButton:close()
		element.PlayerName:close()
		element.rightButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

