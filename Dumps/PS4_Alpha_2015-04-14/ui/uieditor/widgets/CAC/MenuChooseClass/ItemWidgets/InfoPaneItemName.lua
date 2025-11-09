require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameWithVariantName" )

CoD.InfoPaneItemName = InheritFrom( LUI.UIElement )
CoD.InfoPaneItemName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfoPaneItemName )
	self.id = "InfoPaneItemName"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local TitleGlow2NoStretch = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow2NoStretch:setLeftRight( true, false, -2, 226 )
	TitleGlow2NoStretch:setTopBottom( true, true, -3, 3 )
	TitleGlow2NoStretch:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow2NoStretch:setAlpha( 0 )
	self:addElement( TitleGlow2NoStretch )
	self.TitleGlow2NoStretch = TitleGlow2NoStretch
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, false, -52.93, 252.07 )
	Glow2:setTopBottom( false, false, -30, 43 )
	Glow2:setRGB( 1, 1, 1 )
	Glow2:setAlpha( 0.14 )
	Glow2:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local weaponNameLabel0 = LUI.UIText.new()
	weaponNameLabel0:setLeftRight( true, true, 11, 446 )
	weaponNameLabel0:setTopBottom( false, false, -13, 19 )
	weaponNameLabel0:setRGB( 0, 0, 0 )
	weaponNameLabel0:setAlpha( 0 )
	weaponNameLabel0:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
	weaponNameLabel0:setTTF( "fonts/Entovo.ttf" )
	weaponNameLabel0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel0:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel0:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel0:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel0:setLetterSpacing( 0.6 )
	weaponNameLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponNameLabel0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponNameLabel0 )
	self.weaponNameLabel0 = weaponNameLabel0
	
	local weaponNameWithVariant = CoD.InfoPaneItemNameWithVariantName.new( menu, controller )
	weaponNameWithVariant:setLeftRight( true, false, 0, 595 )
	weaponNameWithVariant:setTopBottom( true, false, 0, 34 )
	weaponNameWithVariant:setRGB( 1, 1, 1 )
	weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	weaponNameWithVariant:linkToElementModel( self, nil, false, function ( model )
		weaponNameWithVariant:setModel( model, controller )
	end )
	weaponNameWithVariant:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponNameWithVariant )
	self.weaponNameWithVariant = weaponNameWithVariant
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				weaponNameLabel0:completeAnimation()
				self.weaponNameLabel0:setAlpha( 0 )
				self.clipFinished( weaponNameLabel0, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 0 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TitleGlow2NoStretch:completeAnimation()
				self.TitleGlow2NoStretch:setAlpha( 0 )
				self.clipFinished( TitleGlow2NoStretch, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				weaponNameLabel0:completeAnimation()
				self.weaponNameLabel0:setAlpha( 0 )
				self.weaponNameLabel0:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
				self.clipFinished( weaponNameLabel0, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 1 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TitleGlow2NoStretch:completeAnimation()
				self.TitleGlow2NoStretch:setAlpha( 1 )
				self.clipFinished( TitleGlow2NoStretch, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.14 )
				self.clipFinished( Glow2, {} )
				weaponNameLabel0:completeAnimation()
				self.weaponNameLabel0:setAlpha( 1 )
				self.weaponNameLabel0:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
				self.clipFinished( weaponNameLabel0, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 0 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		},
		NotEquippable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TitleGlow2NoStretch:completeAnimation()
				self.TitleGlow2NoStretch:setAlpha( 0.5 )
				self.clipFinished( TitleGlow2NoStretch, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.1 )
				self.clipFinished( Glow2, {} )
				weaponNameLabel0:completeAnimation()
				self.weaponNameLabel0:setAlpha( 1 )
				self.weaponNameLabel0:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
				self.clipFinished( weaponNameLabel0, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 0 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TitleGlow2NoStretch:completeAnimation()
				self.TitleGlow2NoStretch:setLeftRight( true, false, -2, 226 )
				self.TitleGlow2NoStretch:setTopBottom( true, true, -3, 3 )
				self.TitleGlow2NoStretch:setAlpha( 0.5 )
				self.clipFinished( TitleGlow2NoStretch, {} )
				Glow2:completeAnimation()
				self.Glow2:setLeftRight( true, false, -52.93, 252.07 )
				self.Glow2:setTopBottom( false, false, -30, 43 )
				self.Glow2:setAlpha( 0.1 )
				self.clipFinished( Glow2, {} )
				weaponNameLabel0:completeAnimation()
				self.weaponNameLabel0:setAlpha( 1 )
				self.weaponNameLabel0:setText( Engine.Localize( "MENU_NOT_AVAILABLE_CAPS" ) )
				self.clipFinished( weaponNameLabel0, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 0 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f11_local0 = IsCACSlotNeedWildcard( menu, element, controller )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		}
	} )
	self.close = function ( self )
		self.TitleGlow2NoStretch:close()
		self.weaponNameWithVariant:close()
		CoD.InfoPaneItemName.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

