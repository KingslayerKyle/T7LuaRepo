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
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 101 )
	
	local VoteCount = LUI.UIText.new()
	VoteCount:setLeftRight( true, false, 0, 190.5 )
	VoteCount:setTopBottom( true, false, 0, 68.9 )
	VoteCount:setTTF( "fonts/escom.ttf" )
	VoteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VoteCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	VoteCount:subscribeToGlobalModel( controller, "Pregame", "remainingVotes", function ( model )
		local remainingVotes = Engine.GetModelValue( model )
		if remainingVotes then
			VoteCount:setText( Engine.Localize( remainingVotes ) )
		end
	end )
	self:addElement( VoteCount )
	self.VoteCount = VoteCount
	
	local VoteTitle = LUI.UIText.new()
	VoteTitle:setLeftRight( true, false, 0, 190.5 )
	VoteTitle:setTopBottom( true, false, 68.9, 101.21 )
	VoteTitle:setText( Engine.Localize( "MENU_VOTES_CAPS" ) )
	VoteTitle:setTTF( "fonts/escom.ttf" )
	VoteTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VoteTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VoteTitle )
	self.VoteTitle = VoteTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				VoteCount:completeAnimation()
				self.VoteCount:setAlpha( 1 )
				self.clipFinished( VoteCount, {} )
				VoteTitle:completeAnimation()
				self.VoteTitle:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VoteCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

