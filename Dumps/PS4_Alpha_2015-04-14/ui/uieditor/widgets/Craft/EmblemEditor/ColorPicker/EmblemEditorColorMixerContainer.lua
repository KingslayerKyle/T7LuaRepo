require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixer" )

CoD.EmblemEditorColorMixerContainer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorMixerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorMixerContainer )
	self.id = "EmblemEditorColorMixerContainer"
	self.soundSet = "SelectColor_ColorMixer"
	self:setLeftRight( true, false, 0, 671 )
	self:setTopBottom( true, false, 0, 161 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ColorPickerBkgd0 = LUI.UIImage.new()
	ColorPickerBkgd0:setLeftRight( true, true, 0, 0 )
	ColorPickerBkgd0:setTopBottom( true, true, 0, 0 )
	ColorPickerBkgd0:setRGB( 0.09, 0.1, 0.12 )
	ColorPickerBkgd0:setAlpha( 0.9 )
	ColorPickerBkgd0:setZRot( 180 )
	ColorPickerBkgd0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local colorMixer = CoD.EmblemEditorColorMixer.new( menu, controller )
	colorMixer:setLeftRight( true, true, 0, 0 )
	colorMixer:setTopBottom( true, true, 0, 0 )
	colorMixer:setRGB( 1, 1, 1 )
	colorMixer:setAlpha( 0 )
	colorMixer:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		colorMixer:setModel( model, controller )
	end )
	self:addElement( colorMixer )
	self.colorMixer = colorMixer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0.9 )
				self.clipFinished( ColorPickerBkgd0, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0.9 )
				self.clipFinished( ColorPickerBkgd0, {} )
				colorMixer:completeAnimation()
				self.colorMixer:setAlpha( 1 )
				self.clipFinished( colorMixer, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0 )
				self.clipFinished( ColorPickerBkgd0, {} )
				colorMixer:completeAnimation()
				self.colorMixer:setAlpha( 0 )
				self.clipFinished( colorMixer, {} )
			end
		}
	}
	colorMixer.id = "colorMixer"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.colorMixer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.colorMixer:close()
		CoD.EmblemEditorColorMixerContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

