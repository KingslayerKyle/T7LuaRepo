-- 763e57ce70bcc1b8540cf7ccd98a7612
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.FE_3dTitleNumberGames = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleNumberGames.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FE_3dTitleNumberGames )
	self.id = "FE_3dTitleNumberGames"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 23 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, -11, 11 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 7.13, 91.13 )
	Label1:setTopBottom( true, false, 6.5, 22.5 )
	Label1:setRGB( 0.71, 0.76, 0.77 )
	Label1:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	Label1:setTTF( "fonts/default.ttf" )
	Label1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Label1:setShaderVector( 0, 0.05, 0, 0, 0 )
	Label1:setShaderVector( 1, 0, 0, 0, 0 )
	Label1:setShaderVector( 2, 0, 0, 0, 0 )
	Label1:setShaderVector( 3, 0, 0, 0, 0 )
	Label1:setShaderVector( 4, 0, 0, 0, 0 )
	Label1:setLetterSpacing( 1 )

	LUI.OverrideFunction_CallOriginalFirst( Label1, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
