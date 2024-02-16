-- 6861950ebf408ef19751d6a9c1467d3a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FooterButtonPrompt" )

CoD.overworld_frame = InheritFrom( LUI.UIElement )
CoD.overworld_frame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.overworld_frame )
	self.id = "overworld_frame"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local border = LUI.UIImage.new()
	border:setLeftRight( true, false, 0, 1280 )
	border:setTopBottom( true, false, 0, 720 )
	border:setImage( RegisterImage( "uie_menu_zom_bezel_overlay" ) )
	self:addElement( border )
	self.border = border
	
	local Bbtn = CoD.FooterButtonPrompt.new( menu, controller )
	Bbtn:setLeftRight( true, false, 980, 1060 )
	Bbtn:setTopBottom( false, true, -75, -43 )
	Bbtn.label:setText( Engine.Localize( "" ) )
	Bbtn:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			Bbtn.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	Bbtn:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, false, function ( model )
		Bbtn:setModel( model, controller )
	end )
	self:addElement( Bbtn )
	self.Bbtn = Bbtn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Bbtn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
