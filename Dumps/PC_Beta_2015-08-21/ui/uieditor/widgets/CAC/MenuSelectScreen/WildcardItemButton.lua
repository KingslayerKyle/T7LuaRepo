require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemStacked" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButtonImage" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardInfoWidget" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreaksArrow" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )
require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )

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
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 142 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local cardStack = CoD.WildcardItemStacked.new( menu, controller )
	cardStack:setLeftRight( false, false, -68, 51 )
	cardStack:setTopBottom( true, false, -42, 119 )
	cardStack:linkToElementModel( self, nil, false, function ( model )
		cardStack:setModel( model, controller )
	end )
	self:addElement( cardStack )
	self.cardStack = cardStack
	
	local Bkg = LUI.UIImage.new()
	Bkg:setLeftRight( true, false, 1.54, 101 )
	Bkg:setTopBottom( true, false, 1, 140 )
	Bkg:setRGB( 0, 0, 0 )
	Bkg:setAlpha( 0.9 )
	self:addElement( Bkg )
	self.Bkg = Bkg
	
	local itemImage = CoD.WildcardItemButtonImage.new( menu, controller )
	itemImage:setLeftRight( false, false, -47, 46 )
	itemImage:setTopBottom( false, false, -58, 58 )
	itemImage:linkToElementModel( self, nil, false, function ( model )
		itemImage:setModel( model, controller )
	end )
	itemImage:mergeStateConditions( {
		{
			stateName = "ContextualWildcard",
			condition = function ( menu, element, event )
				return IsCACContextualWildcardOpen( controller )
			end
		}
	} )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local infoText = CoD.WildcardInfoWidget.new( menu, controller )
	infoText:setLeftRight( false, false, -145.5, 145.5 )
	infoText:setTopBottom( false, true, 16, 128 )
	infoText:setAlpha( 0 )
	infoText:linkToElementModel( self, nil, false, function ( model )
		infoText:setModel( model, controller )
	end )
	self:addElement( infoText )
	self.infoText = infoText
	
	local hintArrow = CoD.scorestreaksArrow.new( menu, controller )
	hintArrow:setLeftRight( false, false, -10, 10 )
	hintArrow:setTopBottom( false, true, 0, 20 )
	hintArrow:setAlpha( 0 )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				local f6_local0
				if not HasHintText( element ) then
					f6_local0 = AlwaysFalse()
				else
					f6_local0 = false
				end
				return f6_local0
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
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, false, -54, 54 )
	IconNew:setTopBottom( false, false, -11.5, 12.5 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( false, true, -18, -4 )
	alertIcon:setTopBottom( true, false, 4, 18 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setImage( RegisterImage( "uie_t7_hud_cac_warning_16" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -18, -4 )
	equippedIcon:setTopBottom( true, false, 4, 18 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -16, 16 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local tokenUnlock = CoD.cac_IconTokenStatic.new( menu, controller )
	tokenUnlock:setLeftRight( false, true, -27, 1 )
	tokenUnlock:setTopBottom( true, false, -2, 26 )
	tokenUnlock:setAlpha( 0 )
	tokenUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) then
					f8_local0 = not IsCurrentMenuAttachmentMenu( menu )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	tokenUnlock:linkToElementModel( tokenUnlock, "itemIndex", true, function ( model )
		menu:updateElementState( tokenUnlock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( tokenUnlock )
	self.tokenUnlock = tokenUnlock
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:setLeftRight( true, false, 2, 102 )
	RestrictedItemWarning:setTopBottom( true, false, 28.32, 114.68 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -43.5, 43.5 )
				self.itemImage:setTopBottom( false, false, -58, 58 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.65 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		ContextualWildcardEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
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
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		ContextualWildcardLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
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
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		ContextualWildcardNotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		ContextualWildcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
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
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, -10, 10 )
				self.hintArrow:setTopBottom( false, true, 0, 20 )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
			end
		},
		WildcardOverCapacityEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, -5, 5 )
				self.hintArrow:setTopBottom( false, true, 0, 10 )
				self.hintArrow:setAlpha( 0 )
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
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setLeftRight( false, false, -145.5, 145.5 )
				self.infoText:setTopBottom( false, true, 16, 127 )
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, -5, 5 )
				self.hintArrow:setTopBottom( false, true, 0, 10 )
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
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
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, -10, 10 )
				self.hintArrow:setTopBottom( false, true, 0, 20 )
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setLeftRight( false, false, -10, 10 )
				self.hintArrow:setTopBottom( false, true, 0, 20 )
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
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
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
				self:setupElementClipCounter( 7 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.02 )
				self.clipFinished( FocusBarT, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 1 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				infoText:completeAnimation()
				self.infoText:setAlpha( 0 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				tokenUnlock:completeAnimation()
				self.tokenUnlock:setAlpha( 0 )
				self.clipFinished( tokenUnlock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( false, false, -43.5, 43.5 )
				self.itemImage:setTopBottom( false, false, -58, 58 )
				self.clipFinished( itemImage, {} )
				infoText:completeAnimation()
				self.infoText:setAlpha( 1 )
				self.clipFinished( infoText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0.65 )
				self.clipFinished( hintArrow, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 1 )
				self.clipFinished( alertIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ContextualWildcardEquipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller ) and IsCACContextualWildcardOpen( controller )
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
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACWildcardEquipped( menu, element, controller )
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
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACItemNew( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cardStack:close()
		element.itemImage:close()
		element.StartMenuframenoBG0:close()
		element.infoText:close()
		element.hintArrow:close()
		element.IconNew:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.lockedIcon:close()
		element.tokenUnlock:close()
		element.RestrictedItemWarning:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

