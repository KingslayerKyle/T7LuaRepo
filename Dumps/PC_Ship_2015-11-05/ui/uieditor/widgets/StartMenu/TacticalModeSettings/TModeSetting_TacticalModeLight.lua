CoD.TModeSetting_TacticalModeLight = InheritFrom( LUI.UIElement )
CoD.TModeSetting_TacticalModeLight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_TacticalModeLight )
	self.id = "TModeSetting_TacticalModeLight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_light" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox1000 = LUI.UIText.new()
	TextBox1000:setLeftRight( true, false, 525, 725 )
	TextBox1000:setTopBottom( true, false, 132, 152 )
	TextBox1000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_SHOOTING_DESC" ) )
	TextBox1000:setTTF( "fonts/default.ttf" )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1000 )
	self.TextBox1000 = TextBox1000
	
	local Image1000 = LUI.UIImage.new()
	Image1000:setLeftRight( true, false, 525, 557 )
	Image1000:setTopBottom( true, false, 100, 132 )
	Image1000:setImage( RegisterImage( "uie_tmode1" ) )
	Image1000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1000 )
	self.Image1000 = Image1000
	
	local TextBox3000 = LUI.UIText.new()
	TextBox3000:setLeftRight( true, false, 525, 725 )
	TextBox3000:setTopBottom( true, false, 271.49, 291.49 )
	TextBox3000:setText( Engine.Localize( "CPUI_TMODE_SHOOTER_DESC" ) )
	TextBox3000:setTTF( "fonts/default.ttf" )
	TextBox3000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3000 )
	self.TextBox3000 = TextBox3000
	
	local Image3000 = LUI.UIImage.new()
	Image3000:setLeftRight( true, false, 525, 557 )
	Image3000:setTopBottom( true, false, 239.49, 271.49 )
	Image3000:setImage( RegisterImage( "uie_tmode3" ) )
	Image3000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3000 )
	self.Image3000 = Image3000
	
	local TextBox4000 = LUI.UIText.new()
	TextBox4000:setLeftRight( true, false, 525, 725 )
	TextBox4000:setTopBottom( true, false, 202.49, 222.49 )
	TextBox4000:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox4000:setTTF( "fonts/default.ttf" )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4000 )
	self.TextBox4000 = TextBox4000
	
	local Image4000 = LUI.UIImage.new()
	Image4000:setLeftRight( true, false, 525, 557 )
	Image4000:setTopBottom( true, false, 171.49, 203.49 )
	Image4000:setImage( RegisterImage( "uie_tmode4" ) )
	Image4000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4000 )
	self.Image4000 = Image4000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

