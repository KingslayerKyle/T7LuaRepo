-- 31dc971e61daa96e391cb34542b4d1fe
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 56 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, -0.5, -0.5 )
	Bg:setRGB( 0.07, 0.07, 0.07 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, -1, 0 )
	Border:setTopBottom( true, true, -1, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, true, 0, 0 )
	TitleBg:setTopBottom( true, false, -1, 20.5 )
	TitleBg:setAlpha( 0.45 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( false, false, -29.5, -1.5 )
	CryptoIcon:setTopBottom( false, true, -31.5, -3.5 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 0, 0 )
	Title:setTopBottom( true, false, 0.5, 20.5 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( Engine.Localize( "MENU_EARNED_THIS_GAME" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local EarnedKeys = LUI.UIText.new()
	EarnedKeys:setLeftRight( false, false, 1, 69 )
	EarnedKeys:setTopBottom( false, true, -30, -6 )
	EarnedKeys:setTTF( "fonts/default.ttf" )
	EarnedKeys:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EarnedKeys:setShaderVector( 0, 0.05, 0, 0, 0 )
	EarnedKeys:setShaderVector( 1, 0.05, 0, 0, 0 )
	EarnedKeys:setShaderVector( 2, 1, 0, 0, 0 )
	EarnedKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EarnedKeys:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EarnedKeys:linkToElementModel( self, "rewardName", true, function ( model )
		local rewardName = Engine.GetModelValue( model )
		if rewardName then
			EarnedKeys:setText( Engine.Localize( rewardName ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.EarnedKeys:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

