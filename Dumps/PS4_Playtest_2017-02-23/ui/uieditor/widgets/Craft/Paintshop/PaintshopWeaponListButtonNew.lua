require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelCount" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Lblur = CoD.BorderBakedBlur.new( menu, controller )
	Lblur:setLeftRight( 0, 1, 0, -116 )
	Lblur:setTopBottom( 0, 1, 0, 0 )
	Lblur:setAlpha( 0.05 )
	self:addElement( Lblur )
	self.Lblur = Lblur
	
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( 1, 1, -2, -14 )
	arrowImage:setTopBottom( 0.5, 0.5, -16, 20 )
	arrowImage:setAlpha( 0 )
	arrowImage:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_list1l_focusarrow" ) )
	arrowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowImage )
	self.arrowImage = arrowImage
	
	local itemName = CoD.cac_ListButtonLabel.new( menu, controller )
	itemName:setLeftRight( 0, 0, 118, 247 )
	itemName:setTopBottom( 0, 0, 35, 65 )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0, 0, 0, 98 )
	itemImage:setTopBottom( 0, 1, 0, 0 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( 0, 0, 95, 101 )
	itemImageLine:setTopBottom( 0.5, 0.5, -49, 51 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local totalPaintjobs = CoD.cac_ListButtonLabelCount.new( menu, controller )
	totalPaintjobs:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Paintjobs_IsCountGreaterThanZero( element, controller )
			end
		}
	} )
	totalPaintjobs:setLeftRight( 1, 1, -180, -24 )
	totalPaintjobs:setTopBottom( 0.5, 0.5, -14, 16 )
	totalPaintjobs:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			totalPaintjobs.ButtonLabelCount.itemName:setText( Engine.Localize( GetPaintjobCountByWeaponIndex( modelValue ) ) )
		end
	end )
	self:addElement( totalPaintjobs )
	self.totalPaintjobs = totalPaintjobs
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0, 0, 27, 63 )
	lockedIcon:setTopBottom( 0.5, 0.5, -27, 21 )
	lockedIcon:setAlpha( 0 )
	lockedIcon.lockedIcon:setAlpha( 0 )
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
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Glitch = LUI.UIImage.new()
	Glitch:setLeftRight( 0, 1, -18, 10 )
	Glitch:setTopBottom( 0, 0, -13, 7 )
	Glitch:setRGB( 1, 0.09, 0 )
	Glitch:setAlpha( 0.09 )
	Glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local Glitch2 = LUI.UIImage.new()
	Glitch2:setLeftRight( 0, 1, -13, 13 )
	Glitch2:setTopBottom( 1, 1, -9, 13 )
	Glitch2:setRGB( 1, 0.09, 0 )
	Glitch2:setAlpha( 0.09 )
	Glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch2 )
	self.Glitch2 = Glitch2
	
	local blackMarketBackground = LUI.UIImage.new()
	blackMarketBackground:setLeftRight( 0, 1, 0, 0 )
	blackMarketBackground:setTopBottom( 0, 1, 0, 0 )
	blackMarketBackground:setRGB( 0, 0, 0 )
	blackMarketBackground:setAlpha( 0 )
	self:addElement( blackMarketBackground )
	self.blackMarketBackground = blackMarketBackground
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0.5, 0.5, -148.5, 148.5 )
	BMGoldBarMed:setTopBottom( 0.5, 0.5, -10, 10 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setTopBottom( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	self.resetProperties = function ()
		Glitch2:completeAnimation()
		Glitch:completeAnimation()
		Lblur:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		itemName:completeAnimation()
		itemImage:completeAnimation()
		itemImageLine:completeAnimation()
		totalPaintjobs:completeAnimation()
		blackMarketBackground:completeAnimation()
		BMGoldBarMed:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		lockedIcon:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		Glitch2:setAlpha( 0.09 )
		Glitch:setAlpha( 0.09 )
		Lblur:setLeftRight( 0, 1, 0, -116 )
		Lblur:setTopBottom( 0, 1, 0, 0 )
		Lblur:setAlpha( 0.05 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BoxButtonLrgInactive:setAlpha( 0 )
		BoxButtonLrgIdle:setAlpha( 1 )
		itemName:setAlpha( 1 )
		itemImage:setAlpha( 1 )
		itemImageLine:setAlpha( 0.3 )
		totalPaintjobs:setAlpha( 1 )
		blackMarketBackground:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
		lockedIcon:setAlpha( 0 )
		BoxButtonLrgInactiveDiag:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( 0, 1, 0, 0 )
				self.Lblur:setTopBottom( 0, 1, 0, 0 )
				self.clipFinished( Lblur, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				self.clipFinished( Glitch, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
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
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( 0, 1, 0, 0 )
				self.Lblur:setTopBottom( 0, 1, 0, 0 )
				self.clipFinished( Lblur, {} )
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
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
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
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.55 )
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
						FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local GlitchFrame2 = function ( Glitch, event )
					local GlitchFrame3 = function ( Glitch, event )
						local GlitchFrame4 = function ( Glitch, event )
							local GlitchFrame5 = function ( Glitch, event )
								local GlitchFrame6 = function ( Glitch, event )
									if not event.interrupted then
										Glitch:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									end
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
				self.Glitch:setAlpha( 0 )
				GlitchFrame2( Glitch, {} )
				local Glitch2Frame2 = function ( Glitch2, event )
					local Glitch2Frame3 = function ( Glitch2, event )
						local Glitch2Frame4 = function ( Glitch2, event )
							local Glitch2Frame5 = function ( Glitch2, event )
								local Glitch2Frame6 = function ( Glitch2, event )
									if not event.interrupted then
										Glitch2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									end
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
				self.Glitch2:setAlpha( 0 )
				Glitch2Frame2( Glitch2, {} )
				self.nextClip = "GainFocus"
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0.7 )
				self.clipFinished( Glitch, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
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
				Lblur:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				Lblur:setLeftRight( 0, 1, 0, -116 )
				Lblur:setTopBottom( 0, 1, 0, 0 )
				Lblur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local GlitchFrame2 = function ( Glitch, event )
					local GlitchFrame3 = function ( Glitch, event )
						local GlitchFrame4 = function ( Glitch, event )
							local GlitchFrame5 = function ( Glitch, event )
								local GlitchFrame6 = function ( Glitch, event )
									local GlitchFrame7 = function ( Glitch, event )
										local GlitchFrame8 = function ( Glitch, event )
											if not event.interrupted then
												Glitch:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											end
											Glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Glitch, event )
											else
												Glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlitchFrame8( Glitch, event )
											return 
										else
											Glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Glitch:setAlpha( 0.56 )
											Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame8 )
										end
									end
									
									if event.interrupted then
										GlitchFrame7( Glitch, event )
										return 
									else
										Glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame7 )
									end
								end
								
								if event.interrupted then
									GlitchFrame6( Glitch, event )
									return 
								else
									Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame6 )
								end
							end
							
							if event.interrupted then
								GlitchFrame5( Glitch, event )
								return 
							else
								Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glitch:setAlpha( 0 )
								Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame5 )
							end
						end
						
						if event.interrupted then
							GlitchFrame4( Glitch, event )
							return 
						else
							Glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glitch:setAlpha( 0.28 )
							Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame4 )
						end
					end
					
					if event.interrupted then
						GlitchFrame3( Glitch, event )
						return 
					else
						Glitch:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
						Glitch:registerEventHandler( "transition_complete_keyframe", GlitchFrame3 )
					end
				end
				
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				GlitchFrame2( Glitch, {} )
				local Glitch2Frame2 = function ( Glitch2, event )
					local Glitch2Frame3 = function ( Glitch2, event )
						local Glitch2Frame4 = function ( Glitch2, event )
							local Glitch2Frame5 = function ( Glitch2, event )
								local Glitch2Frame6 = function ( Glitch2, event )
									local Glitch2Frame7 = function ( Glitch2, event )
										if not event.interrupted then
											Glitch2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										Glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Glitch2, event )
										else
											Glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Glitch2Frame7( Glitch2, event )
										return 
									else
										Glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glitch2:setAlpha( 0.56 )
										Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									Glitch2Frame6( Glitch2, event )
									return 
								else
									Glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								Glitch2Frame5( Glitch2, event )
								return 
							else
								Glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Glitch2:setAlpha( 0 )
								Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							Glitch2Frame4( Glitch2, event )
							return 
						else
							Glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glitch2:setAlpha( 0.18 )
							Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						Glitch2Frame3( Glitch2, event )
						return 
					else
						Glitch2:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
						Glitch2:registerEventHandler( "transition_complete_keyframe", Glitch2Frame3 )
					end
				end
				
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				Glitch2Frame2( Glitch2, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				totalPaintjobs:completeAnimation()
				self.totalPaintjobs:setAlpha( 0 )
				self.clipFinished( totalPaintjobs, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				self.clipFinished( Glitch, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setAlpha( 0 )
				self.clipFinished( itemImageLine, {} )
				totalPaintjobs:completeAnimation()
				self.totalPaintjobs:setAlpha( 0 )
				self.clipFinished( totalPaintjobs, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				self.clipFinished( Glitch, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				blackMarketBackground:completeAnimation()
				self.blackMarketBackground:setAlpha( 1 )
				self.clipFinished( blackMarketBackground, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.13 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NotListFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.25 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.2 )
				self.clipFinished( itemImage, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
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
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.Lblur:close()
		self.itemName:close()
		self.totalPaintjobs:close()
		self.lockedIcon:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.BMGoldBarMed:close()
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

