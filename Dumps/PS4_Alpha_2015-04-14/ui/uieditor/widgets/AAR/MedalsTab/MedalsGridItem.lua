CoD.MedalsGridItem = InheritFrom( LUI.UIElement )
CoD.MedalsGridItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalsGridItem )
	self.id = "MedalsGridItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 139 )
	
	local MedalBg = LUI.UIImage.new()
	MedalBg:setLeftRight( true, true, 0, 0 )
	MedalBg:setTopBottom( true, true, 0, 0 )
	MedalBg:setRGB( 0, 0, 0 )
	MedalBg:setAlpha( 0.1 )
	MedalBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MedalBg )
	self.MedalBg = MedalBg
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, true, 45.39, -51.45 )
	MedalImage:setTopBottom( true, false, 13.16, 86.33 )
	MedalImage:setRGB( 1, 1, 1 )
	MedalImage:setImage( RegisterImage( "uie_headicon_dead" ) )
	MedalImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local MedalNameBg = LUI.UIImage.new()
	MedalNameBg:setLeftRight( true, true, 0, -0.22 )
	MedalNameBg:setTopBottom( false, true, -24.67, 0.33 )
	MedalNameBg:setRGB( 0, 0, 0 )
	MedalNameBg:setAlpha( 0.21 )
	MedalNameBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MedalNameBg )
	self.MedalNameBg = MedalNameBg
	
	local MedalName = LUI.UIText.new()
	MedalName:setLeftRight( true, true, 0, -0.22 )
	MedalName:setTopBottom( false, false, 44.83, 69.83 )
	MedalName:setRGB( 1, 1, 1 )
	MedalName:setText( Engine.Localize( "Bloodthirsty" ) )
	MedalName:setTTF( "fonts/default.ttf" )
	MedalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MedalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MedalName )
	self.MedalName = MedalName
	
	local Times = LUI.UITightText.new()
	Times:setLeftRight( true, false, 0, 21 )
	Times:setTopBottom( false, false, 19.83, 44.83 )
	Times:setRGB( 1, 1, 1 )
	Times:setText( Engine.Localize( "x2" ) )
	Times:setTTF( "fonts/default.ttf" )
	self:addElement( Times )
	self.Times = Times
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

