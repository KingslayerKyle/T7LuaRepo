-- f8bae0b472b29d13f501da1b54f4c24a
-- This hash is used for caching, delete to decompile the file again

CoD.TModeSetting_AgileTacticalMode = InheritFrom( LUI.UIElement )
CoD.TModeSetting_AgileTacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_AgileTacticalMode )
	self.id = "TModeSetting_AgileTacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_agile" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox1000 = LUI.UIText.new()
	TextBox1000:setLeftRight( true, false, 525, 725 )
	TextBox1000:setTopBottom( true, false, 256, 276 )
	TextBox1000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_SHOOTING_DESC" ) )
	TextBox1000:setTTF( "fonts/default.ttf" )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1000 )
	self.TextBox1000 = TextBox1000
	
	local Image1000 = LUI.UIImage.new()
	Image1000:setLeftRight( true, false, 525, 557 )
	Image1000:setTopBottom( true, false, 224, 256 )
	Image1000:setImage( RegisterImage( "uie_tmode1" ) )
	Image1000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1000 )
	self.Image1000 = Image1000
	
	local TextBox40000 = LUI.UIText.new()
	TextBox40000:setLeftRight( true, false, 2, 202 )
	TextBox40000:setTopBottom( true, false, 434, 454 )
	TextBox40000:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox40000:setTTF( "fonts/default.ttf" )
	TextBox40000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox40000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox40000 )
	self.TextBox40000 = TextBox40000
	
	local Image40000 = LUI.UIImage.new()
	Image40000:setLeftRight( true, false, 2, 34 )
	Image40000:setTopBottom( true, false, 402, 434 )
	Image40000:setImage( RegisterImage( "uie_tmode4" ) )
	Image40000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40000 )
	self.Image40000 = Image40000
	
	local TextBox2000 = LUI.UIText.new()
	TextBox2000:setLeftRight( true, false, 525, 725 )
	TextBox2000:setTopBottom( true, false, 194.51, 214.51 )
	TextBox2000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_TYPE_DESC" ) )
	TextBox2000:setTTF( "fonts/default.ttf" )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2000 )
	self.TextBox2000 = TextBox2000
	
	local Image2000 = LUI.UIImage.new()
	Image2000:setLeftRight( true, false, 525, 557 )
	Image2000:setTopBottom( true, false, 163.51, 195.51 )
	Image2000:setImage( RegisterImage( "uie_tmode2" ) )
	Image2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2000 )
	self.Image2000 = Image2000
	
	local TextBox300000 = LUI.UIText.new()
	TextBox300000:setLeftRight( true, false, 525, 725 )
	TextBox300000:setTopBottom( true, false, 131, 151 )
	TextBox300000:setText( Engine.Localize( "CPUI_TMODE_SHOOTER_DESC" ) )
	TextBox300000:setTTF( "fonts/default.ttf" )
	TextBox300000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox300000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox300000 )
	self.TextBox300000 = TextBox300000
	
	local Image300000 = LUI.UIImage.new()
	Image300000:setLeftRight( true, false, 525, 557 )
	Image300000:setTopBottom( true, false, 99, 131 )
	Image300000:setImage( RegisterImage( "uie_tmode3" ) )
	Image300000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300000 )
	self.Image300000 = Image300000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
