require( "ui.uieditor.widgets.FaceButtonWithKeyMouse" )

CoD.FaceButtonThatHidesWithLabel = InheritFrom( LUI.UIElement )
CoD.FaceButtonThatHidesWithLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonThatHidesWithLabel )
	self.id = "FaceButtonThatHidesWithLabel"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local ButtonLabel = LUI.UITightText.new()
	ButtonLabel:setLeftRight( true, false, 23.76, 200 )
	ButtonLabel:setTopBottom( true, false, 0, 20 )
	ButtonLabel:setText( Engine.Localize( "MENU_NEW" ) )
	ButtonLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonLabel:setLetterSpacing( 0.5 )
	self:addElement( ButtonLabel )
	self.ButtonLabel = ButtonLabel
	
	local ButtonImage = CoD.FaceButtonWithKeyMouse.new( menu, controller )
	ButtonImage:setLeftRight( true, false, 0, 20 )
	ButtonImage:setTopBottom( true, false, 0, 20 )
	ButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ButtonImage.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ButtonImage )
	self.ButtonImage = ButtonImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setLeftRight( true, false, 23.76, 200 )
				self.ButtonLabel:setTopBottom( true, false, 0, 20 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 1 )
				self.clipFinished( ButtonImage, {} )
			end
		},
		HideButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setLeftRight( true, false, 4.76, 200 )
				self.ButtonLabel:setTopBottom( true, false, 0, 20 )
				self.ButtonLabel:setAlpha( 1 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 0 )
				self.clipFinished( ButtonImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

