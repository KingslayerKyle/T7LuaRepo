require( "ui.uieditor.widgets.Heroes.heroCarouselProgressBar" )
require( "ui.uieditor.widgets.Heroes.heroCarouselSelectionItem" )
require( "ui.uieditor.widgets.Border" )

CoD.heroCarouselItem_Front = InheritFrom( LUI.UIElement )
CoD.heroCarouselItem_Front.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.heroCarouselItem_Front )
	self.id = "heroCarouselItem_Front"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 462 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( false, false, -408, 408 )
	background:setTopBottom( false, false, -230, 231 )
	background:setRGB( 1, 1, 1 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	background:linkToElementModel( self, "background", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( background )
	self.background = background
	
	local HeroExtraCamRender = LUI.UIImage.new()
	HeroExtraCamRender:setLeftRight( false, false, -408, 408 )
	HeroExtraCamRender:setTopBottom( false, false, -231, 231 )
	HeroExtraCamRender:setRGB( 1, 1, 1 )
	HeroExtraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	HeroExtraCamRender:linkToElementModel( self, "extraCamRender", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroExtraCamRender:setupCharacterExtraCamRender( modelValue )
		end
	end )
	self:addElement( HeroExtraCamRender )
	self.HeroExtraCamRender = HeroExtraCamRender
	
	local HeroLiveFeed = LUI.UIImage.new()
	HeroLiveFeed:setLeftRight( true, false, 0, 816 )
	HeroLiveFeed:setTopBottom( true, false, 1, 462 )
	HeroLiveFeed:setRGB( 1, 1, 1 )
	HeroLiveFeed:setAlpha( 0 )
	HeroLiveFeed:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	HeroLiveFeed:setShaderVector( 0, 0, 0, 1, 1 )
	HeroLiveFeed:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( HeroLiveFeed )
	self.HeroLiveFeed = HeroLiveFeed
	
	local heroMenuBacking = LUI.UIImage.new()
	heroMenuBacking:setLeftRight( true, false, 0, 279 )
	heroMenuBacking:setTopBottom( true, false, 0, 462 )
	heroMenuBacking:setRGB( 0, 0, 0 )
	heroMenuBacking:setAlpha( 0.85 )
	heroMenuBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( heroMenuBacking )
	self.heroMenuBacking = heroMenuBacking
	
	local heroNameLabel = LUI.UIText.new()
	heroNameLabel:setLeftRight( false, false, -383, 0 )
	heroNameLabel:setTopBottom( true, false, 6.75, 54.75 )
	heroNameLabel:setRGB( 1, 1, 1 )
	heroNameLabel:setTTF( "fonts/escom.ttf" )
	heroNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	heroNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( heroNameLabel )
	self.heroNameLabel = heroNameLabel
	
	local heroLevelLabel = LUI.UIText.new()
	heroLevelLabel:setLeftRight( false, false, -383, 0 )
	heroLevelLabel:setTopBottom( false, true, -60, -35 )
	heroLevelLabel:setRGB( 1, 1, 1 )
	heroLevelLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	heroLevelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	heroLevelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroLevelLabel:linkToElementModel( self, "level", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroLevelLabel:setText( Engine.Localize( LocalizeIntoString( modelValue, "HEROES_HERO_LEVEL_AND_COUNT" ) ) )
		end
	end )
	self:addElement( heroLevelLabel )
	self.heroLevelLabel = heroLevelLabel
	
	local heroCarouselProgressBar0 = CoD.heroCarouselProgressBar.new( menu, controller )
	heroCarouselProgressBar0:setLeftRight( false, false, -383, -179 )
	heroCarouselProgressBar0:setTopBottom( false, true, -35, -20 )
	heroCarouselProgressBar0:setRGB( 1, 1, 1 )
	self:addElement( heroCarouselProgressBar0 )
	self.heroCarouselProgressBar0 = heroCarouselProgressBar0
	
	local heroNumber = LUI.UIText.new()
	heroNumber:setLeftRight( false, false, -410, 406 )
	heroNumber:setTopBottom( false, true, -20, 0 )
	heroNumber:setRGB( 1, 1, 1 )
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
	
	local lockImage = LUI.UIImage.new()
	lockImage:setLeftRight( false, false, -383, -319 )
	lockImage:setTopBottom( false, false, -31.5, 32.5 )
	lockImage:setRGB( 1, 1, 1 )
	lockImage:setAlpha( 0 )
	lockImage:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lockImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lockImage )
	self.lockImage = lockImage
	
	local selectionList = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, true )
	selectionList:makeFocusable()
	selectionList:setLeftRight( false, false, -383, -161 )
	selectionList:setTopBottom( true, false, 59.5, 880.5 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "HeroCarouselItemList" )
	selectionList:setWidgetType( CoD.heroCarouselSelectionItem )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionList:setDataSource( modelValue )
		end
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.clipFinished( background, {} )
				heroLevelLabel:completeAnimation()
				self.heroLevelLabel:setAlpha( 1 )
				self.clipFinished( heroLevelLabel, {} )
				heroCarouselProgressBar0:completeAnimation()
				self.heroCarouselProgressBar0:setAlpha( 1 )
				self.clipFinished( heroCarouselProgressBar0, {} )
				lockImage:completeAnimation()
				self.lockImage:setAlpha( 0 )
				self.clipFinished( lockImage, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				background:completeAnimation()
				self.background:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( background, {} )
				heroLevelLabel:completeAnimation()
				self.heroLevelLabel:setAlpha( 0 )
				self.clipFinished( heroLevelLabel, {} )
				heroCarouselProgressBar0:completeAnimation()
				self.heroCarouselProgressBar0:setAlpha( 0 )
				self.clipFinished( heroCarouselProgressBar0, {} )
				lockImage:completeAnimation()
				self.lockImage:setLeftRight( false, false, -32, 32 )
				self.lockImage:setTopBottom( false, false, -32, 32 )
				self.lockImage:setAlpha( 1 )
				self.clipFinished( lockImage, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				self.clipFinished( selectionList, {} )
				border:completeAnimation()
				self.border:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( border, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsHeroLocked( element, controller )
			end
		}
	} )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.heroCarouselProgressBar0:close()
		self.selectionList:close()
		self.border:close()
		self.background:close()
		self.HeroExtraCamRender:close()
		self.heroNameLabel:close()
		self.heroLevelLabel:close()
		self.heroNumber:close()
		CoD.heroCarouselItem_Front.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

