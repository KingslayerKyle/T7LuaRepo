-- ff1351fce2971ef0c8e1af61b4eb6787
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 172 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local tokenPermanentUnlock = CoD.Prestige_PermanentUnlockTokenStatic.new( menu, controller )
	tokenPermanentUnlock:setLeftRight( true, false, 3, 35 )
	tokenPermanentUnlock:setTopBottom( true, false, 6.2, 38.2 )
	tokenPermanentUnlock:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( tokenPermanentUnlock )
	self.tokenPermanentUnlock = tokenPermanentUnlock
	
	local tokenLabel = LUI.UITightText.new()
	tokenLabel:setLeftRight( true, false, 42.3, 172 )
	tokenLabel:setTopBottom( true, false, 12.7, 31.7 )
	tokenLabel:setRGB( 0.58, 0.64, 0.65 )
	tokenLabel:setTTF( "fonts/escom.ttf" )
	tokenLabel:setLetterSpacing( 4.3 )
	tokenLabel:subscribeToGlobalModel( controller, "PerController", "permanentUnlockTokensCount", function ( model )
		local permanentUnlockTokensCount = Engine.GetModelValue( model )
		if permanentUnlockTokensCount then
			tokenLabel:setText( GetPermanentUnlockTokenText( controller, permanentUnlockTokensCount ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( tokenLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( tokenLabel )
	self.tokenLabel = tokenLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0.2 )
				self.clipFinished( FETitleNumBrdr0, {} )
				tokenPermanentUnlock:completeAnimation()
				self.tokenPermanentUnlock:setAlpha( 1 )
				self.clipFinished( tokenPermanentUnlock, {} )
				tokenLabel:completeAnimation()
				self.tokenLabel:setAlpha( 1 )
				self.clipFinished( tokenLabel, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
		element.tokenPermanentUnlock:close()
		element.tokenLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

