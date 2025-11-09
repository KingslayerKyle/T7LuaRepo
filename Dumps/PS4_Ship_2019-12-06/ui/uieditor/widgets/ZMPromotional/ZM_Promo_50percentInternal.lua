CoD.ZM_Promo_50percentInternal = InheritFrom( LUI.UIElement )
CoD.ZM_Promo_50percentInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_Promo_50percentInternal )
	self.id = "ZM_Promo_50percentInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 762 )
	self:setTopBottom( true, false, 0, 36 )
	
	local BLACKBOX = LUI.UIImage.new()
	BLACKBOX:setLeftRight( true, true, 0, 0 )
	BLACKBOX:setTopBottom( true, true, 0, 1 )
	BLACKBOX:setRGB( 0, 0, 0 )
	BLACKBOX:setAlpha( 0.35 )
	BLACKBOX:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BLACKBOX:setShaderVector( 0, 0.01, 0.03, 0.01, 0.03 )
	self:addElement( BLACKBOX )
	self.BLACKBOX = BLACKBOX
	
	local MarketingShadow = LUI.UIText.new()
	MarketingShadow:setLeftRight( false, false, -374, 372 )
	MarketingShadow:setTopBottom( false, true, -32.5, -2.5 )
	MarketingShadow:setRGB( 0, 0, 0 )
	MarketingShadow:setAlpha( 0.43 )
	MarketingShadow:setText( Engine.Localize( "MENU_50PERCENTOFF" ) )
	MarketingShadow:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	MarketingShadow:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	MarketingShadow:setShaderVector( 0, 0.21, 0, 0, 0 )
	MarketingShadow:setShaderVector( 1, 0.88, 0, 0, 0 )
	MarketingShadow:setShaderVector( 2, 1, 0, 0, 0 )
	MarketingShadow:setLetterSpacing( -2 )
	MarketingShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MarketingShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( MarketingShadow, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 6 )
	end )
	self:addElement( MarketingShadow )
	self.MarketingShadow = MarketingShadow
	
	local Marketing = LUI.UIText.new()
	Marketing:setLeftRight( false, false, -374, 372 )
	Marketing:setTopBottom( false, true, -32.5, -2.5 )
	Marketing:setRGB( 1, 0.75, 0.31 )
	Marketing:setText( Engine.Localize( "MENU_50PERCENTOFF" ) )
	Marketing:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Marketing:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Marketing:setShaderVector( 0, 0.01, 0, 0, 0 )
	Marketing:setShaderVector( 1, 0.01, 0, 0, 0 )
	Marketing:setShaderVector( 2, 1, 0, 0, 0 )
	Marketing:setLetterSpacing( -2 )
	Marketing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Marketing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Marketing, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 6 )
	end )
	self:addElement( Marketing )
	self.Marketing = Marketing
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HorizontalList = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HorizontalList",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "PurchaseVials" )
			end
		},
		{
			stateName = "Purchasing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

