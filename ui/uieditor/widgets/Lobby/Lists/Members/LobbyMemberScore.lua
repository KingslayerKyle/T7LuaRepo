-- dec37797d4ce4b02a39ec6542ba9adef
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 55 )
	self:setTopBottom( true, false, 0, 25 )
	
	local score = LUI.UIText.new()
	score:setLeftRight( true, false, 0, 55 )
	score:setTopBottom( true, false, 0, 25 )
	score:setText( Engine.Localize( "" ) )
	score:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( score )
	self.score = score
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				score:completeAnimation()
				self.score:setAlpha( 1 )
				self.clipFinished( score, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				score:completeAnimation()
				self.score:setAlpha( 0 )
				self.clipFinished( score, {} )
			end
		},
		Hidden2 = {
			DefaultClip = function ()
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
				local f5_local0
				if not IsGameLobby() then
					f5_local0 = not IsInTheaterMode()
				else
					f5_local0 = false
				end
				return f5_local0
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
