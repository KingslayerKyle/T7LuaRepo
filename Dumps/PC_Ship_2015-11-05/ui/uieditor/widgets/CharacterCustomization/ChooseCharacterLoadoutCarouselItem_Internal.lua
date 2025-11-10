require( "ui.uieditor.widgets.CharacterCustomization.SmallFrameWithBG" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoArea" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )
require( "ui.uieditor.widgets.Heroes.chooseCharacterVignette" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_ButtonFooter" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
end

CoD.ChooseCharacterLoadoutCarouselItem_Internal = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_Internal )
	self.id = "ChooseCharacterLoadoutCarouselItem_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local lockedCharacterWithBackground = LUI.UIImage.new()
	lockedCharacterWithBackground:setLeftRight( false, false, -408, 408 )
	lockedCharacterWithBackground:setTopBottom( false, false, -250, 250 )
	lockedCharacterWithBackground:setRGB( 0.34, 0.4, 0.46 )
	lockedCharacterWithBackground:setAlpha( 0 )
	lockedCharacterWithBackground:linkToElementModel( self, "lockedBackgroundWithCharacter", true, function ( model )
		local lockedBackgroundWithCharacter = Engine.GetModelValue( model )
		if lockedBackgroundWithCharacter then
			lockedCharacterWithBackground:setImage( RegisterImage( lockedBackgroundWithCharacter ) )
		end
	end )
	self:addElement( lockedCharacterWithBackground )
	self.lockedCharacterWithBackground = lockedCharacterWithBackground
	
	local lockedSliverRender = LUI.UIImage.new()
	lockedSliverRender:setLeftRight( false, false, -46, 46 )
	lockedSliverRender:setTopBottom( false, false, -250, 250 )
	lockedSliverRender:setAlpha( 0 )
	lockedSliverRender:linkToElementModel( self, "lockedCharacterSliver", true, function ( model )
		local lockedCharacterSliver = Engine.GetModelValue( model )
		if lockedCharacterSliver then
			lockedSliverRender:setImage( RegisterImage( lockedCharacterSliver ) )
		end
	end )
	self:addElement( lockedSliverRender )
	self.lockedSliverRender = lockedSliverRender
	
	local characterWithBackground = LUI.UIImage.new()
	characterWithBackground:setLeftRight( false, false, -408, 408 )
	characterWithBackground:setTopBottom( false, false, -250, 250 )
	characterWithBackground:linkToElementModel( self, "backgroundWithCharacter", true, function ( model )
		local backgroundWithCharacter = Engine.GetModelValue( model )
		if backgroundWithCharacter then
			characterWithBackground:setImage( RegisterImage( backgroundWithCharacter ) )
		end
	end )
	self:addElement( characterWithBackground )
	self.characterWithBackground = characterWithBackground
	
	local unlockSliverRender = LUI.UIImage.new()
	unlockSliverRender:setLeftRight( false, false, -46, 46 )
	unlockSliverRender:setTopBottom( false, false, -250, 250 )
	unlockSliverRender:setAlpha( 0 )
	unlockSliverRender:linkToElementModel( self, "unlockedCharacterSliver", true, function ( model )
		local unlockedCharacterSliver = Engine.GetModelValue( model )
		if unlockedCharacterSliver then
			unlockSliverRender:setImage( RegisterImage( unlockedCharacterSliver ) )
		end
	end )
	self:addElement( unlockSliverRender )
	self.unlockSliverRender = unlockSliverRender
	
	local SmallFrameWithBG0 = CoD.SmallFrameWithBG.new( menu, controller )
	SmallFrameWithBG0:setLeftRight( true, true, 256.75, -498.25 )
	SmallFrameWithBG0:setTopBottom( false, false, 220, 242 )
	self:addElement( SmallFrameWithBG0 )
	self.SmallFrameWithBG0 = SmallFrameWithBG0
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( false, false, -529.25, 286.75 )
	heroNumber:setTopBottom( false, true, -29.5, -9.5 )
	heroNumber:setTTF( "fonts/default.ttf" )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	heroNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroNumber:linkToElementModel( self, "count", true, function ( model )
		local count = Engine.GetModelValue( model )
		if count then
			heroNumber:setText( count )
		end
	end )
	self:addElement( heroNumber )
	self.heroNumber = heroNumber
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local FETitleNumBrdr2 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr2:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr2:setTopBottom( false, false, -246, 246 )
	FETitleNumBrdr2:setAlpha( 0 )
	self:addElement( FETitleNumBrdr2 )
	self.FETitleNumBrdr2 = FETitleNumBrdr2
	
	local infoArea = CoD.ChooseCharacterLoadoutCarouselItem_InfoArea.new( menu, controller )
	infoArea:setLeftRight( true, false, 0, 300 )
	infoArea:setTopBottom( true, false, -2, 498 )
	infoArea:linkToElementModel( self, nil, false, function ( model )
		infoArea:setModel( model, controller )
	end )
	infoArea:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			infoArea.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( infoArea )
	self.infoArea = infoArea
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( false, false, -44, 44 )
	FETitleNumBrdr0:setTopBottom( false, false, -220, 220 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local lockImage = CoD.cac_LockBig.new( menu, controller )
	lockImage:setLeftRight( true, false, 485, 581 )
	lockImage:setTopBottom( true, false, -2, 500 )
	lockImage:linkToElementModel( self, nil, false, function ( model )
		lockImage:setModel( model, controller )
	end )
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
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( false, false, -42.25, -30.25 )
	newIcon:setTopBottom( false, false, -218, -206 )
	newIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSpecialistNew( self, element, controller )
			end
		}
	} )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	local chooseCharacterVignette = CoD.chooseCharacterVignette.new( menu, controller )
	chooseCharacterVignette:setLeftRight( true, true, 0, 0 )
	chooseCharacterVignette:setTopBottom( true, true, 0, 0 )
	chooseCharacterVignette:setRGB( 0, 0, 0 )
	chooseCharacterVignette.bottomRight:setRGB( 0, 0, 0 )
	chooseCharacterVignette.topRight:setRGB( 0, 0, 0 )
	self:addElement( chooseCharacterVignette )
	self.chooseCharacterVignette = chooseCharacterVignette
	
	local ChooseCharacterLoadoutButtonFooter = CoD.ChooseCharacterLoadout_ButtonFooter.new( menu, controller )
	ChooseCharacterLoadoutButtonFooter:setLeftRight( false, true, -228.25, -8.5 )
	ChooseCharacterLoadoutButtonFooter:setTopBottom( false, false, 211.1, 244 )
	ChooseCharacterLoadoutButtonFooter:linkToElementModel( self, nil, false, function ( model )
		ChooseCharacterLoadoutButtonFooter:setModel( model, controller )
	end )
	self:addElement( ChooseCharacterLoadoutButtonFooter )
	self.ChooseCharacterLoadoutButtonFooter = ChooseCharacterLoadoutButtonFooter
	
	self:mergeStateConditions( {
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "heroSelectionTutorial" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroSelectionTutorial"
		} )
	end )
	infoArea.id = "infoArea"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.infoArea:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SmallFrameWithBG0:close()
		element.border:close()
		element.FETitleNumBrdr2:close()
		element.infoArea:close()
		element.FETitleNumBrdr0:close()
		element.lockImage:close()
		element.newIcon:close()
		element.chooseCharacterVignette:close()
		element.ChooseCharacterLoadoutButtonFooter:close()
		element.lockedCharacterWithBackground:close()
		element.lockedSliverRender:close()
		element.characterWithBackground:close()
		element.unlockSliverRender:close()
		element.heroNumber:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

