require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSnapshotControlButton" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

CoD.GunsmithSnapshotControls = InheritFrom( LUI.UIElement )
CoD.GunsmithSnapshotControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithSnapshotControls )
	self.id = "GunsmithSnapshotControls"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -101, 83 )
	background:setTopBottom( false, true, -40, 54 )
	background:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	self:addElement( background )
	self.background = background
	
	local ButtonList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -144, 144 )
	ButtonList:setTopBottom( false, false, 225, 273 )
	ButtonList:setAlpha( 0.9 )
	ButtonList:setDataSource( "GunsmithSnapshotModeButtonList" )
	ButtonList:setWidgetType( CoD.GunsmithSnapshotControlButton )
	ButtonList:setHorizontalCount( 6 )
	ButtonList:setSpacing( 0 )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		local f2_local0 = ButtonList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) then
			ProcessListAction( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) then
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( false, false, -144, 144 )
	HintText:setTopBottom( false, false, 189, 214 )
	HintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	local buttonBar = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttonBar:setLeftRight( true, true, 20, -108 )
	buttonBar:setTopBottom( false, true, -34, -2 )
	buttonBar:linkToElementModel( self, nil, false, function ( model )
		buttonBar:setModel( model, controller )
	end )
	self:addElement( buttonBar )
	self.buttonBar = buttonBar
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, -123, 131.5 )
	LineLeft:setTopBottom( false, true, -40.85, -36.85 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	HintText:linkToElementModel( ButtonList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			HintText:setText( Engine.Localize( LocalizeToUpperString( description ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, -101, 83 )
				self.background:setTopBottom( false, true, -44, 50 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.clipFinished( HintText, {} )
				buttonBar:completeAnimation()
				self.buttonBar:setLeftRight( true, true, 21, -107 )
				self.buttonBar:setTopBottom( false, true, -38, -6 )
				self.buttonBar:setAlpha( 1 )
				self.clipFinished( buttonBar, {} )
				LineLeft:completeAnimation()
				self.LineLeft:setLeftRight( true, true, -101, 83 )
				self.LineLeft:setTopBottom( false, true, -44.85, -40.85 )
				self.LineLeft:setAlpha( 0.55 )
				self.clipFinished( LineLeft, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				HintText:completeAnimation()
				self.HintText:setAlpha( 0 )
				self.clipFinished( HintText, {} )
				buttonBar:completeAnimation()
				self.buttonBar:setAlpha( 0 )
				self.clipFinished( buttonBar, {} )
				LineLeft:completeAnimation()
				self.LineLeft:setAlpha( 0 )
				self.clipFinished( LineLeft, {} )
			end
		}
	}
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.buttonBar:close()
		element.HintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

