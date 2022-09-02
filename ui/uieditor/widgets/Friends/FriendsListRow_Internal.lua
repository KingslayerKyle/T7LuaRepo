-- 00b475d16c35821ac9f18dd88f751aa5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.uie_Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.IconJoinable" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyRank" )

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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 500, 0 )
	background:setTopBottom( true, false, 0, 64 )
	background:setAlpha( 0.2 )
	background:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	self:addElement( background )
	self.background = background
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, true, 114, -28 )
	gamertag:setTopBottom( true, false, 4, 29 )
	gamertag:setTTF( "fonts/default.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local _gamertag = Engine.GetModelValue( model )
		if _gamertag then
			gamertag:setText( _gamertag )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local highlight = CoD.uie_Border.new( menu, controller )
	highlight:setLeftRight( true, false, 0, 500 )
	highlight:setTopBottom( true, false, 0, 63.5 )
	highlight:setRGB( 1, 0.33, 0 )
	highlight:setAlpha( 0 )
	self:addElement( highlight )
	self.highlight = highlight
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 64 )
	emblem:setTopBottom( true, false, 0, 64 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local presence = LUI.UIText.new()
	presence:setLeftRight( true, true, 64, 0 )
	presence:setTopBottom( false, true, -29, -4 )
	presence:setTTF( "fonts/default.ttf" )
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
	
	local IconJoinable = CoD.IconJoinable.new( menu, controller )
	IconJoinable:setLeftRight( false, true, -28, -4 )
	IconJoinable:setTopBottom( true, false, 4, 28 )
	IconJoinable:linkToElementModel( self, "isJoinable", true, function ( model )
		local isJoinable = Engine.GetModelValue( model )
		if isJoinable then
			IconJoinable:setAlpha( isJoinable )
		end
	end )
	self:addElement( IconJoinable )
	self.IconJoinable = IconJoinable
	
	local rank = CoD.LobbyRank.new( menu, controller )
	rank:setLeftRight( true, false, 64, 114 )
	rank:setTopBottom( true, false, 4, 29 )
	self:addElement( rank )
	self.rank = rank
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
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
				self:setupElementClipCounter( 0 )

			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )

				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end,
			GainFocus = function ()
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
				self:setupElementClipCounter( 0 )

			end,
			hide = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.highlight:close()
		element.IconJoinable:close()
		element.rank:close()
		element.gamertag:close()
		element.emblem:close()
		element.presence:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

