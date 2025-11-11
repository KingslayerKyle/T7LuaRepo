require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardInfoWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButtonImage" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreaksArrow" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokenStatic" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.WildcardItemButton = InheritFrom( LUI.UIElement )
CoD.WildcardItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardItemButton )
	self.id = "WildcardItemButton"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( 0, 0, 0, 156 )
	self:setTopBottom( 0, 0, 0, 213 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Bkg = LUI.UIImage.new()
	Bkg:setLeftRight( 0, 0, 2, 151 )
	Bkg:setTopBottom( 0, 0, 2, 210 )
	Bkg:setRGB( 0, 0, 0 )
	Bkg:setAlpha( 0.9 )
	self:addElement( Bkg )
	self.Bkg = Bkg
	
	local itemImage = CoD.WildcardItemButtonImage.new( menu, controller )
	itemImage:mergeStateConditions( {
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller )
			end
		}
	} )
	itemImage:setLeftRight( 0.5, 0.5, -71, 69 )
	itemImage:setTopBottom( 0.5, 0.5, -87, 87 )
	itemImage:linkToElementModel( self, nil, false, function ( model )
		itemImage:setModel( model, controller )
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local infoText = CoD.WildcardInfoWidget.new( menu, controller )
	infoText:mergeStateConditions( {
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				local f4_local0 = IsInPermanentUnlockMenu( controller )
				if f4_local0 then
					if not IsPermanentlyUnlocked( element, controller ) then
						f4_local0 = HavePermanentUnlockTokens( controller )
						if f4_local0 then
							f4_local0 = IsCACItemPurchased( element, controller )
						end
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		}
	} )
	infoText:linkToElementModel( infoText, "itemIndex", true, function ( model )
		menu:updateElementState( infoText, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	infoText:setLeftRight( 0.5, 0.5, -180, 180 )
	infoText:setTopBottom( 1, 1, 22, 190 )
	infoText:setAlpha( 0 )
	infoText:setScale( 0.9 )
	infoText:linkToElementModel( self, nil, false, function ( model )
		infoText:setModel( model, controller )
	end )
	self:addElement( infoText )
	self.infoText = infoText
	
	local hintArrow = CoD.scorestreaksArrow.new( menu, controller )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				local f7_local0
				if not HasHintText( element ) then
					f7_local0 = AlwaysFalse()
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	hintArrow:linkToElementModel( hintArrow, nil, true, function ( model )
		menu:updateElementState( hintArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	hintArrow:setLeftRight( 0.5, 0.5, -15, 15 )
	hintArrow:setTopBottom( 1, 1, 0, 30 )
	hintArrow:setAlpha( 0 )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 0.5, 0.5, -81, 81 )
	IconNew:setTopBottom( 0.5, 0.5, -17, 19 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -6, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( 1, 1, -27, -6 )
	alertIcon:setTopBottom( 0, 0, 6, 27 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( 1, 1, -27, -6 )
	equippedIcon:setTopBottom( 0, 0, 6, 27 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -18, 18 )
	lockedIcon:setTopBottom( 0.5, 0.5, -24, 24 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local tokenPermanentUnlock = CoD.Prestige_PermanentUnlockTokenStatic.new( menu, controller )
	tokenPermanentUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller )
			end
		}
	} )
	tokenPermanentUnlock:setLeftRight( 1, 1, -41, 1 )
	tokenPermanentUnlock:setTopBottom( 0, 0, -3, 39 )
	self:addElement( tokenPermanentUnlock )
	self.tokenPermanentUnlock = tokenPermanentUnlock
	
	local tokenUnlock = CoD.cac_IconTokenStatic.new( menu, controller )
	tokenUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsCampaign() and not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCurrentMenuAttachmentMenu( menu ) then
					f10_local0 = not IsInPermanentUnlockMenu( controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				local f11_local0 = IsCampaign()
				if f11_local0 then
					if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCurrentMenuAttachmentMenu( menu ) then
						f11_local0 = not IsInPermanentUnlockMenu( controller )
					else
						f11_local0 = false
					end
				end
				return f11_local0
			end
		}
	} )
	tokenUnlock:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( tokenUnlock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	tokenUnlock:linkToElementModel( tokenUnlock, "itemIndex", true, function ( model )
		menu:updateElementState( tokenUnlock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	tokenUnlock:setLeftRight( 1, 1, -41, 1 )
	tokenUnlock:setTopBottom( 0, 0, -3, 39 )
	tokenUnlock:setAlpha( 0 )
	self:addElement( tokenUnlock )
	self.tokenUnlock = tokenUnlock
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:linkToElementModel( RestrictedItemWarning, nil, true, function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	RestrictedItemWarning:setLeftRight( 0, 0, 3, 153 )
	RestrictedItemWarning:setTopBottom( 0, 0, 42, 172 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	self.resetProperties = function ()
		infoText:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		hintArrow:completeAnimation()
		itemImage:completeAnimation()
		equippedIcon:completeAnimation()
		lockedIcon:completeAnimation()
		tokenUnlock:completeAnimation()
		IconNew:completeAnimation()
		alertIcon:completeAnimation()
		infoText:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		hintArrow:setLeftRight( 0.5, 0.5, -15, 15 )
		hintArrow:setTopBottom( 1, 1, 0, 30 )
		hintArrow:setAlpha( 0 )
		itemImage:setLeftRight( 0.5, 0.5, -71, 69 )
		itemImage:setTopBottom( 0.5, 0.5, -87, 87 )
		itemImage:setAlpha( 1 )
		equippedIcon:setAlpha( 0 )
		lockedIcon:setAlpha( 0 )
		tokenUnlock:setAlpha( 0 )
		IconNew:setAlpha( 0 )
		alertIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( 0.5, 0.5, -65, 65 )
				self.itemImage:setTopBottom( 0.5, 0.5, -87, 87 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.65 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		ContextualWildcardEquipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		ContextualWildcardLocked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		ContextualWildcardNotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		ContextualWildcard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		WildcardOverCapacityEquipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 0.5, 0.5, -7.5, 7.5 )
				self.hintArrow:setTopBottom( 1, 1, 0.5, 15.5 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		WildcardOverCapacity = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( 0.5, 0.5, -7.5, 7.5 )
				self.hintArrow:setTopBottom( 1, 1, 0.5, 15.5 )
				self.clipFinished( hintArrow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.8 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.8 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( 0.5, 0.5, -65, 65 )
				self.itemImage:setTopBottom( 0.5, 0.5, -87, 87 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.65 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ContextualWildcardEquipped",
			condition = function ( menu, element, event )
				local f43_local0 = IsCACItemEquipped( menu, element, controller )
				if f43_local0 then
					f43_local0 = IsCACContextualWildcardOpen( controller )
					if f43_local0 then
						f43_local0 = not IsInPermanentUnlockMenu( controller )
					end
				end
				return f43_local0
			end
		},
		{
			stateName = "ContextualWildcardLocked",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller ) and IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "ContextualWildcardNotAvailable",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller ) and not IsCACItemPurchased( element, controller )
			end
		},
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller )
			end
		},
		{
			stateName = "WildcardOverCapacityEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WildcardOverCapacity",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACWildcardEquipped( menu, element, controller ) and not IsInPermanentUnlockMenu( controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACItemPurchased( element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	itemImage.id = "itemImage"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.itemImage:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemImage:close()
		self.StartMenuframenoBG0:close()
		self.infoText:close()
		self.hintArrow:close()
		self.IconNew:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.lockedIcon:close()
		self.tokenPermanentUnlock:close()
		self.tokenUnlock:close()
		self.RestrictedItemWarning:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

