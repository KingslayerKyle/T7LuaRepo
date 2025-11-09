require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Common.common_ButtonLabel_01" )

CoD.FileshareCategoriesSelectorListItem = InheritFrom( LUI.UIElement )
CoD.FileshareCategoriesSelectorListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareCategoriesSelectorListItem )
	self.id = "FileshareCategoriesSelectorListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 50 )
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
	
	local itemImageSolid = LUI.UIImage.new()
	itemImageSolid:setLeftRight( true, false, 0, 65 )
	itemImageSolid:setTopBottom( true, true, 0, 0 )
	itemImageSolid:setRGB( 0, 0, 0 )
	itemImageSolid:setAlpha( 0 )
	self:addElement( itemImageSolid )
	self.itemImageSolid = itemImageSolid
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 64, 68 )
	itemImageLine:setTopBottom( false, false, -25, 25 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
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
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local CategoryIconBg = LUI.UIImage.new()
	CategoryIconBg:setLeftRight( true, false, 0, 65 )
	CategoryIconBg:setTopBottom( true, false, 0, 50 )
	CategoryIconBg:setRGB( 0.18, 0.18, 0.18 )
	CategoryIconBg:setAlpha( 0 )
	self:addElement( CategoryIconBg )
	self.CategoryIconBg = CategoryIconBg
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( true, false, 12.5, 52.5 )
	CategoryIcon:setTopBottom( true, false, 5, 45 )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local DimCoverImage = LUI.UIImage.new()
	DimCoverImage:setLeftRight( true, false, 0, 280 )
	DimCoverImage:setTopBottom( true, false, 0, 50 )
	DimCoverImage:setRGB( 0, 0, 0 )
	DimCoverImage:setAlpha( 0.2 )
	self:addElement( DimCoverImage )
	self.DimCoverImage = DimCoverImage
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, true, -23.14, -10.5 )
	Arrow:setTopBottom( false, false, -5.82, 6.82 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local commonButtonLabel = CoD.common_ButtonLabel_01.new( menu, controller )
	commonButtonLabel:setLeftRight( true, false, 82, 256.86 )
	commonButtonLabel:setTopBottom( true, false, 15.5, 35.5 )
	self:addElement( commonButtonLabel )
	self.commonButtonLabel = commonButtonLabel
	
	self.CategoryIcon:linkToElementModel( self, "displayImage", true, function ( model )
		local displayImage = Engine.GetModelValue( model )
		if displayImage then
			CategoryIcon:setImage( RegisterImage( displayImage ) )
		end
	end )
	self.commonButtonLabel:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			commonButtonLabel.itemName:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.3 )
				self.clipFinished( itemImageLine, {} )
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
				DimCoverImage:completeAnimation()
				self.DimCoverImage:setAlpha( 0 )
				self.clipFinished( DimCoverImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.5 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.48 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.37 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.5 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.48 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.37 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						if not event.interrupted then
							glitch:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						glitch:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch, event )
						else
							glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 0.43 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						if not event.interrupted then
							glitch2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
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
						glitch2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0.43 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.37 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.48 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.5 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.37 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.48 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.5 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						if not event.interrupted then
							glitch:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						glitch:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch, event )
						else
							glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 0.43 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						if not event.interrupted then
							glitch2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
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
						glitch2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0.43 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
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
				DimCoverImage:completeAnimation()
				self.DimCoverImage:setAlpha( 0.4 )
				self.clipFinished( DimCoverImage, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 3 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				DimCoverImage:completeAnimation()
				self.DimCoverImage:setAlpha( 0 )
				self.clipFinished( DimCoverImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.commonButtonLabel:close()
		element.CategoryIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

