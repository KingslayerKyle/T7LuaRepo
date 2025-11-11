require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Back" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Internal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PCSpecific = function ( self, controller )
	self.m_preventFromBeingCurrentMouseFocus = true
end

local PostLoadFunc = function ( self, controller )
	local originalWidth, originalHeight = self:getLocalSize()
	self.getWidthInList = function ()
		if self.gridInfoTable then
			if self.gridInfoTable.parentGrid.activeWidget == self then
				return originalWidth
			else
				return 90
			end
		else
			
		end
	end
	
	if CursorInputEnabledForBuild() then
		PCSpecific( self, controller )
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
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.ChooseCharacterLoadoutCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( 0, 1, 0, 0 )
	item:setTopBottom( 0, 1, 45, -45 )
	item.heroNumber:setAlpha( 0 )
	item.border:setRGB( 0.29, 0.29, 0.29 )
	item.infoArea:setAlpha( 0 )
	item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	item:linkToElementModel( self, nil, false, function ( model )
		item:setModel( model, controller )
	end )
	item:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroLoadoutPreviewChange( element, controller )
		SetSpecialistAsOld( self, element, controller )
		return retVal
	end )
	self:addElement( item )
	self.item = item
	
	local back = CoD.ChooseCharacterLoadoutCarouselItem_Back.new( menu, controller )
	back:setLeftRight( 0, 1, 0, 0 )
	back:setTopBottom( 0, 1, 0, 0 )
	back:setAlpha( 0 )
	back:linkToElementModel( self, nil, false, function ( model )
		back:setModel( model, controller )
	end )
	self:addElement( back )
	self.back = back
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0.5, 0.5, -67, 67 )
	FocusBarB0:setTopBottom( 0.5, 0.5, 105, 111 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarB00 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB00:setLeftRight( 0.5, 0.5, -68, 68 )
	FocusBarB00:setTopBottom( 0.5, 0.5, -315, -321 )
	FocusBarB00:setAlpha( 0 )
	FocusBarB00:setZRot( -180 )
	FocusBarB00:setZoom( 1 )
	self:addElement( FocusBarB00 )
	self.FocusBarB00 = FocusBarB00
	
	self.back:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			back.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	item.navigation = {
		up = back
	}
	back.navigation = {
		up = item
	}
	self.resetProperties = function ()
		item:completeAnimation()
		FocusBarB0:completeAnimation()
		FocusBarB00:completeAnimation()
		back:completeAnimation()
		item:setLeftRight( 0, 1, 0, 0 )
		item:setTopBottom( 0, 1, 45, -45 )
		item:setAlpha( 1 )
		item:setYRot( 0 )
		item:setZoom( 0 )
		item.lockedCharacterWithBackground:setAlpha( 0 )
		item.lockedSliverRender:setAlpha( 0 )
		item.characterWithBackground:setAlpha( 1 )
		item.unlockSliverRender:setAlpha( 0 )
		item.heroNumber:setAlpha( 0 )
		item.border:setRGB( 0.29, 0.29, 0.29 )
		item.infoArea:setAlpha( 0 )
		item.lockImage:setAlpha( 1 )
		item.newIcon:setAlpha( 1 )
		item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
		FocusBarB0:setLeftRight( 0.5, 0.5, -67, 67 )
		FocusBarB0:setTopBottom( 0.5, 0.5, 105, 111 )
		FocusBarB0:setAlpha( 0 )
		FocusBarB00:setLeftRight( 0.5, 0.5, -68, 68 )
		FocusBarB00:setTopBottom( 0.5, 0.5, -315, -321 )
		FocusBarB00:setAlpha( 0 )
		back:setAlpha( 0 )
		back:setYRot( 0 )
		back:setZoom( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.lockImage:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( 0, 1, 0, 0 )
				self.item:setTopBottom( 0, 1, 0, 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				item:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.unlockSliverRender:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.unlockSliverRender:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0.9 )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( 0.5, 0.5, -68, 68 )
				self.FocusBarB0:setTopBottom( 0.5, 0.5, 331, 325 )
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarB00:completeAnimation()
				self.FocusBarB00:setLeftRight( 0.5, 0.5, -68, 68 )
				self.FocusBarB00:setTopBottom( 0.5, 0.5, -325, -331 )
				self.FocusBarB00:setAlpha( 1 )
				self.clipFinished( FocusBarB00, {} )
			end,
			Flipped = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.newIcon:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item.lockedSliverRender:setAlpha( 1 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.lockedCharacterWithBackground:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( 0, 1, 0, 0 )
				self.item:setTopBottom( 0, 1, 0, 0 )
				self.item.lockedCharacterWithBackground:setAlpha( 1 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 0.57, 0.57, 0.57 )
				self.item.infoArea:setAlpha( 1 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.lockedSliverRender:completeAnimation()
				item.characterWithBackground:completeAnimation()
				item.newIcon:completeAnimation()
				self.item.lockedSliverRender:setAlpha( 1 )
				self.item.characterWithBackground:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
			end
		},
		Flipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				item:completeAnimation()
				item.lockImage:completeAnimation()
				item.ChooseCharacterLoadoutButtonFooter:completeAnimation()
				self.item:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.ChooseCharacterLoadoutButtonFooter:setAlpha( HideIfInPermanentUnlockMenu( 0 ) )
				self.clipFinished( item, {} )
				back:completeAnimation()
				self.back:setAlpha( 1 )
				self.clipFinished( back, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local itemFrame2 = function ( item, event )
					local itemFrame3 = function ( item, event )
						local itemFrame4 = function ( item, event )
							if not event.interrupted then
								item:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							item:setAlpha( 1 )
							item:setYRot( 0 )
							item:setZoom( 0 )
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
							item:setYRot( 0 )
							item:registerEventHandler( "transition_complete_keyframe", itemFrame4 )
						end
					end
					
					if event.interrupted then
						itemFrame3( item, event )
						return 
					else
						item:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						item:setAlpha( 1 )
						item:registerEventHandler( "transition_complete_keyframe", itemFrame3 )
					end
				end
				
				item:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				item:setAlpha( 0 )
				item:setYRot( 90 )
				item:setZoom( 20 )
				item:registerEventHandler( "transition_complete_keyframe", itemFrame2 )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				item:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				item.newIcon:completeAnimation()
				self.item:setLeftRight( 0, 1, 0, 0 )
				self.item:setTopBottom( 0, 1, 0, 0 )
				self.item:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.newIcon:setAlpha( 0 )
				self.clipFinished( item, {} )
				back:completeAnimation()
				self.back:setAlpha( 1 )
				self.clipFinished( back, {} )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.item:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.item:close()
		self.back:close()
		self.FocusBarB0:close()
		self.FocusBarB00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

