require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidgetPlayerName" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.LoadingScreenHeroListWidget = InheritFrom( LUI.UIElement )
CoD.LoadingScreenHeroListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenHeroListWidget )
	self.id = "LoadingScreenHeroListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 166 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 1, -1 )
	FEButtonPanel0:setTopBottom( true, true, 0, 1 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( false, false, -80, 80 )
	HeroLobbyClientExtraCamRender:setTopBottom( false, false, -79, 81 )
	HeroLobbyClientExtraCamRender:setRGB( 1, 1, 1 )
	HeroLobbyClientExtraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	HeroLobbyClientExtraCamRender:setShaderVector( 0, 0.19, 0, 0.18, 0.53 )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	local LoadingScreenHeroListWidgetPlayerName = CoD.LoadingScreenHeroListWidgetPlayerName.new( menu, controller )
	LoadingScreenHeroListWidgetPlayerName:setLeftRight( true, true, 0, 0 )
	LoadingScreenHeroListWidgetPlayerName:setTopBottom( false, false, 25, 55 )
	LoadingScreenHeroListWidgetPlayerName:setRGB( 1, 1, 1 )
	LoadingScreenHeroListWidgetPlayerName:mergeStateConditions( {
		{
			stateName = "Coloured",
			condition = function ( menu, element, event )
				return IsSelfPlayerName( element, controller )
			end
		}
	} )
	self:addElement( LoadingScreenHeroListWidgetPlayerName )
	self.LoadingScreenHeroListWidgetPlayerName = LoadingScreenHeroListWidgetPlayerName
	
	local HeroLoadoutItem = LUI.UIText.new()
	HeroLoadoutItem:setLeftRight( true, true, 0, 0 )
	HeroLoadoutItem:setTopBottom( false, true, -26, -2 )
	HeroLoadoutItem:setRGB( 1, 1, 1 )
	HeroLoadoutItem:setAlpha( 0 )
	HeroLoadoutItem:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeroLoadoutItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeroLoadoutItem )
	self.HeroLoadoutItem = HeroLoadoutItem
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( false, true, -5, 3 )
	AbilityWheelPixel0:setTopBottom( false, true, -163, -155 )
	AbilityWheelPixel0:setRGB( 1, 1, 1 )
	AbilityWheelPixel0:setAlpha( 0.25 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	local AbilityWheelPixel00 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel00:setLeftRight( true, false, -3, 5 )
	AbilityWheelPixel00:setTopBottom( true, false, -3, 5 )
	AbilityWheelPixel00:setRGB( 1, 1, 1 )
	AbilityWheelPixel00:setAlpha( 0.25 )
	self:addElement( AbilityWheelPixel00 )
	self.AbilityWheelPixel00 = AbilityWheelPixel00
	
	local AbilityWheelPixel01 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel01:setLeftRight( false, true, -5, 3 )
	AbilityWheelPixel01:setTopBottom( false, true, -4, 4 )
	AbilityWheelPixel01:setRGB( 1, 1, 1 )
	AbilityWheelPixel01:setAlpha( 0.25 )
	self:addElement( AbilityWheelPixel01 )
	self.AbilityWheelPixel01 = AbilityWheelPixel01
	
	local AbilityWheelPixel000 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel000:setLeftRight( true, false, -3, 5 )
	AbilityWheelPixel000:setTopBottom( false, true, -4, 4 )
	AbilityWheelPixel000:setRGB( 1, 1, 1 )
	AbilityWheelPixel000:setAlpha( 0.25 )
	self:addElement( AbilityWheelPixel000 )
	self.AbilityWheelPixel000 = AbilityWheelPixel000
	
	self.HeroLobbyClientExtraCamRender:linkToElementModel( self, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenHeroListWidgetPlayerName.PlayerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.LoadingScreenHeroListWidgetPlayerName:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenHeroListWidgetPlayerName.WpnName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.HeroLoadoutItem:linkToElementModel( self, "playerHeroLoadoutItem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLoadoutItem:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.LoadingScreenHeroListWidgetPlayerName:close()
		self.AbilityWheelPixel0:close()
		self.AbilityWheelPixel00:close()
		self.AbilityWheelPixel01:close()
		self.AbilityWheelPixel000:close()
		self.HeroLobbyClientExtraCamRender:close()
		self.HeroLoadoutItem:close()
		CoD.LoadingScreenHeroListWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

