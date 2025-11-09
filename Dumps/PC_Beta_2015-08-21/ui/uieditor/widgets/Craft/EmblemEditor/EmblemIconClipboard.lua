require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

CoD.EmblemIconClipboard = InheritFrom( LUI.UIElement )
CoD.EmblemIconClipboard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemIconClipboard )
	self.id = "EmblemIconClipboard"
	self.soundSet = "CustomizationEditor"
	self:setLeftRight( true, false, 0, 168 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0.03, 0.03, 0.04 )
	BorderBakedMask0:setAlpha( 0.75 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local Paste = CoD.PaintshopButtonPrompt.new( menu, controller )
	Paste:setLeftRight( true, true, 10, -18 )
	Paste:setTopBottom( true, true, 131, -4 )
	Paste.label:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PASTE" ) )
	Paste:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local startButtonImage = Engine.GetModelValue( model )
		if startButtonImage then
			Paste.buttonPromptImage:setImage( RegisterImage( startButtonImage ) )
		end
	end )
	self:addElement( Paste )
	self.Paste = Paste
	
	local clipboardTitle = LUI.UIText.new()
	clipboardTitle:setLeftRight( true, false, 10, 160 )
	clipboardTitle:setTopBottom( true, false, 11, 27 )
	clipboardTitle:setRGB( 0.51, 0.5, 0.59 )
	clipboardTitle:setText( Engine.Localize( "MENU_EMBLEM_LAYER_CLIPBOARD" ) )
	clipboardTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	clipboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	clipboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( clipboardTitle )
	self.clipboardTitle = clipboardTitle
	
	local bgBorder = LUI.UIImage.new()
	bgBorder:setLeftRight( true, true, 28, -28 )
	bgBorder:setTopBottom( true, true, 27, -29 )
	bgBorder:setAlpha( 0 )
	self:addElement( bgBorder )
	self.bgBorder = bgBorder
	
	local bgMask = LUI.UIImage.new()
	bgMask:setLeftRight( true, true, 30, -30 )
	bgMask:setTopBottom( true, true, 29, -31 )
	bgMask:setRGB( 0, 0, 0 )
	bgMask:setAlpha( 0 )
	self:addElement( bgMask )
	self.bgMask = bgMask
	
	local BackingGradient = LUI.UIImage.new()
	BackingGradient:setLeftRight( true, true, 30, -30 )
	BackingGradient:setTopBottom( true, true, 29, -31 )
	BackingGradient:setRGB( 0.74, 0.75, 0.83 )
	BackingGradient:setAlpha( 0 )
	BackingGradient:setZRot( 180 )
	BackingGradient:setImage( RegisterImage( "uie_img_t7_menu_customclass_gradient01" ) )
	self:addElement( BackingGradient )
	self.BackingGradient = BackingGradient
	
	local copyIcon = LUI.UIElement.new()
	copyIcon:setLeftRight( true, true, 5, -5 )
	copyIcon:setTopBottom( true, true, 27, -33 )
	copyIcon:setupEmblemCopyWidget()
	self:addElement( copyIcon )
	self.copyIcon = copyIcon
	
	local PaintshopLine10 = CoD.PaintshopLine.new( menu, controller )
	PaintshopLine10:setLeftRight( true, false, 157, 10 )
	PaintshopLine10:setTopBottom( true, false, -1, 4 )
	self:addElement( PaintshopLine10 )
	self.PaintshopLine10 = PaintshopLine10
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 168 )
	EmblemEditorFrame0:setTopBottom( true, false, -1, 160 )
	EmblemEditorFrame0:setAlpha( 0 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				Paste:completeAnimation()
				self.Paste:setAlpha( 0 )
				self.clipFinished( Paste, {} )
				clipboardTitle:completeAnimation()
				self.clipboardTitle:setAlpha( 0 )
				self.clipFinished( clipboardTitle, {} )
				bgBorder:completeAnimation()
				self.bgBorder:setAlpha( 0 )
				self.clipFinished( bgBorder, {} )
				bgMask:completeAnimation()
				self.bgMask:setAlpha( 0 )
				self.clipFinished( bgMask, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0 )
				self.clipFinished( BackingGradient, {} )
				copyIcon:completeAnimation()
				self.copyIcon:setAlpha( 0 )
				self.clipFinished( copyIcon, {} )
				PaintshopLine10:completeAnimation()
				self.PaintshopLine10:setRGB( 1, 1, 1 )
				self.PaintshopLine10:setAlpha( 0 )
				self.clipFinished( PaintshopLine10, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				Paste:completeAnimation()
				self.Paste:setAlpha( 0 )
				self.clipFinished( Paste, {} )
				clipboardTitle:completeAnimation()
				self.clipboardTitle:setAlpha( 0 )
				self.clipFinished( clipboardTitle, {} )
				bgBorder:completeAnimation()
				self.bgBorder:setAlpha( 0 )
				self.clipFinished( bgBorder, {} )
				bgMask:completeAnimation()
				self.bgMask:setAlpha( 0 )
				self.clipFinished( bgMask, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0 )
				self.clipFinished( BackingGradient, {} )
				copyIcon:completeAnimation()
				self.copyIcon:setAlpha( 0 )
				self.clipFinished( copyIcon, {} )
				PaintshopLine10:completeAnimation()
				self.PaintshopLine10:setAlpha( 0 )
				self.clipFinished( PaintshopLine10, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.75 )
				self.clipFinished( BorderBakedMask0, {} )
				Paste:completeAnimation()
				self.Paste:setAlpha( 1 )
				self.clipFinished( Paste, {} )
				clipboardTitle:completeAnimation()
				self.clipboardTitle:setLeftRight( true, false, 10, 160 )
				self.clipboardTitle:setTopBottom( true, false, 11, 27 )
				self.clipboardTitle:setAlpha( 1 )
				self.clipFinished( clipboardTitle, {} )
				bgBorder:completeAnimation()
				self.bgBorder:setAlpha( 0 )
				self.clipFinished( bgBorder, {} )
				bgMask:completeAnimation()
				self.bgMask:setAlpha( 0 )
				self.clipFinished( bgMask, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 30, -30 )
				self.BackingGradient:setTopBottom( true, true, 29, -31 )
				self.BackingGradient:setAlpha( 0 )
				self.clipFinished( BackingGradient, {} )
				copyIcon:completeAnimation()
				self.copyIcon:setAlpha( 1 )
				self.clipFinished( copyIcon, {} )
				PaintshopLine10:completeAnimation()
				self.PaintshopLine10:setAlpha( 1 )
				self.clipFinished( PaintshopLine10, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedMask0:close()
		element.Paste:close()
		element.PaintshopLine10:close()
		element.EmblemEditorFrame0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

