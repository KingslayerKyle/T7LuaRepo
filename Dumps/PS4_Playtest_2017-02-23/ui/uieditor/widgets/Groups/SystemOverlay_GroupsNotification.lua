require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Looping" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FadeMask" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

CoD.SystemOverlay_GroupsNotification = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_GroupsNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_GroupsNotification )
	self.id = "SystemOverlay_GroupsNotification"
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
	
	local systemOverlayConnectLooping = CoD.systemOverlay_Connect_Looping.new( menu, controller )
	systemOverlayConnectLooping:setLeftRight( 0, 0, 0, 564 )
	systemOverlayConnectLooping:setTopBottom( 0, 0, 0, 286 )
	systemOverlayConnectLooping:setAlpha( 0 )
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
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( 0, 0, 637, 784 )
	Spinner:setTopBottom( 0, 0, 122, 269 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self.resetProperties = function ()
		Spinner:completeAnimation()
		systemOverlayConnectLooping:completeAnimation()
		Spinner:setAlpha( 1 )
		systemOverlayConnectLooping:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
			end,
			LoadingLoop = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				systemOverlayConnectLooping:completeAnimation()
				self.systemOverlayConnectLooping:setAlpha( 1 )
				self.clipFinished( systemOverlayConnectLooping, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Processing",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "groups.processingTask" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.processingTask" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.processingTask"
		} )
	end )
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

