require( "ui.uieditor.widgets.CharacterCustomization.ChooseContractCharacterLoadoutCarouselItem_Internal" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_SideBet" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Back" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Blackjack.ChooseCharacterLoadoutCarouselItem_BlackJack_Frame" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_preventFromBeingCurrentMouseFocus = true
	f1_arg0.disabledAllowNav = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0, f2_local1 = f2_arg0:getLocalSize()
	f2_arg0.getWidthInList = function ()
		if f2_arg0.gridInfoTable then
			if f2_arg0.gridInfoTable.parentGrid.activeWidget == f2_arg0 then
				return f2_local0
			else
				return 90
			end
		else
			
		end
	end
	
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

CoD.ChooseContractCharacterLoadoutCarouselItem = InheritFrom( LUI.UIElement )
CoD.ChooseContractCharacterLoadoutCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseContractCharacterLoadoutCarouselItem )
	self.id = "ChooseContractCharacterLoadoutCarouselItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.ChooseContractCharacterLoadoutCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( true, true, 0, 0 )
	item:setTopBottom( true, true, 30, -30 )
	item.border:setRGB( 0.29, 0.29, 0.29 )
	item.infoArea:setAlpha( 0 )
	item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	item:linkToElementModel( self, nil, false, function ( model )
		item:setModel( model, controller )
	end )
	item:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		HeroLoadoutPreviewChange( element, controller )
		SetSpecialistAsOld( self, element, controller )
		return f6_local0
	end )
	item:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		ClearNavigationTable( element )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( item )
	self.item = item
	
	local contractChallenges = CoD.ChooseCharacterLoadoutCarouselItem_SideBet.new( menu, controller )
	contractChallenges:setLeftRight( true, true, 0, 0 )
	contractChallenges:setTopBottom( true, true, 0, 0 )
	contractChallenges:setAlpha( 0 )
	contractChallenges:linkToElementModel( self, nil, false, function ( model )
		contractChallenges:setModel( model, controller )
	end )
	contractChallenges:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		ClearNavigationTable( element )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	contractChallenges:mergeStateConditions( {
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( contractChallenges )
	self.contractChallenges = contractChallenges
	
	local back = CoD.ChooseCharacterLoadoutCarouselItem_Back.new( menu, controller )
	back:setLeftRight( true, true, 0, 0 )
	back:setTopBottom( true, true, 0, 0 )
	back:setAlpha( 0 )
	back:linkToElementModel( self, nil, false, function ( model )
		back:setModel( model, controller )
	end )
	back:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		ClearNavigationTable( element )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	back:mergeStateConditions( {
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	back:linkToElementModel( back, nil, true, function ( model )
		menu:updateElementState( back, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( back )
	self.back = back
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarB0:setTopBottom( false, false, 70, 74 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarB00 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB00:setLeftRight( false, false, -45.5, 45.5 )
	FocusBarB00:setTopBottom( false, false, -210, -214 )
	FocusBarB00:setAlpha( 0 )
	FocusBarB00:setZRot( -180 )
	FocusBarB00:setZoom( 1 )
	self:addElement( FocusBarB00 )
	self.FocusBarB00 = FocusBarB00
	
	local BackTopAndBottom0 = LUI.UIImage.new()
	BackTopAndBottom0:setLeftRight( true, false, -3, 822 )
	BackTopAndBottom0:setTopBottom( true, false, -49, 505 )
	BackTopAndBottom0:setAlpha( 0 )
	BackTopAndBottom0:setZoom( 20 )
	BackTopAndBottom0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_backimg2" ) )
	self:addElement( BackTopAndBottom0 )
	self.BackTopAndBottom0 = BackTopAndBottom0
	
	local FrontTopAndBottom = LUI.UIImage.new()
	FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
	FrontTopAndBottom:setTopBottom( true, false, -49, 505 )
	FrontTopAndBottom:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_frame_img" ) )
	self:addElement( FrontTopAndBottom )
	self.FrontTopAndBottom = FrontTopAndBottom
	
	local Frame = CoD.ChooseCharacterLoadoutCarouselItem_BlackJack_Frame.new( menu, controller )
	Frame:setLeftRight( true, false, -4, 821 )
	Frame:setTopBottom( true, false, -49, 505 )
	self:addElement( Frame )
	self.Frame = Frame
	
	self.back:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			back.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	item.navigation = {
		up = back
	}
	back.navigation = {
		up = item
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 1 )
				self.item:setYRot( 0 )
				self.item.lockedCharacterWithBackground:setAlpha( 0 )
				self.item.lockedSliverRender:setAlpha( 0 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 1 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 1 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
				contractChallenges:completeAnimation()
				self.contractChallenges:setAlpha( 0 )
				self.clipFinished( contractChallenges, {} )
				back:completeAnimation()
				self.back:setAlpha( 0 )
				self.clipFinished( back, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )
				BackTopAndBottom0:completeAnimation()
				self.BackTopAndBottom0:setAlpha( 0 )
				self.clipFinished( BackTopAndBottom0, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setAlpha( 0 )
				self.clipFinished( FrontTopAndBottom, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item:setAlpha( 1 )
				self.item.lockedCharacterWithBackground:setAlpha( 0 )
				self.item.lockedSliverRender:setAlpha( 0 )
				self.item.characterWithBackground:setAlpha( 1 )
				self.item.unlockSliverRender:setAlpha( 0 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setAlpha( 1 )
				self.clipFinished( FrontTopAndBottom, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 5 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.lockedCharacterWithBackground:setAlpha( 0 )
				self.item.lockedSliverRender:setAlpha( 0 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 1 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0.9 )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( false, false, -45.5, 45.5 )
				self.FocusBarB0:setTopBottom( false, false, 221, 217 )
				self.FocusBarB0:setAlpha( 1 )
				self.FocusBarB0:setScale( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarB00:completeAnimation()
				self.FocusBarB00:setLeftRight( false, false, -45.5, 45.5 )
				self.FocusBarB00:setTopBottom( false, false, -217, -221 )
				self.FocusBarB00:setAlpha( 1 )
				self.FocusBarB00:setZRot( -180 )
				self.FocusBarB00:setScale( 1 )
				self.clipFinished( FocusBarB00, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setAlpha( 0 )
				self.clipFinished( FrontTopAndBottom, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
			end,
			Flipped = function ()
				self:setupElementClipCounter( 4 )
				local itemFrame2 = function ( item, event )
					local itemFrame3 = function ( item, event )
						local itemFrame4 = function ( item, event )
							if not event.interrupted then
								item:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							item:setAlpha( 0 )
							item:setYRot( 90 )
							item:setZoom( 20 )
							if event.interrupted then
								self.clipFinished( item, event )
							else
								item:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							itemFrame4( item, event )
							return 
						else
							item:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							item:setYRot( 90 )
							item:registerEventHandler( "transition_complete_keyframe", itemFrame4 )
						end
					end
					
					if event.interrupted then
						itemFrame3( item, event )
						return 
					else
						item:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						item:setZoom( 20 )
						item:registerEventHandler( "transition_complete_keyframe", itemFrame3 )
					end
				end
				
				item:completeAnimation()
				self.item:setAlpha( 1 )
				self.item:setYRot( 0 )
				self.item:setZoom( 0 )
				itemFrame2( item, {} )
				local backFrame2 = function ( back, event )
					local backFrame3 = function ( back, event )
						local backFrame4 = function ( back, event )
							local backFrame5 = function ( back, event )
								if not event.interrupted then
									back:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								back:setAlpha( 1 )
								back:setYRot( 0 )
								back:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( back, event )
								else
									back:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								backFrame5( back, event )
								return 
							else
								back:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								back:setYRot( 0 )
								back:registerEventHandler( "transition_complete_keyframe", backFrame5 )
							end
						end
						
						if event.interrupted then
							backFrame4( back, event )
							return 
						else
							back:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							back:setAlpha( 1 )
							back:registerEventHandler( "transition_complete_keyframe", backFrame4 )
						end
					end
					
					if event.interrupted then
						backFrame3( back, event )
						return 
					else
						back:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						back:registerEventHandler( "transition_complete_keyframe", backFrame3 )
					end
				end
				
				back:completeAnimation()
				self.back:setAlpha( 0 )
				self.back:setYRot( -90 )
				self.back:setZoom( 20 )
				backFrame2( back, {} )
				local FrontTopAndBottomFrame2 = function ( FrontTopAndBottom, event )
					local FrontTopAndBottomFrame3 = function ( FrontTopAndBottom, event )
						local FrontTopAndBottomFrame4 = function ( FrontTopAndBottom, event )
							local FrontTopAndBottomFrame5 = function ( FrontTopAndBottom, event )
								local FrontTopAndBottomFrame6 = function ( FrontTopAndBottom, event )
									if not event.interrupted then
										FrontTopAndBottom:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									end
									FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
									FrontTopAndBottom:setTopBottom( true, false, -56, 508 )
									FrontTopAndBottom:setRGB( 0, 0, 0 )
									FrontTopAndBottom:setAlpha( 1 )
									FrontTopAndBottom:setYRot( 180 )
									FrontTopAndBottom:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( FrontTopAndBottom, event )
									else
										FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrontTopAndBottomFrame6( FrontTopAndBottom, event )
									return 
								else
									FrontTopAndBottom:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									FrontTopAndBottom:setYRot( 180 )
									FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame6 )
								end
							end
							
							if event.interrupted then
								FrontTopAndBottomFrame5( FrontTopAndBottom, event )
								return 
							else
								FrontTopAndBottom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
								FrontTopAndBottom:setTopBottom( true, false, -56, 508 )
								FrontTopAndBottom:setRGB( 0, 0, 0 )
								FrontTopAndBottom:setYRot( 90 )
								FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame5 )
							end
						end
						
						if event.interrupted then
							FrontTopAndBottomFrame4( FrontTopAndBottom, event )
							return 
						else
							FrontTopAndBottom:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							FrontTopAndBottom:setYRot( 84 )
							FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame4 )
						end
					end
					
					if event.interrupted then
						FrontTopAndBottomFrame3( FrontTopAndBottom, event )
						return 
					else
						FrontTopAndBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FrontTopAndBottom:setZoom( 20 )
						FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame3 )
					end
				end
				
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
				self.FrontTopAndBottom:setTopBottom( true, false, -49, 505 )
				self.FrontTopAndBottom:setRGB( 1, 1, 1 )
				self.FrontTopAndBottom:setAlpha( 1 )
				self.FrontTopAndBottom:setYRot( 0 )
				self.FrontTopAndBottom:setZoom( 0 )
				FrontTopAndBottomFrame2( FrontTopAndBottom, {} )
				local FrameFrame2 = function ( Frame, event )
					local FrameFrame3 = function ( Frame, event )
						local FrameFrame4 = function ( Frame, event )
							local FrameFrame5 = function ( Frame, event )
								local FrameFrame6 = function ( Frame, event )
									if not event.interrupted then
										Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.text:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.Flippedtext:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.rightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									end
									Frame:setYRot( 180 )
									Frame:setZoom( 0 )
									Frame.text:setAlpha( 0 )
									Frame.Flippedtext:setAlpha( 1 )
									Frame.rightBumper:setAlpha( 0 )
									Frame.FlippedrightBumper:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Frame, event )
									else
										Frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrameFrame6( Frame, event )
									return 
								else
									Frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									Frame:setYRot( 180 )
									Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame6 )
								end
							end
							
							if event.interrupted then
								FrameFrame5( Frame, event )
								return 
							else
								Frame:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.text:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.Flippedtext:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.rightBumper:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame:setYRot( 90 )
								Frame.text:setAlpha( 0 )
								Frame.Flippedtext:setAlpha( 1 )
								Frame.rightBumper:setAlpha( 0 )
								Frame.FlippedrightBumper:setAlpha( 1 )
								Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFrame4( Frame, event )
							return 
						else
							Frame:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Frame:setYRot( 84 )
							Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFrame3( Frame, event )
						return 
					else
						Frame:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Frame:setZoom( 20 )
						Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame3 )
					end
				end
				
				Frame:completeAnimation()
				Frame.text:completeAnimation()
				Frame.Flippedtext:completeAnimation()
				Frame.rightBumper:completeAnimation()
				Frame.FlippedrightBumper:completeAnimation()
				self.Frame:setYRot( 0 )
				self.Frame:setZoom( 0 )
				self.Frame.text:setAlpha( 1 )
				self.Frame.Flippedtext:setAlpha( 0 )
				self.Frame.rightBumper:setAlpha( 1 )
				self.Frame.FlippedrightBumper:setAlpha( 0 )
				FrameFrame2( Frame, {} )
			end,
			Challenges = function ()
				self:setupElementClipCounter( 5 )
				local itemFrame2 = function ( item, event )
					local itemFrame3 = function ( item, event )
						local itemFrame4 = function ( item, event )
							if not event.interrupted then
								item:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							item:setAlpha( 0 )
							item:setYRot( 90 )
							item:setZoom( 20 )
							if event.interrupted then
								self.clipFinished( item, event )
							else
								item:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							itemFrame4( item, event )
							return 
						else
							item:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							item:setYRot( 90 )
							item:registerEventHandler( "transition_complete_keyframe", itemFrame4 )
						end
					end
					
					if event.interrupted then
						itemFrame3( item, event )
						return 
					else
						item:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						item:setZoom( 20 )
						item:registerEventHandler( "transition_complete_keyframe", itemFrame3 )
					end
				end
				
				item:completeAnimation()
				self.item:setAlpha( 1 )
				self.item:setYRot( 0 )
				self.item:setZoom( 0 )
				itemFrame2( item, {} )
				local contractChallengesFrame2 = function ( contractChallenges, event )
					local contractChallengesFrame3 = function ( contractChallenges, event )
						local contractChallengesFrame4 = function ( contractChallenges, event )
							local contractChallengesFrame5 = function ( contractChallenges, event )
								if not event.interrupted then
									contractChallenges:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								contractChallenges:setAlpha( 1 )
								contractChallenges:setYRot( 0 )
								contractChallenges:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( contractChallenges, event )
								else
									contractChallenges:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								contractChallengesFrame5( contractChallenges, event )
								return 
							else
								contractChallenges:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								contractChallenges:setYRot( 0 )
								contractChallenges:registerEventHandler( "transition_complete_keyframe", contractChallengesFrame5 )
							end
						end
						
						if event.interrupted then
							contractChallengesFrame4( contractChallenges, event )
							return 
						else
							contractChallenges:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							contractChallenges:setAlpha( 1 )
							contractChallenges:registerEventHandler( "transition_complete_keyframe", contractChallengesFrame4 )
						end
					end
					
					if event.interrupted then
						contractChallengesFrame3( contractChallenges, event )
						return 
					else
						contractChallenges:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						contractChallenges:registerEventHandler( "transition_complete_keyframe", contractChallengesFrame3 )
					end
				end
				
				contractChallenges:completeAnimation()
				self.contractChallenges:setAlpha( 0 )
				self.contractChallenges:setYRot( -90 )
				self.contractChallenges:setZoom( 20 )
				contractChallengesFrame2( contractChallenges, {} )
				local BackTopAndBottom0Frame2 = function ( BackTopAndBottom0, event )
					local BackTopAndBottom0Frame3 = function ( BackTopAndBottom0, event )
						local BackTopAndBottom0Frame4 = function ( BackTopAndBottom0, event )
							local BackTopAndBottom0Frame5 = function ( BackTopAndBottom0, event )
								if not event.interrupted then
									BackTopAndBottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								BackTopAndBottom0:setAlpha( 1 )
								BackTopAndBottom0:setYRot( 0 )
								BackTopAndBottom0:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( BackTopAndBottom0, event )
								else
									BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BackTopAndBottom0Frame5( BackTopAndBottom0, event )
								return 
							else
								BackTopAndBottom0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								BackTopAndBottom0:setYRot( 0 )
								BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame5 )
							end
						end
						
						if event.interrupted then
							BackTopAndBottom0Frame4( BackTopAndBottom0, event )
							return 
						else
							BackTopAndBottom0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							BackTopAndBottom0:setAlpha( 1 )
							BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame4 )
						end
					end
					
					if event.interrupted then
						BackTopAndBottom0Frame3( BackTopAndBottom0, event )
						return 
					else
						BackTopAndBottom0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame3 )
					end
				end
				
				BackTopAndBottom0:completeAnimation()
				self.BackTopAndBottom0:setAlpha( 0 )
				self.BackTopAndBottom0:setYRot( -90 )
				self.BackTopAndBottom0:setZoom( 20 )
				BackTopAndBottom0Frame2( BackTopAndBottom0, {} )
				local FrontTopAndBottomFrame2 = function ( FrontTopAndBottom, event )
					local FrontTopAndBottomFrame3 = function ( FrontTopAndBottom, event )
						local FrontTopAndBottomFrame4 = function ( FrontTopAndBottom, event )
							if not event.interrupted then
								FrontTopAndBottom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							FrontTopAndBottom:setRGB( 0, 0, 0 )
							FrontTopAndBottom:setAlpha( 0 )
							FrontTopAndBottom:setYRot( 90 )
							FrontTopAndBottom:setZoom( 20 )
							if event.interrupted then
								self.clipFinished( FrontTopAndBottom, event )
							else
								FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FrontTopAndBottomFrame4( FrontTopAndBottom, event )
							return 
						else
							FrontTopAndBottom:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							FrontTopAndBottom:setYRot( 84 )
							FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame4 )
						end
					end
					
					if event.interrupted then
						FrontTopAndBottomFrame3( FrontTopAndBottom, event )
						return 
					else
						FrontTopAndBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FrontTopAndBottom:setZoom( 20 )
						FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame3 )
					end
				end
				
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setRGB( 1, 1, 1 )
				self.FrontTopAndBottom:setAlpha( 1 )
				self.FrontTopAndBottom:setYRot( 0 )
				self.FrontTopAndBottom:setZoom( 0 )
				FrontTopAndBottomFrame2( FrontTopAndBottom, {} )
				local FrameFrame2 = function ( Frame, event )
					local FrameFrame3 = function ( Frame, event )
						local FrameFrame4 = function ( Frame, event )
							local FrameFrame5 = function ( Frame, event )
								local FrameFrame6 = function ( Frame, event )
									if not event.interrupted then
										Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.text:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.Flippedtext:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.rightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									end
									Frame:setYRot( 180 )
									Frame:setZoom( 0 )
									Frame.text:setAlpha( 0 )
									Frame.Flippedtext:setAlpha( 1 )
									Frame.rightBumper:setAlpha( 0 )
									Frame.FlippedrightBumper:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Frame, event )
									else
										Frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrameFrame6( Frame, event )
									return 
								else
									Frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									Frame:setYRot( 180 )
									Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame6 )
								end
							end
							
							if event.interrupted then
								FrameFrame5( Frame, event )
								return 
							else
								Frame:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.text:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.Flippedtext:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.rightBumper:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Frame:setYRot( 90 )
								Frame.text:setAlpha( 0 )
								Frame.Flippedtext:setAlpha( 1 )
								Frame.rightBumper:setAlpha( 0 )
								Frame.FlippedrightBumper:setAlpha( 1 )
								Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFrame4( Frame, event )
							return 
						else
							Frame:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Frame:setYRot( 84 )
							Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFrame3( Frame, event )
						return 
					else
						Frame:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Frame:setZoom( 20 )
						Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame3 )
					end
				end
				
				Frame:completeAnimation()
				Frame.text:completeAnimation()
				Frame.Flippedtext:completeAnimation()
				Frame.rightBumper:completeAnimation()
				Frame.FlippedrightBumper:completeAnimation()
				self.Frame:setYRot( 0 )
				self.Frame:setZoom( 0 )
				self.Frame.text:setAlpha( 1 )
				self.Frame.Flippedtext:setAlpha( 0 )
				self.Frame.rightBumper:setAlpha( 1 )
				self.Frame.FlippedrightBumper:setAlpha( 0 )
				FrameFrame2( Frame, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 1 )
				self.item.lockedCharacterWithBackground:setAlpha( 0 )
				self.item.lockedSliverRender:setAlpha( 1 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setAlpha( 0 )
				self.clipFinished( FrontTopAndBottom, {} )
				Frame:completeAnimation()
				self.Frame:setAlpha( 0 )
				self.clipFinished( Frame, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.lockedCharacterWithBackground:setAlpha( 1 )
				self.item.lockedSliverRender:setAlpha( 0 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 0 )
				self.item.border:setRGB( 0.57, 0.57, 0.57 )
				self.item.infoArea:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.lockedCharacterWithBackground:setAlpha( 0 )
				self.item.lockedSliverRender:setAlpha( 1 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
			end
		},
		Flipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				item:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 0 )
				self.item:setYRot( 0 )
				self.item:setZoom( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 1 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
				back:completeAnimation()
				self.back:setAlpha( 1 )
				self.back:setZoom( 0 )
				self.clipFinished( back, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
				self.FrontTopAndBottom:setTopBottom( true, false, -54, 505 )
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.clipFinished( FrontTopAndBottom, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local f61_local0 = function ( f62_arg0, f62_arg1 )
					local f62_local0 = function ( f63_arg0, f63_arg1 )
						local f63_local0 = function ( f64_arg0, f64_arg1 )
							if not f64_arg1.interrupted then
								f64_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f64_arg0:setAlpha( 1 )
							f64_arg0:setYRot( 0 )
							f64_arg0:setZoom( 0 )
							if f64_arg1.interrupted then
								self.clipFinished( f64_arg0, f64_arg1 )
							else
								f64_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f63_arg1.interrupted then
							f63_local0( f63_arg0, f63_arg1 )
							return 
						else
							f63_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							f63_arg0:setYRot( 0 )
							f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
						end
					end
					
					if f62_arg1.interrupted then
						f62_local0( f62_arg0, f62_arg1 )
						return 
					else
						f62_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f62_arg0:setAlpha( 1 )
						f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
					end
				end
				
				item:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				item:setAlpha( 0 )
				item:setYRot( 90 )
				item:setZoom( 20 )
				item:registerEventHandler( "transition_complete_keyframe", f61_local0 )
				local backFrame2 = function ( back, event )
					local backFrame3 = function ( back, event )
						local backFrame4 = function ( back, event )
							if not event.interrupted then
								back:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							back:setAlpha( 0 )
							back:setYRot( -90 )
							back:setZoom( 20 )
							if event.interrupted then
								self.clipFinished( back, event )
							else
								back:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							backFrame4( back, event )
							return 
						else
							back:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							back:setYRot( -90 )
							back:registerEventHandler( "transition_complete_keyframe", backFrame4 )
						end
					end
					
					if event.interrupted then
						backFrame3( back, event )
						return 
					else
						back:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						back:setZoom( 20 )
						back:registerEventHandler( "transition_complete_keyframe", backFrame3 )
					end
				end
				
				back:completeAnimation()
				self.back:setAlpha( 1 )
				self.back:setYRot( 0 )
				self.back:setZoom( 0 )
				backFrame2( back, {} )
				local FrontTopAndBottomFrame2 = function ( FrontTopAndBottom, event )
					local FrontTopAndBottomFrame3 = function ( FrontTopAndBottom, event )
						local FrontTopAndBottomFrame4 = function ( FrontTopAndBottom, event )
							local FrontTopAndBottomFrame5 = function ( FrontTopAndBottom, event )
								local FrontTopAndBottomFrame6 = function ( FrontTopAndBottom, event )
									if not event.interrupted then
										FrontTopAndBottom:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									end
									FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
									FrontTopAndBottom:setTopBottom( true, false, -49, 505 )
									FrontTopAndBottom:setRGB( 1, 1, 1 )
									FrontTopAndBottom:setAlpha( 1 )
									FrontTopAndBottom:setYRot( 0 )
									FrontTopAndBottom:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( FrontTopAndBottom, event )
									else
										FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrontTopAndBottomFrame6( FrontTopAndBottom, event )
									return 
								else
									FrontTopAndBottom:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									FrontTopAndBottom:setYRot( 0 )
									FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame6 )
								end
							end
							
							if event.interrupted then
								FrontTopAndBottomFrame5( FrontTopAndBottom, event )
								return 
							else
								FrontTopAndBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FrontTopAndBottom:setTopBottom( true, false, -49, 505 )
								FrontTopAndBottom:setRGB( 1, 1, 1 )
								FrontTopAndBottom:setYRot( 84 )
								FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame5 )
							end
						end
						
						if event.interrupted then
							FrontTopAndBottomFrame4( FrontTopAndBottom, event )
							return 
						else
							FrontTopAndBottom:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							FrontTopAndBottom:setYRot( 90 )
							FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame4 )
						end
					end
					
					if event.interrupted then
						FrontTopAndBottomFrame3( FrontTopAndBottom, event )
						return 
					else
						FrontTopAndBottom:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						FrontTopAndBottom:setZoom( 20 )
						FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame3 )
					end
				end
				
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setLeftRight( true, false, -3, 822 )
				self.FrontTopAndBottom:setTopBottom( true, false, -53, 509 )
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.FrontTopAndBottom:setAlpha( 1 )
				self.FrontTopAndBottom:setYRot( 180 )
				self.FrontTopAndBottom:setZoom( 0 )
				FrontTopAndBottomFrame2( FrontTopAndBottom, {} )
				local FrameFrame2 = function ( Frame, event )
					local FrameFrame3 = function ( Frame, event )
						local FrameFrame4 = function ( Frame, event )
							local FrameFrame5 = function ( Frame, event )
								local FrameFrame6 = function ( Frame, event )
									if not event.interrupted then
										Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.text:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.Flippedtext:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.rightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									end
									Frame:setYRot( 0 )
									Frame:setZoom( 0 )
									Frame.text:setAlpha( 1 )
									Frame.Flippedtext:setAlpha( 0 )
									Frame.rightBumper:setAlpha( 1 )
									Frame.FlippedrightBumper:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Frame, event )
									else
										Frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrameFrame6( Frame, event )
									return 
								else
									Frame:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									Frame:setYRot( 0 )
									Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame6 )
								end
							end
							
							if event.interrupted then
								FrameFrame5( Frame, event )
								return 
							else
								Frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.Flippedtext:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.rightBumper:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame:setYRot( 84 )
								Frame.text:setAlpha( 1 )
								Frame.Flippedtext:setAlpha( 0 )
								Frame.rightBumper:setAlpha( 1 )
								Frame.FlippedrightBumper:setAlpha( 0 )
								Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFrame4( Frame, event )
							return 
						else
							Frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							Frame:setYRot( 90 )
							Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFrame3( Frame, event )
						return 
					else
						Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Frame:setZoom( 20 )
						Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame3 )
					end
				end
				
				Frame:completeAnimation()
				Frame.text:completeAnimation()
				Frame.Flippedtext:completeAnimation()
				Frame.rightBumper:completeAnimation()
				Frame.FlippedrightBumper:completeAnimation()
				self.Frame:setYRot( 180 )
				self.Frame:setZoom( 0 )
				self.Frame.text:setAlpha( 0 )
				self.Frame.Flippedtext:setAlpha( 1 )
				self.Frame.rightBumper:setAlpha( 0 )
				self.Frame.FlippedrightBumper:setAlpha( 1 )
				FrameFrame2( Frame, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				item:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item:setAlpha( 0 )
				self.item:setZoom( 0 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
				back:completeAnimation()
				self.back:setAlpha( 1 )
				self.back:setYRot( 0 )
				self.back:setZoom( 0 )
				self.clipFinished( back, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.clipFinished( FrontTopAndBottom, {} )
			end
		},
		Challenges = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				item:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 0 )
				self.item:setYRot( 0 )
				self.item:setZoom( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 1 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
				contractChallenges:completeAnimation()
				self.contractChallenges:setAlpha( 1 )
				self.contractChallenges:setZoom( 0 )
				self.clipFinished( contractChallenges, {} )
				BackTopAndBottom0:completeAnimation()
				self.BackTopAndBottom0:setAlpha( 1 )
				self.clipFinished( BackTopAndBottom0, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.FrontTopAndBottom:setAlpha( 0 )
				self.clipFinished( FrontTopAndBottom, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )
				local f80_local0 = function ( f81_arg0, f81_arg1 )
					local f81_local0 = function ( f82_arg0, f82_arg1 )
						local f82_local0 = function ( f83_arg0, f83_arg1 )
							if not f83_arg1.interrupted then
								f83_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f83_arg0:setAlpha( 1 )
							f83_arg0:setYRot( 0 )
							f83_arg0:setZoom( 0 )
							if f83_arg1.interrupted then
								self.clipFinished( f83_arg0, f83_arg1 )
							else
								f83_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f82_arg1.interrupted then
							f82_local0( f82_arg0, f82_arg1 )
							return 
						else
							f82_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							f82_arg0:setYRot( 0 )
							f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
						end
					end
					
					if f81_arg1.interrupted then
						f81_local0( f81_arg0, f81_arg1 )
						return 
					else
						f81_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f81_arg0:setAlpha( 1 )
						f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
					end
				end
				
				item:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				item:setAlpha( 0 )
				item:setYRot( 90 )
				item:setZoom( 20 )
				item:registerEventHandler( "transition_complete_keyframe", f80_local0 )
				local contractChallengesFrame2 = function ( contractChallenges, event )
					local contractChallengesFrame3 = function ( contractChallenges, event )
						local contractChallengesFrame4 = function ( contractChallenges, event )
							if not event.interrupted then
								contractChallenges:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							contractChallenges:setAlpha( 0 )
							contractChallenges:setYRot( -90 )
							contractChallenges:setZoom( 20 )
							if event.interrupted then
								self.clipFinished( contractChallenges, event )
							else
								contractChallenges:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							contractChallengesFrame4( contractChallenges, event )
							return 
						else
							contractChallenges:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							contractChallenges:setYRot( -90 )
							contractChallenges:registerEventHandler( "transition_complete_keyframe", contractChallengesFrame4 )
						end
					end
					
					if event.interrupted then
						contractChallengesFrame3( contractChallenges, event )
						return 
					else
						contractChallenges:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						contractChallenges:setZoom( 20 )
						contractChallenges:registerEventHandler( "transition_complete_keyframe", contractChallengesFrame3 )
					end
				end
				
				contractChallenges:completeAnimation()
				self.contractChallenges:setAlpha( 1 )
				self.contractChallenges:setYRot( 0 )
				self.contractChallenges:setZoom( 0 )
				contractChallengesFrame2( contractChallenges, {} )
				local BackTopAndBottom0Frame2 = function ( BackTopAndBottom0, event )
					local BackTopAndBottom0Frame3 = function ( BackTopAndBottom0, event )
						local BackTopAndBottom0Frame4 = function ( BackTopAndBottom0, event )
							local BackTopAndBottom0Frame5 = function ( BackTopAndBottom0, event )
								if not event.interrupted then
									BackTopAndBottom0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								end
								BackTopAndBottom0:setAlpha( 0 )
								BackTopAndBottom0:setYRot( -90 )
								BackTopAndBottom0:setZoom( 20 )
								if event.interrupted then
									self.clipFinished( BackTopAndBottom0, event )
								else
									BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BackTopAndBottom0Frame5( BackTopAndBottom0, event )
								return 
							else
								BackTopAndBottom0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BackTopAndBottom0:setAlpha( 0 )
								BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame5 )
							end
						end
						
						if event.interrupted then
							BackTopAndBottom0Frame4( BackTopAndBottom0, event )
							return 
						else
							BackTopAndBottom0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							BackTopAndBottom0:setYRot( -90 )
							BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame4 )
						end
					end
					
					if event.interrupted then
						BackTopAndBottom0Frame3( BackTopAndBottom0, event )
						return 
					else
						BackTopAndBottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						BackTopAndBottom0:setZoom( 20 )
						BackTopAndBottom0:registerEventHandler( "transition_complete_keyframe", BackTopAndBottom0Frame3 )
					end
				end
				
				BackTopAndBottom0:completeAnimation()
				self.BackTopAndBottom0:setAlpha( 1 )
				self.BackTopAndBottom0:setYRot( 0 )
				self.BackTopAndBottom0:setZoom( 0 )
				BackTopAndBottom0Frame2( BackTopAndBottom0, {} )
				local FrontTopAndBottomFrame2 = function ( FrontTopAndBottom, event )
					local FrontTopAndBottomFrame3 = function ( FrontTopAndBottom, event )
						local FrontTopAndBottomFrame4 = function ( FrontTopAndBottom, event )
							local FrontTopAndBottomFrame5 = function ( FrontTopAndBottom, event )
								if not event.interrupted then
									FrontTopAndBottom:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								FrontTopAndBottom:setRGB( 1, 1, 1 )
								FrontTopAndBottom:setAlpha( 1 )
								FrontTopAndBottom:setYRot( 0 )
								FrontTopAndBottom:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( FrontTopAndBottom, event )
								else
									FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FrontTopAndBottomFrame5( FrontTopAndBottom, event )
								return 
							else
								FrontTopAndBottom:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								FrontTopAndBottom:setYRot( 0 )
								FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame5 )
							end
						end
						
						if event.interrupted then
							FrontTopAndBottomFrame4( FrontTopAndBottom, event )
							return 
						else
							FrontTopAndBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FrontTopAndBottom:setRGB( 1, 1, 1 )
							FrontTopAndBottom:setAlpha( 1 )
							FrontTopAndBottom:setYRot( 84 )
							FrontTopAndBottom:setZoom( 20 )
							FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame4 )
						end
					end
					
					if event.interrupted then
						FrontTopAndBottomFrame3( FrontTopAndBottom, event )
						return 
					else
						FrontTopAndBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						FrontTopAndBottom:registerEventHandler( "transition_complete_keyframe", FrontTopAndBottomFrame3 )
					end
				end
				
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.FrontTopAndBottom:setAlpha( 0 )
				self.FrontTopAndBottom:setYRot( 90 )
				self.FrontTopAndBottom:setZoom( 0 )
				FrontTopAndBottomFrame2( FrontTopAndBottom, {} )
				local FrameFrame2 = function ( Frame, event )
					local FrameFrame3 = function ( Frame, event )
						local FrameFrame4 = function ( Frame, event )
							local FrameFrame5 = function ( Frame, event )
								local FrameFrame6 = function ( Frame, event )
									if not event.interrupted then
										Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.text:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.Flippedtext:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.rightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
										Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									end
									Frame:setYRot( 0 )
									Frame:setZoom( 0 )
									Frame.text:setAlpha( 1 )
									Frame.Flippedtext:setAlpha( 0 )
									Frame.rightBumper:setAlpha( 1 )
									Frame.FlippedrightBumper:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Frame, event )
									else
										Frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FrameFrame6( Frame, event )
									return 
								else
									Frame:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									Frame:setYRot( 0 )
									Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame6 )
								end
							end
							
							if event.interrupted then
								FrameFrame5( Frame, event )
								return 
							else
								Frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.text:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.Flippedtext:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.rightBumper:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame.FlippedrightBumper:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Frame:setYRot( 84 )
								Frame.text:setAlpha( 1 )
								Frame.Flippedtext:setAlpha( 0 )
								Frame.rightBumper:setAlpha( 1 )
								Frame.FlippedrightBumper:setAlpha( 0 )
								Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame5 )
							end
						end
						
						if event.interrupted then
							FrameFrame4( Frame, event )
							return 
						else
							Frame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							Frame:setYRot( 90 )
							Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame4 )
						end
					end
					
					if event.interrupted then
						FrameFrame3( Frame, event )
						return 
					else
						Frame:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Frame:setZoom( 20 )
						Frame:registerEventHandler( "transition_complete_keyframe", FrameFrame3 )
					end
				end
				
				Frame:completeAnimation()
				Frame.text:completeAnimation()
				Frame.Flippedtext:completeAnimation()
				Frame.rightBumper:completeAnimation()
				Frame.FlippedrightBumper:completeAnimation()
				self.Frame:setYRot( 180 )
				self.Frame:setZoom( 0 )
				self.Frame.text:setAlpha( 0 )
				self.Frame.Flippedtext:setAlpha( 1 )
				self.Frame.rightBumper:setAlpha( 0 )
				self.Frame.FlippedrightBumper:setAlpha( 1 )
				FrameFrame2( Frame, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				item:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item:setAlpha( 0 )
				self.item:setZoom( 0 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
				contractChallenges:completeAnimation()
				self.contractChallenges:setAlpha( 1 )
				self.contractChallenges:setYRot( 0 )
				self.contractChallenges:setZoom( 0 )
				self.clipFinished( contractChallenges, {} )
				FrontTopAndBottom:completeAnimation()
				self.FrontTopAndBottom:setRGB( 0, 0, 0 )
				self.FrontTopAndBottom:setAlpha( 0 )
				self.clipFinished( FrontTopAndBottom, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsHeroLocked( element, controller )
			end
		},
		{
			stateName = "Flipped",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Flipped" )
			end
		},
		{
			stateName = "Challenges",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Challenges" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "Flipped" ) then
			SetLoseFocusToElement( self, "item", controller )
			MakeElementNotFocusable( self, "item", controller )
			MakeElementFocusable( self, "back", controller )
			SetFocusToElement( self, "back", controller )
		elseif IsSelfInState( self, "Challenges" ) then
			SetLoseFocusToElement( self, "item", controller )
			MakeElementNotFocusable( self, "item", controller )
			MakeElementFocusable( self, "contractChallenges", controller )
			SetFocusToElement( self, "contractChallenges", controller )
		elseif IsSelfInState( self, "DefaultState" ) and IsElementInFocus( element ) then
			SetLoseFocusToElement( self, "back", controller )
			MakeElementNotFocusable( self, "back", controller )
			SetLoseFocusToElement( self, "contractChallenges", controller )
			MakeElementNotFocusable( self, "contractChallenges", controller )
			MakeElementFocusable( self, "item", controller )
			SetFocusToElement( self, "item", controller )
		elseif IsSelfInState( self, "DefaultState" ) then
			MakeElementNotFocusable( self, "back", controller )
			MakeElementNotFocusable( self, "contractChallenges", controller )
			MakeElementFocusable( self, "item", controller )
		end
	end )
	item.id = "item"
	back.id = "back"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.item:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.item:close()
		element.contractChallenges:close()
		element.back:close()
		element.FocusBarB0:close()
		element.FocusBarB00:close()
		element.Frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

