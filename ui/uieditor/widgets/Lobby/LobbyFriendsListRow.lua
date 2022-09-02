-- 59ea024539a6516ce8bd1a3be55cdc42
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.uie_Border" )

CoD.LobbyFriendsListRow = InheritFrom( LUI.UIElement )
CoD.LobbyFriendsListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.LobbyFriendsListRow )
	self.id = "LobbyFriendsListRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 616 )
	self:setTopBottom( true, false, 0, 31 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 616, 0 )
	background:setTopBottom( true, false, 0, 31 )
	background:setAlpha( 0.2 )
	background:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	self:addElement( background )
	self.background = background
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, false, 0, 319 )
	gamertag:setTopBottom( true, false, 0, 31 )
	gamertag:setTTF( "fonts/default.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local highlight = CoD.uie_Border.new( menu, controller )
	highlight:setLeftRight( true, false, 0, 616 )
	highlight:setTopBottom( true, false, 0, 31 )
	highlight:setRGB( 1, 0.33, 0 )
	highlight:setAlpha( 0 )
	self:addElement( highlight )
	self.highlight = highlight
	
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( true, true, 585, 1 )
	joinableIcon:setTopBottom( true, true, -0.5, 0.5 )
	joinableIcon:setImage( RegisterImage( "uie_menu_mp_party_ease_icon" ) )
	self:addElement( joinableIcon )
	self.joinableIcon = joinableIcon
	
	self.gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local _gamertag = Engine.GetModelValue( model )
		if _gamertag then
			gamertag:setText( Engine.Localize( _gamertag ) )
		end
	end )
	self.joinableIcon:linkToElementModel( self, "isJoinable", true, function ( model )
		local isJoinable = Engine.GetModelValue( model )
		if isJoinable then
			joinableIcon:setAlpha( isJoinable )
		end
	end )
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
				self:setupElementClipCounter( 1 )

				joinableIcon:completeAnimation()
				self.clipFinished( joinableIcon, {} )
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
				self:setupElementClipCounter( 1 )

				joinableIcon:completeAnimation()
				self.clipFinished( joinableIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.highlight:close()
		element.gamertag:close()
		element.joinableIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

