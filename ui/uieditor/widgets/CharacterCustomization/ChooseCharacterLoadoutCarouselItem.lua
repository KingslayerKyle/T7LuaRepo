-- 52e010f12ad5764d682c20a22d261661
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Internal" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Back" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_BribeLabel_Specialist" )

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

CoD.ChooseCharacterLoadoutCarouselItem = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem )
	self.id = "ChooseCharacterLoadoutCarouselItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.ChooseCharacterLoadoutCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( true, true, 0, 0 )
	item:setTopBottom( true, true, 30, -30 )
	item.heroNumber:setAlpha( 0 )
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
	self:addElement( item )
	self.item = item
	
	local back = CoD.ChooseCharacterLoadoutCarouselItem_Back.new( menu, controller )
	back:setLeftRight( true, true, 0, 0 )
	back:setTopBottom( true, true, 0, 0 )
	back:setAlpha( 0 )
	back:linkToElementModel( self, nil, false, function ( model )
		back:setModel( model, controller )
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
	
	local BMBribeLabelSpecialist = CoD.BM_BribeLabel_Specialist.new( menu, controller )
	BMBribeLabelSpecialist:setLeftRight( false, true, -510, 22 )
	BMBribeLabelSpecialist:setTopBottom( false, true, -108, -52 )
	BMBribeLabelSpecialist.Text:setText( Engine.Localize( "CONTRACT_BM_BRIBE_ACTIVE" ) )
	BMBribeLabelSpecialist:linkToElementModel( self, nil, false, function ( model )
		BMBribeLabelSpecialist:setModel( model, controller )
	end )
	BMBribeLabelSpecialist:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCurrentBribeForSpecialist( element ) and AllowSpecialistBribeWidget( controller )
			end
		}
	} )
	BMBribeLabelSpecialist:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( BMBribeLabelSpecialist, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:addElement( BMBribeLabelSpecialist )
	self.BMBribeLabelSpecialist = BMBribeLabelSpecialist
	
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
				self:setupElementClipCounter( 5 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 1 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )

				back:completeAnimation()
				self.back:setAlpha( 0 )
				self.clipFinished( back, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 1 )
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

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 1 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 0 )
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

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
			end,
			Flipped = function ()
				self:setupElementClipCounter( 3 )

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

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 0.57, 0.57, 0.57 )
				self.item.infoArea:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 1 )
				self.clipFinished( BMBribeLabelSpecialist, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )

				item:completeAnimation()

				item.lockedCharacterWithBackground:completeAnimation()

				item.lockedSliverRender:completeAnimation()

				item.characterWithBackground:completeAnimation()

				item.unlockSliverRender:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )

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
			end
		},
		Flipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				item:completeAnimation()

				item.heroNumber:completeAnimation()

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
				self.item.heroNumber:setAlpha( 0 )
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

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local f27_local0 = function ( f28_arg0, f28_arg1 )
					local f28_local0 = function ( f29_arg0, f29_arg1 )
						local f29_local0 = function ( f30_arg0, f30_arg1 )
							if not f30_arg1.interrupted then
								f30_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f30_arg0:setAlpha( 1 )
							f30_arg0:setYRot( 0 )
							f30_arg0:setZoom( 0 )
							if f30_arg1.interrupted then
								self.clipFinished( f30_arg0, f30_arg1 )
							else
								f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f29_arg1.interrupted then
							f29_local0( f29_arg0, f29_arg1 )
							return 
						else
							f29_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							f29_arg0:setYRot( 0 )
							f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
						end
					end
					
					if f28_arg1.interrupted then
						f28_local0( f28_arg0, f28_arg1 )
						return 
					else
						f28_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f28_arg0:setAlpha( 1 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
				end
				
				item:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				item:setAlpha( 0 )
				item:setYRot( 90 )
				item:setZoom( 20 )
				item:registerEventHandler( "transition_complete_keyframe", f27_local0 )
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
				local BMBribeLabelSpecialistFrame2 = function ( BMBribeLabelSpecialist, event )
					local BMBribeLabelSpecialistFrame3 = function ( BMBribeLabelSpecialist, event )
						if not event.interrupted then
							BMBribeLabelSpecialist:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						BMBribeLabelSpecialist:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMBribeLabelSpecialist, event )
						else
							BMBribeLabelSpecialist:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMBribeLabelSpecialistFrame3( BMBribeLabelSpecialist, event )
						return 
					else
						BMBribeLabelSpecialist:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						BMBribeLabelSpecialist:registerEventHandler( "transition_complete_keyframe", BMBribeLabelSpecialistFrame3 )
					end
				end
				
				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				BMBribeLabelSpecialistFrame2( BMBribeLabelSpecialist, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				item:completeAnimation()

				item.heroNumber:completeAnimation()

				item.border:completeAnimation()

				item.infoArea:completeAnimation()

				item.FETitleNumBrdr0:completeAnimation()

				item.lockImage:completeAnimation()

				item.newIcon:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item:setAlpha( 0 )
				self.item:setZoom( 0 )
				self.item.heroNumber:setAlpha( 1 )
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

				BMBribeLabelSpecialist:completeAnimation()
				self.BMBribeLabelSpecialist:setAlpha( 0 )
				self.clipFinished( BMBribeLabelSpecialist, {} )
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
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "Flipped" ) then
			SetLoseFocusToElement( self, "item", controller )
			MakeElementNotFocusable( self, "item", controller )
			MakeElementFocusable( self, "back", controller )
			SetFocusToElement( self, "back", controller )
		elseif IsSelfInState( self, "DefaultState" ) and IsElementInFocus( element ) then
			SetLoseFocusToElement( self, "back", controller )
			MakeElementNotFocusable( self, "back", controller )
			MakeElementFocusable( self, "item", controller )
			SetFocusToElement( self, "item", controller )
		elseif IsSelfInState( self, "DefaultState" ) then
			MakeElementNotFocusable( self, "back", controller )
			MakeElementFocusable( self, "item", controller )
		end
	end )
	item.id = "item"
	back.id = "back"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.item:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.item:close()
		element.back:close()
		element.FocusBarB0:close()
		element.FocusBarB00:close()
		element.BMBribeLabelSpecialist:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
