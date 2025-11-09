CoD.FaceButtonLabelHide = InheritFrom( LUI.UIElement )
CoD.FaceButtonLabelHide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonLabelHide )
	self.id = "FaceButtonLabelHide"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	
	local ControllerImage = LUI.UIImage.new()
	ControllerImage:setLeftRight( true, false, 0, 20 )
	ControllerImage:setTopBottom( true, false, 0, 20 )
	ControllerImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local LabelText = LUI.UIText.new()
	LabelText:setLeftRight( true, false, 20, 100 )
	LabelText:setTopBottom( true, false, 0, 20 )
	LabelText:setText( Engine.Localize( "MENU_NEW" ) )
	LabelText:setTTF( "fonts/default.ttf" )
	LabelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LabelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LabelText )
	self.LabelText = LabelText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 1 )
				self.clipFinished( ControllerImage, {} )
				LabelText:completeAnimation()
				self.LabelText:setRGB( 1, 1, 1 )
				self.LabelText:setAlpha( 1 )
				self.clipFinished( LabelText, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
				LabelText:completeAnimation()
				self.LabelText:setAlpha( 0 )
				self.clipFinished( LabelText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ControllerImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

