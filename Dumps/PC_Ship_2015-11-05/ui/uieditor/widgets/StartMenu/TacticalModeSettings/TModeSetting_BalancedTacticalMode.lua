CoD.TModeSetting_BalancedTacticalMode = InheritFrom( LUI.UIElement )
CoD.TModeSetting_BalancedTacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_BalancedTacticalMode )
	self.id = "TModeSetting_BalancedTacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_balance" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox60 = LUI.UIText.new()
	TextBox60:setLeftRight( true, false, 525, 725 )
	TextBox60:setTopBottom( true, false, 272, 292 )
	TextBox60:setText( Engine.Localize( "CPUI_TMODE_HOTZONE_DESC" ) )
	TextBox60:setTTF( "fonts/default.ttf" )
	TextBox60:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox60:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox60 )
	self.TextBox60 = TextBox60
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, false, 525, 555 )
	Image60:setTopBottom( true, false, 242, 272 )
	Image60:setImage( RegisterImage( "uie_tmode6" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local TextBox1000 = LUI.UIText.new()
	TextBox1000:setLeftRight( true, false, 0, 200 )
	TextBox1000:setTopBottom( true, false, 432, 452 )
	TextBox1000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_SHOOTING_DESC" ) )
	TextBox1000:setTTF( "fonts/default.ttf" )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1000 )
	self.TextBox1000 = TextBox1000
	
	local Image1000 = LUI.UIImage.new()
	Image1000:setLeftRight( true, false, 0, 32 )
	Image1000:setTopBottom( true, false, 400, 432 )
	Image1000:setImage( RegisterImage( "uie_tmode1" ) )
	Image1000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1000 )
	self.Image1000 = Image1000
	
	local TextBox2000 = LUI.UIText.new()
	TextBox2000:setLeftRight( true, false, 525, 725 )
	TextBox2000:setTopBottom( true, false, 131, 151 )
	TextBox2000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_TYPE_DESC" ) )
	TextBox2000:setTTF( "fonts/default.ttf" )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2000 )
	self.TextBox2000 = TextBox2000
	
	local Image2000 = LUI.UIImage.new()
	Image2000:setLeftRight( true, false, 525, 557 )
	Image2000:setTopBottom( true, false, 100, 132 )
	Image2000:setImage( RegisterImage( "uie_tmode2" ) )
	Image2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2000 )
	self.Image2000 = Image2000
	
	local TextBox3000 = LUI.UIText.new()
	TextBox3000:setLeftRight( true, false, 525, 725 )
	TextBox3000:setTopBottom( true, false, 341, 361 )
	TextBox3000:setText( Engine.Localize( "CPUI_TMODE_SHOOTER_DESC" ) )
	TextBox3000:setTTF( "fonts/default.ttf" )
	TextBox3000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3000 )
	self.TextBox3000 = TextBox3000
	
	local Image3000 = LUI.UIImage.new()
	Image3000:setLeftRight( true, false, 525, 557 )
	Image3000:setTopBottom( true, false, 309, 341 )
	Image3000:setImage( RegisterImage( "uie_tmode3" ) )
	Image3000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3000 )
	self.Image3000 = Image3000
	
	local TextBox4000 = LUI.UIText.new()
	TextBox4000:setLeftRight( true, false, 525, 725 )
	TextBox4000:setTopBottom( true, false, 203, 223 )
	TextBox4000:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox4000:setTTF( "fonts/default.ttf" )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4000 )
	self.TextBox4000 = TextBox4000
	
	local Image4000 = LUI.UIImage.new()
	Image4000:setLeftRight( true, false, 525, 557 )
	Image4000:setTopBottom( true, false, 171, 203 )
	Image4000:setImage( RegisterImage( "uie_tmode4" ) )
	Image4000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4000 )
	self.Image4000 = Image4000
	
	local TextBox50 = LUI.UIText.new()
	TextBox50:setLeftRight( true, false, 238.5, 438.5 )
	TextBox50:setTopBottom( true, false, 435, 455 )
	TextBox50:setText( Engine.Localize( "CPUI_TMODE_NEEDS_HELP_DESC" ) )
	TextBox50:setTTF( "fonts/default.ttf" )
	TextBox50:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox50:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox50 )
	self.TextBox50 = TextBox50
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, false, 238.5, 270.5 )
	Image500:setTopBottom( true, false, 402.76, 434.76 )
	Image500:setImage( RegisterImage( "uie_t7_hud_cp_help_reference_reticle" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

