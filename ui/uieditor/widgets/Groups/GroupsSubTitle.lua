-- 8c77c1b84044f57b8109c1e1a590bfbf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.GroupsSubTitle = InheritFrom( LUI.UIElement )
CoD.GroupsSubTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsSubTitle )
	self.id = "GroupsSubTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local weaponNameLabel = LUI.UIText.new()
	weaponNameLabel:setLeftRight( true, true, 7, -4 )
	weaponNameLabel:setTopBottom( false, false, -10, 10 )
	weaponNameLabel:setTTF( "fonts/escom.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0.05, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.01, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponNameLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	local BorderBakedSolid000 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid000:setLeftRight( true, true, 0.5, 0 )
	BorderBakedSolid000:setTopBottom( true, true, -0.5, 1.5 )
	BorderBakedSolid000:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid000 )
	self.BorderBakedSolid000 = BorderBakedSolid000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid000:close()
		element.weaponNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
