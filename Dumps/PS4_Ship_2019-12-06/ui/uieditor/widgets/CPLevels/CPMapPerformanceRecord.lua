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
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 264 )
	
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
	Label0:setLeftRight( true, false, 39, 308 )
	Label0:setTopBottom( true, false, 14.11, 36.11 )
	Label0:setText( Engine.Localize( "MENU_PERFORMANCE_RECORD" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label0:setShaderVector( 0, 0.06, 0, 0, 0 )
	Label0:setShaderVector( 1, 0.02, 0, 0, 0 )
	Label0:setShaderVector( 2, 1, 0, 0, 0 )
	Label0:setLetterSpacing( 2 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 40, 165 )
	TextBox00:setTopBottom( true, false, 90, 112 )
	TextBox00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local TextBox70 = LUI.UIText.new()
	TextBox70:setLeftRight( true, false, 194, 335 )
	TextBox70:setTopBottom( true, false, 189.75, 211.75 )
	TextBox70:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_X_OF_Y" ) )
	TextBox70:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox70 )
	self.TextBox70 = TextBox70
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 194, 335 )
	TextBox0:setTopBottom( true, false, 90, 112 )
	TextBox0:setText( Engine.Localize( "MENU_ACCOLADES_X_OF_Y" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 39, 165 )
	TextBox3:setTopBottom( true, false, 57.25, 79.25 )
	TextBox3:setRGB( 0.95, 0.89, 0.03 )
	TextBox3:setText( Engine.Localize( "MENU_INDIVIDUAL_SCORE" ) )
	TextBox3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox301 = LUI.UIText.new()
	TextBox301:setLeftRight( true, false, 193, 335 )
	TextBox301:setTopBottom( true, false, 158, 180 )
	TextBox301:setRGB( 0.95, 0.89, 0.03 )
	TextBox301:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND" ) )
	TextBox301:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox301:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox301:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox301 )
	self.TextBox301 = TextBox301
	
	local TextBox3010 = LUI.UIText.new()
	TextBox3010:setLeftRight( true, false, 192, 335 )
	TextBox3010:setTopBottom( true, false, 57.25, 79.25 )
	TextBox3010:setRGB( 0.95, 0.89, 0.03 )
	TextBox3010:setText( Engine.Localize( "MENU_ACCOLADES" ) )
	TextBox3010:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox3010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3010 )
	self.TextBox3010 = TextBox3010
	
	self.TextBox00:linkToElementModel( self, "bestScore", true, function ( model )
		local bestScore = Engine.GetModelValue( model )
		if bestScore then
			TextBox00:setText( Engine.Localize( bestScore ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TextBox70:completeAnimation()
				self.TextBox70:setAlpha( 1 )
				self.clipFinished( TextBox70, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TextBox70:completeAnimation()
				self.TextBox70:setAlpha( 0 )
				self.clipFinished( TextBox70, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox301:completeAnimation()
				self.TextBox301:setAlpha( 0 )
				self.clipFinished( TextBox301, {} )
				TextBox3010:completeAnimation()
				self.TextBox3010:setAlpha( 0 )
				self.clipFinished( TextBox3010, {} )
			end
		},
		NoCollectiblesLoaded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				TextBox70:completeAnimation()
				self.TextBox70:setAlpha( 0 )
				self.clipFinished( TextBox70, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox301:completeAnimation()
				self.TextBox301:setAlpha( 0 )
				self.clipFinished( TextBox301, {} )
				TextBox3010:completeAnimation()
				self.TextBox3010:setAlpha( 0 )
				self.clipFinished( TextBox3010, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return IsCampaignZombies()
			end
		},
		{
			stateName = "NoCollectiblesLoaded",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "collectiblesTotal", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "collectiblesTotal", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "collectiblesTotal"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TextBox00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

