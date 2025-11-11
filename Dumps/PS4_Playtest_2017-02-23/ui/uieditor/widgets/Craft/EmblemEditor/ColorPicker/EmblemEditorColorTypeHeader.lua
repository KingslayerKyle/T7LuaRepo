require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )

CoD.EmblemEditorColorTypeHeader = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorTypeHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorTypeHeader )
	self.id = "EmblemEditorColorTypeHeader"
	self.soundSet = "SelectColor"
	self:setLeftRight( 0, 0, 0, 1021 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local colorTypeHeader = CoD.PaintshopChooseSide.new( menu, controller )
	colorTypeHeader:setLeftRight( 0, 1, 0, 0 )
	colorTypeHeader:setTopBottom( 0, 1, 0, 0 )
	colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
	colorTypeHeader.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( colorTypeHeader )
	self.colorTypeHeader = colorTypeHeader
	
	self.resetProperties = function ()
		colorTypeHeader:completeAnimation()
		colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorTypeHeader:completeAnimation()
				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Gradient = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorTypeHeader:completeAnimation()
				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Solid = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorTypeHeader:completeAnimation()
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Mixer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorTypeHeader:completeAnimation()
				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_COLOR_MIXER" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colorTypeHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

