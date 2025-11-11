require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSnapshotControlButton" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerWithoutRightBoxes" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, -152, 124 )
	background:setTopBottom( 1, 1, -60, 81 )
	background:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	self:addElement( background )
	self.background = background
	
	local ButtonList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -216, 216 )
	ButtonList:setTopBottom( 0.5, 0.5, 338, 410 )
	ButtonList:setAlpha( 0.9 )
	ButtonList:setWidgetType( CoD.GunsmithSnapshotControlButton )
	ButtonList:setHorizontalCount( 6 )
	ButtonList:setSpacing( 0 )
	ButtonList:setDataSource( "GunsmithSnapshotModeButtonList" )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		local element = ButtonList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) then
			ProcessListAction( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( 0.5, 0.5, -216, 216 )
	HintText:setTopBottom( 0.5, 0.5, 283, 321 )
	HintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	local buttonBar = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttonBar:setLeftRight( 0, 1, 22, -170 )
	buttonBar:setTopBottom( 1, 1, -57, -6 )
	buttonBar:linkToElementModel( self, nil, false, function ( model )
		buttonBar:setModel( model, controller )
	end )
	self:addElement( buttonBar )
	self.buttonBar = buttonBar
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( 0, 1, -185, 197 )
	LineLeft:setTopBottom( 1, 1, -61, -55 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feRightContainerWithoutRightBoxes0 = CoD.fe_RightContainerWithoutRightBoxes.new( menu, controller )
	feRightContainerWithoutRightBoxes0:setLeftRight( 1, 1, -1352.5, -47.5 )
	feRightContainerWithoutRightBoxes0:setTopBottom( 1, 1, -54, -10 )
	feRightContainerWithoutRightBoxes0:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithoutRightBoxes0:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithoutRightBoxes0 )
	self.feRightContainerWithoutRightBoxes0 = feRightContainerWithoutRightBoxes0
	
	HintText:linkToElementModel( ButtonList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HintText:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		ButtonList:completeAnimation()
		buttonBar:completeAnimation()
		HintText:completeAnimation()
		background:completeAnimation()
		LineLeft:completeAnimation()
		feRightContainerWithoutRightBoxes0:completeAnimation()
		ButtonList:setAlpha( 0.9 )
		buttonBar:setAlpha( 1 )
		HintText:setAlpha( 1 )
		background:setAlpha( 1 )
		LineLeft:setAlpha( 0.55 )
		feRightContainerWithoutRightBoxes0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
				feRightContainerWithoutRightBoxes0:completeAnimation()
				self.feRightContainerWithoutRightBoxes0:setAlpha( 0 )
				self.clipFinished( feRightContainerWithoutRightBoxes0, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.buttonBar:close()
		self.feRightContainerWithoutRightBoxes0:close()
		self.HintText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

