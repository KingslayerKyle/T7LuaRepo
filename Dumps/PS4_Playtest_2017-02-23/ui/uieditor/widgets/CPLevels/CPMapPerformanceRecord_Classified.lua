CoD.CPMapPerformanceRecord_Classified = InheritFrom( LUI.UIElement )
CoD.CPMapPerformanceRecord_Classified.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPMapPerformanceRecord_Classified )
	self.id = "CPMapPerformanceRecord_Classified"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 517 )
	self:setTopBottom( 0, 0, 0, 396 )
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( 0, 0, 0, 795 )
	SecTitleBG:setTopBottom( 0, 0, 2, 74 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 5, 47 )
	Image30:setTopBottom( 0, 0, 0, 6 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image301 = LUI.UIImage.new()
	Image301:setLeftRight( 0, 0, 5, 47 )
	Image301:setTopBottom( 0, 0, 68, 74 )
	Image301:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image301:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image301 )
	self.Image301 = Image301
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 58, 462 )
	Label0:setTopBottom( 0, 0, 21, 54 )
	Label0:setText( Engine.Localize( "MENU_PERFORMANCE_RECORD" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Label0:setShaderVector( 0, 0.06, 0, 0, 0 )
	Label0:setShaderVector( 1, 0.02, 0, 0, 0 )
	Label0:setShaderVector( 2, 1, 0, 0, 0 )
	Label0:setLetterSpacing( 2 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( 0, 0, 60, 248 )
	TextBox00:setTopBottom( 0, 0, 135, 168 )
	TextBox00:setText( Engine.Localize( "-" ) )
	TextBox00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local TextBox70 = LUI.UIText.new()
	TextBox70:setLeftRight( 0, 0, 291, 498 )
	TextBox70:setTopBottom( 0, 0, 285, 318 )
	TextBox70:setText( Engine.Localize( "-" ) )
	TextBox70:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox70 )
	self.TextBox70 = TextBox70
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( 0, 0, 59, 248 )
	TextBox3:setTopBottom( 0, 0, 86, 119 )
	TextBox3:setRGB( 0.95, 0.89, 0.03 )
	TextBox3:setText( Engine.Localize( "MENU_INDIVIDUAL_SCORE" ) )
	TextBox3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox301 = LUI.UIText.new()
	TextBox301:setLeftRight( 0, 0, 289, 502 )
	TextBox301:setTopBottom( 0, 0, 237, 270 )
	TextBox301:setRGB( 0.95, 0.89, 0.03 )
	TextBox301:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND" ) )
	TextBox301:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox301:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox301:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox301 )
	self.TextBox301 = TextBox301
	
	local TextBox3010 = LUI.UIText.new()
	TextBox3010:setLeftRight( 0, 0, 288, 502 )
	TextBox3010:setTopBottom( 0, 0, 86, 119 )
	TextBox3010:setRGB( 0.95, 0.89, 0.03 )
	TextBox3010:setText( Engine.Localize( "MENU_ACCOLADES" ) )
	TextBox3010:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3010 )
	self.TextBox3010 = TextBox3010
	
	local TextBox000 = LUI.UIText.new()
	TextBox000:setLeftRight( 0, 0, 291, 498 )
	TextBox000:setTopBottom( 0, 0, 135, 168 )
	TextBox000:setText( Engine.Localize( "-" ) )
	TextBox000:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox000 )
	self.TextBox000 = TextBox000
	
	self.resetProperties = function ()
		TextBox70:completeAnimation()
		TextBox301:completeAnimation()
		TextBox000:completeAnimation()
		TextBox3010:completeAnimation()
		TextBox70:setAlpha( 1 )
		TextBox301:setAlpha( 1 )
		TextBox000:setAlpha( 1 )
		TextBox3010:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				TextBox70:completeAnimation()
				self.TextBox70:setAlpha( 0 )
				self.clipFinished( TextBox70, {} )
				TextBox301:completeAnimation()
				self.TextBox301:setAlpha( 0 )
				self.clipFinished( TextBox301, {} )
				TextBox3010:completeAnimation()
				self.TextBox3010:setAlpha( 0 )
				self.clipFinished( TextBox3010, {} )
				TextBox000:completeAnimation()
				self.TextBox000:setAlpha( 0 )
				self.clipFinished( TextBox000, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return IsCampaignZombies()
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

