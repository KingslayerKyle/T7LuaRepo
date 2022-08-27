-- 864b71f8c2ae5617d2f23c03636ce4ca
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.SystemOverlays.SystemOverlaySpinner" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Looping" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FadeMask" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

CoD.SystemOverlay_ZMHDGobbleGum = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_ZMHDGobbleGum.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_ZMHDGobbleGum )
	self.id = "SystemOverlay_ZMHDGobbleGum"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 191 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 0, 366 )
	largeImage:setTopBottom( true, true, 0, 0 )
	largeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 0, 366 )
	supportInfo:setTopBottom( false, true, -24, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local SystemOverlaySpinner = CoD.SystemOverlaySpinner.new( menu, controller )
	SystemOverlaySpinner:setLeftRight( true, false, 426.4, 725.4 )
	SystemOverlaySpinner:setTopBottom( true, false, 68.5, 82.5 )
	SystemOverlaySpinner:setAlpha( 0 )
	self:addElement( SystemOverlaySpinner )
	self.SystemOverlaySpinner = SystemOverlaySpinner
	
	local systemOverlayConnectLooping = CoD.systemOverlay_Connect_Looping.new( menu, controller )
	systemOverlayConnectLooping:setLeftRight( true, false, 0, 376 )
	systemOverlayConnectLooping:setTopBottom( true, false, 0, 191 )
	systemOverlayConnectLooping:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLooping )
	self.systemOverlayConnectLooping = systemOverlayConnectLooping
	
	local systemOverlayFadeMask = CoD.systemOverlay_FadeMask.new( menu, controller )
	systemOverlayFadeMask:setLeftRight( true, false, 169, 500 )
	systemOverlayFadeMask:setTopBottom( true, false, 0, 191 )
	systemOverlayFadeMask:setAlpha( 0 )
	self:addElement( systemOverlayFadeMask )
	self.systemOverlayFadeMask = systemOverlayFadeMask
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground.new( menu, controller )
	foreground:setLeftRight( true, true, 0, 0 )
	foreground:setTopBottom( true, true, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local ProcessingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	ProcessingWidget:setLeftRight( true, false, 426.4, 732.4 )
	ProcessingWidget:setTopBottom( true, false, 83, 179 )
	ProcessingWidget.PurchasingText:setText( Engine.Localize( "GROUPS_PROCESSING" ) )
	self:addElement( ProcessingWidget )
	self.ProcessingWidget = ProcessingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 0 )
				self.clipFinished( SystemOverlaySpinner, {} )
				systemOverlayConnectLooping:completeAnimation()
				self.systemOverlayConnectLooping:setAlpha( 0 )
				self.clipFinished( systemOverlayConnectLooping, {} )
				systemOverlayFadeMask:completeAnimation()
				self.systemOverlayFadeMask:setAlpha( 0 )
				self.clipFinished( systemOverlayFadeMask, {} )
				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 0 )
				self.clipFinished( ProcessingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 0 )
				self.clipFinished( SystemOverlaySpinner, {} )
				systemOverlayConnectLooping:completeAnimation()
				self.systemOverlayConnectLooping:setAlpha( 0 )
				self.clipFinished( systemOverlayConnectLooping, {} )
				systemOverlayFadeMask:completeAnimation()
				self.systemOverlayFadeMask:setAlpha( 0 )
				self.clipFinished( systemOverlayFadeMask, {} )
				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 1 )
				self.clipFinished( ProcessingWidget, {} )
			end
		}
	}
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.supportInfo:close()
		element.SystemOverlaySpinner:close()
		element.systemOverlayConnectLooping:close()
		element.systemOverlayFadeMask:close()
		element.foreground:close()
		element.ProcessingWidget:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

