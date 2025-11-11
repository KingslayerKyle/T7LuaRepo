require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenGrid" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.MediaManager_EmblemListItem = InheritFrom( LUI.UIElement )
CoD.MediaManager_EmblemListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_EmblemListItem )
	self.id = "MediaManager_EmblemListItem"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 97 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local DrawEmblemByEmblemIndex0 = LUI.UIElement.new()
	DrawEmblemByEmblemIndex0:setLeftRight( 0, 0, 0, 160 )
	DrawEmblemByEmblemIndex0:setTopBottom( 0, 0, -1, 97 )
	DrawEmblemByEmblemIndex0:linkToElementModel( self, "emblemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DrawEmblemByEmblemIndex0:setupEmblemByEmblemIndex( GetEmblemIndexParams( controller, modelValue ) )
		end
	end )
	self:addElement( DrawEmblemByEmblemIndex0 )
	self.DrawEmblemByEmblemIndex0 = DrawEmblemByEmblemIndex0
	
	local itemNameBg = LUI.UIImage.new()
	itemNameBg:setLeftRight( 0, 0, 183, 395 )
	itemNameBg:setTopBottom( 0, 0, 33, 63 )
	itemNameBg:setRGB( 0, 0, 0 )
	itemNameBg:setAlpha( 0.4 )
	self:addElement( itemNameBg )
	self.itemNameBg = itemNameBg
	
	local ItemName = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	ItemName:setLeftRight( 0, 0, 188, 395 )
	ItemName:setTopBottom( 0, 0, 33, 63 )
	ItemName.textBox:setTTF( "fonts/default.ttf" )
	ItemName.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemName:linkToElementModel( self, "emblemName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemName.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -18, 18 )
	lockedIcon:setTopBottom( 0.5, 0.5, -24, 24 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -8, 6 )
	glitch:setTopBottom( 0, 0, -14, 6 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -8, 6 )
	glitch2:setTopBottom( 1, 1, -7, 15 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local cacIconTokenGrid0 = CoD.cac_IconTokenGrid.new( menu, controller )
	cacIconTokenGrid0:setLeftRight( 1, 1, -42, 0 )
	cacIconTokenGrid0:setTopBottom( 0, 0, -1, 41 )
	cacIconTokenGrid0:setAlpha( 0 )
	self:addElement( cacIconTokenGrid0 )
	self.cacIconTokenGrid0 = cacIconTokenGrid0
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( 0, 0, 161, 167 )
	itemImageLine:setTopBottom( 0.5, 0.5, -49, 49 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( 0, 0, 47, 113 )
	PlusImage:setTopBottom( 0, 0, 15, 81 )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	self.PlusImage:linkToElementModel( self, "showBuyImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setAlpha( modelValue )
		end
	end )
	self.PlusImage:linkToElementModel( self, "plusImageSrc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactive:setAlpha( 1 )
		FocusBarB:setLeftRight( 0, 1, -3, 3 )
		FocusBarB:setTopBottom( 1, 1, 0, 6 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -3, 3 )
		FocusBarT:setTopBottom( 0, 0, -6, 0 )
		FocusBarT:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarB:setTopBottom( 1, 1, -6, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarB:setTopBottom( 1, 1, -6, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.ItemName:close()
		self.lockedIcon:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.cacIconTokenGrid0:close()
		self.DrawEmblemByEmblemIndex0:close()
		self.PlusImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

