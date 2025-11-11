require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShader" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.9 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local FEButtonPanel = CoD.FE_ButtonPanelShader.new( menu, controller )
	FEButtonPanel:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel:setTopBottom( 0, 1, 201, -227 )
	FEButtonPanel:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanel:setAlpha( 0 )
	FEButtonPanel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	FEButtonPanel:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( FEButtonPanel )
	self.FEButtonPanel = FEButtonPanel
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0.5, 0.5, -245, 225 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local topBar = LUI.UIImage.new()
	topBar:setLeftRight( 0, 1, 0, 0 )
	topBar:setTopBottom( 0, 0, 201, 295 )
	topBar:setRGB( 0, 0, 0 )
	self:addElement( topBar )
	self.topBar = topBar
	
	local bottomBar = LUI.UIImage.new()
	bottomBar:setLeftRight( 0, 1, 0, 0 )
	bottomBar:setTopBottom( 1, 1, -273, -205 )
	bottomBar:setRGB( 0, 0, 0 )
	self:addElement( bottomBar )
	self.bottomBar = bottomBar
	
	local selectButtonPrompt = CoD.buttonprompt.new( menu, controller )
	selectButtonPrompt:setLeftRight( 0, 0, 119.5, 440.5 )
	selectButtonPrompt:setTopBottom( 0, 0, 818, 864 )
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
	backButtonPrompt:setLeftRight( 0, 0, 244.5, 565.5 )
	backButtonPrompt:setTopBottom( 0, 0, 818, 864 )
	backButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	backButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			backButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( backButtonPrompt )
	self.backButtonPrompt = backButtonPrompt
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 1920 )
	Image0:setTopBottom( 0, 0, 295, 807 )
	Image0:setRGB( 0.77, 0.82, 0.92 )
	Image0:setAlpha( 0.8 )
	Image0:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 96, 605 )
	Image2:setTopBottom( 0, 0, 296, 805 )
	Image2:setAlpha( 0.55 )
	Image2:setImage( RegisterImage( "uie_t7_icon_master_overlays_beta" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.FEButtonPanel:close()
		self.selectButtonPrompt:close()
		self.backButtonPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

