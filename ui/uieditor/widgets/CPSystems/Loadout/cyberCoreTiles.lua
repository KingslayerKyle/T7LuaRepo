-- 8dd0e95977f4a00569badd513d7238fd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.cyberCoreTiles = InheritFrom( LUI.UIElement )
CoD.cyberCoreTiles.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cyberCoreTiles )
	self.id = "cyberCoreTiles"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 293 )
	self:setTopBottom( true, false, 0, 25 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.37 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local cybercoreSubHeader = LUI.UITightText.new()
	cybercoreSubHeader:setLeftRight( true, false, 4, 297 )
	cybercoreSubHeader:setTopBottom( true, false, 0, 25 )
	cybercoreSubHeader:setRGB( 0, 0, 0 )
	cybercoreSubHeader:setText( Engine.Localize( LocalizeToUpperString( "MENU_CYBERNETICS_CORE" ) ) )
	cybercoreSubHeader:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	cybercoreSubHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	cybercoreSubHeader:setShaderVector( 0, 0.06, 0, 0, 0 )
	cybercoreSubHeader:setShaderVector( 1, 0.02, 0, 0, 0 )
	cybercoreSubHeader:setShaderVector( 2, 1, 0, 0, 0 )

	LUI.OverrideFunction_CallOriginalFirst( cybercoreSubHeader, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( cybercoreSubHeader )
	self.cybercoreSubHeader = cybercoreSubHeader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Multicore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Multicore",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

