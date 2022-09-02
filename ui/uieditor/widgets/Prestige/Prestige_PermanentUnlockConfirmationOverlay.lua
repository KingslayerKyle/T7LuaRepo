-- 2d6448798d74533dbf33c34060d66da9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 64, 416 )
	largeImage:setTopBottom( true, true, 0, 0 )
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
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 64, 416 )
	supportInfo:setTopBottom( false, true, -24, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:setLeftRight( true, false, 934, 1214 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 8, 52 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		DefaultStateBGB = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				largeImage:completeAnimation()
				self.largeImage:setLeftRight( true, false, 112, 368 )
				self.largeImage:setTopBottom( true, true, 30, -34 )
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
		element.PermanentUnlockTokensWidget:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

