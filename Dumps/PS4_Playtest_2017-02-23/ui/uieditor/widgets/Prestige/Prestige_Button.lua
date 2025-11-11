require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Prestige.Prestige_Button_Title" )

CoD.Prestige_Button = InheritFrom( LUI.UIElement )
CoD.Prestige_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_Button )
	self.id = "Prestige_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 288 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 4, -4 )
	BlackBox:setTopBottom( 0, 1, 2, -6 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local ButtonIcon = LUI.UIImage.new()
	ButtonIcon:setLeftRight( 0.5, 0.5, -151, 153 )
	ButtonIcon:setTopBottom( 0.5, 0.5, -172, 132 )
	ButtonIcon:setScale( 0.9 )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( 0.5, 0.5, -96, 96 )
	LockIcon:setTopBottom( 0.5, 0.5, -117, 75 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local PrestigeButtonTitle = CoD.Prestige_Button_Title.new( menu, controller )
	PrestigeButtonTitle:setLeftRight( 0, 0, 7, 351 )
	PrestigeButtonTitle:setTopBottom( 1, 1, -46, -7 )
	PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL" ) )
	self:addElement( PrestigeButtonTitle )
	self.PrestigeButtonTitle = PrestigeButtonTitle
	
	self.resetProperties = function ()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackBox:completeAnimation()
		LockIcon:completeAnimation()
		ButtonIcon:completeAnimation()
		BoxButtonLrgInactive:setAlpha( 0.7 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackBox:setAlpha( 0.05 )
		LockIcon:setAlpha( 0 )
		ButtonIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				ButtonIcon:completeAnimation()
				self.ButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonIcon, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				ButtonIcon:completeAnimation()
				self.ButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonIcon, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	PrestigeButtonTitle.id = "PrestigeButtonTitle"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrestigeButtonTitle:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.LockIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.PrestigeButtonTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

