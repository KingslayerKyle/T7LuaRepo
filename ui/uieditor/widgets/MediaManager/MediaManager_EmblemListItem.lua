-- a856df7a68be4a3f0799886365e561f5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenGrid" )

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
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local DrawEmblemByEmblemIndex0 = LUI.UIElement.new()
	DrawEmblemByEmblemIndex0:setLeftRight( true, false, 0, 107 )
	DrawEmblemByEmblemIndex0:setTopBottom( true, false, -0.5, 64.5 )
	DrawEmblemByEmblemIndex0:linkToElementModel( self, "emblemIndex", true, function ( model )
		local emblemIndex = Engine.GetModelValue( model )
		if emblemIndex then
			DrawEmblemByEmblemIndex0:setupEmblemByEmblemIndex( GetEmblemIndexParams( controller, emblemIndex ) )
		end
	end )
	self:addElement( DrawEmblemByEmblemIndex0 )
	self.DrawEmblemByEmblemIndex0 = DrawEmblemByEmblemIndex0
	
	local itemNameBg = LUI.UIImage.new()
	itemNameBg:setLeftRight( true, false, 122, 263 )
	itemNameBg:setTopBottom( true, false, 22, 42 )
	itemNameBg:setRGB( 0, 0, 0 )
	itemNameBg:setAlpha( 0.4 )
	self:addElement( itemNameBg )
	self.itemNameBg = itemNameBg
	
	local ItemName = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	ItemName:setLeftRight( true, false, 125, 263 )
	ItemName:setTopBottom( true, false, 22, 42 )
	ItemName.textBox:setTTF( "fonts/default.ttf" )
	ItemName.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ItemName:linkToElementModel( self, "emblemName", true, function ( model )
		local emblemName = Engine.GetModelValue( model )
		if emblemName then
			ItemName.textBox:setText( emblemName )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -5, 4 )
	glitch:setTopBottom( true, false, -9.75, 3.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -5, 4 )
	glitch2:setTopBottom( false, true, -5, 10 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local cacIconTokenGrid0 = CoD.cac_IconTokenGrid.new( menu, controller )
	cacIconTokenGrid0:setLeftRight( false, true, -28, 0 )
	cacIconTokenGrid0:setTopBottom( true, false, -0.5, 27.5 )
	cacIconTokenGrid0:setAlpha( 0 )
	self:addElement( cacIconTokenGrid0 )
	self.cacIconTokenGrid0 = cacIconTokenGrid0
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 107, 111 )
	itemImageLine:setTopBottom( false, false, -32.5, 32.5 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( true, false, 31.5, 75.5 )
	PlusImage:setTopBottom( true, false, 10, 54 )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	self.PlusImage:linkToElementModel( self, "showBuyImage", true, function ( model )
		local showBuyImage = Engine.GetModelValue( model )
		if showBuyImage then
			PlusImage:setAlpha( showBuyImage )
		end
	end )
	self.PlusImage:linkToElementModel( self, "plusImageSrc", true, function ( model )
		local plusImageSrc = Engine.GetModelValue( model )
		if plusImageSrc then
			PlusImage:setImage( RegisterImage( plusImageSrc ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.ItemName:close()
		element.lockedIcon:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.cacIconTokenGrid0:close()
		element.DrawEmblemByEmblemIndex0:close()
		element.PlusImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

