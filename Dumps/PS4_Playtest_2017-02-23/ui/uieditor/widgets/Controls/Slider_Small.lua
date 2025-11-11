require( "ui.uieditor.widgets.GameSettings.GameSettings_ChangedIndicator" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Control_Item" )

local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		self:setHandleMouseButton( false )
		self:setForceMouseEventDispatch( true )
	end
	self:linkToElementModel( self, "currentSelection", true, function ( model )
		local selectedIndex = Engine.GetModelValue( model )
		local row, col = self.Slider:getRowAndColumnForIndex( selectedIndex - 1 )
		self.Slider:setActiveIndex( row, col, 0 )
	end )
end

CoD.Slider_Small = InheritFrom( LUI.UIElement )
CoD.Slider_Small.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Slider_Small )
	self.id = "Slider_Small"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 816 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle0 = LUI.UIImage.new()
	BoxButtonLrgIdle0:setLeftRight( 0, 0, 502, 816 )
	BoxButtonLrgIdle0:setTopBottom( 0, 0, 3, 45 )
	BoxButtonLrgIdle0:setAlpha( 0.4 )
	BoxButtonLrgIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle0 )
	self.BoxButtonLrgIdle0 = BoxButtonLrgIdle0
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 0, 54, 502 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, 3, 45 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 57, 496 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( 0, 0, 505, 816 )
	StartMenuframenoBG1:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 87, 420 )
	Title:setTopBottom( 0, 0, 7, 40 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Slider = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Slider:makeFocusable()
	Slider:mergeStateConditions( {
		{
			stateName = "ArrowsHidden",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "hideArrows" )
			end
		},
		{
			stateName = "LeftArrowHidden",
			condition = function ( menu, element, event )
				local f6_local0
				if not ListLoopEdgesEnabled( self, "Slider" ) then
					f6_local0 = IsFirstListElement( element )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "RightArrowHidden",
			condition = function ( menu, element, event )
				local f7_local0
				if not ListLoopEdgesEnabled( self, "Slider" ) then
					f7_local0 = IsLastListElement( element )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	Slider:setLeftRight( 0, 0, 534, 786 )
	Slider:setTopBottom( 0, 0, 0, 45 )
	Slider:setWidgetType( CoD.StartMenu_Options_Slider_Control_Item )
	Slider:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Slider:setDataSource( modelValue )
		end
	end )
	Slider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		UpdateElementState( self, "GameSettingsChangedIndicator", controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return retVal
	end )
	self:addElement( Slider )
	self.Slider = Slider
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( 0, 0, 0, 24 )
	Image0000:setTopBottom( 0, 0, 0, 6 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 24 )
	Image0:setTopBottom( 1, 1, -6, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00002 = LUI.UIImage.new()
	Image00002:setLeftRight( 0, 0, 821, 845 )
	Image00002:setTopBottom( 0, 0, 0, 6 )
	Image00002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00002 )
	self.Image00002 = Image00002
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 821, 845 )
	Image00:setTopBottom( 1, 1, -6, 0 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 0, 505, 816 )
	FocusBarB:setTopBottom( 1, 1, -6, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 0, 505, 816 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local GameSettingsChangedIndicator = CoD.GameSettings_ChangedIndicator.new( menu, controller )
	GameSettingsChangedIndicator:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsCampaign() then
					f10_local0 = not IsGametypeItemSettingDefaultNew( self, "Slider" )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	GameSettingsChangedIndicator:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( GameSettingsChangedIndicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	GameSettingsChangedIndicator:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		menu:updateElementState( GameSettingsChangedIndicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		} )
	end )
	GameSettingsChangedIndicator:setLeftRight( 0, 0, 15.5, 60.5 )
	GameSettingsChangedIndicator:setTopBottom( 0, 0, 1.5, 46.5 )
	GameSettingsChangedIndicator:linkToElementModel( self, nil, false, function ( model )
		GameSettingsChangedIndicator:setModel( model, controller )
	end )
	self:addElement( GameSettingsChangedIndicator )
	self.GameSettingsChangedIndicator = GameSettingsChangedIndicator
	
	self.resetProperties = function ()
		StartMenuframenoBG0:completeAnimation()
		StartMenuframenoBG1:completeAnimation()
		Slider:completeAnimation()
		Title:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		GameSettingsChangedIndicator:completeAnimation()
		StartMenuframenoBG0:setAlpha( 1 )
		StartMenuframenoBG1:setAlpha( 1 )
		Slider:setAlpha( 1 )
		Title:setAlpha( 1 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		GameSettingsChangedIndicator:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0.75 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.75 )
				self.clipFinished( Slider, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0.4 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.4 )
				self.clipFinished( Slider, {} )
				GameSettingsChangedIndicator:completeAnimation()
				self.GameSettingsChangedIndicator:setAlpha( 0.2 )
				self.clipFinished( GameSettingsChangedIndicator, {} )
			end
		},
		DisabledBySetting = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Title:completeAnimation()
				self.Title:setAlpha( 0.4 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.4 )
				self.clipFinished( Slider, {} )
				GameSettingsChangedIndicator:completeAnimation()
				self.GameSettingsChangedIndicator:setAlpha( 0.2 )
				self.clipFinished( GameSettingsChangedIndicator, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "DisabledBySetting",
			condition = function ( menu, element, event )
				return not IsEnabledByGametypeSetting( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) then
			DisableMouseButton( self, controller )
		end
	end )
	Slider.id = "Slider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Slider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG1:close()
		self.Slider:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.GameSettingsChangedIndicator:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	ForceListDispatchMouseEvents( self.Slider )
	return self
end

