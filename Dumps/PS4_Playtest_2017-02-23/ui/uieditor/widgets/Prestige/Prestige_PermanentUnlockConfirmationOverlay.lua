require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

CoD.Prestige_PermanentUnlockConfirmationOverlay = InheritFrom( LUI.UIElement )
CoD.Prestige_PermanentUnlockConfirmationOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_PermanentUnlockConfirmationOverlay )
	self.id = "Prestige_PermanentUnlockConfirmationOverlay"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 96, 624 )
	largeImage:setTopBottom( 0, 1, 0, 0 )
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
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( 0, 0, 96, 624 )
	supportInfo:setTopBottom( 1, 1, -36, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:setLeftRight( 0, 0, 1401, 1821 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 12, 78 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	self.resetProperties = function ()
		largeImage:completeAnimation()
		largeImage:setLeftRight( 0, 0, 96, 624 )
		largeImage:setTopBottom( 0, 1, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateBGB = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				largeImage:completeAnimation()
				self.largeImage:setLeftRight( 0, 0, 168, 552 )
				self.largeImage:setTopBottom( 0, 1, 45, -51 )
				self.clipFinished( largeImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultStateBGB",
			condition = function ( menu, element, event )
				return IsInPermanentUnlockMenu( controller ) and IsInBubblegumSelectMenu( element, controller )
			end
		}
	} )
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
		self.PermanentUnlockTokensWidget:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

