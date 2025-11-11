CoD.Pregame_ItemVote_VoteCount = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_VoteCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_ItemVote_VoteCount )
	self.id = "Pregame_ItemVote_VoteCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 286 )
	self:setTopBottom( 0, 0, 0, 151 )
	
	local VoteCount = LUI.UIText.new()
	VoteCount:setLeftRight( 0, 0, 0, 286 )
	VoteCount:setTopBottom( 0, 0, 0, 103 )
	VoteCount:setTTF( "fonts/escom.ttf" )
	VoteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VoteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	VoteCount:subscribeToGlobalModel( controller, "Pregame", "remainingVotes", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VoteCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( VoteCount )
	self.VoteCount = VoteCount
	
	local VoteTitle = LUI.UIText.new()
	VoteTitle:setLeftRight( 0, 0, 0, 286 )
	VoteTitle:setTopBottom( 0, 0, 104, 152 )
	VoteTitle:setText( Engine.Localize( "MENU_VOTES_CAPS" ) )
	VoteTitle:setTTF( "fonts/escom.ttf" )
	VoteTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VoteTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VoteTitle )
	self.VoteTitle = VoteTitle
	
	self.resetProperties = function ()
		VoteCount:completeAnimation()
		VoteTitle:completeAnimation()
		VoteCount:setAlpha( 1 )
		VoteTitle:setAlpha( 1 )
		VoteTitle:setText( Engine.Localize( "MENU_VOTES_CAPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				VoteCount:completeAnimation()
				self.VoteCount:setAlpha( 0 )
				self.clipFinished( VoteCount, {} )
				VoteTitle:completeAnimation()
				self.VoteTitle:setAlpha( 0 )
				self.clipFinished( VoteTitle, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		OneVoteVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				VoteTitle:completeAnimation()
				self.VoteTitle:setText( Engine.Localize( "MENU_VOTE_CAPS" ) )
				self.clipFinished( VoteTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "Pregame.remainingVotes", 1 )
			end
		},
		{
			stateName = "OneVoteVisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Pregame.remainingVotes", 1 ) and IsModelValueGreaterThan( controller, "Pregame.maxVotes", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame.remainingVotes" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Pregame.remainingVotes"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Pregame.maxVotes" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Pregame.maxVotes"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VoteCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

