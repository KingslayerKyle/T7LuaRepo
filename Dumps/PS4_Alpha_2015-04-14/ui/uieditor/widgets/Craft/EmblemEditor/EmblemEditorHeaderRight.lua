CoD.EmblemEditorHeaderRight = InheritFrom( LUI.UIElement )
CoD.EmblemEditorHeaderRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorHeaderRight )
	self.id = "EmblemEditorHeaderRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 0, 0 )
	Image3:setTopBottom( true, true, 0, 5.5 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setAlpha( 0.8 )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 5, -15 )
	text:setTopBottom( true, false, 3.84, 28.84 )
	text:setRGB( 0.86, 0.88, 0.75 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/Entovo.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image3:completeAnimation()
				self.Image3:setLeftRight( true, true, 0, 0 )
				self.Image3:setTopBottom( true, true, 0, 5.5 )
				self.Image3:setAlpha( 0.8 )
				self.clipFinished( Image3, {} )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

