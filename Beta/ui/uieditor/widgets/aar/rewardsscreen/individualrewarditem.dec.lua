require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardBorder" )
require( "ui.uieditor.widgets.Border" )

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
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( true, false, 5, 55 )
	RewardImage:setTopBottom( true, false, 4.5, 54.5 )
	RewardImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local RewardTitle = LUI.UITightText.new()
	RewardTitle:setLeftRight( true, false, 61.97, 238 )
	RewardTitle:setTopBottom( true, false, 10.5, 30.5 )
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
	TextBox0:setLeftRight( true, false, 61.97, 238 )
	TextBox0:setTopBottom( true, false, 30.5, 48.5 )
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
		ScaleWidgetToLabelWrapped( self, element, 1, 1 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NotificationRewardBorder:close()
		self.Border:close()
		self.RewardImage:close()
		self.RewardTitle:close()
		self.TextBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

