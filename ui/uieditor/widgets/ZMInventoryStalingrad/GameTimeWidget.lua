-- 964755940e6832bb3b7d261ca2ff7f2f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.GameTimeWidget = InheritFrom( LUI.UIElement )
CoD.GameTimeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameTimeWidget )
	self.id = "GameTimeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, false, 0, 128 )
	FEButtonPanelShaderContainer:setTopBottom( true, false, 3, 33 )
	FEButtonPanelShaderContainer:setRGB( 0, 0, 0 )
	FEButtonPanelShaderContainer:setAlpha( 0.8 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 0, 128 )
	Backing:setTopBottom( true, false, 40, 94 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.64 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( true, false, 0, 128 )
	BackPanel:setTopBottom( true, false, 40, 69 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0.4 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local TimeElasped = LUI.UIText.new()
	TimeElasped:setLeftRight( true, false, 0, 128 )
	TimeElasped:setTopBottom( true, false, 7, 29 )
	TimeElasped:setTTF( "fonts/escom.ttf" )
	TimeElasped:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TimeElasped:setShaderVector( 0, 0, 0, 0, 0 )
	TimeElasped:setShaderVector( 1, 0, 0, 0, 0 )
	TimeElasped:setShaderVector( 2, 1, 0, 0, 0 )
	TimeElasped:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimeElasped:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeElasped )
	self.TimeElasped = TimeElasped
	
	local GameTimer = LUI.UIText.new()
	GameTimer:setLeftRight( true, false, 0, 128 )
	GameTimer:setTopBottom( true, false, 47, 87 )
	GameTimer:setText( "" )
	GameTimer:setTTF( "fonts/escom.ttf" )
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameTimer:linkToElementModel( self, "time", true, function ( model )
		SetupServerTime( controller, GameTimer )
	end )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, false, 0, 128 )
	HighlightFrame:setTopBottom( true, false, 40, 94 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	self.TimeElasped:linkToElementModel( self, "header", true, function ( model )
		local header = Engine.GetModelValue( model )
		if header then
			TimeElasped:setText( Engine.Localize( header ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )
				TimeElasped:completeAnimation()
				self.TimeElasped:setAlpha( 0 )
				self.clipFinished( TimeElasped, {} )
				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.clipFinished( GameTimer, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0.8 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0.64 )
				self.clipFinished( Backing, {} )
				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0.4 )
				self.clipFinished( BackPanel, {} )
				TimeElasped:completeAnimation()
				self.TimeElasped:setAlpha( 1 )
				self.clipFinished( TimeElasped, {} )
				GameTimer:completeAnimation()
				self.GameTimer:setAlpha( 1 )
				self.clipFinished( GameTimer, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 1 )
				self.clipFinished( HighlightFrame, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer:close()
		element.BackPanel:close()
		element.HighlightFrame:close()
		element.TimeElasped:close()
		element.GameTimer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

