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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			largeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground.new( menu, controller )
	foreground:setLeftRight( true, true, 0, 0 )
	foreground:setTopBottom( true, true, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
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
	SystemOverlaySpinner:setTopBottom( true, false, 81.5, 95.5 )
	SystemOverlaySpinner:setAlpha( 0 )
	self:addElement( SystemOverlaySpinner )
	self.SystemOverlaySpinner = SystemOverlaySpinner
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 0 )
				self.clipFinished( SystemOverlaySpinner, {} )
			end,
			LoadingLoop = function ()
				self:setupElementClipCounter( 2 )
				largeImage:completeAnimation()
				self.largeImage:setAlpha( 1 )
				self.clipFinished( largeImage, {} )
				SystemOverlaySpinner:completeAnimation()
				self.SystemOverlaySpinner:setAlpha( 1 )
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
		self.foreground:close()
		self.supportInfo:close()
		self.SystemOverlaySpinner:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

