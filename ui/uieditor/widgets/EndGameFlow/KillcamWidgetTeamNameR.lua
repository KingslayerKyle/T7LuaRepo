-- 5e00f13c68ea2efa52caa6d564408d9f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.KillcamWidgetTeamNameR = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetTeamNameR.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetTeamNameR )
	self.id = "KillcamWidgetTeamNameR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 292 )
	self:setTopBottom( true, false, 0, 34 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, -2, 3 )
	cacItemTitleGlow0:setTopBottom( true, true, -3, 3 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( false, true, -292, -5.93 )
	weaponNameLabel:setTopBottom( false, false, -15, 17 )
	weaponNameLabel:setRGB( 0, 0, 0 )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 2 )
		SetStateFromText( self, element, "DefaultState", "NoText" )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0.14 )
				self.clipFinished( Glow, {} )

				weaponNameLabel:completeAnimation()
				self.weaponNameLabel:setAlpha( 1 )
				self.clipFinished( weaponNameLabel, {} )
			end
		},
		NoText = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
		element.weaponNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
