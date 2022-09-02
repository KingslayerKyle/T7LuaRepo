-- 56ec5a1d2b9d60e562bb07f34bb0074d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.Social_ShaderContainer" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIcon" )
require( "ui.uieditor.widgets.Social.Social_LeaderIcon" )
require( "ui.uieditor.widgets.Social.Social_MemberGamerTag" )

CoD.Social_PartyList = InheritFrom( LUI.UIElement )
CoD.Social_PartyList.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyList )
	self.id = "Social_PartyList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 26 )
	self.anyChildUsesUpdateState = true
	
	local SocialShaderContainer = CoD.Social_ShaderContainer.new( menu, controller )
	SocialShaderContainer:setLeftRight( true, true, 0, -18 )
	SocialShaderContainer:setTopBottom( true, false, 0, 26 )
	SocialShaderContainer:setRGB( 0.14, 0.24, 0.56 )
	SocialShaderContainer:setAlpha( 0.13 )
	self:addElement( SocialShaderContainer )
	self.SocialShaderContainer = SocialShaderContainer
	
	local SocialPartyMemberIcon0 = CoD.Social_PartyMemberIcon.new( menu, controller )
	SocialPartyMemberIcon0:setLeftRight( true, false, 272, 282 )
	SocialPartyMemberIcon0:setTopBottom( true, false, 0, 25 )
	self:addElement( SocialPartyMemberIcon0 )
	self.SocialPartyMemberIcon0 = SocialPartyMemberIcon0
	
	local SocialLeaderIcon0 = CoD.Social_LeaderIcon.new( menu, controller )
	SocialLeaderIcon0:setLeftRight( true, false, 282, 306 )
	SocialLeaderIcon0:setTopBottom( true, false, 1, 26 )
	self:addElement( SocialLeaderIcon0 )
	self.SocialLeaderIcon0 = SocialLeaderIcon0
	
	local SocialMemberGamerTag = CoD.Social_MemberGamerTag.new( menu, controller )
	SocialMemberGamerTag:setLeftRight( true, false, 9, 280 )
	SocialMemberGamerTag:setTopBottom( true, false, 1, 26.5 )
	SocialMemberGamerTag:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			SocialMemberGamerTag.gamertag:setText( gamertag )
		end
	end )
	self:addElement( SocialMemberGamerTag )
	self.SocialMemberGamerTag = SocialMemberGamerTag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SocialPartyMemberIcon0:completeAnimation()
				self.SocialPartyMemberIcon0:setAlpha( 1 )
				self.clipFinished( SocialPartyMemberIcon0, {} )

				SocialLeaderIcon0:completeAnimation()

				SocialLeaderIcon0.Leader:completeAnimation()
				self.SocialLeaderIcon0.Leader:setAlpha( 0 )
				self.clipFinished( SocialLeaderIcon0, {} )
			end
		},
		IsLeader = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SocialPartyMemberIcon0:completeAnimation()
				self.SocialPartyMemberIcon0:setAlpha( 0 )
				self.clipFinished( SocialPartyMemberIcon0, {} )

				SocialLeaderIcon0:completeAnimation()

				SocialLeaderIcon0.Leader:completeAnimation()
				self.SocialLeaderIcon0.Leader:setAlpha( 1 )
				self.clipFinished( SocialLeaderIcon0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "IsLeader",
			condition = function ( menu, element, event )
				return IsSocialPartyLeader( self, controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SocialShaderContainer:close()
		element.SocialPartyMemberIcon0:close()
		element.SocialLeaderIcon0:close()
		element.SocialMemberGamerTag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

