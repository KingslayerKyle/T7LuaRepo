-- 65f5ce746bfbed2c65b5d99e2f08bbcd
-- This hash is used for caching, delete to decompile the file again

CoD.woundedSoldier_TextTitle = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_TextTitle.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 1
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_TextTitle )
	self.id = "woundedSoldier_TextTitle"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 94 )
	self:setTopBottom( true, false, 0, 27 )
	
	local BracketL = LUI.UIImage.new()
	BracketL:setLeftRight( false, false, -54.83, -38.83 )
	BracketL:setTopBottom( false, true, -27, -0.33 )
	BracketL:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_bracketl" ) )
	BracketL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BracketL )
	self.BracketL = BracketL
	
	local TextLabel = LUI.UITightText.new()
	TextLabel:setLeftRight( false, false, -37.83, 35.98 )
	TextLabel:setTopBottom( false, true, -21.33, -5.33 )
	TextLabel:setText( Engine.Localize( "XXXXXXXX" ) )
	TextLabel:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextLabel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextLabel:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	TextLabel:setShaderVector( 1, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 2, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 3, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 4, 0, 0, 0, 0 )
	TextLabel:setLetterSpacing( 1.4 )
	self:addElement( TextLabel )
	self.TextLabel = TextLabel
	
	local NullSpace = LUI.UIImage.new()
	NullSpace:setLeftRight( true, false, 83.98, 84.83 )
	NullSpace:setTopBottom( true, false, -10.56, 2.44 )
	NullSpace:setAlpha( 0 )
	self:addElement( NullSpace )
	self.NullSpace = NullSpace
	
	local BracketR = LUI.UIImage.new()
	BracketR:setLeftRight( false, false, 38.83, 54.83 )
	BracketR:setTopBottom( false, true, -27, -0.33 )
	BracketR:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_bracketr" ) )
	BracketR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BracketR )
	self.BracketR = BracketR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

