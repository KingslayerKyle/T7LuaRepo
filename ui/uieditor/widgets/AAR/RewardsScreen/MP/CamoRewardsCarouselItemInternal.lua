-- 7b901bc0476a250156af3980a2bef6c0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItem" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )
require( "ui.uieditor.widgets.verticalScrollingTextBox18" )

CoD.CamoRewardsCarouselItemInternal = InheritFrom( LUI.UIElement )
CoD.CamoRewardsCarouselItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CamoRewardsCarouselItemInternal )
	self.id = "CamoRewardsCarouselItemInternal"
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
	
	local BoxButtonLrgInactiveStroke = LUI.UIImage.new()
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, 1, 0 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	BoxButtonLrgInactiveStroke:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokefull" ) )
	BoxButtonLrgInactiveStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveStroke:setShaderVector( 0, 0.06, 0.04, 0, 0 )
	BoxButtonLrgInactiveStroke:setupNineSliceShader( 16, 16 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 1 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
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
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, false, 7.37, 268.11 )
	TitleBacking:setTopBottom( true, false, 8.48, 154.33 )
	TitleBacking:setImage( RegisterImage( "uie_t7_rewards_backer_rank" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( true, false, 32.23, 243 )
	highlight:setTopBottom( true, false, -54.67, 154.33 )
	highlight:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( true, false, -27.5, 304.5 )
	CardImage:setTopBottom( true, false, -13, 131 )
	CardImage:setScale( 0.6 )
	CardImage:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local rewardCarouselItemImage = Engine.GetModelValue( model )
		if rewardCarouselItemImage then
			CardImage:setImage( RegisterImage( rewardCarouselItemImage ) )
		end
	end )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	local IndividualRewardItem1 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem1:setLeftRight( true, false, 18.37, 257.5 )
	IndividualRewardItem1:setTopBottom( true, false, 173, 233 )
	IndividualRewardItem1.NotificationRewardBorder:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	IndividualRewardItem1:linkToElementModel( self, "reward1InfoVisible", true, function ( model )
		local reward1InfoVisible = Engine.GetModelValue( model )
		if reward1InfoVisible then
			IndividualRewardItem1:setAlpha( reward1InfoVisible )
		end
	end )
	IndividualRewardItem1:linkToElementModel( self, "reward1Info", false, function ( model )
		IndividualRewardItem1:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem1 )
	self.IndividualRewardItem1 = IndividualRewardItem1
	
	local IndividualRewardItem2 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem2:setLeftRight( true, false, 18.37, 257.5 )
	IndividualRewardItem2:setTopBottom( true, false, 238, 299 )
	IndividualRewardItem2.NotificationRewardBorder:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	IndividualRewardItem2:linkToElementModel( self, "reward2InfoVisible", true, function ( model )
		local reward2InfoVisible = Engine.GetModelValue( model )
		if reward2InfoVisible then
			IndividualRewardItem2:setAlpha( reward2InfoVisible )
		end
	end )
	IndividualRewardItem2:linkToElementModel( self, "reward2Info", false, function ( model )
		IndividualRewardItem2:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem2 )
	self.IndividualRewardItem2 = IndividualRewardItem2
	
	local IndividualRewardItem3 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem3:setLeftRight( true, false, 18.37, 257.5 )
	IndividualRewardItem3:setTopBottom( true, false, 303, 364 )
	IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	IndividualRewardItem3:linkToElementModel( self, "reward3InfoVisible", true, function ( model )
		local reward3InfoVisible = Engine.GetModelValue( model )
		if reward3InfoVisible then
			IndividualRewardItem3:setAlpha( reward3InfoVisible )
		end
	end )
	IndividualRewardItem3:linkToElementModel( self, "reward3Info", false, function ( model )
		IndividualRewardItem3:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem3 )
	self.IndividualRewardItem3 = IndividualRewardItem3
	
	local IndividualRewardItem4 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem4:setLeftRight( true, false, 18.37, 257.5 )
	IndividualRewardItem4:setTopBottom( true, false, 368, 429 )
	IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	IndividualRewardItem4:linkToElementModel( self, "reward4InfoVisible", true, function ( model )
		local reward4InfoVisible = Engine.GetModelValue( model )
		if reward4InfoVisible then
			IndividualRewardItem4:setAlpha( reward4InfoVisible )
		end
	end )
	IndividualRewardItem4:linkToElementModel( self, "reward4Info", false, function ( model )
		IndividualRewardItem4:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem4 )
	self.IndividualRewardItem4 = IndividualRewardItem4
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( true, false, 0, 340 )
	Border0:setTopBottom( true, false, 0, 520 )
	Border0:setAlpha( 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local RankUpNotificationFooterBacking = CoD.RankUpNotification_FooterBacking01.new( menu, controller )
	RankUpNotificationFooterBacking:setLeftRight( true, false, 14, 262 )
	RankUpNotificationFooterBacking:setTopBottom( true, false, 99.69, 136.31 )
	RankUpNotificationFooterBacking:setRGB( ColorSet.RewardCamo.r, ColorSet.RewardCamo.g, ColorSet.RewardCamo.b )
	RankUpNotificationFooterBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RankUpNotificationFooterBacking )
	self.RankUpNotificationFooterBacking = RankUpNotificationFooterBacking
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( false, false, -130, 130 )
	CardTitle:setTopBottom( true, false, 107, 129 )
	CardTitle:setRGB( 0, 0, 0 )
	CardTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CardTitle:setLetterSpacing( -1 )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardTitle:linkToElementModel( self, "rewardCarouselItemTitle", true, function ( model )
		local rewardCarouselItemTitle = Engine.GetModelValue( model )
		if rewardCarouselItemTitle then
			CardTitle:setText( Engine.Localize( rewardCarouselItemTitle ) )
		end
	end )
	self:addElement( CardTitle )
	self.CardTitle = CardTitle
	
	local verticalScrollingTextBox18 = CoD.verticalScrollingTextBox18.new( menu, controller )
	verticalScrollingTextBox18:setLeftRight( false, false, -119, 119 )
	verticalScrollingTextBox18:setTopBottom( true, false, 131, 167.25 )
	verticalScrollingTextBox18.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox18.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	verticalScrollingTextBox18:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local rewardCarouselItemSubtitle = Engine.GetModelValue( model )
		if rewardCarouselItemSubtitle then
			verticalScrollingTextBox18.textBox:setText( Engine.Localize( rewardCarouselItemSubtitle ) )
		end
	end )
	self:addElement( verticalScrollingTextBox18 )
	self.verticalScrollingTextBox18 = verticalScrollingTextBox18
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid0:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.FEButtonPanel0:close()
		element.IndividualRewardItem1:close()
		element.IndividualRewardItem2:close()
		element.IndividualRewardItem3:close()
		element.IndividualRewardItem4:close()
		element.Border0:close()
		element.RankUpNotificationFooterBacking:close()
		element.verticalScrollingTextBox18:close()
		element.CardImage:close()
		element.CardTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

