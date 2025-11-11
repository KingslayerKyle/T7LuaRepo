require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseContractCharacterLoadoutCarouselItem_InfoArea" )
require( "ui.uieditor.widgets.CharacterCustomization.SmallFrameWithBG" )
require( "ui.uieditor.widgets.Heroes.chooseCharacterVignette" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.ChooseContractCharacterLoadoutCarouselItem_Internal = InheritFrom( LUI.UIElement )
CoD.ChooseContractCharacterLoadoutCarouselItem_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseContractCharacterLoadoutCarouselItem_Internal )
	self.id = "ChooseContractCharacterLoadoutCarouselItem_Internal"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local lockedCharacterWithBackground = LUI.UIImage.new()
	lockedCharacterWithBackground:setLeftRight( 0.5, 0.5, -612, 612 )
	lockedCharacterWithBackground:setTopBottom( 0.5, 0.5, -375, 375 )
	lockedCharacterWithBackground:setRGB( 0.34, 0.4, 0.46 )
	lockedCharacterWithBackground:setAlpha( 0 )
	lockedCharacterWithBackground:linkToElementModel( self, "lockedBackgroundWithCharacter", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lockedCharacterWithBackground:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( lockedCharacterWithBackground )
	self.lockedCharacterWithBackground = lockedCharacterWithBackground
	
	local lockedSliverRender = LUI.UIImage.new()
	lockedSliverRender:setLeftRight( 0.5, 0.5, -69, 69 )
	lockedSliverRender:setTopBottom( 0.5, 0.5, -375, 375 )
	lockedSliverRender:setAlpha( 0 )
	lockedSliverRender:linkToElementModel( self, "lockedCharacterSliver", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lockedSliverRender:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( lockedSliverRender )
	self.lockedSliverRender = lockedSliverRender
	
	local characterWithBackground = LUI.UIImage.new()
	characterWithBackground:setLeftRight( 0.5, 0.5, -612, 612 )
	characterWithBackground:setTopBottom( 0.5, 0.5, -375, 375 )
	characterWithBackground:linkToElementModel( self, "backgroundWithCharacter", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			characterWithBackground:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( characterWithBackground )
	self.characterWithBackground = characterWithBackground
	
	local unlockSliverRender = LUI.UIImage.new()
	unlockSliverRender:setLeftRight( 0.5, 0.5, -69, 69 )
	unlockSliverRender:setTopBottom( 0.5, 0.5, -375, 375 )
	unlockSliverRender:setAlpha( 0 )
	unlockSliverRender:linkToElementModel( self, "unlockedCharacterSliver", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockSliverRender:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( unlockSliverRender )
	self.unlockSliverRender = unlockSliverRender
	
	local SmallFrameWithBG0 = CoD.SmallFrameWithBG.new( menu, controller )
	SmallFrameWithBG0:setLeftRight( 0, 1, 385, -747 )
	SmallFrameWithBG0:setTopBottom( 0.5, 0.5, 329.5, 362.5 )
	self:addElement( SmallFrameWithBG0 )
	self.SmallFrameWithBG0 = SmallFrameWithBG0
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( 0.5, 0.5, -794, 430 )
	heroNumber:setTopBottom( 1, 1, -44, -14 )
	heroNumber:setTTF( "fonts/default.ttf" )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroNumber:linkToElementModel( self, "count", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroNumber:setText( modelValue )
		end
	end )
	self:addElement( heroNumber )
	self.heroNumber = heroNumber
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, 0, 0 )
	border:setTopBottom( 0, 1, 0, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local FETitleNumBrdr2 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr2:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr2:setTopBottom( 0.5, 0.5, -369, 369 )
	FETitleNumBrdr2:setAlpha( 0 )
	self:addElement( FETitleNumBrdr2 )
	self.FETitleNumBrdr2 = FETitleNumBrdr2
	
	local infoArea = CoD.ChooseContractCharacterLoadoutCarouselItem_InfoArea.new( menu, controller )
	infoArea:setLeftRight( 0, 0, 0, 450 )
	infoArea:setTopBottom( 0, 0, -3, 747 )
	infoArea:linkToElementModel( self, nil, false, function ( model )
		infoArea:setModel( model, controller )
	end )
	infoArea:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			infoArea.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( infoArea )
	self.infoArea = infoArea
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0.5, 0.5, -66, 66 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -330, 330 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local lockImage = CoD.cac_LockBig.new( menu, controller )
	lockImage:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsInPermanentUnlockMenu( controller )
			end
		}
	} )
	lockImage:setLeftRight( 0, 0, 728, 872 )
	lockImage:setTopBottom( 0, 0, -3, 750 )
	lockImage:linkToElementModel( self, nil, false, function ( model )
		lockImage:setModel( model, controller )
	end )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSpecialistNew( self, element, controller )
			end
		}
	} )
	newIcon:setLeftRight( 0.5, 0.5, -63, -45 )
	newIcon:setTopBottom( 0.5, 0.5, -327, -309 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	local chooseCharacterVignette = CoD.chooseCharacterVignette.new( menu, controller )
	chooseCharacterVignette:setLeftRight( 0, 1, 0, 0 )
	chooseCharacterVignette:setTopBottom( 0, 1, 0, 0 )
	chooseCharacterVignette:setRGB( 0, 0, 0 )
	chooseCharacterVignette.bottomRight:setRGB( 0, 0, 0 )
	chooseCharacterVignette.topRight:setRGB( 0, 0, 0 )
	self:addElement( chooseCharacterVignette )
	self.chooseCharacterVignette = chooseCharacterVignette
	
	local ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0 = CoD.ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter.new( menu, controller )
	ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0:setLeftRight( 1, 1, -135.5, -24.5 )
	ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0:setTopBottom( 0.5, 0.5, 318.5, 369.5 )
	ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0:linkToElementModel( self, nil, false, function ( model )
		ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0:setModel( model, controller )
	end )
	self:addElement( ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0 )
	self.ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0 = ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0
	
	infoArea.id = "infoArea"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.infoArea:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SmallFrameWithBG0:close()
		self.border:close()
		self.FETitleNumBrdr2:close()
		self.infoArea:close()
		self.FETitleNumBrdr0:close()
		self.lockImage:close()
		self.newIcon:close()
		self.chooseCharacterVignette:close()
		self.ChooseCharacterLoadoutCardFrontBackOfCardOnlyFooter0:close()
		self.lockedCharacterWithBackground:close()
		self.lockedSliverRender:close()
		self.characterWithBackground:close()
		self.unlockSliverRender:close()
		self.heroNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

