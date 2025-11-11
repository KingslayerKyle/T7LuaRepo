require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItem" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )
require( "ui.uieditor.widgets.verticalScrollingTextBox18" )

CoD.SpecialistRewardsCarouselItemInternal = InheritFrom( LUI.UIElement )
CoD.SpecialistRewardsCarouselItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialistRewardsCarouselItemInternal )
	self.id = "SpecialistRewardsCarouselItemInternal"
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
	
	local CenterFill = LUI.UIImage.new()
	CenterFill:setLeftRight( 0.5, 0.5, -98, 98 )
	CenterFill:setTopBottom( 0, 0, -20, 176 )
	CenterFill:setRGB( 0.16, 0.16, 0.16 )
	CenterFill:setAlpha( 0.4 )
	CenterFill:setImage( RegisterImage( "uie_t7_hud_notif_specialist_center_fill" ) )
	self:addElement( CenterFill )
	self.CenterFill = CenterFill
	
	local SideFill = LUI.UIImage.new()
	SideFill:setLeftRight( 0.5, 0.5, -98, 98 )
	SideFill:setTopBottom( 0, 0, -20, 176 )
	SideFill:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
	SideFill:setAlpha( 0.2 )
	SideFill:setImage( RegisterImage( "uie_t7_hud_notif_specialist_side_fill" ) )
	self:addElement( SideFill )
	self.SideFill = SideFill
	
	local SideStroke = LUI.UIImage.new()
	SideStroke:setLeftRight( 0.5, 0.5, -98, 98 )
	SideStroke:setTopBottom( 0, 0, -20, 176 )
	SideStroke:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
	SideStroke:setImage( RegisterImage( "uie_t7_hud_notif_specialist_side_stroke" ) )
	self:addElement( SideStroke )
	self.SideStroke = SideStroke
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0.5, 0.5, -159, 157 )
	highlight:setTopBottom( 0, 0, -82, 232 )
	highlight:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
	highlight:setAlpha( 0.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CardImage = LUI.UIImage.new()
	CardImage:setLeftRight( 0, 0, 89, 317 )
	CardImage:setTopBottom( 0, 0, -38, 190 )
	CardImage:setScale( 0.6 )
	CardImage:linkToElementModel( self, "rewardCarouselItemImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	local IndividualRewardItem1 = CoD.IndividualRewardItem.new( menu, controller )
	IndividualRewardItem1:setLeftRight( 0, 0, 27, 386 )
	IndividualRewardItem1:setTopBottom( 0, 0, 259, 349 )
	IndividualRewardItem1.NotificationRewardBorder:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
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
	IndividualRewardItem2.NotificationRewardBorder:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
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
	IndividualRewardItem3.NotificationRewardBorder:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
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
	IndividualRewardItem4.NotificationRewardBorder:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
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
	RankUpNotificationFooterBacking:setTopBottom( 0, 0, 150, 205 )
	RankUpNotificationFooterBacking:setRGB( ColorSet.RewardSpecialist.r, ColorSet.RewardSpecialist.g, ColorSet.RewardSpecialist.b )
	RankUpNotificationFooterBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RankUpNotificationFooterBacking )
	self.RankUpNotificationFooterBacking = RankUpNotificationFooterBacking
	
	local CardTitle = LUI.UIText.new()
	CardTitle:setLeftRight( 0.5, 0.5, -195, 195 )
	CardTitle:setTopBottom( 0, 0, 161, 194 )
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
	
	local verticalScrollingTextBox18 = CoD.verticalScrollingTextBox18.new( menu, controller )
	verticalScrollingTextBox18:setLeftRight( 0.5, 0.5, -178.5, 178.5 )
	verticalScrollingTextBox18:setTopBottom( 0, 0, 197, 251 )
	verticalScrollingTextBox18.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox18.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	verticalScrollingTextBox18:linkToElementModel( self, "rewardCarouselItemSubtitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			verticalScrollingTextBox18.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( verticalScrollingTextBox18 )
	self.verticalScrollingTextBox18 = verticalScrollingTextBox18
	
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
		self.verticalScrollingTextBox18:close()
		self.CardImage:close()
		self.CardTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

