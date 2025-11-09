CoD.XPProgressionStatusWidget = InheritFrom( LUI.UIElement )
CoD.XPProgressionStatusWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.XPProgressionStatusWidget )
	self.id = "XPProgressionStatusWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1048 )
	self:setTopBottom( true, false, 0, 55 )
	
	local currentRankIcon = LUI.UIImage.new()
	currentRankIcon:setLeftRight( true, false, 22, 54 )
	currentRankIcon:setTopBottom( false, true, -32, 0 )
	currentRankIcon:setRGB( 1, 1, 1 )
	currentRankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	currentRankIcon:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentRankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( currentRankIcon )
	self.currentRankIcon = currentRankIcon
	
	local currentRankLabel = LUI.UITightText.new()
	currentRankLabel:setLeftRight( true, false, 0, 24 )
	currentRankLabel:setTopBottom( false, true, -28, -3 )
	currentRankLabel:setRGB( 1, 1, 1 )
	currentRankLabel:setTTF( "fonts/default.ttf" )
	currentRankLabel:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentRankLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentRankLabel )
	self.currentRankLabel = currentRankLabel
	
	local earnedLabel = LUI.UITightText.new()
	earnedLabel:setLeftRight( true, false, 59, 116 )
	earnedLabel:setTopBottom( true, false, 0, 20 )
	earnedLabel:setRGB( 1, 1, 1 )
	earnedLabel:setText( Engine.Localize( "MENU_EARNED" ) )
	earnedLabel:setTTF( "fonts/default.ttf" )
	self:addElement( earnedLabel )
	self.earnedLabel = earnedLabel
	
	local xpEarned = LUI.UITightText.new()
	xpEarned:setLeftRight( true, false, 113, 149 )
	xpEarned:setTopBottom( true, false, 0, 20 )
	xpEarned:setRGB( 0.22, 0.76, 0.32 )
	xpEarned:setTTF( "fonts/default.ttf" )
	xpEarned:subscribeToGlobalModel( controller, "XPProgressionBar", "xpEarned", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xpEarned:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( xpEarned )
	self.xpEarned = xpEarned
	
	local xpbar = LUI.UIImage.new()
	xpbar:setLeftRight( true, true, 59, -62 )
	xpbar:setTopBottom( true, true, 23, 0 )
	xpbar:setRGB( 1, 1, 1 )
	xpbar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( xpbar )
	self.xpbar = xpbar
	
	local nextRankIcon = LUI.UIImage.new()
	nextRankIcon:setLeftRight( false, true, -32, 0 )
	nextRankIcon:setTopBottom( false, true, -32, 0 )
	nextRankIcon:setRGB( 1, 1, 1 )
	nextRankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	nextRankIcon:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nextRankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( nextRankIcon )
	self.nextRankIcon = nextRankIcon
	
	local nextRankLabel = LUI.UITightText.new()
	nextRankLabel:setLeftRight( false, true, -56, -32 )
	nextRankLabel:setTopBottom( false, true, -28.5, -3.5 )
	nextRankLabel:setRGB( 1, 1, 1 )
	nextRankLabel:setTTF( "fonts/default.ttf" )
	nextRankLabel:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nextRankLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nextRankLabel )
	self.nextRankLabel = nextRankLabel
	
	local nextLevelXp = LUI.UITightText.new()
	nextLevelXp:setLeftRight( false, true, -107, -62 )
	nextLevelXp:setTopBottom( true, false, 0, 20 )
	nextLevelXp:setRGB( 1, 1, 1 )
	nextLevelXp:setTTF( "fonts/default.ttf" )
	nextLevelXp:subscribeToGlobalModel( controller, "XPProgressionBar", "xpToNextRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nextLevelXp:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nextLevelXp )
	self.nextLevelXp = nextLevelXp
	
	local nextLevelLabel = LUI.UITightText.new()
	nextLevelLabel:setLeftRight( false, true, -205, -109 )
	nextLevelLabel:setTopBottom( true, false, 0, 20 )
	nextLevelLabel:setRGB( 1, 1, 1 )
	nextLevelLabel:setText( Engine.Localize( "MPUI_NEXT_LEVEL_CAPS" ) )
	nextLevelLabel:setTTF( "fonts/default.ttf" )
	self:addElement( nextLevelLabel )
	self.nextLevelLabel = nextLevelLabel
	
	self.close = function ( self )
		self.currentRankIcon:close()
		self.currentRankLabel:close()
		self.xpEarned:close()
		self.nextRankIcon:close()
		self.nextRankLabel:close()
		self.nextLevelXp:close()
		CoD.XPProgressionStatusWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

