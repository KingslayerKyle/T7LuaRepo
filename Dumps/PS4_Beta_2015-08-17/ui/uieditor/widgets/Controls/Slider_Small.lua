require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Control_Item" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 38, -339.47 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, true, 336.53, -126 )
	StartMenuframenoBG1:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 58, 280 )
	Title:setTopBottom( true, false, 5, 27 )
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
	Slider:setLeftRight( true, false, 356.27, 524.27 )
	Slider:setTopBottom( true, false, 0, 30 )
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
		return retVal
	end )
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
	self:addElement( Slider )
	self.Slider = Slider
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 0, 16 )
	Image0000:setTopBottom( true, false, 0, 4 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 16 )
	Image0:setTopBottom( false, true, -4, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00002 = LUI.UIImage.new()
	Image00002:setLeftRight( true, false, 547.5, 563.5 )
	Image00002:setTopBottom( true, false, 0, 4 )
	Image00002:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00002:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00002 )
	self.Image00002 = Image00002
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, true, -122.5, -106.5 )
	Image00:setTopBottom( false, true, -4, 0 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 336.53, -126 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 336.53, -126 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 1 )
				self.clipFinished( Slider, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 1 )
				self.clipFinished( Slider, {} )
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
				self:setupElementClipCounter( 4 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Title:completeAnimation()
				self.Title:setRGB( 1, 1, 1 )
				self.Title:setAlpha( 0.4 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.4 )
				self.clipFinished( Slider, {} )
			end
		},
		DisabledBySetting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Title:completeAnimation()
				self.Title:setAlpha( 0.4 )
				self.clipFinished( Title, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.4 )
				self.clipFinished( Slider, {} )
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
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

