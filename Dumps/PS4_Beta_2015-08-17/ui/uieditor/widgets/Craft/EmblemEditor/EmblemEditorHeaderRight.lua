require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

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
	self:setTopBottom( true, false, 0, 25 )
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( true, false, 0, 25 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 0, 0 )
	Image3:setTopBottom( true, true, 0, 5.5 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setAlpha( 0 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 2, 0 )
	text:setTopBottom( true, false, 2.5, 22.5 )
	text:setRGB( 0, 0, 0 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
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
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

