require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVoteLabelLower" )

CoD.MapVoteNoDemoSelected = InheritFrom( LUI.UIElement )
CoD.MapVoteNoDemoSelected.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteNoDemoSelected )
	self.id = "MapVoteNoDemoSelected"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 454 )
	self:setTopBottom( 0, 0, 0, 226 )
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
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 87, 366 )
	Icon:setTopBottom( 0, 0, -41, 238 )
	Icon:setScale( 0.7 )
	Icon:setImage( RegisterImage( "theater_film" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( 0, 0, 20, 300 )
	GameModeNew:setTopBottom( 1, 1, -39.5, -12.5 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setText( LocalizeToUpperString( "MENU_THEATER_LOAD_HINT" ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	self.resetProperties = function ()
		Icon:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		BlackBack:completeAnimation()
		GameModeNew:completeAnimation()
		Icon:setAlpha( 1 )
		FEMemberBlurPanelContainer0:setAlpha( 1 )
		BlackBack:setAlpha( 0.2 )
		GameModeNew:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		CPHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BlackBack:completeAnimation()
				self.BlackBack:setAlpha( 0 )
				self.clipFinished( BlackBack, {} )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				GameModeNew:completeAnimation()
				self.GameModeNew:setAlpha( 0 )
				self.clipFinished( GameModeNew, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CPHidden",
			condition = function ( menu, element, event )
				return IsCPMapVoteHidden( controller )
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
		self.GameModeNew:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

