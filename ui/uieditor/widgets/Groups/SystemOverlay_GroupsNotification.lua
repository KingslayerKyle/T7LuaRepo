-- e2262accf1f3ceb9e5131e083a1ed6f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Looping" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FadeMask" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground" )

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
	
	local systemOverlayConnectLooping = CoD.systemOverlay_Connect_Looping.new( menu, controller )
	systemOverlayConnectLooping:setLeftRight( true, false, 0, 376 )
	systemOverlayConnectLooping:setTopBottom( true, false, 0, 191 )
	systemOverlayConnectLooping:setAlpha( 0 )
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
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 424.4, 522.4 )
	Spinner:setTopBottom( true, false, 81, 179 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
			end,
			LoadingLoop = function ()
				self:setupElementClipCounter( 2 )

				systemOverlayConnectLooping:completeAnimation()
				self.systemOverlayConnectLooping:setAlpha( 1 )
				self.clipFinished( systemOverlayConnectLooping, {} )

				systemOverlayFadeMask:completeAnimation()
				self.systemOverlayFadeMask:setAlpha( 0 )
				self.clipFinished( systemOverlayFadeMask, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.supportInfo:close()
		element.systemOverlayConnectLooping:close()
		element.systemOverlayFadeMask:close()
		element.foreground:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

