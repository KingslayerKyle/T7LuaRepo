require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelCount" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.PaintshopWeaponListButtonNew = InheritFrom( LUI.UIElement )
CoD.PaintshopWeaponListButtonNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopWeaponListButtonNew )
	self.id = "PaintshopWeaponListButtonNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 339 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, -74 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, -74 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Lblur = CoD.BorderBakedBlur.new( menu, controller )
	Lblur:setLeftRight( true, true, 0, -78 )
	Lblur:setTopBottom( true, true, 0, 0 )
	Lblur:setAlpha( 0.05 )
	self:addElement( Lblur )
	self.Lblur = Lblur
	
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( false, true, -1.66, -9.66 )
	arrowImage:setTopBottom( false, false, -10.67, 13.33 )
	arrowImage:setAlpha( 0 )
	arrowImage:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_list1l_focusarrow" ) )
	arrowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowImage )
	self.arrowImage = arrowImage
	
	local Lbutton = CoD.BorderBakedSolid.new( menu, controller )
	Lbutton:setLeftRight( true, true, 0, -76 )
	Lbutton:setTopBottom( true, true, 0, 0 )
	self:addElement( Lbutton )
	self.Lbutton = Lbutton
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, -76 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Glitch = LUI.UIImage.new()
	Glitch:setLeftRight( true, false, -12.16, 263 )
	Glitch:setTopBottom( true, false, -8.55, 8.55 )
	Glitch:setRGB( 1, 0.09, 0 )
	Glitch:setAlpha( 0.09 )
	Glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local FEFocusBarContainer0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainer0:setLeftRight( true, true, -1, -76 )
	FEFocusBarContainer0:setTopBottom( true, false, -3.97, 3.38 )
	FEFocusBarContainer0:setAlpha( 0 )
	self:addElement( FEFocusBarContainer0 )
	self.FEFocusBarContainer0 = FEFocusBarContainer0
	
	local Glitch2 = LUI.UIImage.new()
	Glitch2:setLeftRight( true, false, -6, 263 )
	Glitch2:setTopBottom( true, false, 52.95, 71.05 )
	Glitch2:setRGB( 1, 0.09, 0 )
	Glitch2:setAlpha( 0.09 )
	Glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch2 )
	self.Glitch2 = Glitch2
	
	local itemImageBg = LUI.UIImage.new()
	itemImageBg:setLeftRight( true, false, 0.69, 65.69 )
	itemImageBg:setTopBottom( false, false, -29.12, 30.5 )
	itemImageBg:setRGB( 0.06, 0.08, 0.1 )
	itemImageBg:setAlpha( 0.35 )
	self:addElement( itemImageBg )
	self.itemImageBg = itemImageBg
	
	local itemName = CoD.cac_ListButtonLabel.new( menu, controller )
	itemName:setLeftRight( true, false, 78.5, 164.5 )
	itemName:setTopBottom( true, false, 23.83, 43.83 )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 2, 67 )
	itemImage:setTopBottom( false, false, -30.5, 30.5 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 65, 69 )
	itemImageLine:setTopBottom( false, false, -30.5, 30.5 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1, -76 )
	FocusBarB:setTopBottom( true, false, 63, 66 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local totalPaintjobs = CoD.cac_ListButtonLabelCount.new( menu, controller )
	totalPaintjobs:setLeftRight( false, true, -126, -96 )
	totalPaintjobs:setTopBottom( false, false, -9.31, 10.69 )
	totalPaintjobs:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			totalPaintjobs.ButtonLabelCount.itemName:setText( Engine.Localize( GetPaintjobCountByWeaponIndex( modelValue ) ) )
		end
	end )
	totalPaintjobs:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Paintjobs_IsCountGreaterThanZero( element, controller )
			end
		}
	} )
	self:addElement( totalPaintjobs )
	self.totalPaintjobs = totalPaintjobs
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 20, 44 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setAlpha( 0 )
	lockedIcon.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, -76 )
				self.BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setLeftRight( true, true, -2, -76 )
				self.BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setLeftRight( true, true, 0, -76 )
				self.Lbutton:setTopBottom( true, true, 0, 0 )
				self.clipFinished( Lbutton, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				self.clipFinished( Glitch, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainer0, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				self.clipFinished( itemImageBg, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local LbuttonFrame2 = function ( Lbutton, event )
					local LbuttonFrame3 = function ( Lbutton, event )
						local LbuttonFrame4 = function ( Lbutton, event )
							local LbuttonFrame5 = function ( Lbutton, event )
								local LbuttonFrame6 = function ( Lbutton, event )
									local LbuttonFrame7 = function ( Lbutton, event )
										local LbuttonFrame8 = function ( Lbutton, event )
											if not event.interrupted then
												Lbutton:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											end
											Lbutton:setLeftRight( true, true, 0, -76 )
											Lbutton:setTopBottom( true, true, 0, 0 )
											Lbutton:setAlpha( 0.3 )
											if event.interrupted then
												self.clipFinished( Lbutton, event )
											else
												Lbutton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											LbuttonFrame8( Lbutton, event )
											return 
										else
											Lbutton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Lbutton:setAlpha( 0.7 )
											Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame8 )
										end
									end
									
									if event.interrupted then
										LbuttonFrame7( Lbutton, event )
										return 
									else
										Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Lbutton:setAlpha( 1 )
										Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame7 )
									end
								end
								
								if event.interrupted then
									LbuttonFrame6( Lbutton, event )
									return 
								else
									Lbutton:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Lbutton:setAlpha( 0 )
									Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame6 )
								end
							end
							
							if event.interrupted then
								LbuttonFrame5( Lbutton, event )
								return 
							else
								Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Lbutton:setAlpha( 0.5 )
								Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame5 )
							end
						end
						
						if event.interrupted then
							LbuttonFrame4( Lbutton, event )
							return 
						else
							Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Lbutton:setAlpha( 1 )
							Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame4 )
						end
					end
					
					if event.interrupted then
						LbuttonFrame3( Lbutton, event )
						return 
					else
						Lbutton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame3 )
					end
				end
				
				Lbutton:completeAnimation()
				self.Lbutton:setLeftRight( true, true, 0, -76 )
				self.Lbutton:setTopBottom( true, true, 0, 0 )
				self.Lbutton:setAlpha( 0 )
				LbuttonFrame2( Lbutton, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, true, 0, -76 )
				self.BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				local GlitchFrame2 = function ( Glitch, event )
					local GlitchFrame3 = function ( Glitch, event )
						local GlitchFrame4 = function ( Glitch, event )
							local GlitchFrame5 = function ( Glitch, event )
								local GlitchFrame6 = function ( Glitch, event )
									if not event.interrupted then
										Glitch:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									end
									Glitch:setLeftRight( true, false, -9, 263 )
									Glitch:setTopBottom( true, false, -9.05, 8.05 )
									Glitch:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glitch, event )
									else
										Glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlitchFrame6( Glitch, event )
									return 
								else
									Glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Glitch:setAlpha( 0.6 )
									Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame6 )
								end
							end
							
							if event.interrupted then
								GlitchFrame5( Glitch, event )
								return 
							else
								Glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glitch:setAlpha( 0.7 )
								Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame5 )
							end
						end
						
						if event.interrupted then
							GlitchFrame4( Glitch, event )
							return 
						else
							Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glitch:setAlpha( 0.5 )
							Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame4 )
						end
					end
					
					if event.interrupted then
						GlitchFrame3( Glitch, event )
						return 
					else
						Glitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glitch:setAlpha( 0.3 )
						Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame3 )
					end
				end
				
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, -9, 263 )
				self.Glitch:setTopBottom( true, false, -9.05, 8.05 )
				self.Glitch:setAlpha( 0 )
				GlitchFrame2( Glitch, {} )
				local FEFocusBarContainer0Frame2 = function ( FEFocusBarContainer0, event )
					local FEFocusBarContainer0Frame3 = function ( FEFocusBarContainer0, event )
						local FEFocusBarContainer0Frame4 = function ( FEFocusBarContainer0, event )
							local FEFocusBarContainer0Frame5 = function ( FEFocusBarContainer0, event )
								local FEFocusBarContainer0Frame6 = function ( FEFocusBarContainer0, event )
									local FEFocusBarContainer0Frame7 = function ( FEFocusBarContainer0, event )
										if not event.interrupted then
											FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FEFocusBarContainer0:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FEFocusBarContainer0, event )
										else
											FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FEFocusBarContainer0Frame7( FEFocusBarContainer0, event )
										return 
									else
										FEFocusBarContainer0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame7 )
									end
								end
								
								if event.interrupted then
									FEFocusBarContainer0Frame6( FEFocusBarContainer0, event )
									return 
								else
									FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FEFocusBarContainer0:setAlpha( 0.35 )
									FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame6 )
								end
							end
							
							if event.interrupted then
								FEFocusBarContainer0Frame5( FEFocusBarContainer0, event )
								return 
							else
								FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FEFocusBarContainer0:setAlpha( 0.55 )
								FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							FEFocusBarContainer0Frame4( FEFocusBarContainer0, event )
							return 
						else
							FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FEFocusBarContainer0:setAlpha( 0.56 )
							FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						FEFocusBarContainer0Frame3( FEFocusBarContainer0, event )
						return 
					else
						FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame3 )
					end
				end
				
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				FEFocusBarContainer0Frame2( FEFocusBarContainer0, {} )
				local Glitch2Frame2 = function ( Glitch2, event )
					local Glitch2Frame3 = function ( Glitch2, event )
						local Glitch2Frame4 = function ( Glitch2, event )
							local Glitch2Frame5 = function ( Glitch2, event )
								local Glitch2Frame6 = function ( Glitch2, event )
									if not event.interrupted then
										Glitch2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									end
									Glitch2:setLeftRight( true, false, -13, 263 )
									Glitch2:setTopBottom( true, false, 52.83, 71.93 )
									Glitch2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glitch2, event )
									else
										Glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glitch2Frame6( Glitch2, event )
									return 
								else
									Glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Glitch2:setAlpha( 0.6 )
									Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								Glitch2Frame5( Glitch2, event )
								return 
							else
								Glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glitch2:setAlpha( 0.5 )
								Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							Glitch2Frame4( Glitch2, event )
							return 
						else
							Glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glitch2:setAlpha( 0.3 )
							Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						Glitch2Frame3( Glitch2, event )
						return 
					else
						Glitch2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glitch2:setAlpha( 0.01 )
						Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame3 )
					end
				end
				
				Glitch2:completeAnimation()
				self.Glitch2:setLeftRight( true, false, -13, 263 )
				self.Glitch2:setTopBottom( true, false, 52.83, 71.93 )
				self.Glitch2:setAlpha( 0 )
				Glitch2Frame2( Glitch2, {} )
				local itemImageBgFrame2 = function ( itemImageBg, event )
					if not event.interrupted then
						itemImageBg:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					itemImageBg:setAlpha( 0 )
					itemImageBg:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 1 )
				self.itemImageBg:setZoom( 0 )
				itemImageBgFrame2( itemImageBg, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 1 )
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
								FocusBarB:setAlpha( 0.35 )
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
						FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				self.nextClip = "GainFocus"
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setLeftRight( false, true, -1.66, -9.66 )
				self.arrowImage:setTopBottom( false, false, -10.67, 13.33 )
				self.clipFinished( arrowImage, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setZoom( 0 )
				self.clipFinished( Lbutton, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0.7 )
				self.clipFinished( Glitch, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainer0, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 2, 67 )
				self.itemImage:setTopBottom( false, false, -30.5, 30.5 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setLeftRight( true, false, 65, 69 )
				self.itemImageLine:setTopBottom( false, false, -30.5, 30.5 )
				self.clipFinished( itemImageLine, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local LblurFrame2 = function ( Lblur, event )
					if not event.interrupted then
						Lblur:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Lblur:setLeftRight( true, true, 0, -78 )
					Lblur:setTopBottom( true, true, 0, 0 )
					Lblur:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Lblur, event )
					else
						Lblur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( true, true, 0, -78 )
				self.Lblur:setTopBottom( true, true, 0, 0 )
				self.Lblur:setZoom( 0 )
				LblurFrame2( Lblur, {} )
				local LbuttonFrame2 = function ( Lbutton, event )
					if not event.interrupted then
						Lbutton:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Back )
					end
					Lbutton:setAlpha( 0.3 )
					Lbutton:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Lbutton, event )
					else
						Lbutton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 1 )
				self.Lbutton:setZoom( 0 )
				LbuttonFrame2( Lbutton, {} )
				local GlitchFrame2 = function ( Glitch, event )
					local GlitchFrame3 = function ( Glitch, event )
						local GlitchFrame4 = function ( Glitch, event )
							local GlitchFrame5 = function ( Glitch, event )
								local GlitchFrame6 = function ( Glitch, event )
									local GlitchFrame7 = function ( Glitch, event )
										local GlitchFrame8 = function ( Glitch, event )
											local GlitchFrame9 = function ( Glitch, event )
												if not event.interrupted then
													Glitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												end
												Glitch:setLeftRight( true, false, -12.16, 263 )
												Glitch:setTopBottom( true, false, -8.55, 8.55 )
												Glitch:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glitch, event )
												else
													Glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlitchFrame9( Glitch, event )
												return 
											else
												Glitch:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Glitch:setLeftRight( true, false, -12.16, 263 )
												Glitch:setAlpha( 0.28 )
												Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame9 )
											end
										end
										
										if event.interrupted then
											GlitchFrame8( Glitch, event )
											return 
										else
											Glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Glitch:setLeftRight( true, false, -12.16, 271 )
											Glitch:setAlpha( 0.56 )
											Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame8 )
										end
									end
									
									if event.interrupted then
										GlitchFrame7( Glitch, event )
										return 
									else
										Glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Glitch:setLeftRight( true, false, -12.16, 290.59 )
										Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame7 )
									end
								end
								
								if event.interrupted then
									GlitchFrame6( Glitch, event )
									return 
								else
									Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glitch:setLeftRight( true, false, -12.16, 329.76 )
									Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame6 )
								end
							end
							
							if event.interrupted then
								GlitchFrame5( Glitch, event )
								return 
							else
								Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glitch:setLeftRight( true, false, -12.16, 349.34 )
								Glitch:setAlpha( 0 )
								Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame5 )
							end
						end
						
						if event.interrupted then
							GlitchFrame4( Glitch, event )
							return 
						else
							Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glitch:setLeftRight( true, false, -10.5, 306.17 )
							Glitch:setAlpha( 0.28 )
							Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame4 )
						end
					end
					
					if event.interrupted then
						GlitchFrame3( Glitch, event )
						return 
					else
						Glitch:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
						Glitch:setLeftRight( true, false, -8.83, 263 )
						Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame3 )
					end
				end
				
				Glitch:completeAnimation()
				self.Glitch:setLeftRight( true, false, -7.16, 263 )
				self.Glitch:setTopBottom( true, false, -8.55, 8.55 )
				self.Glitch:setAlpha( 0 )
				GlitchFrame2( Glitch, {} )
				local FEFocusBarContainer0Frame2 = function ( FEFocusBarContainer0, event )
					if not event.interrupted then
						FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					FEFocusBarContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEFocusBarContainer0, event )
					else
						FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 1 )
				FEFocusBarContainer0Frame2( FEFocusBarContainer0, {} )
				local Glitch2Frame2 = function ( Glitch2, event )
					local Glitch2Frame3 = function ( Glitch2, event )
						local Glitch2Frame4 = function ( Glitch2, event )
							local Glitch2Frame5 = function ( Glitch2, event )
								local Glitch2Frame6 = function ( Glitch2, event )
									local Glitch2Frame7 = function ( Glitch2, event )
										local Glitch2Frame8 = function ( Glitch2, event )
											if not event.interrupted then
												Glitch2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											Glitch2:setLeftRight( true, false, -6, 263 )
											Glitch2:setTopBottom( true, false, 52.95, 71.05 )
											Glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Glitch2, event )
											else
												Glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Glitch2Frame8( Glitch2, event )
											return 
										else
											Glitch2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glitch2:setLeftRight( true, false, -6, 263 )
											Glitch2:setAlpha( 0.28 )
											Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										Glitch2Frame7( Glitch2, event )
										return 
									else
										Glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glitch2:setLeftRight( true, false, -6, 266.29 )
										Glitch2:setAlpha( 0.56 )
										Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									Glitch2Frame6( Glitch2, event )
									return 
								else
									Glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glitch2:setLeftRight( true, false, -6, 287.22 )
									Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								Glitch2Frame5( Glitch2, event )
								return 
							else
								Glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Glitch2:setLeftRight( true, false, -6, 308.15 )
								Glitch2:setAlpha( 0 )
								Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							Glitch2Frame4( Glitch2, event )
							return 
						else
							Glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glitch2:setLeftRight( true, false, -6, 350.01 )
							Glitch2:setAlpha( 0.18 )
							Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						Glitch2Frame3( Glitch2, event )
						return 
					else
						Glitch2:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
						Glitch2:setLeftRight( true, false, -2.67, 261 )
						Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame3 )
					end
				end
				
				Glitch2:completeAnimation()
				self.Glitch2:setLeftRight( true, false, -1, 263 )
				self.Glitch2:setTopBottom( true, false, 52.95, 71.05 )
				self.Glitch2:setAlpha( 0 )
				Glitch2Frame2( Glitch2, {} )
				local itemImageBgFrame2 = function ( itemImageBg, event )
					if not event.interrupted then
						itemImageBg:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Back )
					end
					itemImageBg:setLeftRight( true, false, 0.69, 65.69 )
					itemImageBg:setTopBottom( false, false, -29.12, 30.5 )
					itemImageBg:setRGB( 0.06, 0.08, 0.1 )
					itemImageBg:setAlpha( 0.35 )
					itemImageBg:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setLeftRight( true, false, 0.69, 65.69 )
				self.itemImageBg:setTopBottom( false, false, -29.12, 30.5 )
				self.itemImageBg:setRGB( 0.06, 0.08, 0.1 )
				self.itemImageBg:setAlpha( 0.35 )
				self.itemImageBg:setZoom( 0 )
				itemImageBgFrame2( itemImageBg, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.13 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 0 )
				self.clipFinished( itemImageBg, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0.1 )
				self.clipFinished( itemImageLine, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NotListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0.05 )
				self.clipFinished( Lblur, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 0.15 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainer0, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 0.17 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.25 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.2 )
				self.clipFinished( itemImage, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return Gunsmith_IsLockedForDemo( menu, element, controller )
			end
		},
		{
			stateName = "NotListFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.Lblur:close()
		self.Lbutton:close()
		self.BoxButtonLrgIdle:close()
		self.FEFocusBarContainer0:close()
		self.itemName:close()
		self.FocusBarB:close()
		self.totalPaintjobs:close()
		self.lockedIcon:close()
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

