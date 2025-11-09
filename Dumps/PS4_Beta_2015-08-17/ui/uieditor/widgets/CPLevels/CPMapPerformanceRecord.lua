CoD.CPMapPerformanceRecord = InheritFrom( LUI.UIElement )
CoD.CPMapPerformanceRecord.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPMapPerformanceRecord )
	self.id = "CPMapPerformanceRecord"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 530 )
	self:setTopBottom( true, false, 0, 181 )
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 0, 530 )
	SecTitleBG:setTopBottom( true, false, 1, 49.22 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 3, 31 )
	Image30:setTopBottom( true, false, 0, 4.22 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image301 = LUI.UIImage.new()
	Image301:setLeftRight( true, false, 3, 31 )
	Image301:setTopBottom( true, false, 45, 49.22 )
	Image301:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image301:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image301 )
	self.Image301 = Image301
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 39, 347 )
	Label0:setTopBottom( true, false, 16, 36 )
	Label0:setText( Engine.Localize( "MENU_MISSION_PERFORMANCE_RECORD" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label0:setShaderVector( 0, 0.06, 0, 0, 0 )
	Label0:setShaderVector( 1, 0.02, 0, 0, 0 )
	Label0:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local TextBox30 = LUI.UIText.new()
	TextBox30:setLeftRight( true, false, 23, 160 )
	TextBox30:setTopBottom( true, false, 68.5, 90.5 )
	TextBox30:setText( Engine.Localize( "MENU_INDIVIDUAL_SCORE" ) )
	TextBox30:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox30:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox30:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox30 )
	self.TextBox30 = TextBox30
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 26, 141 )
	TextBox00:setTopBottom( true, false, 98.75, 124.75 )
	TextBox00:setTTF( "fonts/escom.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local TextBox70 = LUI.UIText.new()
	TextBox70:setLeftRight( true, false, 355.5, 468 )
	TextBox70:setTopBottom( true, false, 98.75, 124.75 )
	TextBox70:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_X_OF_Y" ) )
	TextBox70:setTTF( "fonts/escom.ttf" )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox70 )
	self.TextBox70 = TextBox70
	
	local TextBox300 = LUI.UIText.new()
	TextBox300:setLeftRight( true, false, 355.5, 477 )
	TextBox300:setTopBottom( true, false, 68.5, 90.5 )
	TextBox300:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND" ) )
	TextBox300:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox300 )
	self.TextBox300 = TextBox300
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 177, 289.5 )
	TextBox0:setTopBottom( true, false, 98.75, 124.75 )
	TextBox0:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_X_OF_Y" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 177, 298.5 )
	TextBox1:setTopBottom( true, false, 68.5, 90.5 )
	TextBox1:setText( Engine.Localize( "MENU_ACCOLADES" ) )
	TextBox1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	self.TextBox00:linkToElementModel( self, "bestScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox00:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TextBox00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

