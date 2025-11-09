require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.GroupsInputButton = InheritFrom( LUI.UIElement )
CoD.GroupsInputButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsInputButton )
	self.id = "GroupsInputButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.11, 0.14, 0.2 )
	Background:setAlpha( 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local SelectionIndicator = CoD.Border.new( menu, controller )
	SelectionIndicator:setLeftRight( true, true, 360, -360 )
	SelectionIndicator:setTopBottom( true, true, 0, 0 )
	SelectionIndicator:setRGB( 1, 0.41, 0 )
	SelectionIndicator:setAlpha( 0 )
	self:addElement( SelectionIndicator )
	self.SelectionIndicator = SelectionIndicator
	
	local DefaultText = LUI.UIText.new()
	DefaultText:setLeftRight( false, false, -180, 179.5 )
	DefaultText:setTopBottom( false, false, -13, 17 )
	DefaultText:setRGB( 0.56, 0.56, 0.56 )
	DefaultText:setText( Engine.Localize( "MENU_DEFAULT" ) )
	DefaultText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	DefaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DefaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DefaultText )
	self.DefaultText = DefaultText
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -180, 179.5 )
	Text:setTopBottom( false, false, -13, 17 )
	Text:setRGB( 1, 1, 1 )
	Text:setText( Engine.Localize( "MENU_NEW" ) )
	Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, false, 0, 385 )
	LobbyMemberBackingFooter0:setTopBottom( true, false, 34, 37 )
	LobbyMemberBackingFooter0:setRGB( 1, 1, 1 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Background:completeAnimation()
				self.Background:setRGB( 0.11, 0.14, 0.2 )
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				self.clipFinished( SelectionIndicator, {} )
				DefaultText:completeAnimation()
				self.DefaultText:setLeftRight( false, false, -180, 179.5 )
				self.DefaultText:setTopBottom( false, false, -13, 17 )
				self.DefaultText:setAlpha( 1 )
				self.DefaultText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
				self.clipFinished( DefaultText, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( false, false, -180, 179.5 )
				self.Text:setTopBottom( false, false, -13, 17 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				BackgroundFrame2( Background, {} )
				local SelectionIndicatorFrame2 = function ( SelectionIndicator, event )
					if not event.interrupted then
						SelectionIndicator:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SelectionIndicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SelectionIndicator, event )
					else
						SelectionIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				SelectionIndicatorFrame2( SelectionIndicator, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				BackgroundFrame2( Background, {} )
				local SelectionIndicatorFrame2 = function ( SelectionIndicator, event )
					if not event.interrupted then
						SelectionIndicator:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SelectionIndicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SelectionIndicator, event )
					else
						SelectionIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				SelectionIndicatorFrame2( SelectionIndicator, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				local BackgroundFrame2 = function ( Background, event )
					local BackgroundFrame3 = function ( Background, event )
						if not event.interrupted then
							Background:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						Background:setRGB( 0.14, 0.16, 0.2 )
						Background:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Background, event )
						else
							Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackgroundFrame3( Background, event )
						return 
					else
						Background:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Background:setAlpha( 0.75 )
						Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame3 )
					end
				end
				
				Background:completeAnimation()
				self.Background:setRGB( 0.14, 0.16, 0.2 )
				self.Background:setAlpha( 1 )
				BackgroundFrame2( Background, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				self.nextClip = "Focus"
			end
		}
	}
	self.close = function ( self )
		self.SelectionIndicator:close()
		self.LobbyMemberBackingFooter0:close()
		CoD.GroupsInputButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

