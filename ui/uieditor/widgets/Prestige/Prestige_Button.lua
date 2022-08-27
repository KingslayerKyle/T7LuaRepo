-- 8f8bb617cb0311e1d06a864be72f9f3c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 192 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( true, true, 2, -4 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local ButtonIcon = LUI.UIImage.new()
	ButtonIcon:setLeftRight( false, false, -101, 102 )
	ButtonIcon:setTopBottom( false, false, -115, 88 )
	ButtonIcon:setScale( 0.9 )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( false, false, -64, 64 )
	LockIcon:setTopBottom( false, false, -78, 50 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local PrestigeButtonTitle = CoD.Prestige_Button_Title.new( menu, controller )
	PrestigeButtonTitle:setLeftRight( true, false, 5, 234 )
	PrestigeButtonTitle:setTopBottom( false, true, -31, -5 )
	PrestigeButtonTitle.ButtonTitle:setText( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL" ) )
	self:addElement( PrestigeButtonTitle )
	self.PrestigeButtonTitle = PrestigeButtonTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.05 )
				self.clipFinished( BlackBox, {} )
				ButtonIcon:completeAnimation()
				self.ButtonIcon:setAlpha( 1 )
				self.clipFinished( ButtonIcon, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				ButtonIcon:completeAnimation()
				self.ButtonIcon:setAlpha( 1 )
				self.clipFinished( ButtonIcon, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
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
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.05 )
				self.clipFinished( BlackBox, {} )
				ButtonIcon:completeAnimation()
				self.ButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonIcon, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.PrestigeButtonTitle:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.LockIcon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.PrestigeButtonTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

