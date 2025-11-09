require( "ui.uieditor.widgets.Heroes.chooseCharacterVignette" )
require( "ui.uieditor.widgets.CharacterCustomization.SmallFrameWithBG" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_InfoArea" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

local PreLoadFunc = function ( self, controller )
	local tutorialModel = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
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
	
	local background = LUI.UIImage.new()
	background:setLeftRight( false, false, -408, 408 )
	background:setTopBottom( false, false, -250, 250 )
	background:linkToElementModel( self, "background", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( background )
	self.background = background
	
	local chooseCharacterVignette = CoD.chooseCharacterVignette.new( menu, controller )
	chooseCharacterVignette:setLeftRight( true, true, 0, 0 )
	chooseCharacterVignette:setTopBottom( true, true, 0, 0 )
	chooseCharacterVignette.bottomRight:setRGB( 0, 0, 0 )
	chooseCharacterVignette.topRight:setRGB( 0, 0, 0 )
	self:addElement( chooseCharacterVignette )
	self.chooseCharacterVignette = chooseCharacterVignette
	
	local apeRender = LUI.UIImage.new()
	apeRender:setLeftRight( false, false, -46, 46 )
	apeRender:setTopBottom( false, false, -250, 250 )
	apeRender:setAlpha( 0 )
	apeRender:linkToElementModel( self, "frozenMomentRender", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			apeRender:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( apeRender )
	self.apeRender = apeRender
	
	local ExtraCamLiveFeed = LUI.UIImage.new()
	ExtraCamLiveFeed:setLeftRight( false, false, -408, 408 )
	ExtraCamLiveFeed:setTopBottom( false, false, -250, 250 )
	ExtraCamLiveFeed:setAlpha( 0 )
	ExtraCamLiveFeed:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	ExtraCamLiveFeed:setShaderVector( 0, 0, 0, 1, 1 )
	ExtraCamLiveFeed:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ExtraCamLiveFeed )
	self.ExtraCamLiveFeed = ExtraCamLiveFeed
	
	local characterPlusBackground = LUI.UIImage.new()
	characterPlusBackground:setLeftRight( false, false, -408, 408 )
	characterPlusBackground:setTopBottom( false, false, -250, 250 )
	characterPlusBackground:setAlpha( 0 )
	characterPlusBackground:linkToElementModel( self, "backgroundWithCharacter", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			characterPlusBackground:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( characterPlusBackground )
	self.characterPlusBackground = characterPlusBackground
	
	local CenteredSilhouette = LUI.UIImage.new()
	CenteredSilhouette:setLeftRight( false, false, -133.25, 148 )
	CenteredSilhouette:setTopBottom( false, false, -241.14, 241 )
	CenteredSilhouette:setAlpha( 0 )
	CenteredSilhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( CenteredSilhouette )
	self.CenteredSilhouette = CenteredSilhouette
	
	local Silhouette = LUI.UIImage.new()
	Silhouette:setLeftRight( false, false, 51.75, 333 )
	Silhouette:setTopBottom( false, false, -241.14, 241 )
	Silhouette:setAlpha( 0 )
	Silhouette:setImage( RegisterImage( "uie_t7_menu_mp_hero_tempimage" ) )
	self:addElement( Silhouette )
	self.Silhouette = Silhouette
	
	local characterOverlay = LUI.UIImage.new()
	characterOverlay:setLeftRight( false, false, -408, 408 )
	characterOverlay:setTopBottom( false, false, -250, 250 )
	characterOverlay:setAlpha( 0 )
	characterOverlay:linkToElementModel( self, "frozenMomentOverlay", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			characterOverlay:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( characterOverlay )
	self.characterOverlay = characterOverlay
	
	local SmallFrameWithBG0 = CoD.SmallFrameWithBG.new( menu, controller )
	SmallFrameWithBG0:setLeftRight( true, true, 741, -14 )
	SmallFrameWithBG0:setTopBottom( false, false, 220.5, 242.5 )
	self:addElement( SmallFrameWithBG0 )
	self.SmallFrameWithBG0 = SmallFrameWithBG0
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( false, false, -45, 771 )
	heroNumber:setTopBottom( false, true, -29, -9 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			infoArea.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
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
	lockImage:setAlpha( 0 )
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
				return true
			end
		}
	} )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( false, false, -44, 44 )
				self.FETitleNumBrdr0:setTopBottom( false, false, -220, 220 )
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end
		},
		DisabledFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.chooseCharacterVignette:close()
		self.SmallFrameWithBG0:close()
		self.border:close()
		self.FETitleNumBrdr2:close()
		self.infoArea:close()
		self.FETitleNumBrdr0:close()
		self.lockImage:close()
		self.background:close()
		self.apeRender:close()
		self.characterPlusBackground:close()
		self.characterOverlay:close()
		self.heroNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

