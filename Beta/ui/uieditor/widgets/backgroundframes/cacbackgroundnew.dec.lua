require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewWidget" )
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
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local heroPreview = CoD.CACHeroPreviewWidget.new( menu, controller )
	heroPreview:setLeftRight( false, false, -783, 717 )
	heroPreview:setTopBottom( false, true, -138, 0 )
	self:addElement( heroPreview )
	self.heroPreview = heroPreview
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( false, true, -486, -51 )
	classAllocation:setTopBottom( true, false, 35, 70 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
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
				local f6_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f6_local0 then
					f6_local0 = IsMultiplayer()
				end
				return f6_local0
			end
		},
		{
			stateName = "NameAndWeapon",
			condition = function ( menu, element, event )
				local f7_local0 = IsCurrentMenu( menu, "chooseClass" )
				if f7_local0 then
					f7_local0 = IsMultiplayer()
				end
				return f7_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.heroPreview:close()
		self.classAllocation:close()
		self.cac3dTitleIntermediary0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

