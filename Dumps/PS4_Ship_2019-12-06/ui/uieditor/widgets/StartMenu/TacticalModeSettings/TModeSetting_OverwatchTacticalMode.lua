CoD.TModeSetting_OverwatchTacticalMode = InheritFrom( LUI.UIElement )
CoD.TModeSetting_OverwatchTacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_OverwatchTacticalMode )
	self.id = "TModeSetting_OverwatchTacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_overwatch" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 526, 726 )
	TextBox00:setTopBottom( true, false, 268, 288 )
	TextBox00:setText( Engine.Localize( "CPUI_TMODE_ENEMY_DISTANCE_DESC" ) )
	TextBox00:setTTF( "fonts/default.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 526, 558 )
	Image00:setTopBottom( true, false, 236, 268 )
	Image00:setImage( RegisterImage( "uie_tmode0" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local TextBox500 = LUI.UIText.new()
	TextBox500:setLeftRight( true, false, 213, 413 )
	TextBox500:setTopBottom( true, false, 435, 455 )
	TextBox500:setText( Engine.Localize( "CPUI_TMODE_NEEDS_HELP_DESC" ) )
	TextBox500:setTTF( "fonts/default.ttf" )
	TextBox500:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox500:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox500 )
	self.TextBox500 = TextBox500
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, false, 213, 245 )
	Image500:setTopBottom( true, false, 402.76, 434.76 )
	Image500:setImage( RegisterImage( "uie_t7_hud_cp_help_reference_reticle" ) )
	Image500:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image500 )
	self.Image500 = Image500
	
	local TextBox100 = LUI.UIText.new()
	TextBox100:setLeftRight( true, false, 526, 726 )
	TextBox100:setTopBottom( true, false, 197, 217 )
	TextBox100:setText( Engine.Localize( "CPUI_TMODE_ENEMY_SHOOTING_DESC" ) )
	TextBox100:setTTF( "fonts/default.ttf" )
	TextBox100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox100 )
	self.TextBox100 = TextBox100
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, 526, 558 )
	Image100:setTopBottom( true, false, 165, 197 )
	Image100:setImage( RegisterImage( "uie_tmode1" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local TextBox400 = LUI.UIText.new()
	TextBox400:setLeftRight( true, false, 0, 200 )
	TextBox400:setTopBottom( true, false, 435.76, 455.76 )
	TextBox400:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox400:setTTF( "fonts/default.ttf" )
	TextBox400:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox400:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox400 )
	self.TextBox400 = TextBox400
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 0, 32 )
	Image400:setTopBottom( true, false, 403.76, 435.76 )
	Image400:setImage( RegisterImage( "uie_tmode4" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local TextBox2000 = LUI.UIText.new()
	TextBox2000:setLeftRight( true, false, 526, 726 )
	TextBox2000:setTopBottom( true, false, 131, 151 )
	TextBox2000:setText( Engine.Localize( "CPUI_TMODE_ENEMY_TYPE_DESC" ) )
	TextBox2000:setTTF( "fonts/default.ttf" )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2000 )
	self.TextBox2000 = TextBox2000
	
	local Image2000 = LUI.UIImage.new()
	Image2000:setLeftRight( true, false, 526, 558 )
	Image2000:setTopBottom( true, false, 100, 132 )
	Image2000:setImage( RegisterImage( "uie_tmode2" ) )
	Image2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2000 )
	self.Image2000 = Image2000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

