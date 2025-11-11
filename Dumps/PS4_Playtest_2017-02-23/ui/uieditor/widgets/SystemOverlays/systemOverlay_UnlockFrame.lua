require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( 0, 0, 87, 539 )
	extracamBG:setTopBottom( 0, 1, 26, -78 )
	extracamBG:setAlpha( 0 )
	self:addElement( extracamBG )
	self.extracamBG = extracamBG
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( 0, 0, 87, 539 )
	largeImage:setTopBottom( 0, 1, 26, -42 )
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
	supportInfo:setLeftRight( 0, 0, 87, 539 )
	supportInfo:setTopBottom( 1, 1, -78, -42 )
	supportInfo:setAlpha( 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	UnlockTokensWidget:setLeftRight( 0, 0, 1488, 1923 )
	UnlockTokensWidget:setTopBottom( 0, 0, 12, 78 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( menu, controller )
	PermanentUnlockTokensWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PermanentUnlockTokensWidget:setLeftRight( 0, 0, 1407, 1829 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 12, 80 )
	PermanentUnlockTokensWidget:setAlpha( 0 )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( 0, 0, 87, 539 )
	levelBoxBg:setTopBottom( 0, 1, 26, -78 )
	levelBoxBg:setAlpha( 0 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	self.resetProperties = function ()
		PermanentUnlockTokensWidget:completeAnimation()
		PermanentUnlockTokensWidget:setLeftRight( 0, 0, 1407, 1829 )
		PermanentUnlockTokensWidget:setTopBottom( 0, 0, 12, 80 )
		PermanentUnlockTokensWidget:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PermanentUnlock = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PermanentUnlockTokensWidget:completeAnimation()
				self.PermanentUnlockTokensWidget:setLeftRight( 0, 0, 1488, 1920 )
				self.PermanentUnlockTokensWidget:setTopBottom( 0, 0, 73, 141 )
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
		self.UnlockTokensWidget:close()
		self.PermanentUnlockTokensWidget:close()
		self.levelBoxBg:close()
		self.largeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

