require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerArrows" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBakedBlur0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBakedBlur0:setRGB( 1, 1, 1 )
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
	BackingGradient:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BackingGradient )
	self.BackingGradient = BackingGradient
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBakedSolid0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 7.5, -6.5 )
	BorderBaked0:setTopBottom( true, true, 7.5, -7.5 )
	BorderBaked0:setRGB( 1, 1, 1 )
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
	emblemLayer:setLeftRight( true, true, 7.5, -7.5 )
	emblemLayer:setTopBottom( true, true, 7.5, -7.5 )
	emblemLayer:setRGB( 1, 1, 1 )
	emblemLayer.background:setRGB( 1, 1, 1 )
	emblemLayer.layerIcon:setAlpha( 0.8 )
	emblemLayer:linkToElementModel( self, nil, false, function ( model )
		emblemLayer:setModel( model, controller )
	end )
	self:addElement( emblemLayer )
	self.emblemLayer = emblemLayer
	
	local arrows = CoD.EmblemLayerArrows.new( menu, controller )
	arrows:setLeftRight( true, true, 0, 0 )
	arrows:setTopBottom( true, true, 0, 0 )
	arrows:setRGB( 1, 1, 1 )
	self:addElement( arrows )
	self.arrows = arrows
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 7.5, -6.5 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 6, -5 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, 7.5, -5 )
	glitch:setTopBottom( true, false, -6, 7.5 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, 6, -6.5 )
	glitch2:setTopBottom( false, true, -8.5, 6.5 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0 )
				self.clipFinished( BackingGradient, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				emblemLayer:completeAnimation()
				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 7.5, -7.5 )
				self.emblemLayer:setTopBottom( true, true, 7.5, -7.5 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer.layerIcon:setAlpha( 0.8 )
				self.clipFinished( emblemLayer, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setRGB( 0.05, 0.05, 0.05 )
				self.BorderBakedMask0:setAlpha( 0.95 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setLeftRight( true, true, 7.5, -7.5 )
				self.BackingGradient:setTopBottom( true, true, 8.5, -7.5 )
				self.BackingGradient:setRGB( 0.74, 0.75, 0.83 )
				self.BackingGradient:setAlpha( 0.2 )
				self.BackingGradient:setXRot( 0 )
				self.BackingGradient:setYRot( 0 )
				self.BackingGradient:setZRot( 180 )
				self.BackingGradient:setZoom( 0 )
				self.BackingGradient:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( BackingGradient, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				emblemLayer:completeAnimation()
				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 7.5, -7.5 )
				self.emblemLayer:setTopBottom( true, true, 7.5, -7.5 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )
				arrows:completeAnimation()
				self.arrows:setZoom( 0 )
				self.clipFinished( arrows, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 6, -6.5 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 6, -5 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, 7.5, -5 )
				self.glitch:setTopBottom( true, false, -6, 7.5 )
				self.glitch:setAlpha( 1 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, 6, -6.5 )
				self.glitch2:setTopBottom( false, true, -8.5, 6.5 )
				self.glitch2:setAlpha( 1 )
				self.clipFinished( glitch2, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setZoom( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					BorderBakedMask0:setRGB( 0.05, 0.05, 0.05 )
					BorderBakedMask0:setAlpha( 0.95 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setRGB( 0.05, 0.05, 0.05 )
				self.BorderBakedMask0:setAlpha( 0.95 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0.2 )
				self.clipFinished( BackingGradient, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					BorderBakedSolid0:setAlpha( 0 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				emblemLayer:completeAnimation()
				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 7.5, -7.5 )
				self.emblemLayer:setTopBottom( true, true, 7.5, -7.5 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setLeftRight( true, true, 7.5, -6.5 )
					FocusBarB:setTopBottom( false, true, -4, 0 )
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 7.5, -6.5 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( true, true, 7.5, -5 )
					FocusBarT:setTopBottom( true, false, 0, 4 )
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 7.5, -5 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				glitch:setAlpha( 0 )
				glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local glitch2Frame2 = function ( glitch2, event )
					if not event.interrupted then
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					glitch2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( glitch2, event )
					else
						glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.95 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0.2 )
				self.clipFinished( BackingGradient, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				backgroundMask:completeAnimation()
				self.backgroundMask:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.backgroundMask:setShaderVector( 0, 0, 0, 0, 0 )
				self.backgroundMask:setShaderVector( 1, 0, 0, 0, 0 )
				self.backgroundMask:setShaderVector( 2, 0, 0, 0, 0 )
				self.backgroundMask:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( backgroundMask, {} )
				local emblemLayerFrame2 = function ( emblemLayer, event )
					if not event.interrupted then
						emblemLayer:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						emblemLayer.layerIcon:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
					end
					emblemLayer:setAlpha( 1 )
					emblemLayer:setZoom( 0 )
					emblemLayer.layerIcon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( emblemLayer, event )
					else
						emblemLayer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				emblemLayer:completeAnimation()
				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				emblemLayerFrame2( emblemLayer, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setLeftRight( true, true, 5, -5 )
										FocusBarB:setTopBottom( false, true, -4, 0 )
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.56 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 5, -5 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setLeftRight( true, true, 5, -5 )
										FocusBarT:setTopBottom( true, false, 0, 4 )
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.56 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 5, -5 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local glitchFrame2 = function ( glitch, event )
					if not event.interrupted then
						glitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					glitch:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( glitch, event )
					else
						glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						if not event.interrupted then
							glitch2:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						glitch2:setLeftRight( true, true, 7.5, -5 )
						glitch2:setTopBottom( false, true, -8.5, 6.5 )
						glitch2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch2, event )
						else
							glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, 7.5, -5 )
				self.glitch2:setTopBottom( false, true, -8.5, 6.5 )
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end
		},
		EditMode_Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.1 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.2 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0 )
				self.BackingGradient:setZoom( 0 )
				self.clipFinished( BackingGradient, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.12 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				backgroundMask:completeAnimation()
				self.backgroundMask:setAlpha( 0 )
				self.clipFinished( backgroundMask, {} )
				emblemLayer:completeAnimation()
				emblemLayer.layerIcon:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 7.5, -7.5 )
				self.emblemLayer:setTopBottom( true, true, 7.5, -7.5 )
				self.emblemLayer:setAlpha( 0.25 )
				self.emblemLayer:setZoom( 0 )
				self.emblemLayer.layerIcon:setAlpha( 1 )
				self.clipFinished( emblemLayer, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.95 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BackingGradient:completeAnimation()
				self.BackingGradient:setAlpha( 0.2 )
				self.BackingGradient:setZoom( 50 )
				self.clipFinished( BackingGradient, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setZoom( 50 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 1 )
				self.BorderBaked0:setZoom( 50 )
				self.clipFinished( BorderBaked0, {} )
				emblemLayer:completeAnimation()
				self.emblemLayer:setLeftRight( true, true, 0, 0 )
				self.emblemLayer:setTopBottom( true, true, 0, 0 )
				self.emblemLayer:setAlpha( 1 )
				self.emblemLayer:setZoom( 50 )
				self.clipFinished( emblemLayer, {} )
				arrows:completeAnimation()
				self.arrows:setZoom( 50 )
				self.clipFinished( arrows, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedBlur0:close()
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked0:close()
		self.emblemLayer:close()
		self.arrows:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		CoD.EmblemLayerContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

