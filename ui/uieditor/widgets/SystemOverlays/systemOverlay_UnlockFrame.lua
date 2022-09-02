-- 511f33b1dc63fbcc5d263b121ab82f44
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.systemOverlay_UnlockFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_UnlockFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_UnlockFrame )
	self.id = "systemOverlay_UnlockFrame"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( true, false, 58, 359.4 )
	extracamBG:setTopBottom( true, true, 18, -52 )
	extracamBG:setAlpha( 0 )
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
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 58, 359.4 )
	supportInfo:setTopBottom( false, true, -52, -28 )
	supportInfo:setAlpha( 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( true, false, 992, 1282 )
	UnlockTokensWidget:setTopBottom( true, false, 8, 52 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	UnlockTokensWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:setLeftRight( true, false, 938, 1219 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 8, 53 )
	PermanentUnlockTokensWidget:setAlpha( 0 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	PermanentUnlockTokensWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( true, false, 58, 359.4 )
	levelBoxBg:setTopBottom( true, true, 18, -52 )
	levelBoxBg:setAlpha( 0 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		PermanentUnlock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PermanentUnlockTokensWidget:completeAnimation()
				self.PermanentUnlockTokensWidget:setLeftRight( true, false, 992, 1280 )
				self.PermanentUnlockTokensWidget:setTopBottom( true, false, 49, 94 )
				self.PermanentUnlockTokensWidget:setAlpha( 1 )
				self.clipFinished( PermanentUnlockTokensWidget, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "PermanentUnlock",
			condition = function ( menu, element, event )
				return IsMultiplayer() and HavePermanentUnlockTokens( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
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
		element.foreground:close()
		element.supportInfo:close()
		element.UnlockTokensWidget:close()
		element.PermanentUnlockTokensWidget:close()
		element.levelBoxBg:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

