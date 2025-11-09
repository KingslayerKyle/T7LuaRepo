require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Item_Arrow" )

local PostLoadFunc = function ( self, controller, menu )
	
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
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local left = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	left:setLeftRight( true, false, -15, 0 )
	left:setTopBottom( false, false, -6, 6 )
	left:setAlpha( 0.8 )
	left:setZRot( -90 )
	self:addElement( left )
	self.left = left
	
	local right = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	right:setLeftRight( false, true, 0, 15 )
	right:setTopBottom( false, false, -6, 6 )
	right:setAlpha( 0.8 )
	right:setYRot( 180 )
	right:setZRot( -90 )
	self:addElement( right )
	self.right = right
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, true, 0, 0 )
	TextBox:setTopBottom( false, false, -10, 10 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 1 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ArrowsHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end
		},
		LeftArrowHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0.8 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0.8 )
				self.clipFinished( right, {} )
			end
		},
		RightArrowHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0.8 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				left:completeAnimation()
				self.left:setAlpha( 0.8 )
				self.clipFinished( left, {} )
				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "DefaultState" ) then
			SetElementStateByElementName( self, "left", controller, "DefaultState" )
			SetElementStateByElementName( self, "right", controller, "DefaultState" )
		elseif IsElementInState( element, "ArrowsHidden" ) then
			SetElementStateByElementName( self, "left", controller, "Hidden" )
			SetElementStateByElementName( self, "right", controller, "Hidden" )
		end
	end )
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

