-- 50979bb4eda2caf4ea42ce309eb80013
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

CoD.CACBackgroundNew = InheritFrom( LUI.UIElement )
CoD.CACBackgroundNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACBackgroundNew )
	self.id = "CACBackgroundNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, -36, 29 )
	TitleBacking0:setTopBottom( true, false, -35, 85 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setAlpha( 0.65 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local heroPreview = CoD.CACHeroPreviewWidget.new( menu, controller )
	heroPreview:setLeftRight( false, false, -783, 717 )
	heroPreview:setTopBottom( false, true, -138, 0 )
	self:addElement( heroPreview )
	self.heroPreview = heroPreview
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 39, 84 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( false, true, -486, -51 )
	classAllocation:setTopBottom( true, false, 35, 70 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -78, 531 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0, 146 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 82, 90 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setAlpha( 0 )
				self.clipFinished( heroPreview, {} )
			end
		},
		DisplayHero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setAlpha( 1 )
				self.clipFinished( heroPreview, {} )
			end
		},
		NameAndWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setLeftRight( false, false, -700, 800 )
				self.heroPreview:setTopBottom( false, true, -138, 0 )
				self.heroPreview:setAlpha( 1 )
				self.clipFinished( heroPreview, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayHero",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "CustomClass" ) and IsMultiplayer()
			end
		},
		{
			stateName = "NameAndWeapon",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "chooseClass" ) and IsMultiplayer()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.heroPreview:close()
		element.PermanentUnlockTokensWidget:close()
		element.classAllocation:close()
		element.cac3dTitleIntermediary0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

