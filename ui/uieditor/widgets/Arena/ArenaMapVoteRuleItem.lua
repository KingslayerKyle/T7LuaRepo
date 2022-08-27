-- 8717fbff8e0256fd3d43d709bb3ab7db
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 303 )
	self:setTopBottom( true, false, 0, 23 )
	self.anyChildUsesUpdateState = true
	
	local BlackBack = LUI.UIImage.new()
	BlackBack:setLeftRight( true, true, 0, 0 )
	BlackBack:setTopBottom( true, true, 0, -1.5 )
	BlackBack:setRGB( 0, 0, 0 )
	BlackBack:setAlpha( 0.2 )
	self:addElement( BlackBack )
	self.BlackBack = BlackBack
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, true, 0, -1 )
	FEMemberBlurPanelContainer0:setTopBottom( true, true, 0, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 13.5, 303 )
	Text:setTopBottom( true, false, 3, 21 )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setLetterSpacing( 0.5 )
	Text:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			Text:setText( text )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Carat = LUI.UIImage.new()
	Carat:setLeftRight( true, false, 2, 9 )
	Carat:setTopBottom( true, false, 9.5, 13 )
	Carat:setZRot( -90 )
	Carat:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( Carat )
	self.Carat = Carat
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				BlackBack:completeAnimation()
				self.BlackBack:setAlpha( 0.2 )
				self.clipFinished( BlackBack, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				Carat:completeAnimation()
				self.Carat:setAlpha( 1 )
				self.clipFinished( Carat, {} )
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
	if self.m_eventHandlers["<modelChangeGLobal>lobbyRoot.lobbyNav"] then
		local f1_local5 = self.m_eventHandlers["<modelChangeGLobal>lobbyRoot.lobbyNav"]
		self:registerEventHandler( "<modelChangeGLobal>lobbyRoot.lobbyNav", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local5( element, event )
		end )
	else
		self:registerEventHandler( "<modelChangeGLobal>lobbyRoot.lobbyNav", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
		element.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

