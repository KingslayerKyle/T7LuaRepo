require( "ui.uieditor.widgets.CAC.NewBreadcrumbCount" )

CoD.ChooseCharacterLoadout_ButtonFooter_Personalize = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_ButtonFooter_Personalize.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_ButtonFooter_Personalize )
	self.id = "ChooseCharacterLoadout_ButtonFooter_Personalize"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 99 )
	self:setTopBottom( 0, 0, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local BlackBoxBottomLeft = LUI.UIImage.new()
	BlackBoxBottomLeft:setLeftRight( 0, 1, -44, 0 )
	BlackBoxBottomLeft:setTopBottom( 0.5, 0.5, 18, 27 )
	BlackBoxBottomLeft:setRGB( 0, 0, 0 )
	BlackBoxBottomLeft:setAlpha( 0.6 )
	self:addElement( BlackBoxBottomLeft )
	self.BlackBoxBottomLeft = BlackBoxBottomLeft
	
	local BlackBoxLeft = LUI.UIImage.new()
	BlackBoxLeft:setLeftRight( 0, 1, -44, 0 )
	BlackBoxLeft:setTopBottom( 0.5, 0.5, -28, 13 )
	BlackBoxLeft:setRGB( 0, 0, 0 )
	BlackBoxLeft:setAlpha( 0.45 )
	self:addElement( BlackBoxLeft )
	self.BlackBoxLeft = BlackBoxLeft
	
	local personalizeLabel = LUI.UITightText.new()
	personalizeLabel:setLeftRight( 0.5, 0.5, -50, 49 )
	personalizeLabel:setTopBottom( 0.5, 0.5, -23, 7 )
	personalizeLabel:setText( Engine.Localize( "HEROES_PERSONALIZE" ) )
	personalizeLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( personalizeLabel, "setText", function ( element, text )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 5, 66 )
	end )
	self:addElement( personalizeLabel )
	self.personalizeLabel = personalizeLabel
	
	local Button1 = LUI.UIImage.new()
	Button1:setLeftRight( 0, 0, -41, -8 )
	Button1:setTopBottom( 0.5, 0.5, -24, 10 )
	Button1:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Button1:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Button1 )
	self.Button1 = Button1
	
	local LineRight = LUI.UIImage.new()
	LineRight:setLeftRight( 1, 1, -18, 6 )
	LineRight:setTopBottom( 0.5, 0.5, -24, 8 )
	LineRight:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	LineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineRight )
	self.LineRight = LineRight
	
	local borderLines = LUI.UIImage.new()
	borderLines:setLeftRight( 0, 1, -94, 0 )
	borderLines:setTopBottom( 0.5, 0.5, -48, 39 )
	borderLines:setAlpha( 0.8 )
	borderLines:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_left" ) )
	borderLines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	borderLines:setShaderVector( 0, 0, 0, 0, 0 )
	borderLines:setupNineSliceShader( 105, 43 )
	self:addElement( borderLines )
	self.borderLines = borderLines
	
	local breadcrumbCount = CoD.NewBreadcrumbCount.new( menu, controller )
	breadcrumbCount:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShouldDisplayWeaponGroupBreadcrumbCount( self, controller )
			end
		}
	} )
	breadcrumbCount:linkToElementModel( breadcrumbCount, "breadcrumbCount", true, function ( model )
		menu:updateElementState( breadcrumbCount, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "breadcrumbCount"
		} )
	end )
	breadcrumbCount:setLeftRight( 1, 1, -30.5, -3.5 )
	breadcrumbCount:setTopBottom( 0, 0, -18.5, 8.5 )
	breadcrumbCount:linkToElementModel( self, "breadcrumbCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			breadcrumbCount.countText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( breadcrumbCount )
	self.breadcrumbCount = breadcrumbCount
	
	self.resetProperties = function ()
		Button1:completeAnimation()
		personalizeLabel:completeAnimation()
		Button1:setRGB( 1, 1, 1 )
		personalizeLabel:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoPersonalization = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				personalizeLabel:completeAnimation()
				self.personalizeLabel:setRGB( 0.28, 0.28, 0.28 )
				self.clipFinished( personalizeLabel, {} )
				Button1:completeAnimation()
				self.Button1:setRGB( 0.49, 0.49, 0.49 )
				self.clipFinished( Button1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoPersonalization",
			condition = function ( menu, element, event )
				return not CharacterHasAnyWeaponUnlocked( controller, element )
			end
		}
	} )
	self:linkToElementModel( self, "heroIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.breadcrumbCount:close()
		self.Button1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

