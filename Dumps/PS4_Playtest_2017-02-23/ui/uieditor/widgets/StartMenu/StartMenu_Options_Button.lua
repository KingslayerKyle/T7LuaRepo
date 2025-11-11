require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local SetupPC = function ( self, controller, menu )
	local runOnPressFn = function ( element, controller )
		local onPressFn = CoD.PCUtil.GetElementModelValues( element, "onPressFn" )
		if onPressFn then
			onPressFn( element, controller )
		end
	end
	
	self:registerEventHandler( "button_action", function ( self, event )
		runOnPressFn( self, controller )
		return true
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not self.disabled and not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			runOnPressFn( element, controller )
			return true
		else
			
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CursorInputEnabledForBuild() then
		SetupPC( self, controller, menu )
	end
end

CoD.StartMenu_Options_Button = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Button )
	self.id = "StartMenu_Options_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local fullBorder = CoD.StartMenu_frame_noBG.new( menu, controller )
	fullBorder:setLeftRight( 0, 1, 0, 0 )
	fullBorder:setTopBottom( 0, 1, 0, 0 )
	fullBorder:setRGB( 0.87, 0.37, 0 )
	fullBorder:setAlpha( 0 )
	self:addElement( fullBorder )
	self.fullBorder = fullBorder
	
	local actionText = LUI.UIText.new()
	actionText:setLeftRight( 0, 0, 12, 352 )
	actionText:setTopBottom( 0, 0, 11, 49 )
	actionText:setTTF( "fonts/default.ttf" )
	actionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	actionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	actionText:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( actionText )
	self.actionText = actionText
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, -4 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, -4 )
	FocusBarB:setTopBottom( 1, 1, -8, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		fullBorder:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		fullBorder:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fullBorder:close()
		self.StartMenuframenoBG00:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.actionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

