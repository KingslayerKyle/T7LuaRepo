require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )

CoD.FileshareScreenshotSelectorItem = InheritFrom( LUI.UIElement )
CoD.FileshareScreenshotSelectorItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareScreenshotSelectorItem )
	self.id = "FileshareScreenshotSelectorItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 264 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( 0, 0, 84, 180 )
	PlusImage:setTopBottom( 0, 0, 21, 117 )
	PlusImage:setImage( RegisterImage( "uie_t7_icon_menu_simple_publish_green" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( 0, 1, 0, 0 )
	ImageViewer0:setTopBottom( 0, 1, 0, 0 )
	ImageViewer0:linkToElementModel( self, "showFileImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer0:setAlpha( modelValue )
		end
	end )
	ImageViewer0:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 1, 262 )
	LabelButton:setTopBottom( 1, 1, -30, -2 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -2, 2 )
	FocusBarT:setTopBottom( 0, 0, -5, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -2, 2 )
	FocusBarB:setTopBottom( 1, 1, -1, 5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.PlusImage:linkToElementModel( self, "showPlusImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setAlpha( modelValue )
		end
	end )
	self.LabelButton:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		BoxButtonLrgIdle:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgIdle:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.8 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.8 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.LabelButton:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.PlusImage:close()
		self.ImageViewer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

