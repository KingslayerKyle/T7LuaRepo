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
	darkbg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	scorestreakVignetteContainer:setRGB( 1, 1, 1 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( true, true, 0, 0 )
	FEButtonPanel:setTopBottom( true, true, 134, -151 )
	FEButtonPanel:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( false, false, -163, 150 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( true, true, 0, 0 )
	topBar:setTopBottom( true, false, 134, 197 )
	topBar:setRGB( 0, 0, 0 )
	topBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( true, true, 0, 0 )
	bottomBar:setTopBottom( false, true, -182, -137 )
	bottomBar:setRGB( 0, 0, 0 )
	bottomBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local selectButtonPrompt = CoD.buttonprompt.new( menu, controller )
	selectButtonPrompt:setLeftRight( true, false, 80, 294 )
	selectButtonPrompt:setTopBottom( true, false, 545, 576 )
	selectButtonPrompt:setRGB( 1, 1, 1 )
	selectButtonPrompt.label:setText( Engine.Localize( "MENU_SELECT" ) )
	selectButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( selectButtonPrompt )
	self.selectButtonPrompt = selectButtonPrompt
	
	local backButtonPrompt = CoD.buttonprompt.new( menu, controller )
	backButtonPrompt:setLeftRight( true, false, 163, 377 )
	backButtonPrompt:setTopBottom( true, false, 545, 576 )
	backButtonPrompt:setRGB( 1, 1, 1 )
	backButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	backButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			backButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( backButtonPrompt )
	self.backButtonPrompt = backButtonPrompt
	
	self.close = function ( self )
		self.scorestreakVignetteContainer:close()
		self.FEButtonPanel:close()
		self.selectButtonPrompt:close()
		self.backButtonPrompt:close()
		CoD.GunsmithFullPopupBackground.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

