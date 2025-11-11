require( "ui.uieditor.widgets.CodCaster.CodCasterTeamIdentityInformation" )

CoD.CodCasterTeamIdentityInformationPanel = InheritFrom( LUI.UIElement )
CoD.CodCasterTeamIdentityInformationPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterTeamIdentityInformationPanel )
	self.id = "CodCasterTeamIdentityInformationPanel"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 684 )
	self:setTopBottom( 0, 0, 0, 540 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterTeam1Information = CoD.CodCasterTeamIdentityInformation.new( menu, controller )
	CodCasterTeam1Information:setLeftRight( 0, 0, 0, 684 )
	CodCasterTeam1Information:setTopBottom( 0, 0, -1, 269 )
	CodCasterTeam1Information.TeamLogoTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_LOGO" ) )
	CodCasterTeam1Information.TeamNameTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_NAME" ) )
	CodCasterTeam1Information.TeamColorTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_COLOR" ) )
	CodCasterTeam1Information:subscribeToGlobalModel( controller, "TeamIdentity", "team1", function ( model )
		CodCasterTeam1Information:setModel( model, controller )
	end )
	self:addElement( CodCasterTeam1Information )
	self.CodCasterTeam1Information = CodCasterTeam1Information
	
	local CodCasterTeam2Information = CoD.CodCasterTeamIdentityInformation.new( menu, controller )
	CodCasterTeam2Information:setLeftRight( 0, 0, 0, 684 )
	CodCasterTeam2Information:setTopBottom( 0, 0, 282, 560 )
	CodCasterTeam2Information.TeamLogoTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM2_LOGO" ) )
	CodCasterTeam2Information.TeamNameTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM2_NAME" ) )
	CodCasterTeam2Information.TeamColorTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM2_COLOR" ) )
	CodCasterTeam2Information:subscribeToGlobalModel( controller, "TeamIdentity", "team2", function ( model )
		CodCasterTeam2Information:setModel( model, controller )
	end )
	self:addElement( CodCasterTeam2Information )
	self.CodCasterTeam2Information = CodCasterTeam2Information
	
	self.resetProperties = function ()
		CodCasterTeam1Information:completeAnimation()
		CodCasterTeam2Information:completeAnimation()
		CodCasterTeam1Information:setAlpha( 1 )
		CodCasterTeam2Information:setLeftRight( 0, 0, 0, 684 )
		CodCasterTeam2Information:setTopBottom( 0, 0, 282, 560 )
		CodCasterTeam2Information:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		},
		ShowBoth = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowTeam1Only = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		},
		ShowTeam2Only = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setLeftRight( 0, 0, 0, 684 )
				self.CodCasterTeam2Information:setTopBottom( 0, 0, -1, 269 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CodCasterTeam1Information:close()
		self.CodCasterTeam2Information:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

