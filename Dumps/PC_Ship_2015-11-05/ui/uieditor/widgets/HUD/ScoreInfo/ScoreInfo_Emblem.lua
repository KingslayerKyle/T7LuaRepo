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
	playerEmblem:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			playerEmblem:setupPlayerEmblemByXUID( xuid )
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

