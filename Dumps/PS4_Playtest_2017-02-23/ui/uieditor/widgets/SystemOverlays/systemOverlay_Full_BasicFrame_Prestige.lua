require( "ui.uieditor.widgets.GenericPopups.SystemOverlay_WeaponPrestigeStar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

CoD.systemOverlay_Full_BasicFrame_Prestige = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Full_BasicFrame_Prestige.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Full_BasicFrame_Prestige )
	self.id = "systemOverlay_Full_BasicFrame_Prestige"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( 0, 0, 87, 539 )
	extracamBG:setTopBottom( 0, 1, 26, -78 )
	extracamBG:setAlpha( 0.08 )
	self:addElement( extracamBG )
	self.extracamBG = extracamBG
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 87, 539 )
	largeImage:setTopBottom( 0, 1, 26, -42 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			largeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground_Full.new( menu, controller )
	foreground:setLeftRight( 0, 1, 0, 0 )
	foreground:setTopBottom( 0, 1, 0, 0 )
	foreground.categoryTypeImage:setAlpha( 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( 0, 0, 87, 539 )
	supportInfo:setTopBottom( 1, 1, -78, -42 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( 0, 0, 87, 539 )
	levelBoxBg:setTopBottom( 0, 1, 26, -78 )
	levelBoxBg:setAlpha( 0.6 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	local SystemOverlayWeaponPrestigeStar = CoD.SystemOverlay_WeaponPrestigeStar.new( menu, controller )
	SystemOverlayWeaponPrestigeStar:setLeftRight( 0, 0, 583.5, 616.5 )
	SystemOverlayWeaponPrestigeStar:setTopBottom( 0, 0, 22.5, 55.5 )
	self:addElement( SystemOverlayWeaponPrestigeStar )
	self.SystemOverlayWeaponPrestigeStar = SystemOverlayWeaponPrestigeStar
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.foreground:close()
		self.supportInfo:close()
		self.levelBoxBg:close()
		self.SystemOverlayWeaponPrestigeStar:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

