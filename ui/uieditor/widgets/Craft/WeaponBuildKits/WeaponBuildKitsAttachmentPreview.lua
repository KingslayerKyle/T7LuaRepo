-- 716eddf550d2dc7093e08fe49a17de60
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )
require( "ui.uieditor.widgets.PC.Craft.Gunsmith.GunsmithRemoveButton" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.WeaponBuildKitsAttachmentPreview = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsAttachmentPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsAttachmentPreview )
	self.id = "WeaponBuildKitsAttachmentPreview"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
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
	
	local attachmentImage = LUI.UIImage.new()
	attachmentImage:setLeftRight( true, true, 0, 0 )
	attachmentImage:setTopBottom( true, true, 0, 0 )
	self:addElement( attachmentImage )
	self.attachmentImage = attachmentImage
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
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
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( false, false, -8, 8 )
	plusIcon:setTopBottom( false, false, -8.25, 7.75 )
	plusIcon:setRGB( 0.92, 0.43, 0 )
	plusIcon:setAlpha( 0 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( true, true, -2, 2 )
	FocusWhiteT:setTopBottom( true, false, -4, 0 )
	FocusWhiteT:setAlpha( 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( true, true, -2, 2 )
	FocusWhiteB:setTopBottom( false, true, 0, 4 )
	FocusWhiteB:setAlpha( 0 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	local removeButton = CoD.GunsmithRemoveButton.new( menu, controller )
	removeButton:setLeftRight( true, false, 47, 62 )
	removeButton:setTopBottom( true, false, 2, 17 )
	removeButton:setAlpha( 0 )
	self:addElement( removeButton )
	self.removeButton = removeButton
	
	local opticIndicator = LUI.UIImage.new()
	opticIndicator:setLeftRight( false, false, -8, 8 )
	opticIndicator:setTopBottom( false, true, -18.5, -6.5 )
	opticIndicator:setAlpha( 0 )
	opticIndicator:setImage( RegisterImage( "uie_t7_menu_cac_iconoptics" ) )
	self:addElement( opticIndicator )
	self.opticIndicator = opticIndicator
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( false, false, -12.5, 11.5 )
	LockIcon:setTopBottom( false, false, -16, 16 )
	LockIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				attachmentImage:completeAnimation()
				self.attachmentImage:setAlpha( 0 )
				self.clipFinished( attachmentImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 1, 1, 1 )
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
				removeButton:completeAnimation()
				self.removeButton:setAlpha( 0 )
				self.clipFinished( removeButton, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end
		},
		IsEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				attachmentImage:completeAnimation()
				self.attachmentImage:setAlpha( 1 )
				self.clipFinished( attachmentImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 0.98, 0.37, 0 )
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				removeButton:completeAnimation()
				self.removeButton:setAlpha( 0 )
				self.clipFinished( removeButton, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				attachmentImage:completeAnimation()
				self.attachmentImage:setAlpha( 0 )
				self.clipFinished( attachmentImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				self.clipFinished( FocusBorder, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 1, 1, 1 )
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
				removeButton:completeAnimation()
				self.removeButton:setAlpha( 0 )
				self.clipFinished( removeButton, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactiveStroke:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.plusIcon:close()
		element.FocusWhiteT:close()
		element.FocusWhiteB:close()
		element.removeButton:close()
		element.LockIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

