-- a10dae82ae1f038e9f57b58917ba4262
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 681 )
	self:setTopBottom( true, false, 0, 30 )
	
	local colorTypeHeader = CoD.PaintshopChooseSide.new( menu, controller )
	colorTypeHeader:setLeftRight( true, true, 0, 0 )
	colorTypeHeader:setTopBottom( true, true, 0, 0 )
	colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
	colorTypeHeader.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( colorTypeHeader )
	self.colorTypeHeader = colorTypeHeader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				colorTypeHeader:completeAnimation()

				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Gradient = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				colorTypeHeader:completeAnimation()

				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_GRADIENT" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Solid = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				colorTypeHeader:completeAnimation()

				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_SOLID_COLOR" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		},
		Mixer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				colorTypeHeader:completeAnimation()

				colorTypeHeader.text:completeAnimation()
				self.colorTypeHeader.text:setText( Engine.Localize( "MENU_EMBLEM_COLOR_MIXER" ) )
				self.clipFinished( colorTypeHeader, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorTypeHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

