-- 156652e55872c84954b277f097d58605
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardBorder" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItemImage" )

CoD.IndividualRewardItem = InheritFrom( LUI.UIElement )
CoD.IndividualRewardItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IndividualRewardItem )
	self.id = "IndividualRewardItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, false, 0, 240 )
	Bg:setTopBottom( true, false, -0.5, 59.5 )
	Bg:setRGB( 0.07, 0.07, 0.07 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 4, 56 )
	Image0:setTopBottom( true, false, 3, 56 )
	Image0:setRGB( 0.27, 0.27, 0.27 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local NotificationRewardBorder = CoD.NotificationRewardBorder.new( menu, controller )
	NotificationRewardBorder:setLeftRight( true, false, 2, 58 )
	NotificationRewardBorder:setTopBottom( true, false, 1.5, 57.5 )
	self:addElement( NotificationRewardBorder )
	self.NotificationRewardBorder = NotificationRewardBorder
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, -1, 240 )
	Border:setTopBottom( true, false, -1, 60 )
	self:addElement( Border )
	self.Border = Border
	
	local RewardTitle = LUI.UITightText.new()
	RewardTitle:setLeftRight( true, false, 61.97, 238 )
	RewardTitle:setTopBottom( true, false, 10.5, 30.5 )
	RewardTitle:setTTF( "fonts/default.ttf" )
	RewardTitle:linkToElementModel( self, "rewardName", true, function ( model )
		local rewardName = Engine.GetModelValue( model )
		if rewardName then
			RewardTitle:setText( Engine.Localize( rewardName ) )
		end
	end )
	self:addElement( RewardTitle )
	self.RewardTitle = RewardTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 61.97, 235 )
	TextBox0:setTopBottom( true, false, 30.5, 48.5 )
	TextBox0:setRGB( 0.58, 0.58, 0.58 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "rewardDesc", true, function ( model )
		local rewardDesc = Engine.GetModelValue( model )
		if rewardDesc then
			TextBox0:setText( Engine.Localize( rewardDesc ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, controller )
		if not IsCurrentLanguageReversed() then
			ScaleWidgetToLabelWrapped( self, element, 1, 1 )
		elseif IsCurrentLanguageReversed() then
			ScaleWidgetToLabelLeftJustify( self, element, 1 )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local IndividualRewardItemImage0 = CoD.IndividualRewardItemImage.new( menu, controller )
	IndividualRewardItemImage0:setLeftRight( true, false, 5, 55 )
	IndividualRewardItemImage0:setTopBottom( true, false, 4.5, 54.5 )
	IndividualRewardItemImage0:linkToElementModel( self, nil, false, function ( model )
		IndividualRewardItemImage0:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItemImage0 )
	self.IndividualRewardItemImage0 = IndividualRewardItemImage0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RewardTitle:completeAnimation()
				self.RewardTitle:setLeftRight( true, false, 61.97, 238 )
				self.RewardTitle:setTopBottom( true, false, 10.5, 30.5 )
				self.RewardTitle:setAlpha( 1 )
				self.clipFinished( RewardTitle, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )

				IndividualRewardItemImage0:completeAnimation()
				self.IndividualRewardItemImage0:setLeftRight( true, false, 5, 55 )
				self.IndividualRewardItemImage0:setTopBottom( true, false, 4.5, 54.5 )
				self.clipFinished( IndividualRewardItemImage0, {} )
			end
		},
		NoDescription = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RewardTitle:completeAnimation()
				self.RewardTitle:setLeftRight( true, false, 61.97, 238 )
				self.RewardTitle:setTopBottom( true, false, 19.5, 39.5 )
				self.RewardTitle:setAlpha( 1 )
				self.clipFinished( RewardTitle, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )

				IndividualRewardItemImage0:completeAnimation()
				self.IndividualRewardItemImage0:setLeftRight( true, false, 5, 55 )
				self.IndividualRewardItemImage0:setTopBottom( true, false, 4.5, 54.5 )
				self.clipFinished( IndividualRewardItemImage0, {} )
			end
		},
		Incentive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				RewardTitle:completeAnimation()
				self.RewardTitle:setLeftRight( true, false, 61.97, 238 )
				self.RewardTitle:setTopBottom( true, false, 10.5, 30.5 )
				self.RewardTitle:setAlpha( 1 )
				self.clipFinished( RewardTitle, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )

				IndividualRewardItemImage0:completeAnimation()
				self.IndividualRewardItemImage0:setLeftRight( true, false, 1, 59 )
				self.IndividualRewardItemImage0:setTopBottom( true, false, 0.5, 58.5 )
				self.clipFinished( IndividualRewardItemImage0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoDescription",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "rewardDesc" )
			end
		},
		{
			stateName = "Incentive",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
		element.NotificationRewardBorder:close()
		element.Border:close()
		element.IndividualRewardItemImage0:close()
		element.RewardTitle:close()
		element.TextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

