CoD.BonusCardTitle = {}
CoD.BonusCardTitle.New = function ( defaultAnimationState )
	local bonusCardTitle = LUI.UIElement.new( defaultAnimationState )
	bonusCardTitle.id = "BonusCardTitle"
	bonusCardTitle.update = CoD.BonusCardTitle.Update
	return bonusCardTitle
end

CoD.BonusCardTitle.Update = function ( self, titleText, cardName )
	if self.titleLabel ~= nil then
		self.titleLabel:close()
		self.titleLable = nil
	end
	if self.cardNameLabel ~= nil then
		self.cardNameLabel:close()
		self.cardNameLabel = nil
	end
	self.titleLabel = LUI.UITightText.new()
	self.titleLabel:setLeftRight( true, false, 0, 10 )
	self.titleLabel:setTopBottom( true, true, 0, 0 )
	self.titleLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.titleLabel:setAlpha( 0.5 )
	self.titleLabel:setFont( CoD.fonts.ExtraSmall )
	self.titleLabel:setText( titleText )
	self:addElement( self.titleLabel )
	if cardName then
		local f2_local0 = {}
		local titleLabelDim = GetTextDimensions( titleText, CoD.fonts.Default, CoD.textSize.Default )
		local spacer = 4
		local cardNameLeft = titleLabelDim[3] + spacer
		self.cardNameLabel = LUI.UITightText.new()
		self.cardNameLabel:setLeftRight( true, false, cardNameLeft, cardNameLeft + 10 )
		self.cardNameLabel:setTopBottom( true, true, 0, 0 )
		self.cardNameLabel:setFont( CoD.fonts.Default )
		self.cardNameLabel:setText( cardName )
		self.cardNameLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		self:addElement( self.cardNameLabel )
	end
end

