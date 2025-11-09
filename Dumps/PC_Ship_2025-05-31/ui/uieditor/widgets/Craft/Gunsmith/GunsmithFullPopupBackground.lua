require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.buttonprompt" )

CoD.GunsmithFullPopupBackground = InheritFrom( LUI.UIElement )
CoD.GunsmithFullPopupBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithFullPopupBackground )
	self.id = "GunsmithFullPopupBackground"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.9 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 134, -151 )
	FEButtonPanel:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( false, false, -163, 150 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( true, true, 0, 0 )
	topBar:setTopBottom( true, false, 134, 197 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( true, true, 0, 0 )
	bottomBar:setTopBottom( false, true, -182, -137 )
	bottomBar:setRGB( 0, 0, 0 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local selectButtonPrompt = CoD.buttonprompt.new( menu, controller )
	selectButtonPrompt:setLeftRight( true, false, 80, 294 )
	selectButtonPrompt:setTopBottom( true, false, 545, 576 )
	selectButtonPrompt.label:setText( Engine.Localize( "MENU_SELECT" ) )
	selectButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			selectButtonPrompt.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( selectButtonPrompt )
	self.selectButtonPrompt = selectButtonPrompt
	
	local backButtonPrompt = CoD.buttonprompt.new( menu, controller )
	backButtonPrompt:setLeftRight( true, false, 163, 377 )
	backButtonPrompt:setTopBottom( true, false, 545, 576 )
	backButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	backButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			backButtonPrompt.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( backButtonPrompt )
	self.backButtonPrompt = backButtonPrompt
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 1280 )
	Image0:setTopBottom( true, false, 197, 538 )
	Image0:setRGB( 0.77, 0.82, 0.92 )
	Image0:setAlpha( 0.8 )
	Image0:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 64, 403.42 )
	Image2:setTopBottom( true, false, 197, 536.42 )
	Image2:setAlpha( 0.55 )
	Image2:setImage( RegisterImage( "uie_t7_icon_master_overlays_beta" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.FEButtonPanel:close()
		element.selectButtonPrompt:close()
		element.backButtonPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

