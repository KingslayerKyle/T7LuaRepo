local PostLoadFunc = function ( self, controller, menu )
	if IsDemoPlaying() and self.playerEmblem then
		self.playerEmblem:unsubscribeFromAllModels()
		self.playerEmblem:subscribeToGlobalModel( controller, "Demo", "clientXUID", function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.playerEmblem:setupPlayerEmblemByXUID( modelValue )
			end
		end )
	end
end

CoD.ScoreInfo_Emblem = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_Emblem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_Emblem )
	self.id = "ScoreInfo_Emblem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 44 )
	
	local playerEmblem = LUI.UIImage.new()
	playerEmblem:setLeftRight( true, true, 0, 0 )
	playerEmblem:setTopBottom( true, true, 0, 0 )
	playerEmblem:subscribeToGlobalModel( controller, "PerController", "identityBadge.xuid", function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			playerEmblem:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	self:addElement( playerEmblem )
	self.playerEmblem = playerEmblem
	
	local SidemaskL = LUI.UIImage.new()
	SidemaskL:setLeftRight( false, false, -36, -20 )
	SidemaskL:setTopBottom( false, false, -22, 22 )
	SidemaskL:setAlpha( 0 )
	SidemaskL:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_emblemmask" ) )
	self:addElement( SidemaskL )
	self.SidemaskL = SidemaskL
	
	local SidemaskR = LUI.UIImage.new()
	SidemaskR:setLeftRight( false, false, 20, 36 )
	SidemaskR:setTopBottom( false, false, -22, 22 )
	SidemaskR:setAlpha( 0 )
	SidemaskR:setYRot( -180 )
	SidemaskR:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_emblemmask" ) )
	self:addElement( SidemaskR )
	self.SidemaskR = SidemaskR
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.playerEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

