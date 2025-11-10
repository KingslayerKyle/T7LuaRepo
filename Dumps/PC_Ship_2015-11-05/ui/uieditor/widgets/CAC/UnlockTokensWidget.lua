require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )

CoD.UnlockTokensWidget = InheritFrom( LUI.UIElement )
CoD.UnlockTokensWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.UnlockTokensWidget )
	self.id = "UnlockTokensWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 172 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, -2.15 )
	FETitleNumBrdr0:setTopBottom( true, true, -4, -6.7 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local cacIconTokenStatic0 = CoD.cac_IconTokenStatic.new( menu, controller )
	cacIconTokenStatic0:setLeftRight( true, false, 6, 38 )
	cacIconTokenStatic0:setTopBottom( true, false, 2.2, 34.2 )
	self:addElement( cacIconTokenStatic0 )
	self.cacIconTokenStatic0 = cacIconTokenStatic0
	
	local tokenLabel = LUI.UITightText.new()
	tokenLabel:setLeftRight( true, false, 42.3, 172 )
	tokenLabel:setTopBottom( false, false, -12.8, 6.2 )
	tokenLabel:setRGB( 0.58, 0.64, 0.65 )
	tokenLabel:setTTF( "fonts/escom.ttf" )
	tokenLabel:setLetterSpacing( 4.3 )
	tokenLabel:subscribeToGlobalModel( controller, "PerController", "unlockTokensCount", function ( model )
		local unlockTokensCount = Engine.GetModelValue( model )
		if unlockTokensCount then
			tokenLabel:setText( GetAllUnlockTokens( controller, unlockTokensCount ) )
		end
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
				cacIconTokenStatic0:completeAnimation()
				self.cacIconTokenStatic0:setAlpha( 0 )
				self.clipFinished( cacIconTokenStatic0, {} )
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
				cacIconTokenStatic0:completeAnimation()
				self.cacIconTokenStatic0:setAlpha( 1 )
				self.clipFinished( cacIconTokenStatic0, {} )
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
				return ShouldCACDisplayTokens( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
		element.cacIconTokenStatic0:close()
		element.tokenLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

