require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

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
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 3, -3 )
	FEButtonPanel0:setTopBottom( 0, 1, 10, -2 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.6 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FEButtonPanel00 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel00:setLeftRight( 0, 1, 4, -4 )
	FEButtonPanel00:setTopBottom( 0.5, 0.5, 22, 55 )
	FEButtonPanel00:setRGB( 0, 0, 0 )
	FEButtonPanel00:setAlpha( 0 )
	self:addElement( FEButtonPanel00 )
	self.FEButtonPanel00 = FEButtonPanel00
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, 3, -3 )
	TitleGlow1:setTopBottom( 0, 1, 42, 36 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( 0.5, 0.5, -139, 138 )
	PlayerName:setTopBottom( 0, 0, 50, 71 )
	PlayerName:setRGB( 0, 0, 0 )
	PlayerName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	PlayerName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerName:setLetterSpacing( 0.5 )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( 0.5, 0.5, -143, 143 )
	WpnName:setTopBottom( 0, 0, 14.5, 39.5 )
	WpnName:setText( LocalizeToUpperString( "WWWWWWWWWWWWWWWW" ) )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	self.resetProperties = function ()
		TitleGlow1:completeAnimation()
		TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 0.89, 0.89, 0.89 )
				self.clipFinished( TitleGlow1, {} )
			end
		},
		Coloured = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TitleGlow1:completeAnimation()
				self.TitleGlow1:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( TitleGlow1, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.FEButtonPanel00:close()
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

