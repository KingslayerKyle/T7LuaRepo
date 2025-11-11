require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokenStatic" )

CoD.Prestige_PermanentUnlockTokensWidget = InheritFrom( LUI.UIElement )
CoD.Prestige_PermanentUnlockTokensWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_PermanentUnlockTokensWidget )
	self.id = "Prestige_PermanentUnlockTokensWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 258 )
	self:setTopBottom( 0, 0, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0, 1, 0, 0 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local tokenPermanentUnlock = CoD.Prestige_PermanentUnlockTokenStatic.new( menu, controller )
	tokenPermanentUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	tokenPermanentUnlock:setLeftRight( 0, 0, 4, 52 )
	tokenPermanentUnlock:setTopBottom( 0, 0, 9, 57 )
	self:addElement( tokenPermanentUnlock )
	self.tokenPermanentUnlock = tokenPermanentUnlock
	
	local tokenLabel = LUI.UITightText.new()
	tokenLabel:setLeftRight( 0, 0, 63, 258 )
	tokenLabel:setTopBottom( 0, 0, 19, 47 )
	tokenLabel:setRGB( 0.58, 0.64, 0.65 )
	tokenLabel:setTTF( "fonts/escom.ttf" )
	tokenLabel:setLetterSpacing( 4.3 )
	tokenLabel:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			tokenLabel:setText( GetPermanentUnlockTokenText( controller, modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( tokenLabel, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( tokenLabel )
	self.tokenLabel = tokenLabel
	
	self.resetProperties = function ()
		FETitleNumBrdr0:completeAnimation()
		tokenLabel:completeAnimation()
		tokenPermanentUnlock:completeAnimation()
		FETitleNumBrdr0:setAlpha( 0.2 )
		tokenLabel:setAlpha( 1 )
		tokenPermanentUnlock:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 0 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenLabel:completeAnimation()
				self.tokenLabel:setAlpha( 0 )
				self.clipFinished( tokenLabel, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInPermanentUnlockMenu( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
		self.tokenPermanentUnlock:close()
		self.tokenLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

