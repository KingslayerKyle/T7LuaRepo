require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Looping" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FadeMask" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.SystemOverlays.SystemOverlaySpinner" )

CoD.systemOverlay_Compact_BasicFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Compact_BasicFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Compact_BasicFrame )
	self.id = "systemOverlay_Compact_BasicFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 286 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 0, 549 )
	largeImage:setTopBottom( 0, 1, 0, 0 )
	largeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			largeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( 0, 0, 0, 549 )
	supportInfo:setTopBottom( 1, 1, -36, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local SystemOverlaySpinner = CoD.SystemOverlaySpinner.new( menu, controller )
	SystemOverlaySpinner:setLeftRight( 0, 0, 639, 1088 )
	SystemOverlaySpinner:setTopBottom( 0, 0, 102.5, 123.5 )
	SystemOverlaySpinner:setAlpha( 0 )
	self:addElement( SystemOverlaySpinner )
	self.SystemOverlaySpinner = SystemOverlaySpinner
	
	local systemOverlayConnectLooping = CoD.systemOverlay_Connect_Looping.new( menu, controller )
	systemOverlayConnectLooping:setLeftRight( 0, 0, 0, 564 )
	systemOverlayConnectLooping:setTopBottom( 0, 0, 0, 286 )
	systemOverlayConnectLooping:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLooping )
	self.systemOverlayConnectLooping = systemOverlayConnectLooping
	
	local systemOverlayFadeMask = CoD.systemOverlay_FadeMask.new( menu, controller )
	systemOverlayFadeMask:setLeftRight( 0, 0, 254, 750 )
	systemOverlayFadeMask:setTopBottom( 0, 0, 0, 286 )
	systemOverlayFadeMask:setAlpha( 0 )
	self:addElement( systemOverlayFadeMask )
	self.systemOverlayFadeMask = systemOverlayFadeMask
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground.new( menu, controller )
	foreground:setLeftRight( 0, 1, 0, 0 )
	foreground:setTopBottom( 0, 1, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	self.resetProperties = function ()
		systemOverlayConnectLooping:completeAnimation()
		SystemOverlaySpinner:completeAnimation()
		systemOverlayConnectLooping:setAlpha( 1 )
		SystemOverlaySpinner:setLeftRight( 0, 0, 639, 1088 )
		SystemOverlaySpinner:setTopBottom( 0, 0, 102.5, 123.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				systemOverlayConnectLooping:completeAnimation()
				self.systemOverlayConnectLooping:setAlpha( 0 )
				self.clipFinished( systemOverlayConnectLooping, {} )
			end,
			LoadingLoop = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setLeftRight( 0, 0, 635, 1084 )
				self.SystemOverlaySpinner:setTopBottom( 0, 0, 67, 83 )
				self.clipFinished( SystemOverlaySpinner, {} )
			end
		}
	}
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.supportInfo:close()
		self.SystemOverlaySpinner:close()
		self.systemOverlayConnectLooping:close()
		self.systemOverlayFadeMask:close()
		self.foreground:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

