require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Fileshare_BuyExtraSlots = InheritFrom( LUI.UIElement )
CoD.Fileshare_BuyExtraSlots.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Fileshare_BuyExtraSlots )
	self.id = "Fileshare_BuyExtraSlots"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 195 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 525 )
	BG:setTopBottom( 0, 0, 0, 195 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.6 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 0, 523, 1 )
	TitleGlow1:setTopBottom( 0, 0, 0, 54 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local HeaderLabel = LUI.UITightText.new()
	HeaderLabel:setLeftRight( 0, 0, 26, 549 )
	HeaderLabel:setTopBottom( 0, 0, 5, 50 )
	HeaderLabel:setRGB( 0, 0, 0 )
	HeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
	HeaderLabel:setTTF( "fonts/escom.ttf" )
	HeaderLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	HeaderLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	HeaderLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	HeaderLabel:setShaderVector( 2, 1, 0, 0, 0 )
	HeaderLabel:setLetterSpacing( 0.6 )
	self:addElement( HeaderLabel )
	self.HeaderLabel = HeaderLabel
	
	local BuyMoreDesc = LUI.UIText.new()
	BuyMoreDesc:setLeftRight( 0, 0, 26, 494 )
	BuyMoreDesc:setTopBottom( 0, 0, 73, 101 )
	BuyMoreDesc:setAlpha( 0.8 )
	BuyMoreDesc:setText( Engine.Localize( "MENU_FILESHARE_BUY_SLOTS_DESC" ) )
	BuyMoreDesc:setTTF( "fonts/default.ttf" )
	BuyMoreDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BuyMoreDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BuyMoreDesc )
	self.BuyMoreDesc = BuyMoreDesc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

