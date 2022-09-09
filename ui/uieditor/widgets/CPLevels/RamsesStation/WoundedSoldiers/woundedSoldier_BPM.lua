-- a827da037a48152aecfd43ec2f40b947
-- This hash is used for caching, delete to decompile the file again

CoD.woundedSoldier_BPM = InheritFrom( LUI.UIElement )
CoD.woundedSoldier_BPM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.woundedSoldier_BPM )
	self.id = "woundedSoldier_BPM"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 35 )
	self:setTopBottom( true, false, 0, 35 )
	
	local HeartContainer = LUI.UIImage.new()
	HeartContainer:setLeftRight( true, false, 0, 34.67 )
	HeartContainer:setTopBottom( true, false, 0, 34.67 )
	HeartContainer:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_heartcontainer" ) )
	HeartContainer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeartContainer )
	self.HeartContainer = HeartContainer
	
	local BPArrow = LUI.UIImage.new()
	BPArrow:setLeftRight( true, false, 22.33, 33 )
	BPArrow:setTopBottom( true, false, 12, 22.67 )
	BPArrow:setAlpha( 0 )
	BPArrow:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_bparrow" ) )
	BPArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BPArrow )
	self.BPArrow = BPArrow
	
	local TextLabel = LUI.UITightText.new()
	TextLabel:setLeftRight( false, false, -15.86, 13.64 )
	TextLabel:setTopBottom( false, true, -23, -9 )
	TextLabel:setAlpha( 0.8 )
	TextLabel:setText( Engine.Localize( "0000" ) )
	TextLabel:setTTF( "fonts/escom.ttf" )
	TextLabel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextLabel:setShaderVector( 0, 0.08, 0.5, 0, 0 )
	TextLabel:setShaderVector( 1, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 2, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 3, 0, 0, 0, 0 )
	TextLabel:setShaderVector( 4, 0, 0, 0, 0 )
	TextLabel:setLetterSpacing( 0.5 )
	self:addElement( TextLabel )
	self.TextLabel = TextLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
