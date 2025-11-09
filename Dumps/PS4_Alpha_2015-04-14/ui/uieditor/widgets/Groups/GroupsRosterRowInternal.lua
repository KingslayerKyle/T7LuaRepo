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
	joinableIcon:setRGB( 1, 1, 1 )
	joinableIcon:setImage( RegisterImage( "uie_img_t7_menu_partyease_iconjoinable" ) )
	joinableIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	joinableIcon:linkToElementModel( self, "isJoinable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			joinableIcon:setAlpha( modelValue )
		end
	end )
	self:addElement( joinableIcon )
	self.joinableIcon = joinableIcon
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 2, 49 )
	emblem:setTopBottom( true, false, 2, 49 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local presence = LUI.UIText.new()
	presence:setLeftRight( true, true, 55.68, -8.32 )
	presence:setTopBottom( false, true, -22.5, -2.5 )
	presence:setRGB( 1, 1, 1 )
	presence:setAlpha( 0.5 )
	presence:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local rank = LUI.UIText.new()
	rank:setLeftRight( false, true, -66, -34 )
	rank:setTopBottom( true, false, 14, 39 )
	rank:setRGB( 1, 1, 1 )
	rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rank:linkToElementModel( self, "hasRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rank:setAlpha( modelValue )
		end
	end )
	rank:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rank )
	self.rank = rank
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( false, true, -32, -7 )
	rankIcon:setTopBottom( true, false, 13, 38 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	rankIcon:linkToElementModel( self, "hasRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setAlpha( modelValue )
		end
	end )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local GroupsRosterRowInternalName0 = CoD.GroupsRosterRowInternalName.new( menu, controller )
	GroupsRosterRowInternalName0:setLeftRight( true, false, 55.68, 456 )
	GroupsRosterRowInternalName0:setTopBottom( true, false, 7, 32 )
	GroupsRosterRowInternalName0:setRGB( 1, 1, 1 )
	GroupsRosterRowInternalName0:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsRosterRowInternalName0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupsRosterRowInternalName0:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsRosterRowInternalName0.gamertag:setText( Engine.Localize( modelValue ) )
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
	self.close = function ( self )
		self.GroupsRosterRowInternalName0:close()
		self.joinableIcon:close()
		self.emblem:close()
		self.presence:close()
		self.rank:close()
		self.rankIcon:close()
		CoD.GroupsRosterRowInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

