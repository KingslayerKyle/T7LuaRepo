require( "ui.uieditor.widgets.AAR.RewardsScreen.IndividualRewardItemImage" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardBorder" )

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
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 0, 0, 360 )
	Bg:setTopBottom( 0, 0, -1, 89 )
	Bg:setRGB( 0.07, 0.07, 0.07 )
	Bg:setAlpha( 0.8 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 6, 84 )
	Image0:setTopBottom( 0, 0, 4, 84 )
	Image0:setRGB( 0.27, 0.27, 0.27 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local NotificationRewardBorder = CoD.NotificationRewardBorder.new( menu, controller )
	NotificationRewardBorder:setLeftRight( 0, 0, 3, 87 )
	NotificationRewardBorder:setTopBottom( 0, 0, 2, 86 )
	self:addElement( NotificationRewardBorder )
	self.NotificationRewardBorder = NotificationRewardBorder
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 0, -2, 360 )
	Border:setTopBottom( 0, 0, -2, 90 )
	self:addElement( Border )
	self.Border = Border
	
	local RewardTitle = LUI.UITightText.new()
	RewardTitle:setLeftRight( 0, 0, 93, 357 )
	RewardTitle:setTopBottom( 0, 0, 16, 46 )
	RewardTitle:setTTF( "fonts/default.ttf" )
	RewardTitle:linkToElementModel( self, "rewardName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RewardTitle )
	self.RewardTitle = RewardTitle
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 93, 353 )
	TextBox0:setTopBottom( 0, 0, 46, 73 )
	TextBox0:setRGB( 0.58, 0.58, 0.58 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "rewardDesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, text )
		if not IsCurrentLanguageReversed() then
			ScaleWidgetToLabelWrapped( self, element, 1, 1 )
		elseif IsCurrentLanguageReversed() then
			ScaleWidgetToLabelLeftJustify( self, element, 1 )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local IndividualRewardItemImage0 = CoD.IndividualRewardItemImage.new( menu, controller )
	IndividualRewardItemImage0:setLeftRight( 0, 0, 7.5, 82.5 )
	IndividualRewardItemImage0:setTopBottom( 0, 0, 6.5, 81.5 )
	IndividualRewardItemImage0:linkToElementModel( self, nil, false, function ( model )
		IndividualRewardItemImage0:setModel( model, controller )
	end )
	self:addElement( IndividualRewardItemImage0 )
	self.IndividualRewardItemImage0 = IndividualRewardItemImage0
	
	self.resetProperties = function ()
		TextBox0:completeAnimation()
		RewardTitle:completeAnimation()
		TextBox0:setAlpha( 1 )
		RewardTitle:setLeftRight( 0, 0, 93, 357 )
		RewardTitle:setTopBottom( 0, 0, 16, 46 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoDescription = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				RewardTitle:completeAnimation()
				self.RewardTitle:setLeftRight( 0, 0, 93, 357 )
				self.RewardTitle:setTopBottom( 0, 0, 29, 59 )
				self.clipFinished( RewardTitle, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
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
		self.NotificationRewardBorder:close()
		self.Border:close()
		self.IndividualRewardItemImage0:close()
		self.RewardTitle:close()
		self.TextBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

