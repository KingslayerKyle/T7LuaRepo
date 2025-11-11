require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.WeaponNameWidget = InheritFrom( LUI.UIElement )
CoD.WeaponNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponNameWidget )
	self.id = "WeaponNameWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 154 )
	self:setTopBottom( 0, 0, 0, 51 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, -3, 5 )
	cacItemTitleGlow0:setTopBottom( 0, 1, -4, 4 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -80, 74 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( 0, 1, 0, 0 )
	weaponNameLabel:setTopBottom( 0.5, 0.5, -22, 26 )
	weaponNameLabel:setRGB( 0, 0, 0 )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	weaponNameLabel:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
		SetStateFromText( self, element, "DefaultState", "NoText" )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	self.resetProperties = function ()
		cacItemTitleGlow0:completeAnimation()
		Glow:completeAnimation()
		weaponNameLabel:completeAnimation()
		cacItemTitleGlow0:setAlpha( 1 )
		Glow:setAlpha( 0.14 )
		weaponNameLabel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 0 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				weaponNameLabel:completeAnimation()
				self.weaponNameLabel:setAlpha( 0 )
				self.clipFinished( weaponNameLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoText",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "NoText" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
		self.weaponNameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

