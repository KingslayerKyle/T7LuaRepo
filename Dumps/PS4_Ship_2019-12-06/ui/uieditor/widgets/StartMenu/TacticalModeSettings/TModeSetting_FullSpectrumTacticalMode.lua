CoD.TModeSetting_FullSpectrumTacticalMode = InheritFrom( LUI.UIElement )
CoD.TModeSetting_FullSpectrumTacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_FullSpectrumTacticalMode )
	self.id = "TModeSetting_FullSpectrumTacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_full" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 200 )
	TextBox0:setTopBottom( true, false, 437, 457 )
	TextBox0:setText( Engine.Localize( "CPUI_TMODE_ENEMY_DISTANCE_DESC" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 32 )
	Image0:setTopBottom( true, false, 405, 437 )
	Image0:setImage( RegisterImage( "uie_tmode0" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox50 = LUI.UIText.new()
	TextBox50:setLeftRight( true, false, 423, 623 )
	TextBox50:setTopBottom( true, false, 435, 455 )
	TextBox50:setText( Engine.Localize( "CPUI_TMODE_NEEDS_HELP_DESC" ) )
	TextBox50:setTTF( "fonts/default.ttf" )
	TextBox50:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox50:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox50 )
	self.TextBox50 = TextBox50
	
	local TextBox60 = LUI.UIText.new()
	TextBox60:setLeftRight( true, false, 527, 727 )
	TextBox60:setTopBottom( true, false, 268, 288 )
	TextBox60:setText( Engine.Localize( "CPUI_TMODE_HOTZONE_DESC" ) )
	TextBox60:setTTF( "fonts/default.ttf" )
	TextBox60:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox60:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox60 )
	self.TextBox60 = TextBox60
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, false, 527, 557 )
	Image60:setTopBottom( true, false, 238, 268 )
	Image60:setImage( RegisterImage( "uie_tmode6" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local TextBox100 = LUI.UIText.new()
	TextBox100:setLeftRight( true, false, 525, 725 )
	TextBox100:setTopBottom( true, false, 198, 218 )
	TextBox100:setText( Engine.Localize( "CPUI_TMODE_ENEMY_SHOOTING_DESC" ) )
	TextBox100:setTTF( "fonts/default.ttf" )
	TextBox100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox100 )
	self.TextBox100 = TextBox100
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, 525, 557 )
	Image100:setTopBottom( true, false, 166, 198 )
	Image100:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_shooting" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local TextBox300 = LUI.UIText.new()
	TextBox300:setLeftRight( true, false, 527, 727 )
	TextBox300:setTopBottom( true, false, 341, 361 )
	TextBox300:setText( Engine.Localize( "CPUI_TMODE_SHOOTER_DESC" ) )
	TextBox300:setTTF( "fonts/default.ttf" )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox300 )
	self.TextBox300 = TextBox300
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 527, 559 )
	Image300:setTopBottom( true, false, 309, 341 )
	Image300:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_type_sniper" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local TextBox400 = LUI.UIText.new()
	TextBox400:setLeftRight( true, false, 209, 409 )
	TextBox400:setTopBottom( true, false, 434.76, 454.76 )
	TextBox400:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox400:setTTF( "fonts/default.ttf" )
	TextBox400:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox400:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox400 )
	self.TextBox400 = TextBox400
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 209, 241 )
	Image400:setTopBottom( true, false, 402.76, 434.76 )
	Image400:setImage( RegisterImage( "uie_tmode4" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
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
	Image2000:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_type_assault" ) )
	Image2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2000 )
	self.Image2000 = Image2000
	
	local Image500 = LUI.UIImage.new()
	Image500:setLeftRight( true, false, 423, 455 )
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

