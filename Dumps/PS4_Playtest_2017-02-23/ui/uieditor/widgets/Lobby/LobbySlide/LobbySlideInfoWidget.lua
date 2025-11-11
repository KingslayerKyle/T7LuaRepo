require( "ui.uieditor.widgets.Lobby.Common.FE_ImageA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )

CoD.LobbySlideInfoWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideInfoWidget )
	self.id = "LobbySlideInfoWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 135 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, -1, 141 )
	Background:setTopBottom( 0, 1, -3, 3 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.5 )
	Background:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0, 0, 0, 0 )
	Background:setupNineSliceShader( 18, 18 )
	self:addElement( Background )
	self.Background = Background
	
	local pixelA = LUI.UIImage.new()
	pixelA:setLeftRight( 0, 0, 469, 523 )
	pixelA:setTopBottom( 0, 0, -1, 4 )
	pixelA:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA )
	self.pixelA = pixelA
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( 0, 0, 469, 523 )
	pixelA0:setTopBottom( 0, 0, 134, 139 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( 0, 0, 138, 492 )
	LineT:setTopBottom( 0, 0, -1, 5 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( 0, 0, 138, 492 )
	LineB:setTopBottom( 0, 0, 133, 139 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( 0, 0, -3, 141 )
	ImageX:setTopBottom( 0, 0, -3, 141 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImageX:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageX:setAlpha( HideIfNotEmptyString( modelValue ) )
		end
	end )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( 0, 0, 0, 138 )
	ImageBorder:setTopBottom( 0, 0, 0, 136 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local rankIcon = CoD.FE_ImageA.new( menu, controller )
	rankIcon:setLeftRight( 0, 0, 6, 132 )
	rankIcon:setTopBottom( 0, 0, 5, 131 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon.imgAdd:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( 0, 0, 150, 345 )
	rankText:setTopBottom( 0, 0, 51, 105 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText.FELabelSubHeadingD0.Label0:setRGB( SetToParagonColorIfPrestigeMasterByRank( 148, 162, 165, modelValue ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", modelValue ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -9, 15 )
	Image0:setTopBottom( 0, 0, -24, -6 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( 0, 0, 150, 458 )
	ListHeader0:setTopBottom( 0, 0, 3, 45 )
	ListHeader0:setAlpha( HideIfEmptyString( 1 ) )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setLetterSpacing( 0.5 )
	ListHeader0:linkToElementModel( self, "rankString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 1, 1, -523, -469 )
	pixelU0:setTopBottom( 0.5, 0.5, -70, -65 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 1, 1, -523, -469 )
	Image1:setTopBottom( 0.5, 0.5, 66, 71 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInParagonCapableGameMode() and IsPrestigeMasterFromRankModel( element, controller, "rank" )
			end
		}
	} )
	PrestigeMasterTierWidget:linkToElementModel( PrestigeMasterTierWidget, "rank", true, function ( model )
		menu:updateElementState( PrestigeMasterTierWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rank"
		} )
	end )
	PrestigeMasterTierWidget:setLeftRight( 0, 0, 150, 458 )
	PrestigeMasterTierWidget:setTopBottom( 0, 0, 108, 146 )
	PrestigeMasterTierWidget:linkToElementModel( self, nil, false, function ( model )
		PrestigeMasterTierWidget:setModel( model, controller )
	end )
	PrestigeMasterTierWidget:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountByRank( modelValue ) )
		end
	end )
	PrestigeMasterTierWidget:linkToElementModel( self, "rank", true, function ( model )
		local element = PrestigeMasterTierWidget
		UpdateElementState( self, "PrestigeMasterTierWidget", controller )
	end )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	self.resetProperties = function ()
		rankText:completeAnimation()
		rankText:setLeftRight( 0, 0, 150, 345 )
		rankText:setTopBottom( 0, 0, 51, 105 )
		rankText:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		OverLevel55 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rankText:completeAnimation()
				self.rankText:setLeftRight( 0, 0, 149.5, 457.5 )
				self.rankText:setTopBottom( 0, 0, 59, 113 )
				self.rankText:setRGB( 0.92, 0.64, 0.15 )
				self.clipFinished( rankText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "OverLevel55",
			condition = function ( menu, element, event )
				return IsSelfModelRankValueGreaterThan( element, controller, 55 )
			end
		}
	} )
	self:linkToElementModel( self, "rank", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rank"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ImageBorder:close()
		self.rankIcon:close()
		self.rankText:close()
		self.ListHeader0:close()
		self.PrestigeMasterTierWidget:close()
		self.ImageX:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

