CoD.woundedSoldier_BP = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_BP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_BP )
	self.id = "woundedSoldier_BP"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 58 )
	self:setTopBottom( true, false, 0, 16 )
	
	local BP1text = LUI.UITightText.new()
	BP1text:setLeftRight( false, false, -29.17, -8.17 )
	BP1text:setTopBottom( false, true, -14, 0 )
	BP1text:setAlpha( 0.8 )
	BP1text:setText( Engine.Localize( "120" ) )
	BP1text:setTTF( "fonts/escom.ttf" )
	BP1text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BP1text:setShaderVector( 0, 0.08, 0.5, 0, 0 )
	BP1text:setShaderVector( 1, 0, 0, 0, 0 )
	BP1text:setShaderVector( 2, 0, 0, 0, 0 )
	BP1text:setShaderVector( 3, 0, 0, 0, 0 )
	BP1text:setShaderVector( 4, 0, 0, 0, 0 )
	BP1text:setLetterSpacing( 0.5 )
	self:addElement( BP1text )
	self.BP1text = BP1text
	
	local IconHeart = LUI.UIImage.new()
	IconHeart:setLeftRight( true, false, 47.66, 58.33 )
	IconHeart:setTopBottom( true, false, 0, 16 )
	IconHeart:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_iconheart" ) )
	IconHeart:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconHeart )
	self.IconHeart = IconHeart
	
	local Slash = LUI.UITightText.new()
	Slash:setLeftRight( false, false, -8.17, -2.17 )
	Slash:setTopBottom( false, true, -14, 0 )
	Slash:setAlpha( 0.8 )
	Slash:setText( Engine.Localize( "/" ) )
	Slash:setTTF( "fonts/escom.ttf" )
	Slash:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Slash:setShaderVector( 0, 0.08, 0.5, 0, 0 )
	Slash:setShaderVector( 1, 0, 0, 0, 0 )
	Slash:setShaderVector( 2, 0, 0, 0, 0 )
	Slash:setShaderVector( 3, 0, 0, 0, 0 )
	Slash:setShaderVector( 4, 0, 0, 0, 0 )
	Slash:setLetterSpacing( 0.5 )
	self:addElement( Slash )
	self.Slash = Slash
	
	local BP2text = LUI.UITightText.new()
	BP2text:setLeftRight( false, false, -1.08, 13.42 )
	BP2text:setTopBottom( false, true, -14, 0 )
	BP2text:setAlpha( 0.8 )
	BP2text:setText( Engine.Localize( "64" ) )
	BP2text:setTTF( "fonts/escom.ttf" )
	BP2text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BP2text:setShaderVector( 0, 0.08, 0.5, 0, 0 )
	BP2text:setShaderVector( 1, 0, 0, 0, 0 )
	BP2text:setShaderVector( 2, 0, 0, 0, 0 )
	BP2text:setShaderVector( 3, 0, 0, 0, 0 )
	BP2text:setShaderVector( 4, 0, 0, 0, 0 )
	BP2text:setLetterSpacing( 0.5 )
	self:addElement( BP2text )
	self.BP2text = BP2text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

