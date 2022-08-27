-- 86122d9e90d75f043873a6d9c6ac0ca7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

CoD.MapVoteLabelUpper = InheritFrom( LUI.UIElement )
CoD.MapVoteLabelUpper.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteLabelUpper )
	self.id = "MapVoteLabelUpper"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 177 )
	self:setTopBottom( true, false, 0, 21 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListHeaderGlow0:setTopBottom( true, true, 0, 0 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UITightText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 4, 4 )
	btnDisplayTextStroke:setTopBottom( true, false, 0.5, 20.5 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "" ) )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.09, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 2.5 )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 2 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

