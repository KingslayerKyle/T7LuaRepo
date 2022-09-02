-- 5b7e7a811f37e3413e559e356bda079a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.LoadingScreenHeroListWidgetPlayerName = InheritFrom( LUI.UIElement )
CoD.LoadingScreenHeroListWidgetPlayerName.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenHeroListWidgetPlayerName )
	self.id = "LoadingScreenHeroListWidgetPlayerName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 30 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 2, -2 )
	FEButtonPanel0:setTopBottom( true, true, 6.68, -0.68 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.6 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FEButtonPanel00 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel00:setLeftRight( true, true, 2.5, -2.5 )
	FEButtonPanel00:setTopBottom( false, false, 14.32, 36.53 )
	FEButtonPanel00:setRGB( 0, 0, 0 )
	FEButtonPanel00:setAlpha( 0 )
	self:addElement( FEButtonPanel00 )
	self.FEButtonPanel00 = FEButtonPanel00
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 2, -2 )
	TitleGlow1:setTopBottom( true, true, 28, 23.43 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( false, false, -92.5, 92 )
	PlayerName:setTopBottom( true, false, 33.43, 47.43 )
	PlayerName:setRGB( 0, 0, 0 )
	PlayerName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	PlayerName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerName:setLetterSpacing( 0.5 )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( false, false, -95.5, 95 )
	WpnName:setTopBottom( true, false, 9.5, 26.5 )
	WpnName:setText( LocalizeToUpperString( "WWWWWWWWWWWWWWWW" ) )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 0.89, 0.89, 0.89 )
				self.clipFinished( TitleGlow1, {} )

				WpnName:completeAnimation()
				self.WpnName:setRGB( 1, 1, 1 )
				self.clipFinished( WpnName, {} )
			end
		},
		Coloured = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( TitleGlow1, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.FEButtonPanel00:close()
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

