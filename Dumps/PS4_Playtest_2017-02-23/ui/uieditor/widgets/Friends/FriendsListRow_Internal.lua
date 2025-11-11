require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyRank" )
require( "ui.uieditor.widgets.uie_Border" )

CoD.FriendsListRow_Internal = InheritFrom( LUI.UIElement )
CoD.FriendsListRow_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FriendsListRow_Internal )
	self.id = "FriendsListRow_Internal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 96 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 750, 0 )
	background:setTopBottom( 0, 0, 0, 96 )
	background:setAlpha( 0.2 )
	background:setImage( RegisterImage( "mp_cac_grad_stretch" ) )
	self:addElement( background )
	self.background = background
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( 0, 1, 170, -42 )
	gamertag:setTopBottom( 0, 0, 6, 43 )
	gamertag:setText( Engine.Localize( "LobbyFriends->Gamertag" ) )
	gamertag:setTTF( "fonts/default.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local highlight = CoD.uie_Border.new( menu, controller )
	highlight:setLeftRight( 0, 0, 0, 750 )
	highlight:setTopBottom( 0, 0, 0, 95 )
	highlight:setRGB( 1, 0.33, 0 )
	highlight:setAlpha( 0 )
	self:addElement( highlight )
	self.highlight = highlight
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 96 )
	emblem:setTopBottom( 0, 0, 0, 96 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local presence = LUI.UIText.new()
	presence:setLeftRight( 0, 1, 96, 0 )
	presence:setTopBottom( 1, 1, -44, -6 )
	presence:setTTF( "fonts/default.ttf" )
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
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
	IconJoinable:setLeftRight( 1, 1, -42, -6 )
	IconJoinable:setTopBottom( 0, 0, 6, 42 )
	IconJoinable:linkToElementModel( self, "isJoinable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IconJoinable:setAlpha( modelValue )
		end
	end )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local rank = CoD.LobbyRank.new( menu, controller )
	rank:setLeftRight( 0, 0, 96.5, 171.5 )
	rank:setTopBottom( 0, 0, 6, 43 )
	self:addElement( rank )
	self.rank = rank
	
	self.resetProperties = function ()
		highlight:completeAnimation()
		highlight:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						if not event.interrupted then
							highlight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						highlight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( highlight, event )
						else
							highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						highlight:setAlpha( 1 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				highlightFrame2( highlight, {} )
				self.nextClip = "Focus"
			end,
			hideJoinableIcon = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				highlightFrame2( highlight, {} )
			end
		},
		hideJoinableIcon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.highlight:close()
		self.IconJoinable:close()
		self.rank:close()
		self.presence:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

