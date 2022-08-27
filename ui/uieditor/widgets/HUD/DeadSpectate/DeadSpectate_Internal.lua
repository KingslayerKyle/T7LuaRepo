-- 79aedeb9f6da217e56990bcc4db315f9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnLine" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBar" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingMode" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingBarPC" )

CoD.DeadSpectate_Internal = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DeadSpectate_Internal )
	self.id = "DeadSpectate_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, false, 17, 283 )
	LeftPanel:setTopBottom( true, false, 7.75, 52.75 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox0:setLeftRight( true, false, 17, 283 )
	Top3PlayerScoreBlurBox0:setTopBottom( true, false, 7.75, 52.75 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, false, 17, 283 )
	VSpanel:setTopBottom( true, false, 7.75, 52.75 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.5 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local LeftPanelLnT0 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT0:setLeftRight( true, false, 13, 287 )
	LeftPanelLnT0:setTopBottom( true, false, -0.25, 7.75 )
	LeftPanelLnT0:setRGB( 0, 0, 0 )
	LeftPanelLnT0:setAlpha( 0.2 )
	self:addElement( LeftPanelLnT0 )
	self.LeftPanelLnT0 = LeftPanelLnT0
	
	local LeftPanelLnT00 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT00:setLeftRight( true, false, 13, 287 )
	LeftPanelLnT00:setTopBottom( true, false, 52.75, 60.75 )
	LeftPanelLnT00:setRGB( 0, 0, 0 )
	LeftPanelLnT00:setAlpha( 0.2 )
	LeftPanelLnT00:setXRot( 180 )
	self:addElement( LeftPanelLnT00 )
	self.LeftPanelLnT00 = LeftPanelLnT00
	
	local playerName = LUI.UIText.new()
	playerName:setLeftRight( false, false, -100, 100 )
	playerName:setTopBottom( true, false, 17.75, 42.75 )
	playerName:setTTF( "fonts/default.ttf" )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playerName:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			playerName:setText( GetClientNameAndClanTag( controller, playerIndex ) )
		end
	end )
	self:addElement( playerName )
	self.playerName = playerName
	
	local spectatingBar = CoD.DeadSpectate_SpectatingBar.new( menu, controller )
	spectatingBar:setLeftRight( true, true, 0, 0 )
	spectatingBar:setTopBottom( true, false, -24.75, 0.75 )
	self:addElement( spectatingBar )
	self.spectatingBar = spectatingBar
	
	local spectatingMode = CoD.DeadSpectate_SpectatingMode.new( menu, controller )
	spectatingMode:setLeftRight( false, false, -150, 150 )
	spectatingMode:setTopBottom( false, true, 3, 28 )
	self:addElement( spectatingMode )
	self.spectatingMode = spectatingMode
	
	local codcastTeamText = LUI.UIText.new()
	codcastTeamText:setLeftRight( false, false, -150, 150 )
	codcastTeamText:setTopBottom( true, false, 60, 76 )
	codcastTeamText:setRGB( 0, 0, 0 )
	codcastTeamText:setAlpha( 0 )
	codcastTeamText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	codcastTeamText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	codcastTeamText:setShaderVector( 0, 0.11, 0, 0, 0 )
	codcastTeamText:setShaderVector( 1, 0.5, 0, 0, 0 )
	codcastTeamText:setShaderVector( 2, 2, 0, 0, 0 )
	codcastTeamText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	codcastTeamText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	codcastTeamText:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			codcastTeamText:setText( TeamStringFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( codcastTeamText )
	self.codcastTeamText = codcastTeamText
	
	local codcastTeamText0 = LUI.UIText.new()
	codcastTeamText0:setLeftRight( false, false, -150, 150 )
	codcastTeamText0:setTopBottom( true, false, 60, 76 )
	codcastTeamText0:setAlpha( 0 )
	codcastTeamText0:setTTF( "fonts/default.ttf" )
	codcastTeamText0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	codcastTeamText0:setShaderVector( 0, 0, 0, 0, 0 )
	codcastTeamText0:setShaderVector( 1, 0, 0, 0, 0 )
	codcastTeamText0:setShaderVector( 2, 1, 0, 0, 0 )
	codcastTeamText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	codcastTeamText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	codcastTeamText0:subscribeToGlobalModel( controller, "DeadSpectate", "playerIndex", function ( model )
		local playerIndex = Engine.GetModelValue( model )
		if playerIndex then
			codcastTeamText0:setText( TeamStringFromPlayerIndex( controller, playerIndex ) )
		end
	end )
	self:addElement( codcastTeamText0 )
	self.codcastTeamText0 = codcastTeamText0
	
	local DeadSpectateSpectatingBarPC = CoD.DeadSpectate_SpectatingBarPC.new( menu, controller )
	DeadSpectateSpectatingBarPC:setLeftRight( true, true, 0, 0 )
	DeadSpectateSpectatingBarPC:setTopBottom( true, false, -24.75, 0.25 )
	self:addElement( DeadSpectateSpectatingBarPC )
	self.DeadSpectateSpectatingBarPC = DeadSpectateSpectatingBarPC
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 1 )
				self.clipFinished( spectatingBar, {} )
				spectatingMode:completeAnimation()
				self.spectatingMode:setAlpha( 1 )
				self.clipFinished( spectatingMode, {} )
				codcastTeamText:completeAnimation()
				self.codcastTeamText:setAlpha( 0 )
				self.clipFinished( codcastTeamText, {} )
				codcastTeamText0:completeAnimation()
				self.codcastTeamText0:setAlpha( 0 )
				self.clipFinished( codcastTeamText0, {} )
			end
		},
		ShowOnlySpectatingPrompt = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				playerName:completeAnimation()
				self.playerName:setLeftRight( false, false, -100, 100 )
				self.playerName:setTopBottom( true, false, 9.75, 34.75 )
				self.clipFinished( playerName, {} )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 1 )
				self.clipFinished( spectatingBar, {} )
				spectatingMode:completeAnimation()
				self.spectatingMode:setAlpha( 0 )
				self.clipFinished( spectatingMode, {} )
				codcastTeamText:completeAnimation()
				self.codcastTeamText:setAlpha( 0 )
				self.clipFinished( codcastTeamText, {} )
				codcastTeamText0:completeAnimation()
				self.codcastTeamText0:setLeftRight( false, false, -150, 150 )
				self.codcastTeamText0:setTopBottom( true, false, 35, 51 )
				self.codcastTeamText0:setAlpha( 1 )
				self.clipFinished( codcastTeamText0, {} )
			end
		},
		HideAllPrompts = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				playerName:completeAnimation()
				self.playerName:setLeftRight( false, false, -100, 100 )
				self.playerName:setTopBottom( true, false, 9.75, 34.75 )
				self.clipFinished( playerName, {} )
				spectatingBar:completeAnimation()
				self.spectatingBar:setAlpha( 0 )
				self.clipFinished( spectatingBar, {} )
				spectatingMode:completeAnimation()
				self.spectatingMode:setAlpha( 0 )
				self.clipFinished( spectatingMode, {} )
				codcastTeamText:completeAnimation()
				self.codcastTeamText:setAlpha( 0 )
				self.clipFinished( codcastTeamText, {} )
				codcastTeamText0:completeAnimation()
				self.codcastTeamText0:setLeftRight( false, false, -150, 150 )
				self.codcastTeamText0:setTopBottom( true, false, 35, 51 )
				self.codcastTeamText0:setAlpha( 1 )
				self.clipFinished( codcastTeamText0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.Top3PlayerScoreBlurBox0:close()
		element.VSpanel:close()
		element.LeftPanelLnT0:close()
		element.LeftPanelLnT00:close()
		element.spectatingBar:close()
		element.spectatingMode:close()
		element.DeadSpectateSpectatingBarPC:close()
		element.playerName:close()
		element.codcastTeamText:close()
		element.codcastTeamText0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

