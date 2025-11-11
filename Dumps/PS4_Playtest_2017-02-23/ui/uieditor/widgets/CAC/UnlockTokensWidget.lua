require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

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
	self:setLeftRight( 0, 0, 0, 258 )
	self:setTopBottom( 0, 0, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, -4 )
	FETitleNumBrdr0:setTopBottom( 0, 1, -6, -10 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local cacIconTokenStatic0 = CoD.cac_IconTokenStatic.new( menu, controller )
	cacIconTokenStatic0:setLeftRight( 0, 0, 9, 57 )
	cacIconTokenStatic0:setTopBottom( 0, 0, 3, 51 )
	self:addElement( cacIconTokenStatic0 )
	self.cacIconTokenStatic0 = cacIconTokenStatic0
	
	local tokenLabel = LUI.UITightText.new()
	tokenLabel:setLeftRight( 0, 0, 63, 258 )
	tokenLabel:setTopBottom( 0.5, 0.5, -19, 9 )
	tokenLabel:setRGB( 0.58, 0.64, 0.65 )
	tokenLabel:setTTF( "fonts/escom.ttf" )
	tokenLabel:setLetterSpacing( 4.3 )
	tokenLabel:subscribeToGlobalModel( controller, "PerController", "unlockTokensCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			tokenLabel:setText( GetAllUnlockTokens( controller, modelValue ) )
		end
	end )
	self:addElement( tokenLabel )
	self.tokenLabel = tokenLabel
	
	self.resetProperties = function ()
		cacIconTokenStatic0:completeAnimation()
		FETitleNumBrdr0:completeAnimation()
		tokenLabel:completeAnimation()
		cacIconTokenStatic0:setAlpha( 1 )
		FETitleNumBrdr0:setAlpha( 0.2 )
		tokenLabel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
		self.cacIconTokenStatic0:close()
		self.tokenLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

