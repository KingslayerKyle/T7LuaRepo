CoD.EACJumpHeightTextHeight = InheritFrom( LUI.UIElement )
CoD.EACJumpHeightTextHeight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EACJumpHeightTextHeight )
	self.id = "EACJumpHeightTextHeight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 161 )
	self:setTopBottom( true, false, 0, 38 )
	
	local HeightLbl = LUI.UIText.new()
	HeightLbl:setLeftRight( true, false, 49.27, 111.27 )
	HeightLbl:setTopBottom( true, false, 3, 38 )
	HeightLbl:setRGB( 1, 1, 1 )
	HeightLbl:setText( Engine.Localize( "4.52" ) )
	HeightLbl:setTTF( "fonts/UnitedSansRgMd.ttf" )
	HeightLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeightLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeightLbl )
	self.HeightLbl = HeightLbl
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

