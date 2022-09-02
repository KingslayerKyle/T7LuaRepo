-- 346d9af16dd8010ff2d96507f1cd69cb
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 303 )
	self:setTopBottom( true, false, 0, 151 )
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
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 58.09, 243.91 )
	Icon:setTopBottom( true, false, -27, 158.83 )
	Icon:setScale( 0.7 )
	Icon:setImage( RegisterImage( "uie_t7_icons_theater_film" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local GameModeNew = CoD.MapVoteLabelLower.new( menu, controller )
	GameModeNew:setLeftRight( true, false, 13, 200 )
	GameModeNew:setTopBottom( false, true, -26.5, -8.5 )
	GameModeNew.StartMenuIdentitySubtitleBG00:setAlpha( 0.42 )
	GameModeNew.SubTitle:setText( Engine.Localize( LocalizeToUpperString( "MENU_THEATER_LOAD_HINT" ) ) )
	GameModeNew.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameModeNew )
	self.GameModeNew = GameModeNew
	
	self.clipsPerState = {
		CPHidden = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
		element.GameModeNew:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

