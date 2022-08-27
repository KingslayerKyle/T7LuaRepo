-- 22c87c5ccae359d719d363ae935e9a6f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.GenericPopups.SystemOverlay_WeaponPrestigeStar" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( true, false, 58, 359.4 )
	extracamBG:setTopBottom( true, true, 18, -52 )
	extracamBG:setAlpha( 0.08 )
	self:addElement( extracamBG )
	self.extracamBG = extracamBG
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 58, 359.4 )
	largeImage:setTopBottom( true, true, 18, -28 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground_Full.new( menu, controller )
	foreground:setLeftRight( true, true, 0, 0 )
	foreground:setTopBottom( true, true, 0, 0 )
	foreground.categoryTypeImage:setAlpha( 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 58, 359.4 )
	supportInfo:setTopBottom( false, true, -52, -28 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( true, false, 58, 359.4 )
	levelBoxBg:setTopBottom( true, true, 18, -52 )
	levelBoxBg:setAlpha( 0.6 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	local SystemOverlayWeaponPrestigeStar = CoD.SystemOverlay_WeaponPrestigeStar.new( menu, controller )
	SystemOverlayWeaponPrestigeStar:setLeftRight( true, false, 389.25, 411.25 )
	SystemOverlayWeaponPrestigeStar:setTopBottom( true, false, 15, 37 )
	self:addElement( SystemOverlayWeaponPrestigeStar )
	self.SystemOverlayWeaponPrestigeStar = SystemOverlayWeaponPrestigeStar
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.foreground:close()
		element.supportInfo:close()
		element.levelBoxBg:close()
		element.SystemOverlayWeaponPrestigeStar:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

