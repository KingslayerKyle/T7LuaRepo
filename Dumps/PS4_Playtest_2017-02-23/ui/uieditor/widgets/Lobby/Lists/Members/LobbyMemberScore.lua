CoD.LobbyMemberScore = InheritFrom( LUI.UIElement )
CoD.LobbyMemberScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberScore )
	self.id = "LobbyMemberScore"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 82 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local score = LUI.UIText.new()
	score:setLeftRight( 0, 0, 0, 82 )
	score:setTopBottom( 0, 0, 0, 38 )
	score:setText( Engine.Localize( "" ) )
	score:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( score )
	self.score = score
	
	self.resetProperties = function ()
		score:completeAnimation()
		score:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				score:completeAnimation()
				self.score:setAlpha( 0 )
				self.clipFinished( score, {} )
			end
		},
		Hidden2 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				score:completeAnimation()
				self.score:setAlpha( 0 )
				self.clipFinished( score, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGameLobby() then
					f6_local0 = not IsInTheaterMode()
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "Hidden2",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

