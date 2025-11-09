require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )

CoD.EmblemIconNew = InheritFrom( LUI.UIElement )
CoD.EmblemIconNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemIconNew )
	self.id = "EmblemIconNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 0, 1 )
	BorderBakedBlur0:setTopBottom( true, true, 0, 0 )
	BorderBakedBlur0:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 1 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 1 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 1 )
	BoxButtonLrgInactive:setTopBottom( true, true, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 1, -1 )
	bgImage:setTopBottom( true, true, 1, -1 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, false, 0, 96 )
	BMGoldBarMed:setTopBottom( true, false, 38.75, 54.75 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -31.5, 31.5 )
	blackMarketBrandIcon:setTopBottom( true, false, 16.5, 79.5 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 0, 1 )
	BorderBaked0:setTopBottom( true, true, 0, 0 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 2, -2 )
	backgroundMask:setTopBottom( true, true, 2, -2 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local drawPaintshop = LUI.UIElement.new()
	drawPaintshop:setLeftRight( true, true, 4, -4 )
	drawPaintshop:setTopBottom( true, true, 4, -4 )
	drawPaintshop:setAlpha( 0 )
	drawPaintshop:linkToElementModel( self, "iconID", true, function ( model )
		local iconID = Engine.GetModelValue( model )
		if iconID then
			drawPaintshop:setupDrawDecalById( iconID )
		end
	end )
	self:addElement( drawPaintshop )
	self.drawPaintshop = drawPaintshop
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, false, -54, 54 )
	IconNew:setTopBottom( false, false, -11.5, 12.5 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 0.8 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 1 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							if not event.interrupted then
								FocusBarB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							FocusBarB:setLeftRight( true, true, 2, -2 )
							FocusBarB:setTopBottom( false, true, -4, 0 )
							FocusBarB:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FocusBarB, event )
							else
								FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 1 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.5 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 2, -2 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							if not event.interrupted then
								FocusBarT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							FocusBarT:setLeftRight( true, true, 2, -2 )
							FocusBarT:setTopBottom( true, false, 0, 4 )
							FocusBarT:setAlpha( 0.97 )
							if event.interrupted then
								self.clipFinished( FocusBarT, event )
							else
								FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.97 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.51 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 2, -2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setZoom( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 1 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarB, event )
								else
									FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.56 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.35 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								if not event.interrupted then
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarT:setAlpha( 0 )
								FocusBarT:setYRot( 0 )
								FocusBarT:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarT, event )
								else
									FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.56 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.35 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setYRot( 0 )
				self.FocusBarT:setZoom( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					local BoxButtonLrgInactiveFrame3 = function ( BoxButtonLrgInactive, event )
						local BoxButtonLrgInactiveFrame4 = function ( BoxButtonLrgInactive, event )
							local BoxButtonLrgInactiveFrame5 = function ( BoxButtonLrgInactive, event )
								if not event.interrupted then
									BoxButtonLrgInactive:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								BoxButtonLrgInactive:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BoxButtonLrgInactive, event )
								else
									BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BoxButtonLrgInactiveFrame5( BoxButtonLrgInactive, event )
								return 
							else
								BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BoxButtonLrgInactive:setAlpha( 0 )
								BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame5 )
							end
						end
						
						if event.interrupted then
							BoxButtonLrgInactiveFrame4( BoxButtonLrgInactive, event )
							return 
						else
							BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							BoxButtonLrgInactive:setAlpha( 1 )
							BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame4 )
						end
					end
					
					if event.interrupted then
						BoxButtonLrgInactiveFrame3( BoxButtonLrgInactive, event )
						return 
					else
						BoxButtonLrgInactive:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						BoxButtonLrgInactive:setAlpha( 0.35 )
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame3 )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 0, 1 )
				self.BorderBaked0:setTopBottom( true, true, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 0.8 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0.35 )
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
										FocusBarB:setAlpha( 0.56 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.35 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0.35 )
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
										FocusBarT:setAlpha( 0.56 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
				self.BoxButtonLrgInactive:setTopBottom( true, true, 0, 0 )
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setLeftRight( true, true, 2, -2 )
				self.bgImage:setTopBottom( true, true, 2, -2 )
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( true, false, 0, 96 )
				self.BMGoldBarMed:setTopBottom( true, false, 38.75, 54.75 )
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 0 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				local BMGoldBarMedFrame2 = function ( BMGoldBarMed, event )
					if not event.interrupted then
						BMGoldBarMed:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					BMGoldBarMed:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMGoldBarMed, event )
					else
						BMGoldBarMed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				BMGoldBarMedFrame2( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.clipFinished( BorderBaked0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setZoom( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarB, event )
								else
									FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.56 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.35 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								if not event.interrupted then
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarT:setAlpha( 0 )
								FocusBarT:setYRot( 0 )
								FocusBarT:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarT, event )
								else
									FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.65 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.35 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setYRot( 0 )
				self.FocusBarT:setZoom( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					local BoxButtonLrgInactiveFrame3 = function ( BoxButtonLrgInactive, event )
						local BoxButtonLrgInactiveFrame4 = function ( BoxButtonLrgInactive, event )
							local BoxButtonLrgInactiveFrame5 = function ( BoxButtonLrgInactive, event )
								if not event.interrupted then
									BoxButtonLrgInactive:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								BoxButtonLrgInactive:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BoxButtonLrgInactive, event )
								else
									BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BoxButtonLrgInactiveFrame5( BoxButtonLrgInactive, event )
								return 
							else
								BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BoxButtonLrgInactive:setAlpha( 0 )
								BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame5 )
							end
						end
						
						if event.interrupted then
							BoxButtonLrgInactiveFrame4( BoxButtonLrgInactive, event )
							return 
						else
							BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							BoxButtonLrgInactive:setAlpha( 1 )
							BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame4 )
						end
					end
					
					if event.interrupted then
						BoxButtonLrgInactiveFrame3( BoxButtonLrgInactive, event )
						return 
					else
						BoxButtonLrgInactive:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						BoxButtonLrgInactive:setAlpha( 0.35 )
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame3 )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				local BMGoldBarMedFrame2 = function ( BMGoldBarMed, event )
					if not event.interrupted then
						BMGoldBarMed:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					BMGoldBarMed:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMGoldBarMed, event )
					else
						BMGoldBarMed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.65 )
				BMGoldBarMedFrame2( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 0, 1 )
				self.BorderBaked0:setTopBottom( true, true, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0.35 )
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
										FocusBarB:setAlpha( 0.56 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.35 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0.35 )
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
										FocusBarT:setAlpha( 0.56 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 0.8 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 1 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							if not event.interrupted then
								FocusBarB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							FocusBarB:setLeftRight( true, true, 2, -2 )
							FocusBarB:setTopBottom( false, true, -4, 0 )
							FocusBarB:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FocusBarB, event )
							else
								FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 1 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.5 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 2, -2 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							if not event.interrupted then
								FocusBarT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							FocusBarT:setLeftRight( true, true, 2, -2 )
							FocusBarT:setTopBottom( true, false, 0, 4 )
							FocusBarT:setAlpha( 0.97 )
							if event.interrupted then
								self.clipFinished( FocusBarT, event )
							else
								FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.97 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.51 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 2, -2 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setZoom( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0.7 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 1 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarB, event )
								else
									FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.56 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.35 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								if not event.interrupted then
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								FocusBarT:setAlpha( 0 )
								FocusBarT:setYRot( 0 )
								FocusBarT:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarT, event )
								else
									FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.56 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.35 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.FocusBarT:setYRot( 0 )
				self.FocusBarT:setZoom( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					local BoxButtonLrgInactiveFrame3 = function ( BoxButtonLrgInactive, event )
						local BoxButtonLrgInactiveFrame4 = function ( BoxButtonLrgInactive, event )
							local BoxButtonLrgInactiveFrame5 = function ( BoxButtonLrgInactive, event )
								if not event.interrupted then
									BoxButtonLrgInactive:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								BoxButtonLrgInactive:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BoxButtonLrgInactive, event )
								else
									BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BoxButtonLrgInactiveFrame5( BoxButtonLrgInactive, event )
								return 
							else
								BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BoxButtonLrgInactive:setAlpha( 0 )
								BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame5 )
							end
						end
						
						if event.interrupted then
							BoxButtonLrgInactiveFrame4( BoxButtonLrgInactive, event )
							return 
						else
							BoxButtonLrgInactive:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							BoxButtonLrgInactive:setAlpha( 1 )
							BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame4 )
						end
					end
					
					if event.interrupted then
						BoxButtonLrgInactiveFrame3( BoxButtonLrgInactive, event )
						return 
					else
						BoxButtonLrgInactive:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						BoxButtonLrgInactive:setAlpha( 0.35 )
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", BoxButtonLrgInactiveFrame3 )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( true, true, 0, 1 )
				self.BorderBaked0:setTopBottom( true, true, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				drawPaintshop:completeAnimation()
				self.drawPaintshop:setAlpha( 0.8 )
				self.drawPaintshop:setZoom( 0 )
				self.clipFinished( drawPaintshop, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0.35 )
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
										FocusBarB:setAlpha( 0.56 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.35 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0.35 )
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
										FocusBarT:setAlpha( 0.56 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Emblems_IsIconNew( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "iconID", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "iconID"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedBlur0:close()
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.BoxButtonLrgInactive:close()
		element.BMGoldBarMed:close()
		element.BorderBaked0:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.IconNew:close()
		element.drawPaintshop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

