-- 4348c176b00890983743f535d5babf33
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 16 )
	
	local prestige = LUI.UIText.new()
	prestige:setLeftRight( true, false, 0, 80 )
	prestige:setTopBottom( true, false, 0, 16 )
	prestige:setText( Engine.Localize( "" ) )
	prestige:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prestige:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	prestige:setShaderVector( 0, 0.06, 0, 0, 0 )
	prestige:setShaderVector( 1, 0.02, 0, 0, 0 )
	prestige:setShaderVector( 2, 1, 0, 0, 0 )
	prestige:setLetterSpacing( 0.9 )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	prestige:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( prestige, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedUp( self, element, 0, 0 )
	end )
	self:addElement( prestige )
	self.prestige = prestige
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
