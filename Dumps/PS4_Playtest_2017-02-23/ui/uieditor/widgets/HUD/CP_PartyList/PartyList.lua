require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_PlayerScore" )

CoD.PartyList = InheritFrom( LUI.UIElement )
CoD.PartyList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList )
	self.id = "PartyList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 399 )
	self:setTopBottom( 0, 0, 0, 145 )
	self.anyChildUsesUpdateState = true
	
	local playerScores = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playerScores:makeFocusable()
	playerScores:setLeftRight( 0, 0, 6, 391 )
	playerScores:setTopBottom( 0, 0, 15, 133 )
	playerScores:setWidgetType( CoD.PartyList_PlayerScore )
	playerScores:setVerticalCount( 4 )
	playerScores:setDataSource( "PlayerList" )
	self:addElement( playerScores )
	self.playerScores = playerScores
	
	self.resetProperties = function ()
		playerScores:completeAnimation()
		playerScores:setLeftRight( 0, 0, 6, 391 )
		playerScores:setTopBottom( 0, 0, 15, 133 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PlayerCount_4 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( 0, 0, 5.5, 391.5 )
				self.playerScores:setTopBottom( 0, 0, 12.5, 135.5 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_3 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( 0, 0, 5.5, 391.5 )
				self.playerScores:setTopBottom( 0, 0, 43.5, 166.5 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_2 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( 0, 0, 5.5, 391.5 )
				self.playerScores:setTopBottom( 0, 0, 74.5, 197.5 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_1 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( 0, 0, 5.5, 391.5 )
				self.playerScores:setTopBottom( 0, 0, 106.5, 229.5 )
				self.clipFinished( playerScores, {} )
			end
		}
	}
	playerScores.id = "playerScores"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playerScores:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

