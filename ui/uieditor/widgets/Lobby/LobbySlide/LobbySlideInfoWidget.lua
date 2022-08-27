-- 7fb08143052cf5fc5b847f6bad4600be
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ImageA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SlideSubHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )
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
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, -1, 94 )
	Background:setTopBottom( true, true, -2, 2 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.5 )
	Background:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0.13, 0.13, 0, 0 )
	Background:setupNineSliceShader( 12, 12 )
	self:addElement( Background )
	self.Background = Background
	
	local pixelA = LUI.UIImage.new()
	pixelA:setLeftRight( true, false, 313, 349 )
	pixelA:setTopBottom( true, false, -1, 2.5 )
	pixelA:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA )
	self.pixelA = pixelA
	
	local pixelA0 = LUI.UIImage.new()
	pixelA0:setLeftRight( true, false, 313, 349 )
	pixelA0:setTopBottom( true, false, 89, 92.5 )
	pixelA0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelA0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelA0 )
	self.pixelA0 = pixelA0
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, 92, 328 )
	LineT:setTopBottom( true, false, -1, 3 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, 92, 328 )
	LineB:setTopBottom( true, false, 89, 93 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, -2, 94 )
	ImageX:setTopBottom( true, false, -2, 94 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImageX:linkToElementModel( self, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			ImageX:setAlpha( HideIfNotEmptyString( rankIcon ) )
		end
	end )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 92 )
	ImageBorder:setTopBottom( true, false, 0, 91 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local rankIcon = CoD.FE_ImageA.new( menu, controller )
	rankIcon:setLeftRight( true, false, 4, 88 )
	rankIcon:setTopBottom( true, false, 3, 87 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon:setAlpha( HideIfEmptyString( _rankIcon ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon.imgSolid:setImage( RegisterImage( GetRankIconLarge( _rankIcon ) ) )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon.imgAdd:setImage( RegisterImage( GetRankIconLarge( _rankIcon ) ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = CoD.FE_SlideSubHeader.new( menu, controller )
	rankText:setLeftRight( true, false, 99.9, 229.9 )
	rankText:setTopBottom( true, false, 34, 70 )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setAlpha( HideIfEmptyString( rank ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText.FELabelSubHeadingD0.Label0:setRGB( SetToParagonColorIfPrestigeMasterByRank( 148, 162, 165, rank ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText.FELabelSubHeadingD0.Label0:setText( Engine.Localize( PrependLocalizedStringWithSeparator( "MENU_LEVEL_CAPS", " ", rank ) ) )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -6, 10 )
	Image0:setTopBottom( true, false, -16, -4 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonsseparate" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ListHeader0 = CoD.FE_ListHeader.new( menu, controller )
	ListHeader0:setLeftRight( true, false, 100, 305 )
	ListHeader0:setTopBottom( true, false, 1.88, 29.88 )
	ListHeader0:setAlpha( HideIfEmptyString( 1 ) )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	ListHeader0.btnDisplayTextStroke:setLetterSpacing( 0.5 )
	ListHeader0:linkToElementModel( self, "rankString", true, function ( model )
		local rankString = Engine.GetModelValue( model )
		if rankString then
			ListHeader0.btnDisplayTextStroke:setText( Engine.Localize( rankString ) )
		end
	end )
	self:addElement( ListHeader0 )
	self.ListHeader0 = ListHeader0
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( false, true, -349, -313 )
	pixelU0:setTopBottom( false, false, -46.75, -43.25 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -349, -313 )
	Image1:setTopBottom( false, false, 44, 47.5 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:setLeftRight( true, false, 99.9, 305 )
	PrestigeMasterTierWidget:setTopBottom( true, false, 72, 97 )
	PrestigeMasterTierWidget:linkToElementModel( self, nil, false, function ( model )
		PrestigeMasterTierWidget:setModel( model, controller )
	end )
	PrestigeMasterTierWidget:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountByRank( rank ) )
		end
	end )
	PrestigeMasterTierWidget:linkToElementModel( self, "rank", true, function ( model )
		local f12_local0 = PrestigeMasterTierWidget
		UpdateElementState( self, "PrestigeMasterTierWidget", controller )
	end )
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
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				rankText:completeAnimation()
				self.rankText:setLeftRight( true, false, 99.9, 229.9 )
				self.rankText:setTopBottom( true, false, 34, 70 )
				self.rankText:setRGB( 1, 1, 1 )
				self.clipFinished( rankText, {} )
			end
		},
		OverLevel55 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				rankText:completeAnimation()
				self.rankText:setLeftRight( true, false, 99.9, 305 )
				self.rankText:setTopBottom( true, false, 39, 75 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageBorder:close()
		element.rankIcon:close()
		element.rankText:close()
		element.ListHeader0:close()
		element.PrestigeMasterTierWidget:close()
		element.ImageX:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

