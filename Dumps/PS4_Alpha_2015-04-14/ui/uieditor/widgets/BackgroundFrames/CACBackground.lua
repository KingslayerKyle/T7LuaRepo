require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewWidget" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

CoD.CACBackground = InheritFrom( LUI.UIElement )
CoD.CACBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACBackground )
	self.id = "CACBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local heroPreview = CoD.CACHeroPreviewWidget.new( menu, controller )
	heroPreview:setLeftRight( false, false, -785, 715 )
	heroPreview:setTopBottom( false, true, -138, 0 )
	heroPreview:setRGB( 1, 1, 1 )
	heroPreview:mergeStateConditions( {
		{
			stateName = "HiddenHero",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "chooseClass" )
			end
		}
	} )
	self:addElement( heroPreview )
	self.heroPreview = heroPreview
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -4, 84 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setAlpha( 0.6 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( false, true, -494, -59 )
	classAllocation:setTopBottom( true, false, 32, 67 )
	classAllocation:setRGB( 1, 1, 1 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setLeftRight( false, false, -785, 715 )
				self.heroPreview:setTopBottom( false, true, -138, 0 )
				self.clipFinished( heroPreview, {} )
			end
		},
		HiddenHero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				heroPreview:completeAnimation()
				self.heroPreview:setLeftRight( false, false, -662, 838 )
				self.heroPreview:setTopBottom( false, true, -138, 0 )
				self.clipFinished( heroPreview, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HiddenHero",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "chooseClass" )
			end
		}
	} )
	self.close = function ( self )
		self.heroPreview:close()
		self.classAllocation:close()
		self.cac3dTitleIntermediary0:close()
		CoD.CACBackground.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

