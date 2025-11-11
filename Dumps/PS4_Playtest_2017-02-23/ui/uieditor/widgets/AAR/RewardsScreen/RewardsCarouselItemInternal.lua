require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItem" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
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
	
	local BoxButtonLrgInactiveStroke = LUI.UIImage.new()
	BoxButtonLrgInactiveStroke:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveStroke:setTopBottom( 0, 1, 2, 0 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	BoxButtonLrgInactiveStroke:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokefull" ) )
	BoxButtonLrgInactiveStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveStroke:setShaderVector( 0, 0, 0, 0, 0 )
	BoxButtonLrgInactiveStroke:setupNineSliceShader( 24, 24 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 1, 0, 2 )
	BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
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
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( 0, 0, 11, 402 )
	TitleBacking:setTopBottom( 0, 0, 13, 232 )
	TitleBacking:setImage( RegisterImage( "uie_t7_rewards_backer_rank" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0.5, 0.5, -127, 129 )
	highlight:setTopBottom( 0, 0, -32, 222 )
	highlight:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( 0, 0, 131, 279 )
	CardImage:setTopBottom( 0, 0, 13, 161 )
	CardImage:setScale( 0.6 )
	CardImage:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	local ParagonRankUpDesc = LUI.UIText.new()
	ParagonRankUpDesc:setLeftRight( 0.5, 0.5, -128, 128 )
	ParagonRankUpDesc:setTopBottom( 0, 0, 259, 289 )
	ParagonRankUpDesc:setText( Engine.Localize( "MENU_AAR_PARAGON_LEVEL_GAIN" ) )
	ParagonRankUpDesc:setTTF( "fonts/default.ttf" )
	ParagonRankUpDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ParagonRankUpDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ParagonRankUpDesc:linkToElementModel( self, "paragonRankDescVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ParagonRankUpDesc:setAlpha( modelValue )
		end
	end )
	self:addElement( ParagonRankUpDesc )
	self.ParagonRankUpDesc = ParagonRankUpDesc
	
	local ExtraParagonIconsText = LUI.UIText.new()
	ExtraParagonIconsText:setLeftRight( 0.5, 0.5, -128, 128 )
	ExtraParagonIconsText:setTopBottom( 0, 0, 583, 613 )
	ExtraParagonIconsText:setText( LocalizeIntoString( "PRESENCE_PLUS_NUM_MORE", "6" ) )
	ExtraParagonIconsText:setTTF( "fonts/default.ttf" )
	ExtraParagonIconsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ExtraParagonIconsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ExtraParagonIconsText:linkToElementModel( self, "extraParagonIconsVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ExtraParagonIconsText:setAlpha( modelValue )
		end
	end )
	self:addElement( ExtraParagonIconsText )
	self.ExtraParagonIconsText = ExtraParagonIconsText
	
	local IndividualRewardItem1 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem1:setLeftRight( 0, 0, 27, 386 )
	IndividualRewardItem1:setTopBottom( 0, 0, 259, 349 )
	IndividualRewardItem1:linkToElementModel( self, "reward1InfoVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IndividualRewardItem1:setAlpha( modelValue )
		end
	end )
	IndividualRewardItem1:linkToElementModel( self, "reward1Info", false, function ( model )
		IndividualRewardItem1:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem1 )
	self.IndividualRewardItem1 = IndividualRewardItem1
	
	local IndividualRewardItem2 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem2:setLeftRight( 0, 0, 27, 386 )
	IndividualRewardItem2:setTopBottom( 0, 0, 357, 449 )
	IndividualRewardItem2:linkToElementModel( self, "reward2InfoVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IndividualRewardItem2:setAlpha( modelValue )
		end
	end )
	IndividualRewardItem2:linkToElementModel( self, "reward2Info", false, function ( model )
		IndividualRewardItem2:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem2 )
	self.IndividualRewardItem2 = IndividualRewardItem2
	
	local IndividualRewardItem3 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem3:setLeftRight( 0, 0, 27, 386 )
	IndividualRewardItem3:setTopBottom( 0, 0, 454, 546 )
	IndividualRewardItem3:linkToElementModel( self, "reward3InfoVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IndividualRewardItem3:setAlpha( modelValue )
		end
	end )
	IndividualRewardItem3:linkToElementModel( self, "reward3Info", false, function ( model )
		IndividualRewardItem3:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem3 )
	self.IndividualRewardItem3 = IndividualRewardItem3
	
	local IndividualRewardItem4 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem4:setLeftRight( 0, 0, 27, 386 )
	IndividualRewardItem4:setTopBottom( 0, 0, 552, 644 )
	IndividualRewardItem4:linkToElementModel( self, "reward4InfoVisible", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IndividualRewardItem4:setAlpha( modelValue )
		end
	end )
	IndividualRewardItem4:linkToElementModel( self, "reward4Info", false, function ( model )
		IndividualRewardItem4:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItem4 )
	self.IndividualRewardItem4 = IndividualRewardItem4
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( 0, 0, 0, 510 )
	Border0:setTopBottom( 0, 0, 0, 780 )
	Border0:setAlpha( 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local RankUpNotificationFooterBacking = CoD.RankUpNotification_FooterBacking01.new( menu, controller )
	RankUpNotificationFooterBacking:setLeftRight( 0, 0, 21, 393 )
	RankUpNotificationFooterBacking:setTopBottom( 0, 0, 146, 201 )
	RankUpNotificationFooterBacking:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
	RankUpNotificationFooterBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RankUpNotificationFooterBacking )
	self.RankUpNotificationFooterBacking = RankUpNotificationFooterBacking
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( 0.5, 0.5, -189, 189 )
	CardDescription:setTopBottom( 0, 0, 195, 228 )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardDescription:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( 0.5, 0.5, -195, 195 )
	CardTitle:setTopBottom( 0, 0, 157, 190 )
	CardTitle:setRGB( 0, 0, 0 )
	CardTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CardTitle:setLetterSpacing( -1 )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardTitle:linkToElementModel( self, "rewardCarouselItemTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CardTitle )
	self.CardTitle = CardTitle
	
	self.resetProperties = function ()
		IndividualRewardItem1:completeAnimation()
		IndividualRewardItem2:completeAnimation()
		highlight:completeAnimation()
		RankUpNotificationFooterBacking:completeAnimation()
		IndividualRewardItem3:completeAnimation()
		IndividualRewardItem4:completeAnimation()
		CardImage:completeAnimation()
		CardDescription:completeAnimation()
		IndividualRewardItem1.NotificationRewardBorder:setRGB( 1, 1, 1 )
		IndividualRewardItem2.NotificationRewardBorder:setRGB( 1, 1, 1 )
		highlight:setLeftRight( 0.5, 0.5, -127, 129 )
		highlight:setTopBottom( 0, 0, -32, 222 )
		highlight:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
		highlight:setAlpha( 0.2 )
		RankUpNotificationFooterBacking:setRGB( ColorSet.RewardWeaponLevel.r, ColorSet.RewardWeaponLevel.g, ColorSet.RewardWeaponLevel.b )
		IndividualRewardItem3.NotificationRewardBorder:setRGB( 1, 1, 1 )
		IndividualRewardItem4.NotificationRewardBorder:setRGB( 1, 1, 1 )
		CardImage:setLeftRight( 0, 0, 131, 279 )
		CardImage:setTopBottom( 0, 0, 13, 161 )
		CardDescription:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( 0.5, 0.5, -156, 154 )
				self.highlight:setTopBottom( 0, 0, -44.5, 232.5 )
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
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
			end
		},
		WeaponLevelUp = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( 0.5, 0.5, -301, 303 )
				self.highlight:setTopBottom( 0, 0, -73, 225 )
				self.highlight:setAlpha( 0.1 )
				self.clipFinished( highlight, {} )
				CardImage:completeAnimation()
				self.CardImage:setLeftRight( 0, 0, -8.5, 422.5 )
				self.CardImage:setTopBottom( 0, 0, -2.5, 184.5 )
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
			end
		},
		ChallengeCompleted = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( 0.5, 0.5, -156, 154 )
				self.highlight:setTopBottom( 0, 0, -44.5, 232.5 )
				self.highlight:setRGB( 0.27, 0.85, 1 )
				self.highlight:setAlpha( 0.15 )
				self.clipFinished( highlight, {} )
				CardImage:completeAnimation()
				self.CardImage:setLeftRight( 0, 0, 12, 402 )
				self.CardImage:setTopBottom( 0, 0, 45.5, 146.5 )
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
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
			end
		},
		ParagonRankUp = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				highlight:completeAnimation()
				self.highlight:setLeftRight( 0.5, 0.5, -156, 154 )
				self.highlight:setTopBottom( 0, 0, -44.5, 232.5 )
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
				self.IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem3, {} )
				IndividualRewardItem4:completeAnimation()
				IndividualRewardItem4.NotificationRewardBorder:completeAnimation()
				self.IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( IndividualRewardItem4, {} )
				RankUpNotificationFooterBacking:completeAnimation()
				self.RankUpNotificationFooterBacking:setRGB( ColorSet.RewardRankup.r, ColorSet.RewardRankup.g, ColorSet.RewardRankup.b )
				self.clipFinished( RankUpNotificationFooterBacking, {} )
				CardDescription:completeAnimation()
				self.CardDescription:setRGB( ColorSet.ParagonRank.r, ColorSet.ParagonRank.g, ColorSet.ParagonRank.b )
				self.clipFinished( CardDescription, {} )
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
		},
		{
			stateName = "ParagonRankUp",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rewardCarouselItemType", "paragonRankUp" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedSolid0:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.FEButtonPanel0:close()
		self.IndividualRewardItem1:close()
		self.IndividualRewardItem2:close()
		self.IndividualRewardItem3:close()
		self.IndividualRewardItem4:close()
		self.Border0:close()
		self.RankUpNotificationFooterBacking:close()
		self.CardImage:close()
		self.ParagonRankUpDesc:close()
		self.ExtraParagonIconsText:close()
		self.CardDescription:close()
		self.CardTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

