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
	self:setLeftRight( true, false, 0, 456 )
	self:setTopBottom( true, false, 0, 360 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterTeam1Information = CoD.CodCasterTeamIdentityInformation.new( menu, controller )
	CodCasterTeam1Information:setLeftRight( true, false, 0, 220 )
	CodCasterTeam1Information:setTopBottom( true, false, 0, 360 )
	CodCasterTeam1Information.TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM1_LOGO" ) )
	CodCasterTeam1Information.TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM1_NAME" ) )
	CodCasterTeam1Information.TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM1_COLOR" ) )
	CodCasterTeam1Information:subscribeToGlobalModel( controller, "TeamIdentity", "team1", function ( model )
		CodCasterTeam1Information:setModel( model, controller )
	end )
	self:addElement( CodCasterTeam1Information )
	self.CodCasterTeam1Information = CodCasterTeam1Information
	
	local CodCasterTeam2Information = CoD.CodCasterTeamIdentityInformation.new( menu, controller )
	CodCasterTeam2Information:setLeftRight( true, false, 235.5, 455.5 )
	CodCasterTeam2Information:setTopBottom( true, false, 0, 360 )
	CodCasterTeam2Information.TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM2_LOGO" ) )
	CodCasterTeam2Information.TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM2_NAME" ) )
	CodCasterTeam2Information.TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM2_COLOR" ) )
	CodCasterTeam2Information:subscribeToGlobalModel( controller, "TeamIdentity", "team2", function ( model )
		CodCasterTeam2Information:setModel( model, controller )
	end )
	self:addElement( CodCasterTeam2Information )
	self.CodCasterTeam2Information = CodCasterTeam2Information
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setLeftRight( true, false, 0, 220 )
				self.CodCasterTeam1Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam1Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setLeftRight( true, false, 235.5, 455.5 )
				self.CodCasterTeam2Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam2Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		},
		ShowBoth = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setLeftRight( true, false, 0, 220 )
				self.CodCasterTeam1Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam1Information:setAlpha( 1 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setLeftRight( true, false, 235.5, 455.5 )
				self.CodCasterTeam2Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam2Information:setAlpha( 1 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		},
		ShowTeam1Only = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setLeftRight( true, false, 0, 220 )
				self.CodCasterTeam1Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam1Information:setAlpha( 1 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setLeftRight( true, false, 235.5, 455.5 )
				self.CodCasterTeam2Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam2Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam2Information, {} )
			end
		},
		ShowTeam2Only = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterTeam1Information:completeAnimation()
				self.CodCasterTeam1Information:setLeftRight( true, false, 0, 220 )
				self.CodCasterTeam1Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam1Information:setAlpha( 0 )
				self.clipFinished( CodCasterTeam1Information, {} )
				CodCasterTeam2Information:completeAnimation()
				self.CodCasterTeam2Information:setLeftRight( true, false, 0, 220 )
				self.CodCasterTeam2Information:setTopBottom( true, false, 0, 360 )
				self.CodCasterTeam2Information:setAlpha( 1 )
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

