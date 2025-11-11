require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Item_Arrow" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self.m_preventFromBeingCurrentMouseFocus = true
		self:setForceMouseEventDispatch( true )
	end
end

CoD.CodCaster_Options_Slider_Control_Item = InheritFrom( LUI.UIElement )
CoD.CodCaster_Options_Slider_Control_Item.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCaster_Options_Slider_Control_Item )
	self.id = "CodCaster_Options_Slider_Control_Item"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 232 )
	self:setTopBottom( 0, 0, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
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
	
	local left = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	left:setLeftRight( 0, 0, -22, 0 )
	left:setTopBottom( 0.5, 0.5, -9, 9 )
	left:setZRot( -90 )
	self:addElement( left )
	self.left = left
	
	local right = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	right:setLeftRight( 1, 1, 0, 22 )
	right:setTopBottom( 0.5, 0.5, -9, 9 )
	right:setYRot( 180 )
	right:setZRot( -90 )
	self:addElement( right )
	self.right = right
	
	left.navigation = {
		right = right
	}
	right.navigation = {
		left = left
	}
	self.resetProperties = function ()
		TextBox:completeAnimation()
		right:completeAnimation()
		left:completeAnimation()
		TextBox:setRGB( 1, 1, 1 )
		right:setAlpha( 1 )
		left:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TextBox:completeAnimation()
				self.TextBox:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
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
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "DefaultState" ) then
			SetElementStateByElementName( self, "arrow", controller, "DefaultState" )
			SetElementStateByElementName( self, "arrow", controller, "DefaultState" )
			SetElementStateByElementName( self, "left", controller, "DefaultState" )
			SetElementStateByElementName( self, "right", controller, "DefaultState" )
		elseif IsElementInState( element, "ArrowsHidden" ) then
			SetElementStateByElementName( self, "arrow", controller, "Hidden" )
			SetElementStateByElementName( self, "arrow0", controller, "Hidden" )
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
	return self
end

