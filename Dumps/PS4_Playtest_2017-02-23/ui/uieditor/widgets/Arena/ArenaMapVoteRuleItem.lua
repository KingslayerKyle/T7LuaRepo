require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

CoD.ArenaMapVoteRuleItem = InheritFrom( LUI.UIElement )
CoD.ArenaMapVoteRuleItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArenaMapVoteRuleItem )
	self.id = "ArenaMapVoteRuleItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 454 )
	self:setTopBottom( 0, 0, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( 0, 1, 0, 0 )
	BlackBack:setTopBottom( 0, 1, 0, -2 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, 0, -2 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( 0, 0, 20, 454 )
	Text:setTopBottom( 0, 0, 4, 31 )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setLetterSpacing( 0.5 )
	Text:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( modelValue )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Carat = LUI.UIImage.new()
	Carat:setLeftRight( 0, 0, 3, 13 )
	Carat:setTopBottom( 0, 0, 14, 19 )
	Carat:setZRot( -90 )
	Carat:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( Carat )
	self.Carat = Carat
	
	self.resetProperties = function ()
		Text:completeAnimation()
		Carat:completeAnimation()
		BlackBack:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		Text:setAlpha( 1 )
		Carat:setAlpha( 1 )
		BlackBack:setAlpha( 0.2 )
		FEMemberBlurPanelContainer0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BlackBack:completeAnimation()
				self.BlackBack:setAlpha( 0 )
				self.clipFinished( BlackBack, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				Carat:completeAnimation()
				self.Carat:setAlpha( 0 )
				self.clipFinished( Carat, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsArenaMode() and IsGameLobby()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
		self.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

