require( "ui.uieditor.widgets.Groups.GroupsRosterRowInternalName" )

CoD.GroupsRosterRowInternal = InheritFrom( LUI.UIElement )
CoD.GroupsRosterRowInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsRosterRowInternal )
	self.id = "GroupsRosterRowInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( false, true, -88, -64 )
	joinableIcon:setTopBottom( true, false, 12, 36 )
	joinableIcon:setImage( RegisterImage( "uie_img_t7_menu_partyease_iconjoinable" ) )
	joinableIcon:linkToElementModel( self, "isJoinable", true, function ( model )
		local isJoinable = Engine.GetModelValue( model )
		if isJoinable then
			joinableIcon:setAlpha( isJoinable )
		end
	end )
	self:addElement( joinableIcon )
	self.joinableIcon = joinableIcon
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 2, 49 )
	emblem:setTopBottom( true, false, 2, 49 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local presence = LUI.UIText.new()
	presence:setLeftRight( true, true, 55.68, -8.32 )
	presence:setTopBottom( false, true, -22.5, -2.5 )
	presence:setAlpha( 0.5 )
	presence:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local _presence = Engine.GetModelValue( model )
		if _presence then
			presence:setText( Engine.Localize( _presence ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local rank = LUI.UIText.new()
	rank:setLeftRight( false, true, -66, -34 )
	rank:setTopBottom( true, false, 14, 39 )
	rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rank:linkToElementModel( self, "hasRank", true, function ( model )
		local hasRank = Engine.GetModelValue( model )
		if hasRank then
			rank:setAlpha( hasRank )
		end
	end )
	rank:linkToElementModel( self, "rank", true, function ( model )
		local _rank = Engine.GetModelValue( model )
		if _rank then
			rank:setText( Engine.Localize( _rank ) )
		end
	end )
	self:addElement( rank )
	self.rank = rank
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( false, true, -32, -7 )
	rankIcon:setTopBottom( true, false, 13, 38 )
	rankIcon:linkToElementModel( self, "hasRank", true, function ( model )
		local hasRank = Engine.GetModelValue( model )
		if hasRank then
			rankIcon:setAlpha( hasRank )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon:setImage( RegisterImage( _rankIcon ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local GroupsRosterRowInternalName0 = CoD.GroupsRosterRowInternalName.new( menu, controller )
	GroupsRosterRowInternalName0:setLeftRight( true, false, 55.68, 456 )
	GroupsRosterRowInternalName0:setTopBottom( true, false, 7, 32 )
	GroupsRosterRowInternalName0:linkToElementModel( self, "clanTag", true, function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			GroupsRosterRowInternalName0.Label0:setText( Engine.Localize( clanTag ) )
		end
	end )
	GroupsRosterRowInternalName0:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			GroupsRosterRowInternalName0.gamertag:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( GroupsRosterRowInternalName0 )
	self.GroupsRosterRowInternalName0 = GroupsRosterRowInternalName0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				joinableIcon:completeAnimation()
				self.joinableIcon:setLeftRight( false, true, -88, -64 )
				self.joinableIcon:setTopBottom( true, false, 5, 29 )
				self.clipFinished( joinableIcon, {} )
				rank:completeAnimation()
				self.rank:setLeftRight( false, true, -66, -34 )
				self.rank:setTopBottom( true, false, 7, 32 )
				self.clipFinished( rank, {} )
				rankIcon:completeAnimation()
				self.rankIcon:setLeftRight( false, true, -32, -7 )
				self.rankIcon:setTopBottom( true, false, 6, 31 )
				self.clipFinished( rankIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		hideJoinableIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			hide = function ()
				self:setupElementClipCounter( 1 )
				joinableIcon:completeAnimation()
				self.clipFinished( joinableIcon, {} )
			end
		}
	}
	GroupsRosterRowInternalName0.id = "GroupsRosterRowInternalName0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsRosterRowInternalName0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsRosterRowInternalName0:close()
		element.joinableIcon:close()
		element.emblem:close()
		element.presence:close()
		element.rank:close()
		element.rankIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

