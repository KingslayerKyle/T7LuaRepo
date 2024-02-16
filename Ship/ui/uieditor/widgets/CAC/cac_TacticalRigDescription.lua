-- 163c2d6495b99507571f6e364cbcf6df
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.cac_TacticalRigDescription = InheritFrom( LUI.UIElement )
CoD.cac_TacticalRigDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_TacticalRigDescription )
	self.id = "cac_TacticalRigDescription"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 406 )
	self:setTopBottom( true, false, 0, 36 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, 5 )
	TitleGlow1:setTopBottom( true, true, 0, 6 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local UpgradeName0 = LUI.UITightText.new()
	UpgradeName0:setLeftRight( true, false, 5, 330.44 )
	UpgradeName0:setTopBottom( true, false, 3, 39 )
	UpgradeName0:setRGB( 0.05, 0.01, 0.01 )
	UpgradeName0:setText( Engine.Localize( "CYBERCOM_RIG_PLAYER_MOVEMENT_PRO" ) )
	UpgradeName0:setTTF( "fonts/escom.ttf" )
	UpgradeName0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	UpgradeName0:setShaderVector( 0, 0.06, 0, 0, 0 )
	UpgradeName0:setShaderVector( 1, 0.02, 0, 0, 0 )
	UpgradeName0:setShaderVector( 2, 1, 0, 0, 0 )
	UpgradeName0:setLetterSpacing( 1 )

	LUI.OverrideFunction_CallOriginalFirst( UpgradeName0, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( UpgradeName0 )
	self.UpgradeName0 = UpgradeName0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				UpgradeName0:completeAnimation()
				self.UpgradeName0:setAlpha( 1 )
				self.clipFinished( UpgradeName0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
