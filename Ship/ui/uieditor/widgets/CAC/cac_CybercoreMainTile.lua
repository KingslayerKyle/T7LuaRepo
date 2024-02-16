-- 32d70665274e49804e6ff409b0c12a24
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.cac_CybercoreMainTile = InheritFrom( LUI.UIElement )
CoD.cac_CybercoreMainTile.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_CybercoreMainTile )
	self.id = "cac_CybercoreMainTile"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 444 )
	self:setTopBottom( true, false, 0, 36 )
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, -2, 2 )
	cacItemTitleGlow0:setTopBottom( true, true, -2, 2 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local name = LUI.UIText.new()
	name:setLeftRight( true, false, 5, 444 )
	name:setTopBottom( true, false, 0, 36 )
	name:setRGB( 0.02, 0, 0 )
	name:setTTF( "fonts/escom.ttf" )
	name:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	name:setShaderVector( 0, 0.07, 0, 0, 0 )
	name:setShaderVector( 1, 0.02, 0, 0, 0 )
	name:setShaderVector( 2, 1, 0, 0, 0 )
	name:setLetterSpacing( 0.6 )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name:setText( Engine.Localize( _name ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( name )
	self.name = name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				name:completeAnimation()
				self.name:setAlpha( 1 )
				self.clipFinished( name, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
