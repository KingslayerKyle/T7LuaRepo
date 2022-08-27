-- dfc3a3da9ff6e658e39c0a75132ddd45
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_StatusPanelLeftContainer" )

CoD.AmmoWidget_TacModeIndicator = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_TacModeIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_TacModeIndicator )
	self.id = "AmmoWidget_TacModeIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetStatusPanelLeftContainer = CoD.AmmoWidget_StatusPanelLeftContainer.new( menu, controller )
	AmmoWidgetStatusPanelLeftContainer:setLeftRight( true, false, -6.13, 41.87 )
	AmmoWidgetStatusPanelLeftContainer:setTopBottom( true, false, -4.23, 43.77 )
	AmmoWidgetStatusPanelLeftContainer:setRGB( 0.79, 0.82, 0.85 )
	AmmoWidgetStatusPanelLeftContainer:setZoom( -5 )
	AmmoWidgetStatusPanelLeftContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	AmmoWidgetStatusPanelLeftContainer:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( AmmoWidgetStatusPanelLeftContainer )
	self.AmmoWidgetStatusPanelLeftContainer = AmmoWidgetStatusPanelLeftContainer
	
	local tacModePlaceholder = LUI.UIText.new()
	tacModePlaceholder:setLeftRight( true, false, -15, 48 )
	tacModePlaceholder:setTopBottom( true, false, 4.25, 20.75 )
	tacModePlaceholder:setAlpha( 0 )
	tacModePlaceholder:setZRot( 28 )
	tacModePlaceholder:setText( Engine.Localize( "tac mode" ) )
	tacModePlaceholder:setTTF( "fonts/default.ttf" )
	tacModePlaceholder:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	tacModePlaceholder:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tacModePlaceholder )
	self.tacModePlaceholder = tacModePlaceholder
	
	local Outline = LUI.UIImage.new()
	Outline:setLeftRight( true, false, -6.13, 41.87 )
	Outline:setTopBottom( true, false, -4.23, 43.77 )
	Outline:setRGB( 0.82, 0.92, 0.93 )
	Outline:setAlpha( 0.4 )
	Outline:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_statuspanelline" ) )
	Outline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Outline:setShaderVector( 0, 0.1, 1, 0, 0 )
	Outline:setShaderVector( 1, 0, 0, 0, 0 )
	Outline:setShaderVector( 2, 0, 0, 0, 0 )
	Outline:setShaderVector( 3, 0, 0, 0, 0 )
	Outline:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Outline )
	self.Outline = Outline
	
	local ActiveFill = LUI.UIImage.new()
	ActiveFill:setLeftRight( true, false, -6.13, 41.87 )
	ActiveFill:setTopBottom( true, false, -4.23, 43.77 )
	ActiveFill:setAlpha( 0 )
	ActiveFill:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_statuspanelactivefill" ) )
	self:addElement( ActiveFill )
	self.ActiveFill = ActiveFill
	
	local Icon0 = LUI.UIImage.new()
	Icon0:setLeftRight( true, false, 9, 23 )
	Icon0:setTopBottom( true, false, 7.25, 21.25 )
	Icon0:setAlpha( 0.1 )
	Icon0:setZoom( -20 )
	Icon0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_statusev" ) )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 9, 23 )
	Icon:setTopBottom( true, false, 7.25, 21.25 )
	Icon:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_statusev" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AmmoWidgetStatusPanelLeftContainer:completeAnimation()
				self.AmmoWidgetStatusPanelLeftContainer:setAlpha( 1 )
				self.clipFinished( AmmoWidgetStatusPanelLeftContainer, {} )
				tacModePlaceholder:completeAnimation()
				self.tacModePlaceholder:setRGB( 0.35, 0.35, 0.35 )
				self.tacModePlaceholder:setAlpha( 0 )
				self.clipFinished( tacModePlaceholder, {} )
				ActiveFill:completeAnimation()
				self.ActiveFill:setAlpha( 0 )
				self.clipFinished( ActiveFill, {} )
				Icon0:completeAnimation()
				self.Icon0:setRGB( 0.43, 0.43, 0.43 )
				self.Icon0:setAlpha( 0.15 )
				self.clipFinished( Icon0, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.67, 0.67, 0.67 )
				self.Icon:setAlpha( 0.6 )
				self.clipFinished( Icon, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AmmoWidgetStatusPanelLeftContainer:completeAnimation()
				self.AmmoWidgetStatusPanelLeftContainer:setAlpha( 0 )
				self.clipFinished( AmmoWidgetStatusPanelLeftContainer, {} )
				tacModePlaceholder:completeAnimation()
				self.tacModePlaceholder:setAlpha( 0 )
				self.clipFinished( tacModePlaceholder, {} )
				Outline:completeAnimation()
				self.Outline:setAlpha( 0 )
				self.clipFinished( Outline, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.clipFinished( Icon0, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				AmmoWidgetStatusPanelLeftContainer:completeAnimation()
				self.AmmoWidgetStatusPanelLeftContainer:setAlpha( 1 )
				self.clipFinished( AmmoWidgetStatusPanelLeftContainer, {} )
				tacModePlaceholder:completeAnimation()
				self.tacModePlaceholder:setRGB( 0.98, 1, 0.19 )
				self.tacModePlaceholder:setAlpha( 0 )
				self.clipFinished( tacModePlaceholder, {} )
				Outline:completeAnimation()
				self.Outline:setAlpha( 0.3 )
				self.clipFinished( Outline, {} )
				ActiveFill:completeAnimation()
				self.ActiveFill:setRGB( 1, 1, 1 )
				self.ActiveFill:setAlpha( 0.85 )
				self.clipFinished( ActiveFill, {} )
				Icon0:completeAnimation()
				self.Icon0:setAlpha( 0 )
				self.clipFinished( Icon0, {} )
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 1, 1 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideCyberCoreWidget( controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.enhancedVisionActivated", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.enhancedVisionActivated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.enhancedVisionActivated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetStatusPanelLeftContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

