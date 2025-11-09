require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.BlackmarketRewardsCarouselFX" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )
require( "ui.uieditor.widgets.verticalScrollingTextBox18" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.BlackmarketIndividualRewardItem" )
require( "ui.uieditor.widgets.Border" )

CoD.BlackmarketRewardsCarouselItemInternal = InheritFrom( LUI.UIElement )
CoD.BlackmarketRewardsCarouselItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackmarketRewardsCarouselItemInternal )
	self.id = "BlackmarketRewardsCarouselItemInternal"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 444 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -1.77, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 7.37, -7.89 )
	FEButtonPanel0:setTopBottom( true, true, 8.48, -9.48 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.75 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 32.23, 243 )
	highlight:setTopBottom( true, false, -54.67, 154.33 )
	highlight:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, false, 7.37, 268.11 )
	TitleBacking:setTopBottom( true, false, 8.48, 154.33 )
	TitleBacking:setImage( RegisterImage( "uie_t7_rewards_backer_rank" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local BlackmarketRewardsCarouselFX = CoD.BlackmarketRewardsCarouselFX.new( menu, controller )
	BlackmarketRewardsCarouselFX:setLeftRight( true, false, 53.2, 222.8 )
	BlackmarketRewardsCarouselFX:setTopBottom( true, false, 8.48, 98.48 )
	BlackmarketRewardsCarouselFX:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local rewardCarouselItemImage = Engine.GetModelValue( model )
		if rewardCarouselItemImage then
			BlackmarketRewardsCarouselFX.CardImage:setImage( RegisterImage( rewardCarouselItemImage ) )
		end
	end )
	self:addElement( BlackmarketRewardsCarouselFX )
	self.BlackmarketRewardsCarouselFX = BlackmarketRewardsCarouselFX
	
	local CardTitleBacking = CoD.RankUpNotification_FooterBacking01.new( menu, controller )
	CardTitleBacking:setLeftRight( true, false, 14, 262 )
	CardTitleBacking:setTopBottom( true, false, 99.69, 136.31 )
	CardTitleBacking:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
	CardTitleBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CardTitleBacking )
	self.CardTitleBacking = CardTitleBacking
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( false, false, -130, 130 )
	CardTitle:setTopBottom( true, false, 107, 129 )
	CardTitle:setRGB( 0, 0, 0 )
	CardTitle:setText( Engine.Localize( "MENU_PURCHASE_AVAILABLE" ) )
	CardTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CardTitle:setLetterSpacing( -1 )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CardTitle )
	self.CardTitle = CardTitle
	
	local verticalScrollingTextBox18 = CoD.verticalScrollingTextBox18.new( menu, controller )
	verticalScrollingTextBox18:setLeftRight( false, false, -119, 119 )
	verticalScrollingTextBox18:setTopBottom( true, false, 131, 171.25 )
	verticalScrollingTextBox18.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox18.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	verticalScrollingTextBox18:linkToElementModel( self, "rewardCarouselItemTitle", true, function ( model )
		local rewardCarouselItemTitle = Engine.GetModelValue( model )
		if rewardCarouselItemTitle then
			verticalScrollingTextBox18.textBox:setText( Engine.Localize( rewardCarouselItemTitle ) )
		end
	end )
	self:addElement( verticalScrollingTextBox18 )
	self.verticalScrollingTextBox18 = verticalScrollingTextBox18
	
	local BlackmarketIndividualRewardItem = CoD.BlackmarketIndividualRewardItem.new( menu, controller )
	BlackmarketIndividualRewardItem:setLeftRight( false, false, -110, 110 )
	BlackmarketIndividualRewardItem:setTopBottom( true, false, 173, 233 )
	BlackmarketIndividualRewardItem.Title:setText( Engine.Localize( "MENU_EARNED_THIS_GAME" ) )
	BlackmarketIndividualRewardItem:linkToElementModel( self, "reward1Info", false, function ( model )
		BlackmarketIndividualRewardItem:setModel( model, controller )
	end )
	self:addElement( BlackmarketIndividualRewardItem )
	self.BlackmarketIndividualRewardItem = BlackmarketIndividualRewardItem
	
	local CryptokeyBalanceBacking = LUI.UIImage.new()
	CryptokeyBalanceBacking:setLeftRight( false, false, -120, 120 )
	CryptokeyBalanceBacking:setTopBottom( true, false, 361.5, 422.5 )
	CryptokeyBalanceBacking:setRGB( 0, 0, 0 )
	CryptokeyBalanceBacking:setAlpha( 0.2 )
	self:addElement( CryptokeyBalanceBacking )
	self.CryptokeyBalanceBacking = CryptokeyBalanceBacking
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( false, false, -121, 120 )
	Border:setTopBottom( true, false, 361.5, 422.5 )
	Border:setAlpha( 0.25 )
	self:addElement( Border )
	self.Border = Border
	
	local CryptokeyBalanceTitle = LUI.UIText.new()
	CryptokeyBalanceTitle:setLeftRight( true, false, 38.5, 238.5 )
	CryptokeyBalanceTitle:setTopBottom( true, false, 341.5, 361.5 )
	CryptokeyBalanceTitle:setText( Engine.Localize( "MENU_CRYPTOKEY_BALANCE" ) )
	CryptokeyBalanceTitle:setTTF( "fonts/default.ttf" )
	CryptokeyBalanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CryptokeyBalanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CryptokeyBalanceTitle )
	self.CryptokeyBalanceTitle = CryptokeyBalanceTitle
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, 100.5, 141.5 )
	CryptoIcon:setTopBottom( true, false, 372, 413 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptokeyBalanceNum = LUI.UIText.new()
	CryptokeyBalanceNum:setLeftRight( true, false, 143.5, 242 )
	CryptokeyBalanceNum:setTopBottom( true, false, 378.5, 404.5 )
	CryptokeyBalanceNum:setTTF( "fonts/default.ttf" )
	CryptokeyBalanceNum:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	CryptokeyBalanceNum:setShaderVector( 0, 0.05, 0, 0, 0 )
	CryptokeyBalanceNum:setShaderVector( 1, 0.05, 0, 0, 0 )
	CryptokeyBalanceNum:setShaderVector( 2, 1, 0, 0, 0 )
	CryptokeyBalanceNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptokeyBalanceNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptokeyBalanceNum:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local rewardCarouselItemSubtitle = Engine.GetModelValue( model )
		if rewardCarouselItemSubtitle then
			CryptokeyBalanceNum:setText( Engine.Localize( rewardCarouselItemSubtitle ) )
		end
	end )
	self:addElement( CryptokeyBalanceNum )
	self.CryptokeyBalanceNum = CryptokeyBalanceNum
	
	local BonusCryptokeyBlackmarketIndividualRewardItem = CoD.BlackmarketIndividualRewardItem.new( menu, controller )
	BonusCryptokeyBlackmarketIndividualRewardItem:setLeftRight( false, false, -110, 110 )
	BonusCryptokeyBlackmarketIndividualRewardItem:setTopBottom( true, false, 244, 304 )
	BonusCryptokeyBlackmarketIndividualRewardItem.Title:setText( Engine.Localize( "CONTRACT_REWARD" ) )
	BonusCryptokeyBlackmarketIndividualRewardItem:linkToElementModel( self, "reward2Info", false, function ( model )
		BonusCryptokeyBlackmarketIndividualRewardItem:setModel( model, controller )
	end )
	self:addElement( BonusCryptokeyBlackmarketIndividualRewardItem )
	self.BonusCryptokeyBlackmarketIndividualRewardItem = BonusCryptokeyBlackmarketIndividualRewardItem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				CardTitle:completeAnimation()
				self.CardTitle:setText( Engine.Localize( "MENU_PURCHASE_AVAILABLE" ) )
				self.clipFinished( CardTitle, {} )
				verticalScrollingTextBox18:completeAnimation()
				self.verticalScrollingTextBox18:setAlpha( 1 )
				self.clipFinished( verticalScrollingTextBox18, {} )
				BlackmarketIndividualRewardItem:completeAnimation()
				self.BlackmarketIndividualRewardItem:setLeftRight( false, false, -120, 120 )
				self.BlackmarketIndividualRewardItem:setTopBottom( true, false, 173, 233 )
				self.clipFinished( BlackmarketIndividualRewardItem, {} )
				CryptokeyBalanceBacking:completeAnimation()
				self.CryptokeyBalanceBacking:setAlpha( 0.2 )
				self.clipFinished( CryptokeyBalanceBacking, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0.25 )
				self.clipFinished( Border, {} )
				CryptokeyBalanceTitle:completeAnimation()
				self.CryptokeyBalanceTitle:setAlpha( 1 )
				self.clipFinished( CryptokeyBalanceTitle, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptokeyBalanceNum:completeAnimation()
				self.CryptokeyBalanceNum:setAlpha( 1 )
				self.clipFinished( CryptokeyBalanceNum, {} )
				BonusCryptokeyBlackmarketIndividualRewardItem:completeAnimation()
				self.BonusCryptokeyBlackmarketIndividualRewardItem:setAlpha( 0 )
				self.clipFinished( BonusCryptokeyBlackmarketIndividualRewardItem, {} )
			end
		},
		ShowBonusCryptokeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				CardTitle:completeAnimation()
				self.CardTitle:setText( Engine.Localize( "MENU_PURCHASE_AVAILABLE" ) )
				self.clipFinished( CardTitle, {} )
				verticalScrollingTextBox18:completeAnimation()
				self.verticalScrollingTextBox18:setAlpha( 1 )
				self.clipFinished( verticalScrollingTextBox18, {} )
				BlackmarketIndividualRewardItem:completeAnimation()
				self.BlackmarketIndividualRewardItem:setLeftRight( false, false, -110, 110 )
				self.BlackmarketIndividualRewardItem:setTopBottom( true, false, 173, 233 )
				self.clipFinished( BlackmarketIndividualRewardItem, {} )
				CryptokeyBalanceBacking:completeAnimation()
				self.CryptokeyBalanceBacking:setAlpha( 0.2 )
				self.clipFinished( CryptokeyBalanceBacking, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0.25 )
				self.clipFinished( Border, {} )
				CryptokeyBalanceTitle:completeAnimation()
				self.CryptokeyBalanceTitle:setAlpha( 1 )
				self.clipFinished( CryptokeyBalanceTitle, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptokeyBalanceNum:completeAnimation()
				self.CryptokeyBalanceNum:setAlpha( 1 )
				self.clipFinished( CryptokeyBalanceNum, {} )
				BonusCryptokeyBlackmarketIndividualRewardItem:completeAnimation()
				self.BonusCryptokeyBlackmarketIndividualRewardItem:setAlpha( 1 )
				self.clipFinished( BonusCryptokeyBlackmarketIndividualRewardItem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowBonusCryptokeys",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "showBonusCryptokeys" )
			end
		}
	} )
	self:linkToElementModel( self, "showBonusCryptokeys", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showBonusCryptokeys"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.FEButtonPanel0:close()
		element.BlackmarketRewardsCarouselFX:close()
		element.CardTitleBacking:close()
		element.verticalScrollingTextBox18:close()
		element.BlackmarketIndividualRewardItem:close()
		element.Border:close()
		element.BonusCryptokeyBlackmarketIndividualRewardItem:close()
		element.CryptokeyBalanceNum:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

