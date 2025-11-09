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
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local playerScores = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playerScores:makeFocusable()
	playerScores:setLeftRight( true, false, 4, 261 )
	playerScores:setTopBottom( true, false, 8, 90 )
	playerScores:setDataSource( "PlayerList" )
	playerScores:setWidgetType( CoD.PartyList_PlayerScore )
	playerScores:setVerticalCount( 4 )
	self:addElement( playerScores )
	self.playerScores = playerScores
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PlayerCount_4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 8, 90 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 29, 111 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 50, 132 )
				self.clipFinished( playerScores, {} )
			end
		},
		PlayerCount_1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 71, 153 )
				self.clipFinished( playerScores, {} )
			end
		}
	}
	playerScores.id = "playerScores"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.playerScores:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

