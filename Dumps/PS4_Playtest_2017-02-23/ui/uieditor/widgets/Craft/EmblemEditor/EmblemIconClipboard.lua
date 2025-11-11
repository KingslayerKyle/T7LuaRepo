require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )

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
	self:setLeftRight( 0, 0, 0, 252 )
	self:setTopBottom( 0, 0, 0, 240 )
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
	BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedMask0:setRGB( 0.03, 0.03, 0.04 )
	BorderBakedMask0:setAlpha( 0.75 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local Paste = CoD.PaintshopButtonPrompt.new( menu, controller )
	Paste:setLeftRight( 0, 1, 15, -27 )
	Paste:setTopBottom( 0, 1, 196, -6 )
	Paste.label:setText( Engine.Localize( "MENU_EMBLEM_LAYER_PASTE" ) )
	Paste:subscribeToGlobalModel( controller, "Controller", "start_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Paste.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Paste )
	self.Paste = Paste
	
	local clipboardTitle = LUI.UIText.new()
	clipboardTitle:setLeftRight( 0, 0, 15, 240 )
	clipboardTitle:setTopBottom( 0, 0, 16, 40 )
	clipboardTitle:setRGB( 0.51, 0.5, 0.59 )
	clipboardTitle:setText( Engine.Localize( "MENU_EMBLEM_LAYER_CLIPBOARD" ) )
	clipboardTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	clipboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	clipboardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( clipboardTitle )
	self.clipboardTitle = clipboardTitle
	
	local bgBorder = LUI.UIImage.new()
	bgBorder:setLeftRight( 0, 1, 42, -42 )
	bgBorder:setTopBottom( 0, 1, 40, -44 )
	bgBorder:setAlpha( 0 )
	self:addElement( bgBorder )
	self.bgBorder = bgBorder
	
	local bgMask = LUI.UIImage.new()
	bgMask:setLeftRight( 0, 1, 45, -45 )
	bgMask:setTopBottom( 0, 1, 43, -47 )
	bgMask:setRGB( 0, 0, 0 )
	bgMask:setAlpha( 0 )
	self:addElement( bgMask )
	self.bgMask = bgMask
	
	local BackingGradient = LUI.UIImage.new()
	BackingGradient:setLeftRight( 0, 1, 45, -45 )
	BackingGradient:setTopBottom( 0, 1, 43, -47 )
	BackingGradient:setRGB( 0.74, 0.75, 0.83 )
	BackingGradient:setAlpha( 0 )
	BackingGradient:setZRot( 180 )
	BackingGradient:setImage( RegisterImage( "uie_img_t7_menu_customclass_gradient01" ) )
	self:addElement( BackingGradient )
	self.BackingGradient = BackingGradient
	
	local copyIcon = LUI.UIElement.new()
	copyIcon:setLeftRight( 0, 1, 8, -8 )
	copyIcon:setTopBottom( 0, 1, 41, -49 )
	copyIcon:setupEmblemCopyWidget()
	self:addElement( copyIcon )
	self.copyIcon = copyIcon
	
	local PaintshopLine10 = CoD.PaintshopLine.new( menu, controller )
	PaintshopLine10:setLeftRight( 0, 0, 235, 15 )
	PaintshopLine10:setTopBottom( 0, 0, -2, 6 )
	self:addElement( PaintshopLine10 )
	self.PaintshopLine10 = PaintshopLine10
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( 0, 0, 0, 252 )
	EmblemEditorFrame0:setTopBottom( 0, 0, -2, 240 )
	EmblemEditorFrame0:setAlpha( 0 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	local allGroupsUsedText = LUI.UIText.new()
	allGroupsUsedText:setLeftRight( 0, 0, 7, 244 )
	allGroupsUsedText:setTopBottom( 0, 0, 193, 226 )
	allGroupsUsedText:setRGB( 1, 0, 0 )
	allGroupsUsedText:setAlpha( 0 )
	allGroupsUsedText:setText( Engine.Localize( "MENU_EMBLEM_MAX_GROUPS_USED" ) )
	allGroupsUsedText:setTTF( "fonts/default.ttf" )
	allGroupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	allGroupsUsedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( allGroupsUsedText )
	self.allGroupsUsedText = allGroupsUsedText
	
	self.resetProperties = function ()
		clipboardTitle:completeAnimation()
		PaintshopLine10:completeAnimation()
		Paste:completeAnimation()
		BorderBakedMask0:completeAnimation()
		copyIcon:completeAnimation()
		allGroupsUsedText:completeAnimation()
		clipboardTitle:setAlpha( 1 )
		PaintshopLine10:setAlpha( 1 )
		Paste:setAlpha( 1 )
		BorderBakedMask0:setAlpha( 0.75 )
		copyIcon:setAlpha( 1 )
		allGroupsUsedText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				Paste:completeAnimation()
				self.Paste:setAlpha( 0 )
				self.clipFinished( Paste, {} )
				clipboardTitle:completeAnimation()
				self.clipboardTitle:setAlpha( 0 )
				self.clipFinished( clipboardTitle, {} )
				copyIcon:completeAnimation()
				self.copyIcon:setAlpha( 0 )
				self.clipFinished( copyIcon, {} )
				PaintshopLine10:completeAnimation()
				self.PaintshopLine10:setAlpha( 0 )
				self.clipFinished( PaintshopLine10, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				Paste:completeAnimation()
				self.Paste:setAlpha( 0 )
				self.clipFinished( Paste, {} )
				clipboardTitle:completeAnimation()
				self.clipboardTitle:setAlpha( 0 )
				self.clipFinished( clipboardTitle, {} )
				copyIcon:completeAnimation()
				self.copyIcon:setAlpha( 0 )
				self.clipFinished( copyIcon, {} )
				PaintshopLine10:completeAnimation()
				self.PaintshopLine10:setAlpha( 0 )
				self.clipFinished( PaintshopLine10, {} )
			end
		},
		PasteState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AllGroupsUsed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Paste:completeAnimation()
				self.Paste:setAlpha( 0 )
				self.clipFinished( Paste, {} )
				allGroupsUsedText:completeAnimation()
				self.allGroupsUsedText:setAlpha( 1 )
				self.clipFinished( allGroupsUsedText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedMask0:close()
		self.Paste:close()
		self.PaintshopLine10:close()
		self.EmblemEditorFrame0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

