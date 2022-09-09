-- 924db1a8cd34243caa17b8983d356bd2
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.FaceButtonWithKeyMouse = InheritFrom( LUI.UIElement )
CoD.FaceButtonWithKeyMouse.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonWithKeyMouse )
	self.id = "FaceButtonWithKeyMouse"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local KeyMouseImage = LUI.UIImage.new()
	KeyMouseImage:setLeftRight( true, true, 0, 0 )
	KeyMouseImage:setTopBottom( true, true, 0, 0 )
	KeyMouseImage:setAlpha( 0 )
	KeyMouseImage:setImage( RegisterImage( "uie_smallsquarebutton" ) )
	self:addElement( KeyMouseImage )
	self.KeyMouseImage = KeyMouseImage
	
	local ControllerImage = LUI.UIImage.new()
	ControllerImage:setLeftRight( true, true, 0, 0 )
	ControllerImage:setTopBottom( true, true, 0, 0 )
	ControllerImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setAlpha( 0 )
				self.clipFinished( KeyMouseImage, {} )

				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 1 )
				self.clipFinished( ControllerImage, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setAlpha( 0 )
				self.clipFinished( KeyMouseImage, {} )

				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end
		},
		KeyMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setRGB( 1, 1, 1 )
				self.KeyMouseImage:setAlpha( 1 )
				self.clipFinished( KeyMouseImage, {} )

				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setRGB( 1, 0.41, 0 )
				self.clipFinished( KeyMouseImage, {} )

				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f2_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local3( element, event )
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
		element.ControllerImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
