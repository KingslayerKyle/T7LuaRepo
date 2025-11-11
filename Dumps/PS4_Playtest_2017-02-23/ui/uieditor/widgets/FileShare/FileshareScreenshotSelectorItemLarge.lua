require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )

CoD.FileshareScreenshotSelectorItemLarge = InheritFrom( LUI.UIElement )
CoD.FileshareScreenshotSelectorItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareScreenshotSelectorItemLarge )
	self.id = "FileshareScreenshotSelectorItemLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 367 )
	self:setTopBottom( 0, 0, 0, 228 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local ImageViewer = LUI.UIElement.new()
	ImageViewer:setLeftRight( 0, 0, 0, 368 )
	ImageViewer:setTopBottom( 0, 0, 0, 228 )
	ImageViewer:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( ImageViewer )
	self.ImageViewer = ImageViewer
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, -37 )
	BoxButtonLrgIdle:setAlpha( 0.24 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BarBg = LUI.UIImage.new()
	BarBg:setLeftRight( 0, 1, 0, 0 )
	BarBg:setTopBottom( 1, 1, -38, 0 )
	BarBg:setRGB( 0, 0, 0 )
	BarBg:setAlpha( 0.8 )
	self:addElement( BarBg )
	self.BarBg = BarBg
	
	local CategoryImage = LUI.UIImage.new()
	CategoryImage:setLeftRight( 0, 0, 5, 31 )
	CategoryImage:setTopBottom( 1, 1, -33, -6 )
	CategoryImage:linkToElementModel( self, "fileCategory", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryImage:setImage( RegisterImage( FileshareGetCategoryIcon( modelValue ) ) )
		end
	end )
	self:addElement( CategoryImage )
	self.CategoryImage = CategoryImage
	
	local TimeText = LUI.UIText.new()
	TimeText:setLeftRight( 0, 0, 36, 359 )
	TimeText:setTopBottom( 1, 1, -32, -5 )
	TimeText:setTTF( "fonts/default.ttf" )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeText )
	self.TimeText = TimeText
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 0, 368 )
	LabelButton:setTopBottom( 1, 1, -68, -36 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -3, 3 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -3, 3 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -3, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -5, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.TimeText:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimeText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		BoxButtonLrgIdle:setAlpha( 0.24 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.LabelButton:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.ImageViewer:close()
		self.CategoryImage:close()
		self.TimeText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

