-- 8ddaa1c95a54339abcfca25be7ded44c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.SystemOverlays.SystemOverlaySpinner" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FadeMask" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground" )

local PostLoadFunc = function ( self, controller, menu )
	
end

CoD.SystemOverlay_Winter_Reward = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_Winter_Reward.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_Winter_Reward )
	self.id = "SystemOverlay_Winter_Reward"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 191 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( false, true, -315, 0 )
	largeImage:setTopBottom( true, true, 0.5, -0.5 )
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
	
	local systemOverlayFadeMask = CoD.systemOverlay_FadeMask.new( menu, controller )
	systemOverlayFadeMask:setLeftRight( true, false, 169, 500 )
	systemOverlayFadeMask:setTopBottom( true, false, 0, 191 )
	systemOverlayFadeMask:setAlpha( 0 )
	self:addElement( systemOverlayFadeMask )
	self.systemOverlayFadeMask = systemOverlayFadeMask
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground.new( menu, controller )
	foreground:setLeftRight( true, false, -30, 1280 )
	foreground:setTopBottom( true, true, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 0 )
				self.clipFinished( SystemOverlaySpinner, {} )
				systemOverlayFadeMask:completeAnimation()
				self.systemOverlayFadeMask:setAlpha( 0 )
				self.clipFinished( systemOverlayFadeMask, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 0 )
				self.clipFinished( SystemOverlaySpinner, {} )
				systemOverlayFadeMask:completeAnimation()
				self.systemOverlayFadeMask:setAlpha( 0 )
				self.clipFinished( systemOverlayFadeMask, {} )
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
		element.systemOverlayFadeMask:close()
		element.foreground:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

