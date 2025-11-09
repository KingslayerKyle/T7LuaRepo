require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )

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
		spacing = 0
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
	self.anyChildUsesUpdateState = true
	
	local leftBumper = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	leftBumper:setLeftRight( false, false, -159.5, -114.5 )
	leftBumper:setTopBottom( false, false, -14.5, 15.5 )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "mouse_left_button_image", function ( model )
		local mouseLeftButtonImage = Engine.GetModelValue( model )
		if mouseLeftButtonImage then
			leftBumper.KeyMouseImage:setImage( RegisterImage( mouseLeftButtonImage ) )
		end
	end )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			leftBumper.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
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
	
	local rightBumper = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	rightBumper:setLeftRight( false, false, 114.5, 159.5 )
	rightBumper:setTopBottom( false, false, -14.5, 15.5 )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "mouse_right_button_image", function ( model )
		local mouseRightButtonImage = Engine.GetModelValue( model )
		if mouseRightButtonImage then
			rightBumper.KeyMouseImage:setImage( RegisterImage( mouseRightButtonImage ) )
		end
	end )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			rightBumper.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 0 )
				self.clipFinished( leftBumper, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 0 )
				self.clipFinished( rightBumper, {} )
			end
		},
		WithButtonPrompts = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 1 )
				self.clipFinished( leftBumper, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 1 )
				self.clipFinished( rightBumper, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithButtonPrompts",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsDemoClipPlaying() and not IsGlobalModelValueEqualToEnum( element, controller, "demo.cameraMode", Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM ) then
					f14_local0 = not IsGameTypeEqualToString( "fr" )
				else
					f14_local0 = false
				end
				return f14_local0
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
		element.leftBumper:close()
		element.rightBumper:close()
		element.PlayerName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

