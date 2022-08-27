-- 6085e4a234241abb7081f40d248408bb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabelCount" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

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
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
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
	
	local itemName = CoD.cac_ListButtonLabel.new( menu, controller )
	itemName:setLeftRight( true, false, 78.5, 200.5 )
	itemName:setTopBottom( true, false, 23, 43 )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 0, 65 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 63, 67 )
	itemImageLine:setTopBottom( false, false, -33, 34 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local totalPaintjobs = CoD.cac_ListButtonLabelCount.new( menu, controller )
	totalPaintjobs:setLeftRight( false, true, -76, -16 )
	totalPaintjobs:setTopBottom( false, false, -9.5, 10.5 )
	totalPaintjobs:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			totalPaintjobs.ButtonLabelCount.itemName:setText( Engine.Localize( GetPaintjobCountByWeaponIndex( itemIndex ) ) )
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
	lockedIcon:setLeftRight( true, false, 18, 42 )
	lockedIcon:setTopBottom( false, false, -18, 14 )
	lockedIcon:setAlpha( 0 )
	lockedIcon.lockedIcon:setAlpha( 0 )
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
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local Glitch = LUI.UIImage.new()
	Glitch:setLeftRight( true, true, -12, 7 )
	Glitch:setTopBottom( true, false, -8.75, 4.75 )
	Glitch:setRGB( 1, 0.09, 0 )
	Glitch:setAlpha( 0.09 )
	Glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local Glitch2 = LUI.UIImage.new()
	Glitch2:setLeftRight( true, true, -8.5, 8.5 )
	Glitch2:setTopBottom( false, true, -6, 9 )
	Glitch2:setRGB( 1, 0.09, 0 )
	Glitch2:setAlpha( 0.09 )
	Glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glitch2 )
	self.Glitch2 = Glitch2
	
	local blackMarketBackground = LUI.UIImage.new()
	blackMarketBackground:setLeftRight( true, true, 0, 0 )
	blackMarketBackground:setTopBottom( true, true, 0, 0 )
	blackMarketBackground:setRGB( 0, 0, 0 )
	blackMarketBackground:setAlpha( 0 )
	self:addElement( blackMarketBackground )
	self.blackMarketBackground = blackMarketBackground
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( false, false, -99, 99 )
	BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
	blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( true, false, 148.8, 251.8 )
	BMContractsLockBars:setTopBottom( true, false, 13.25, 48.25 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( true, false, 28.8, 132.8 )
	BMContractsLockBars0:setTopBottom( true, false, 13.25, 48.25 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( true, false, 107.25, 172.75 )
	bmContractBrandIcon:setTopBottom( true, false, -0.5, 65 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
				self.BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
				self.BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( true, true, 0, 0 )
				self.Lblur:setTopBottom( true, true, 0, 0 )
				self.clipFinished( Lblur, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Glitch:completeAnimation()
				self.Glitch:setAlpha( 0 )
				self.clipFinished( Glitch, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )
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
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
				self.BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( true, true, 0, 0 )
				self.Lblur:setTopBottom( true, true, 0, 0 )
				self.clipFinished( Lblur, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.clipFinished( itemImage, {} )
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
				self:setupElementClipCounter( 10 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setLeftRight( false, true, -1.66, -9.66 )
				self.arrowImage:setTopBottom( false, false, -10.67, 13.33 )
				self.clipFinished( arrowImage, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
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
				self:setupElementClipCounter( 7 )
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
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.clipFinished( itemImage, {} )
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
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
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
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 17 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
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
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
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
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 20 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lblur:completeAnimation()
				self.Lblur:setAlpha( 0 )
				self.clipFinished( Lblur, {} )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
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
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		NotListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
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
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.25 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 0, 65 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.2 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				Glitch2:completeAnimation()
				self.Glitch2:setAlpha( 0 )
				self.clipFinished( Glitch2, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
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
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isContractClassified" )
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
	self:linkToElementModel( self, "isContractClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.Lblur:close()
		element.itemName:close()
		element.totalPaintjobs:close()
		element.lockedIcon:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.BMGoldBarMed:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

