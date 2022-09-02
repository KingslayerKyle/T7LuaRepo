-- ee917e1ab7584434244235ae6b348b95
-- This hash is used for caching, delete to decompile the file again

CoD.EventMessageText = InheritFrom( LUI.UIElement )
CoD.EventMessageText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EventMessageText )
	self.id = "EventMessageText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 16 )
	
	local message = LUI.UIText.new()
	message:setLeftRight( true, false, 0, 300 )
	message:setTopBottom( true, false, 0, 16 )
	message:setRGB( 1, 1, 0.7 )
	message:setZoom( 5 )
	message:setTTF( "fonts/escom.ttf" )
	message:setLetterSpacing( 0.4 )
	message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	message:linkToElementModel( self, "messageText", true, function ( model )
		local messageText = Engine.GetModelValue( model )
		if messageText then
			message:setText( Engine.Localize( messageText ) )
		end
	end )
	self:addElement( message )
	self.message = message
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.message:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

