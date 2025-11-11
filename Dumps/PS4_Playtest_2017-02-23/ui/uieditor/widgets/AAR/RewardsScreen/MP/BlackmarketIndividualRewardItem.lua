require( "ui.uieditor.widgets.Border" )

CoD.BlackmarketIndividualRewardItem = InheritFrom( LUI.UIElement )
CoD.BlackmarketIndividualRewardItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackmarketIndividualRewardItem )
	self.id = "BlackmarketIndividualRewardItem"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 0, 0, 360 )
	Bg:setTopBottom( 0, 0, -1, 89 )
	Bg:setRGB( 0.07, 0.07, 0.07 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 0, -2, 360 )
	Border:setTopBottom( 0, 0, -2, 90 )
	self:addElement( Border )
	self.Border = Border
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 0, 0, 360 )
	TitleBg:setTopBottom( 0, 0, -2, 38 )
	TitleBg:setAlpha( 0.45 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( 0, 0, 137, 179 )
	CryptoIcon:setTopBottom( 0, 0, 44, 86 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 0, 360 )
	Title:setTopBottom( 0, 0, 1, 39 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( Engine.Localize( "MENU_EARNED_THIS_GAME" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local EarnedKeys = LUI.UIText.new()
	EarnedKeys:setLeftRight( 0, 0, 180, 282 )
	EarnedKeys:setTopBottom( 0, 0, 46, 84 )
	EarnedKeys:setTTF( "fonts/default.ttf" )
	EarnedKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EarnedKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EarnedKeys:linkToElementModel( self, "rewardName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EarnedKeys:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EarnedKeys )
	self.EarnedKeys = EarnedKeys
	
	self:mergeStateConditions( {
		{
			stateName = "NoDescription",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "rewardDesc" )
			end
		}
	} )
	self:linkToElementModel( self, "rewardDesc", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardDesc"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.EarnedKeys:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

