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
	self:setLeftRight( 0, 0, 0, 924 )
	self:setTopBottom( 0, 0, 0, 46 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 924, 0 )
	background:setTopBottom( 0, 0, 0, 46 )
	background:setAlpha( 0.2 )
	background:setImage( RegisterImage( "mp_cac_grad_stretch" ) )
	self:addElement( background )
	self.background = background
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( 0, 0, 0, 478 )
	gamertag:setTopBottom( 0, 0, 0, 46 )
	gamertag:setText( Engine.Localize( "LobbyFriends->Gamertag" ) )
	gamertag:setTTF( "fonts/default.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local highlight = CoD.uie_Border.new( menu, controller )
	highlight:setLeftRight( 0, 0, 0, 924 )
	highlight:setTopBottom( 0, 0, 0, 46 )
	highlight:setRGB( 1, 0.33, 0 )
	highlight:setAlpha( 0 )
	self:addElement( highlight )
	self.highlight = highlight
	
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( 0, 1, 878, 2 )
	joinableIcon:setTopBottom( 0, 1, -1, 1 )
	joinableIcon:setImage( RegisterImage( "uie_menu_mp_party_ease_icon" ) )
	self:addElement( joinableIcon )
	self.joinableIcon = joinableIcon
	
	self.joinableIcon:linkToElementModel( self, "isJoinable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			joinableIcon:setAlpha( modelValue )
		end
	end )
	self.resetProperties = function ()
		highlight:completeAnimation()
		joinableIcon:completeAnimation()
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
				self:setupElementClipCounter( 1 )
				joinableIcon:completeAnimation()
				self.clipFinished( joinableIcon, {} )
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
				self:setupElementClipCounter( 1 )
				joinableIcon:completeAnimation()
				self.clipFinished( joinableIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.highlight:close()
		self.joinableIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

