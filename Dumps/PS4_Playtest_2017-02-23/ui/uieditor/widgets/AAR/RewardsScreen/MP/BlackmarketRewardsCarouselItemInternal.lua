require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.BlackmarketIndividualRewardItem" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.BlackmarketRewardsCarouselFX" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )
require( "ui.uieditor.widgets.verticalScrollingTextBox18" )

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
	self:setLeftRight( 0, 0, 0, 414 )
	self:setTopBottom( 0, 0, 0, 666 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 1, 0, 0 )
	Bg:setTopBottom( 0, 1, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 11, -11 )
	FEButtonPanel0:setTopBottom( 0, 1, 12, -14 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.75 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0, 0, 48, 364 )
	highlight:setTopBottom( 0, 0, -82, 232 )
	highlight:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( 0, 0, 11, 402 )
	TitleBacking:setTopBottom( 0, 0, 13, 232 )
	TitleBacking:setImage( RegisterImage( "uie_t7_rewards_backer_rank" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local BlackmarketRewardsCarouselFX = CoD.BlackmarketRewardsCarouselFX.new( menu, controller )
	BlackmarketRewardsCarouselFX:setLeftRight( 0, 0, 80, 334 )
	BlackmarketRewardsCarouselFX:setTopBottom( 0, 0, 12.5, 147.5 )
	BlackmarketRewardsCarouselFX:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BlackmarketRewardsCarouselFX.CardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( BlackmarketRewardsCarouselFX )
	self.BlackmarketRewardsCarouselFX = BlackmarketRewardsCarouselFX
	
	local CardTitleBacking = CoD.RankUpNotification_FooterBacking01.new( menu, controller )
	CardTitleBacking:setLeftRight( 0, 0, 21, 393 )
	CardTitleBacking:setTopBottom( 0, 0, 150, 205 )
	CardTitleBacking:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
	CardTitleBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CardTitleBacking )
	self.CardTitleBacking = CardTitleBacking
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( 0.5, 0.5, -195, 195 )
	CardTitle:setTopBottom( 0, 0, 161, 194 )
	CardTitle:setRGB( 0, 0, 0 )
	CardTitle:setText( Engine.Localize( "MENU_PURCHASE_AVAILABLE" ) )
	CardTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CardTitle:setLetterSpacing( -1 )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CardTitle )
	self.CardTitle = CardTitle
	
	local verticalScrollingTextBox18 = CoD.verticalScrollingTextBox18.new( menu, controller )
	verticalScrollingTextBox18:setLeftRight( 0.5, 0.5, -178.5, 178.5 )
	verticalScrollingTextBox18:setTopBottom( 0, 0, 197, 257 )
	verticalScrollingTextBox18.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox18.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	verticalScrollingTextBox18:linkToElementModel( self, "rewardCarouselItemTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			verticalScrollingTextBox18.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( verticalScrollingTextBox18 )
	self.verticalScrollingTextBox18 = verticalScrollingTextBox18
	
	local BlackmarketIndividualRewardItem = CoD.BlackmarketIndividualRewardItem.new( menu, controller )
	BlackmarketIndividualRewardItem:setLeftRight( 0.5, 0.5, -180, 180 )
	BlackmarketIndividualRewardItem:setTopBottom( 0, 0, 259, 349 )
	BlackmarketIndividualRewardItem:linkToElementModel( self, "reward1Info", false, function ( model )
		BlackmarketIndividualRewardItem:setModel( model, controller )
	end )
	self:addElement( BlackmarketIndividualRewardItem )
	self.BlackmarketIndividualRewardItem = BlackmarketIndividualRewardItem
	
	local CryptokeyBalanceBacking = LUI.UIImage.new()
	CryptokeyBalanceBacking:setLeftRight( 0.5, 0.5, -180, 180 )
	CryptokeyBalanceBacking:setTopBottom( 0, 0, 542, 634 )
	CryptokeyBalanceBacking:setRGB( 0, 0, 0 )
	CryptokeyBalanceBacking:setAlpha( 0.2 )
	self:addElement( CryptokeyBalanceBacking )
	self.CryptokeyBalanceBacking = CryptokeyBalanceBacking
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0.5, 0.5, -182, 180 )
	Border:setTopBottom( 0, 0, 542, 634 )
	Border:setAlpha( 0.25 )
	self:addElement( Border )
	self.Border = Border
	
	local CryptokeyBalanceTitle = LUI.UIText.new()
	CryptokeyBalanceTitle:setLeftRight( 0, 0, 58, 358 )
	CryptokeyBalanceTitle:setTopBottom( 0, 0, 505, 543 )
	CryptokeyBalanceTitle:setText( Engine.Localize( "MENU_CRYPTOKEY_BALANCE" ) )
	CryptokeyBalanceTitle:setTTF( "fonts/default.ttf" )
	CryptokeyBalanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CryptokeyBalanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CryptokeyBalanceTitle )
	self.CryptokeyBalanceTitle = CryptokeyBalanceTitle
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( 0, 0, 145, 207 )
	CryptoIcon:setTopBottom( 0, 0, 559, 621 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptokeyBalanceNum = LUI.UIText.new()
	CryptokeyBalanceNum:setLeftRight( 0, 0, 208, 356 )
	CryptokeyBalanceNum:setTopBottom( 0, 0, 566, 610 )
	CryptokeyBalanceNum:setTTF( "fonts/default.ttf" )
	CryptokeyBalanceNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptokeyBalanceNum:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptokeyBalanceNum:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyBalanceNum:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptokeyBalanceNum )
	self.CryptokeyBalanceNum = CryptokeyBalanceNum
	
	self.resetProperties = function ()
		CryptokeyBalanceBacking:completeAnimation()
		Border:completeAnimation()
		CryptokeyBalanceTitle:completeAnimation()
		CryptoIcon:completeAnimation()
		CryptokeyBalanceNum:completeAnimation()
		verticalScrollingTextBox18:completeAnimation()
		BlackmarketIndividualRewardItem:completeAnimation()
		CardTitle:completeAnimation()
		CryptokeyBalanceBacking:setAlpha( 0.2 )
		Border:setAlpha( 0.25 )
		CryptokeyBalanceTitle:setAlpha( 1 )
		CryptoIcon:setAlpha( 1 )
		CryptokeyBalanceNum:setAlpha( 1 )
		verticalScrollingTextBox18:setAlpha( 1 )
		BlackmarketIndividualRewardItem:setLeftRight( 0.5, 0.5, -180, 180 )
		BlackmarketIndividualRewardItem:setTopBottom( 0, 0, 259, 349 )
		CardTitle:setText( Engine.Localize( "MENU_PURCHASE_AVAILABLE" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CryptokeyCountChanged = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				CardTitle:completeAnimation()
				self.CardTitle:setText( Engine.Localize( "MPUI_BM_CRYPTOKEYS" ) )
				self.clipFinished( CardTitle, {} )
				verticalScrollingTextBox18:completeAnimation()
				self.verticalScrollingTextBox18:setAlpha( 0 )
				self.clipFinished( verticalScrollingTextBox18, {} )
				BlackmarketIndividualRewardItem:completeAnimation()
				self.BlackmarketIndividualRewardItem:setLeftRight( 0.5, 0.5, -180, 180 )
				self.BlackmarketIndividualRewardItem:setTopBottom( 0, 0, 204, 294 )
				self.clipFinished( BlackmarketIndividualRewardItem, {} )
				CryptokeyBalanceBacking:completeAnimation()
				self.CryptokeyBalanceBacking:setAlpha( 0 )
				self.clipFinished( CryptokeyBalanceBacking, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
				CryptokeyBalanceTitle:completeAnimation()
				self.CryptokeyBalanceTitle:setAlpha( 0 )
				self.clipFinished( CryptokeyBalanceTitle, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 0 )
				self.clipFinished( CryptoIcon, {} )
				CryptokeyBalanceNum:completeAnimation()
				self.CryptokeyBalanceNum:setAlpha( 0 )
				self.clipFinished( CryptokeyBalanceNum, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CryptokeyCountChanged",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "cryptoKeyCountChanged" )
			end
		}
	} )
	self:linkToElementModel( self, "cryptoKeyCountChanged", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cryptoKeyCountChanged"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.FEButtonPanel0:close()
		self.BlackmarketRewardsCarouselFX:close()
		self.CardTitleBacking:close()
		self.verticalScrollingTextBox18:close()
		self.BlackmarketIndividualRewardItem:close()
		self.Border:close()
		self.CryptokeyBalanceNum:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

