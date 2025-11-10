require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItem" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )

CoD.RewardsCarouselItemInternal = InheritFrom( LUI.UIElement )
CoD.RewardsCarouselItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RewardsCarouselItemInternal )
	self.id = "RewardsCarouselItemInternal"
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
	highlight:setLeftRight( false, false, -84.72, 85.72 )
	highlight:setTopBottom( true, false, -21, 148 )
	highlight:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( true, false, 87, 186 )
	CardImage:setTopBottom( true, false, 8.48, 107.48 )
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
	IndividualRewardItem1:setLeftRight( true, false, 17.37, 256.5 )
	IndividualRewardItem1:setTopBottom( true, false, 162.5, 222.5 )
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
	IndividualRewardItem2:setLeftRight( true, false, 17.37, 256.5 )
	IndividualRewardItem2:setTopBottom( true, false, 230, 291 )
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
	IndividualRewardItem3:setLeftRight( true, false, 18.44, 258.56 )
	IndividualRewardItem3:setTopBottom( true, false, 296, 357 )
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
	IndividualRewardItem4:setLeftRight( true, false, 18.37, 258.56 )
	IndividualRewardItem4:setTopBottom( true, false, 364, 425 )
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
	RankUpNotificationFooterBacking:setTopBottom( true, false, 97.69, 134.31 )
	RankUpNotificationFooterBacking:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
	RankUpNotificationFooterBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RankUpNotificationFooterBacking )
	self.RankUpNotificationFooterBacking = RankUpNotificationFooterBacking
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( false, false, -126, 126 )
	CardDescription:setTopBottom( true, false, 130, 152 )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardDescription:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local rewardCarouselItemSubtitle = Engine.GetModelValue( model )
		if rewardCarouselItemSubtitle then
			CardDescription:setText( Engine.Localize( rewardCarouselItemSubtitle ) )
		end
	end )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( false, false, -130, 130 )
	CardTitle:setTopBottom( true, false, 105, 127 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -103.94, 102.94 )
				self.highlight:setTopBottom( true, false, -29.5, 155 )
				self.highlight:setRGB( 0.27, 0.85, 1 )
				self.highlight:setAlpha( 0.15 )
				self.clipFinished( highlight, {} )
				IndividualRewardItem1:completeAnimation()
				IndividualRewardItem1.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem1.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem1, {} )
				IndividualRewardItem2:completeAnimation()
				IndividualRewardItem2.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem2.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem2, {} )
				IndividualRewardItem3:completeAnimation()
				IndividualRewardItem3.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem3:setRGB( 1, 1, 1 )
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4:setRGB( 1, 1, 1 )
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
			end
		},
		WeaponLevelUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -201, 202 )
				self.highlight:setTopBottom( true, false, -49, 150 )
				self.highlight:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.highlight:setAlpha( 0.1 )
				self.clipFinished( highlight, {} )
				CardImage:completeAnimation()
				self.CardImage:setLeftRight( true, false, -5.81, 281.68 )
				self.CardImage:setTopBottom( true, false, -1.46, 123.23 )
				self.clipFinished( CardImage, {} )
				IndividualRewardItem1:completeAnimation()
				IndividualRewardItem1.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem1.NotificationRewardBorder:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.clipFinished( IndividualRewardItem1, {} )
				IndividualRewardItem2:completeAnimation()
				IndividualRewardItem2.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem2.NotificationRewardBorder:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.clipFinished( IndividualRewardItem2, {} )
				IndividualRewardItem3:completeAnimation()
				IndividualRewardItem3.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
			end
		},
		ChallengeCompleted = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -103.94, 102.94 )
				self.highlight:setTopBottom( true, false, -29.5, 155 )
				self.highlight:setRGB( 0.27, 0.85, 1 )
				self.highlight:setAlpha( 0.15 )
				self.clipFinished( highlight, {} )
				CardImage:completeAnimation()
				self.CardImage:setLeftRight( true, false, 8, 268.11 )
				self.CardImage:setTopBottom( true, false, 30.48, 97.69 )
				self.clipFinished( CardImage, {} )
				IndividualRewardItem1:completeAnimation()
				IndividualRewardItem1.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem1.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem1, {} )
				IndividualRewardItem2:completeAnimation()
				IndividualRewardItem2.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem2.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem2, {} )
				IndividualRewardItem3:completeAnimation()
				IndividualRewardItem3.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem3:setRGB( 1, 1, 1 )
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4:setRGB( 1, 1, 1 )
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WeaponLevelUp",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rewardCarouselItemType", "weaponRankup" )
			end
		},
		{
			stateName = "ChallengeCompleted",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rewardCarouselItemType", "challengeCompleted" )
			end
		}
	} )
	self:linkToElementModel( self, "rewardCarouselItemType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardCarouselItemType"
		} )
	end )
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
		element.CardImage:close()
		element.CardDescription:close()
		element.CardTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

