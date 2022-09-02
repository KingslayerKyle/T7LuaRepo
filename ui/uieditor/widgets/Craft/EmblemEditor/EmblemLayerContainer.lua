-- f6cf38d32f847c2919fbfdd238608f6a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerArrows" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local f0_local0 = function ( f1_arg0, f1_arg1 )

	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
		if controller == "EditMode_Selected" then
			f1_arg0.m_skipMouseFocus = true
		else
			f1_arg0.m_skipMouseFocus = nil
		end
	end )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.isPC then
		f0_local0( f3_arg0, f3_arg1 )
	end
end

CoD.EmblemLayerContainer = InheritFrom( LUI.UIElement )
CoD.EmblemLayerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmblemLayerContainer )
	self.id = "EmblemLayerContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBakedBlur0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBakedBlur0:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBakedMask0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBakedMask0:setRGB( 0.05, 0.05, 0.05 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BackingGradient = LUI.UIImage.new()
	BackingGradient:setLeftRight( true, true, 7.5, -7.5 )
	BackingGradient:setTopBottom( true, true, 8.5, -7.5 )
	BackingGradient:setRGB( 0.74, 0.75, 0.83 )
	BackingGradient:setAlpha( 0 )
	BackingGradient:setZRot( 180 )
	BackingGradient:setImage( RegisterImage( "uie_img_t7_menu_customclass_gradient01" ) )
	self:addElement( BackingGradient )
	self.BackingGradient = BackingGradient
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBakedSolid0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBaked0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 9.5, -9.5 )
	backgroundMask:setTopBottom( true, true, 9.5, -9.5 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	backgroundMask:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	backgroundMask:setShaderVector( 0, 0, 0, 0, 0 )
	backgroundMask:setShaderVector( 1, 0, 0, 0, 0 )
	backgroundMask:setShaderVector( 2, 0, 0, 0, 0 )
	backgroundMask:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local emblemLayer = CoD.EmblemLayer.new( menu, controller )
	emblemLayer:setLeftRight( true, true, 0, 0 )
	emblemLayer:setTopBottom( true, true, 0, 0 )
	emblemLayer.layerIcon:setAlpha( 0.8 )
	emblemLayer:linkToElementModel( self, nil, false, function ( model )
		emblemLayer:setModel( model, controller )
	end )
	self:addElement( emblemLayer )
	self.emblemLayer = emblemLayer
	
	local arrows = CoD.EmblemLayerArrows.new( menu, controller )
	arrows:setLeftRight( true, true, 0, 0 )
	arrows:setTopBottom( true, true, 0, 0 )
	self:addElement( arrows )
	self.arrows = arrows
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 6, -5 )
	FocusBarB:setTopBottom( false, true, -9.5, -5.5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 6, -5 )
	FocusBarT:setTopBottom( true, false, 4, 8 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, 7.5, -5 )
	glitch:setTopBottom( true, false, -2, 11.5 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, 6, -6.5 )
	glitch2:setTopBottom( false, true, -14.5, 0.5 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 7.5, -8 )
	FETitleNumBrdr1:setTopBottom( false, false, -52, 52.5 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedBlur0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.BorderBakedBlur0:setScale( 1 )
				self.clipFinished( BorderBakedBlur0, {} )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedMask0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.BorderBakedMask0:setScale( 1 )
				self.clipFinished( BorderBakedMask0, {} )

				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 6, -6 )
				self.BackingGradient:setTopBottom( true, true, 6, -6 )
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setScale( 1 )
				self.clipFinished( BackingGradient, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedSolid0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.BorderBakedSolid0:setScale( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 6, -6 )
				self.BorderBaked0:setTopBottom( true, true, 6, -6 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.BorderBaked0:setScale( 1 )
				self.clipFinished( BorderBaked0, {} )

				backgroundMask:completeAnimation()
				self.backgroundMask:setScale( 1 )
				self.clipFinished( backgroundMask, {} )

				emblemLayer:completeAnimation()

				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer:setScale( 0.8 )
				self.emblemLayer.layerIcon:setAlpha( 0.8 )
				self.clipFinished( emblemLayer, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.FocusBarB:setScale( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.FocusBarT:setScale( 1 )
				self.clipFinished( FocusBarT, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.glitch:setScale( 1 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.glitch2:setScale( 1 )
				self.clipFinished( glitch2, {} )

				FETitleNumBrdr1:completeAnimation()
				self.FETitleNumBrdr1:setRGB( 1, 1, 1 )
				self.FETitleNumBrdr1:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr1, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )

				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedBlur0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.BorderBakedBlur0:setScale( 1.2 )
				self.clipFinished( BorderBakedBlur0, {} )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedMask0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedMask0:setRGB( 0.05, 0.05, 0.05 )
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 0 )
				self.BorderBakedMask0:setScale( 1.2 )
				self.clipFinished( BorderBakedMask0, {} )

				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 6, -6 )
				self.BackingGradient:setTopBottom( true, true, 6, -6 )
				self.BackingGradient:setRGB( 0.74, 0.75, 0.83 )
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setXRot( 0 )
				self.BackingGradient:setYRot( 0 )
				self.BackingGradient:setZRot( 180 )
				self.BackingGradient:setZoom( 0 )
				self.BackingGradient:setScale( 1.2 )
				self.BackingGradient:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( BackingGradient, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 3, -5 )
				self.BorderBakedSolid0:setTopBottom( true, true, 5, -4 )
				self.BorderBakedSolid0:setAlpha( 0.7 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.BorderBakedSolid0:setScale( 1.2 )
				self.clipFinished( BorderBakedSolid0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 6, -6 )
				self.BorderBaked0:setTopBottom( true, true, 6, -6 )
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.BorderBaked0:setScale( 1.2 )
				self.clipFinished( BorderBaked0, {} )

				backgroundMask:completeAnimation()
				self.backgroundMask:setAlpha( 1 )
				self.backgroundMask:setScale( 1 )
				self.clipFinished( backgroundMask, {} )

				emblemLayer:completeAnimation()

				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer:setScale( 1 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )

				arrows:completeAnimation()
				self.arrows:setZoom( 0 )
				self.clipFinished( arrows, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 3, -5 )
				self.FocusBarB:setTopBottom( false, true, 2, 6 )
				self.FocusBarB:setAlpha( 1 )
				self.FocusBarB:setScale( 1.2 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 3, -5 )
				self.FocusBarT:setTopBottom( true, false, -7, 1 )
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setScale( 1.2 )
				self.clipFinished( FocusBarT, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, 1, -3 )
				self.glitch:setTopBottom( true, false, -10, 4 )
				self.glitch:setAlpha( 1 )
				self.glitch:setScale( 1.2 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, 1, -5 )
				self.glitch2:setTopBottom( false, true, -3, 11 )
				self.glitch2:setAlpha( 1 )
				self.glitch2:setScale( 1.2 )
				self.clipFinished( glitch2, {} )

				FETitleNumBrdr1:completeAnimation()
				self.FETitleNumBrdr1:setRGB( 1, 1, 1 )
				self.FETitleNumBrdr1:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr1, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 12 )

				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedBlur0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.BorderBakedBlur0:setScale( 1 )
				self.clipFinished( BorderBakedBlur0, {} )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedMask0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.BorderBakedMask0:setScale( 1 )
				self.clipFinished( BorderBakedMask0, {} )

				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 6, -6 )
				self.BackingGradient:setTopBottom( true, true, 6, -6 )
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setScale( 1 )
				self.clipFinished( BackingGradient, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedSolid0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.BorderBakedSolid0:setScale( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 6, -6 )
				self.BorderBaked0:setTopBottom( true, true, 6, -6 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.BorderBaked0:setScale( 1 )
				self.clipFinished( BorderBaked0, {} )

				backgroundMask:completeAnimation()
				self.backgroundMask:setScale( 1 )
				self.clipFinished( backgroundMask, {} )

				emblemLayer:completeAnimation()

				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer:setScale( 0.8 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.FocusBarB:setScale( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.FocusBarT:setScale( 1 )
				self.clipFinished( FocusBarT, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.glitch:setScale( 1 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.glitch2:setScale( 1 )
				self.clipFinished( glitch2, {} )

				FETitleNumBrdr1:completeAnimation()
				self.FETitleNumBrdr1:setRGB( 1, 1, 1 )
				self.FETitleNumBrdr1:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr1, {} )
			end
		},
		EditMode_Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedBlur0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedBlur0:setAlpha( 1 )
				self.BorderBakedBlur0:setScale( 1 )
				self.clipFinished( BorderBakedBlur0, {} )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedMask0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 0 )
				self.BorderBakedMask0:setScale( 1 )
				self.clipFinished( BorderBakedMask0, {} )

				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 6, -6 )
				self.BackingGradient:setTopBottom( true, true, 6, -6 )
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setZoom( 0 )
				self.BackingGradient:setScale( 1 )
				self.clipFinished( BackingGradient, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedSolid0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedSolid0:setAlpha( 0.2 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.BorderBakedSolid0:setScale( 1 )
				self.clipFinished( BorderBakedSolid0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 7, -7 )
				self.BorderBaked0:setTopBottom( true, true, 7, -7 )
				self.BorderBaked0:setAlpha( 0.2 )
				self.BorderBaked0:setZoom( 0 )
				self.BorderBaked0:setScale( 1 )
				self.clipFinished( BorderBaked0, {} )

				backgroundMask:completeAnimation()
				self.backgroundMask:setAlpha( 1 )
				self.backgroundMask:setScale( 1 )
				self.clipFinished( backgroundMask, {} )

				emblemLayer:completeAnimation()

				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 0.25 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer:setScale( 0.8 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )

				arrows:completeAnimation()
				self.arrows:setScale( 1 )
				self.clipFinished( arrows, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 7 )

				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedBlur0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.BorderBakedBlur0:setScale( 1.2 )
				self.clipFinished( BorderBakedBlur0, {} )

				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 6, -6 )
				self.BorderBakedMask0:setTopBottom( true, true, 6, -6 )
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.BorderBakedMask0:setScale( 1.2 )
				self.clipFinished( BorderBakedMask0, {} )

				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 6, -6 )
				self.BackingGradient:setTopBottom( true, true, 6, -6 )
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setZRot( 0 )
				self.BackingGradient:setZoom( 0 )
				self.BackingGradient:setScale( 1.2 )
				self.clipFinished( BackingGradient, {} )

				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 3, -5 )
				self.BorderBakedSolid0:setTopBottom( true, true, 5, -4 )
				self.BorderBakedSolid0:setAlpha( 0.7 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.BorderBakedSolid0:setScale( 1.2 )
				self.clipFinished( BorderBakedSolid0, {} )

				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 6, -6 )
				self.BorderBaked0:setTopBottom( true, true, 6, -6 )
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 0 )
				self.BorderBaked0:setScale( 1.2 )
				self.clipFinished( BorderBaked0, {} )

				emblemLayer:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer:setScale( 1 )
				self.clipFinished( emblemLayer, {} )

				arrows:completeAnimation()
				self.arrows:setZoom( 50 )
				self.clipFinished( arrows, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedBlur0:close()
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.BorderBaked0:close()
		element.emblemLayer:close()
		element.arrows:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.FETitleNumBrdr1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

