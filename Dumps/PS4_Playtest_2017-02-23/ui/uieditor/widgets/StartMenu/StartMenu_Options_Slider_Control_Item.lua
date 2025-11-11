require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Item_Arrow" )

local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		self.m_preventFromBeingCurrentMouseFocus = true
		self:setForceMouseEventDispatch( true )
	end
end

CoD.StartMenu_Options_Slider_Control_Item = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Slider_Control_Item.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Slider_Control_Item )
	self.id = "StartMenu_Options_Slider_Control_Item"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 252 )
	self:setTopBottom( 0, 0, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local left = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	left:setLeftRight( 0, 0, -22, 0 )
	left:setTopBottom( 0.5, 0.5, -9, 9 )
	left:setAlpha( 0.8 )
	left:setZRot( -90 )
	left:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		CallElementModel( self, self, controller, "prevAction" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( left )
	self.left = left
	
	local right = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	right:setLeftRight( 1, 1, 0, 22 )
	right:setTopBottom( 0.5, 0.5, -9, 9 )
	right:setAlpha( 0.8 )
	right:setYRot( 180 )
	right:setZRot( -90 )
	right:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		CallElementModel( self, self, controller, "nextAction" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( right )
	self.right = right
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 1, 0, 0 )
	TextBox:setTopBottom( 0.5, 0.5, -15, 15 )
	TextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TextBox:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	left.navigation = {
		right = right
	}
	right.navigation = {
		left = left
	}
	self.resetProperties = function ()
		left:completeAnimation()
		right:completeAnimation()
		TextBox:completeAnimation()
		left:setAlpha( 0.8 )
		right:setAlpha( 0.8 )
		TextBox:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 1 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TextBox:completeAnimation()
				self.TextBox:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( TextBox, {} )
			end
		},
		ArrowsHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 0.41, 0 )
				self.clipFinished( TextBox, {} )
			end
		},
		LeftArrowHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 0.41, 0 )
				self.clipFinished( TextBox, {} )
			end
		},
		RightArrowHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 0.41, 0 )
				self.clipFinished( TextBox, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "DefaultState" ) then
			SetElementStateByElementName( self, "left", controller, "DefaultState" )
			SetElementStateByElementName( self, "right", controller, "DefaultState" )
			SetElementStateByElementName( self, "left", controller, "DefaultState" )
			SetElementStateByElementName( self, "right", controller, "DefaultState" )
		elseif IsElementInState( element, "ArrowsHidden" ) then
			SetElementStateByElementName( self, "left", controller, "Hidden" )
			SetElementStateByElementName( self, "right", controller, "Hidden" )
			SetElementStateByElementName( self, "left", controller, "Hidden" )
			SetElementStateByElementName( self, "right", controller, "Hidden" )
		end
	end )
	left.id = "left"
	right.id = "right"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.left:close()
		self.right:close()
		self.TextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	CallCustomElementFunction_Element( self, "setForceMouseEventDispatch", true )
	return self
end

