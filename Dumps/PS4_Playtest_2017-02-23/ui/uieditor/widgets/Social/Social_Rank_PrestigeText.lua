CoD.Social_Rank_PrestigeText = InheritFrom( LUI.UIElement )
CoD.Social_Rank_PrestigeText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Rank_PrestigeText )
	self.id = "Social_Rank_PrestigeText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 118 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local prestige = LUI.UIText.new()
	prestige:setLeftRight( 0, 0, 0, 118 )
	prestige:setTopBottom( 0, 0, 0, 27 )
	prestige:setText( Engine.Localize( "" ) )
	prestige:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prestige:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	prestige:setShaderVector( 0, 0.06, 0, 0, 0 )
	prestige:setShaderVector( 1, 0.02, 0, 0, 0 )
	prestige:setShaderVector( 2, 1, 0, 0, 0 )
	prestige:setLetterSpacing( 1 )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( prestige, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedUp( self, element, 0, 0 )
	end )
	self:addElement( prestige )
	self.prestige = prestige
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

