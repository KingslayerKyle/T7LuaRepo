require( "ui.uieditor.widgets.Social.Social_LeaderIcon" )
require( "ui.uieditor.widgets.Social.Social_MemberGamerTag" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIcon" )
require( "ui.uieditor.widgets.Social.Social_ShaderContainer" )

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
	self:setLeftRight( 0, 0, 0, 438 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local SocialShaderContainer = CoD.Social_ShaderContainer.new( menu, controller )
	SocialShaderContainer:setLeftRight( 0, 0, 0, 411 )
	SocialShaderContainer:setTopBottom( 0, 0, 0, 39 )
	SocialShaderContainer:setRGB( 0.14, 0.24, 0.56 )
	SocialShaderContainer:setAlpha( 0.13 )
	self:addElement( SocialShaderContainer )
	self.SocialShaderContainer = SocialShaderContainer
	
	local SocialPartyMemberIcon0 = CoD.Social_PartyMemberIcon.new( menu, controller )
	SocialPartyMemberIcon0:setLeftRight( 0, 0, 412.5, 427.5 )
	SocialPartyMemberIcon0:setTopBottom( 0, 0, 0, 38 )
	self:addElement( SocialPartyMemberIcon0 )
	self.SocialPartyMemberIcon0 = SocialPartyMemberIcon0
	
	local SocialLeaderIcon0 = CoD.Social_LeaderIcon.new( menu, controller )
	SocialLeaderIcon0:setLeftRight( 0, 0, 411, 447 )
	SocialLeaderIcon0:setTopBottom( 0, 0, 1, 39 )
	self:addElement( SocialLeaderIcon0 )
	self.SocialLeaderIcon0 = SocialLeaderIcon0
	
	local SocialMemberGamerTag = CoD.Social_MemberGamerTag.new( menu, controller )
	SocialMemberGamerTag:setLeftRight( 0, 0, 14, 420 )
	SocialMemberGamerTag:setTopBottom( 0, 0, 2, 40 )
	SocialMemberGamerTag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SocialMemberGamerTag.gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SocialMemberGamerTag )
	self.SocialMemberGamerTag = SocialMemberGamerTag
	
	self.resetProperties = function ()
		SocialLeaderIcon0:completeAnimation()
		SocialPartyMemberIcon0:completeAnimation()
		SocialLeaderIcon0.Leader:setAlpha( 1 )
		SocialPartyMemberIcon0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SocialLeaderIcon0:completeAnimation()
				SocialLeaderIcon0.Leader:completeAnimation()
				self.SocialLeaderIcon0.Leader:setAlpha( 0 )
				self.clipFinished( SocialLeaderIcon0, {} )
			end
		},
		IsLeader = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SocialPartyMemberIcon0:completeAnimation()
				self.SocialPartyMemberIcon0:setAlpha( 0 )
				self.clipFinished( SocialPartyMemberIcon0, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SocialShaderContainer:close()
		self.SocialPartyMemberIcon0:close()
		self.SocialLeaderIcon0:close()
		self.SocialMemberGamerTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

