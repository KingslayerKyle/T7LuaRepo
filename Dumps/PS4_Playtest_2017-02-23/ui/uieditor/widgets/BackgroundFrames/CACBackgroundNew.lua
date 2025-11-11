require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0, 1, -54, 44 )
	TitleBacking0:setTopBottom( 0, 0, -52, 128 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setAlpha( 0.65 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local heroPreview = CoD.CACHeroPreviewWidget.new( menu, controller )
	heroPreview:setLeftRight( 0.5, 0.5, -1174, 1076 )
	heroPreview:setTopBottom( 1, 1, -207.5, -0.5 )
	self:addElement( heroPreview )
	self.heroPreview = heroPreview
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 58, 126 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( 1, 1, -729, -77 )
	classAllocation:setTopBottom( 0, 0, 53, 105 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -117, 797 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, 0.5, 219.5 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine:setTopBottom( 0, 0, 123, 135 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	self.resetProperties = function ()
		heroPreview:completeAnimation()
		heroPreview:setLeftRight( 0.5, 0.5, -1174, 1076 )
		heroPreview:setTopBottom( 1, 1, -207.5, -0.5 )
		heroPreview:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setAlpha( 0 )
				self.clipFinished( heroPreview, {} )
			end
		},
		DisplayHero = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NameAndWeapon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setLeftRight( 0.5, 0.5, -1050, 1200 )
				self.heroPreview:setTopBottom( 1, 1, -207.5, -0.5 )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.heroPreview:close()
		self.PermanentUnlockTokensWidget:close()
		self.classAllocation:close()
		self.cac3dTitleIntermediary0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

