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
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, true, 0, 0 )
	TextBox:setTopBottom( false, false, -7.5, 9.5 )
	TextBox:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
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
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, -20, 1 )
	arrow:setTopBottom( false, false, -10, 10 )
	arrow:setImage( RegisterImage( "uie_t7_codcaster_optionarrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local arrow0 = LUI.UIImage.new()
	arrow0:setLeftRight( false, true, 0, 21 )
	arrow0:setTopBottom( false, false, -10, 10 )
	arrow0:setZRot( 180 )
	arrow0:setImage( RegisterImage( "uie_t7_codcaster_optionarrow" ) )
	self:addElement( arrow0 )
	self.arrow0 = arrow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 1, 1 )
				self.clipFinished( TextBox, {} )
				arrow:completeAnimation()
				self.arrow:setRGB( 0.9, 0.9, 0.9 )
				self.arrow:setAlpha( 0.5 )
				self.clipFinished( arrow, {} )
				arrow0:completeAnimation()
				self.arrow0:setRGB( 0.9, 0.9, 0.9 )
				self.arrow0:setAlpha( 0.5 )
				self.clipFinished( arrow0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				TextBox:completeAnimation()
				self.TextBox:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
				self.clipFinished( TextBox, {} )
				arrow:completeAnimation()
				self.arrow:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				arrow0:completeAnimation()
				self.arrow0:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
				self.arrow0:setAlpha( 1 )
				self.clipFinished( arrow0, {} )
			end
		},
		ArrowsHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				arrow0:completeAnimation()
				self.arrow0:setAlpha( 0 )
				self.clipFinished( arrow0, {} )
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
		self.TextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

