CoD.GunsmithVariantAttachmentHeader = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantAttachmentHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantAttachmentHeader )
	self.id = "GunsmithVariantAttachmentHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, 0, 27 )
	text:setRGB( 0.9, 0.9, 0.9 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.resetProperties = function ()
		text:completeAnimation()
		text:setRGB( 0.9, 0.9, 0.9 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 1, 1, 1 )
				self.clipFinished( text, {} )
			end
		},
		Focus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 1, 1, 1 )
				self.clipFinished( text, {} )
			end
		},
		NotFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 0.51, 0.49, 0.49 )
				self.clipFinished( text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

