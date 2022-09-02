-- ea7e77a5cfd34e4cf3696d2af148a710
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.CombatRecordLeftTitleWithBackground = InheritFrom( LUI.UIElement )
CoD.CombatRecordLeftTitleWithBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordLeftTitleWithBackground )
	self.id = "CombatRecordLeftTitleWithBackground"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 36 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, 0 )
	TitleGlow1:setTopBottom( true, true, -2.5, 2.5 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Label = LUI.UIText.new()
	Label:setLeftRight( true, false, 4, 253 )
	Label:setTopBottom( false, false, -12.5, 12.5 )
	Label:setRGB( 0, 0, 0 )
	Label:setText( Engine.Localize( "MENU_FAVORITE_SPECIALIST" ) )
	Label:setTTF( "fonts/escom.ttf" )
	Label:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label:setShaderVector( 0, 0.05, 0, 0, 0 )
	Label:setShaderVector( 1, 0.3, 0, 0, 0 )
	Label:setShaderVector( 2, 1, 0, 0, 0 )
	Label:setLetterSpacing( 0.6 )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 7 )
	end )
	self:addElement( Label )
	self.Label = Label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

