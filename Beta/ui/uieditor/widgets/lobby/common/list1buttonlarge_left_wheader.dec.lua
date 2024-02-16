require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBacking" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.List1ButtonLarge_Left_wHeader = InheritFrom( LUI.UIElement )
CoD.List1ButtonLarge_Left_wHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.List1ButtonLarge_Left_wHeader )
	self.id = "List1ButtonLarge_Left_wHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 356 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
	LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
	LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
	LobbyMemberBackingMask0:setAlpha( 0.4 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local LobbyMemberBacking0 = CoD.LobbyMemberBacking.new( menu, controller )
	LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
	LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
	self:addElement( LobbyMemberBacking0 )
	self.LobbyMemberBacking0 = LobbyMemberBacking0
	
	local LfocusLINE = LUI.UIImage.new()
	LfocusLINE:setLeftRight( false, true, -3, 2.34 )
	LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
	LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
	LfocusLINE:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_list1l_focusline" ) )
	LfocusLINE:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( LfocusLINE )
	self.LfocusLINE = LfocusLINE
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 8.82, 359 )
	Text:setTopBottom( false, false, -7.77, 11.23 )
	Text:setRGB( 0.81, 0.83, 0.76 )
	Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
	LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( false, true, -26.18, -10.18 )
	SelectedIcon:setTopBottom( false, false, -8.09, 7.92 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
				self.LobbyMemberBackingMask0:setAlpha( 0.4 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, -3, 2.34 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 0 )
				self.clipFinished( LfocusLINE, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 8.82, 361.67 )
				self.Text:setTopBottom( false, false, -7.77, 11.23 )
				self.Text:setRGB( 0.81, 0.83, 0.76 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 0 )
				self.Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 1.67 )
					LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
					LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
					LobbyMemberBackingMask0:setAlpha( 1 )
					LobbyMemberBackingMask0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
				self.LobbyMemberBackingMask0:setAlpha( 0.4 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setLeftRight( true, true, -2.33, 1.67 )
					LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
					LobbyMemberBacking0:setAlpha( 1 )
					LobbyMemberBacking0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LfocusLINEFrame2 = function ( LfocusLINE, event )
					if not event.interrupted then
						LfocusLINE:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
					LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
					LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
					LfocusLINE:setAlpha( 1 )
					LfocusLINE:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LfocusLINE, event )
					else
						LfocusLINE:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, -3, 2.34 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 0 )
				LfocusLINEFrame2( LfocusLINE, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					Text:setRGB( 1, 1, 1 )
					Text:setAlpha( 1 )
					Text:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setRGB( 0.81, 0.83, 0.76 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 0 )
				TextFrame2( Text, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
					LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 60 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -2.33, 1.67 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBacking0:setZoom( 60 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 60 )
				self.clipFinished( LfocusLINE, {} )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 60 )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 60 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
					LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
					LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
					LobbyMemberBackingMask0:setAlpha( 0.4 )
					LobbyMemberBackingMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 60 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
					LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
					LobbyMemberBacking0:setAlpha( 1 )
					LobbyMemberBacking0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 60 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LfocusLINEFrame2 = function ( LfocusLINE, event )
					if not event.interrupted then
						LfocusLINE:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LfocusLINE:setLeftRight( false, true, -3, 2.34 )
					LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
					LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
					LfocusLINE:setAlpha( 1 )
					LfocusLINE:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LfocusLINE, event )
					else
						LfocusLINE:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 60 )
				LfocusLINEFrame2( LfocusLINE, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					Text:setRGB( 0.81, 0.83, 0.76 )
					Text:setAlpha( 1 )
					Text:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 60 )
				TextFrame2( Text, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
					LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 60 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end
		},
		WithSelectedIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
				self.LobbyMemberBackingMask0:setAlpha( 0.4 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, -3, 2.34 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 0 )
				self.clipFinished( LfocusLINE, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 8.82, 359 )
				self.Text:setTopBottom( false, false, -7.77, 11.23 )
				self.Text:setRGB( 0.81, 0.83, 0.76 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 0 )
				self.Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 1 )
				self.SelectedIcon:setZoom( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 1.67 )
					LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
					LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
					LobbyMemberBackingMask0:setAlpha( 1 )
					LobbyMemberBackingMask0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
				self.LobbyMemberBackingMask0:setAlpha( 0.4 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setLeftRight( true, true, -2.33, 1.67 )
					LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
					LobbyMemberBacking0:setAlpha( 1 )
					LobbyMemberBacking0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LfocusLINEFrame2 = function ( LfocusLINE, event )
					if not event.interrupted then
						LfocusLINE:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
					LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
					LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
					LfocusLINE:setAlpha( 1 )
					LfocusLINE:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LfocusLINE, event )
					else
						LfocusLINE:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, -3, 2.34 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 0 )
				LfocusLINEFrame2( LfocusLINE, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					Text:setRGB( 1, 1, 1 )
					Text:setAlpha( 1 )
					Text:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setRGB( 0.81, 0.83, 0.76 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 0 )
				TextFrame2( Text, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
					LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local SelectedIconFrame2 = function ( SelectedIcon, event )
					if not event.interrupted then
						SelectedIcon:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					SelectedIcon:setZoom( 60 )
					if event.interrupted then
						self.clipFinished( SelectedIcon, event )
					else
						SelectedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setZoom( 0 )
				SelectedIconFrame2( SelectedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 60 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -2.33, 1.67 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBacking0:setZoom( 60 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 60 )
				self.clipFinished( LfocusLINE, {} )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 60 )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 60 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setZoom( 60 )
				self.clipFinished( SelectedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setLeftRight( true, true, -0.33, -0.33 )
					LobbyMemberBackingMask0:setTopBottom( false, false, -14.17, 14 )
					LobbyMemberBackingMask0:setRGB( 0.11, 0.14, 0.18 )
					LobbyMemberBackingMask0:setAlpha( 0.4 )
					LobbyMemberBackingMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBackingMask0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBackingMask0:setRGB( 0.16, 0.22, 0.27 )
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 60 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setLeftRight( true, true, -0.33, -0.33 )
					LobbyMemberBacking0:setTopBottom( false, false, -14.17, 14 )
					LobbyMemberBacking0:setAlpha( 1 )
					LobbyMemberBacking0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setLeftRight( true, true, -2.33, 0.67 )
				self.LobbyMemberBacking0:setTopBottom( false, false, -16.17, 16 )
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 60 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LfocusLINEFrame2 = function ( LfocusLINE, event )
					if not event.interrupted then
						LfocusLINE:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LfocusLINE:setLeftRight( false, true, -3, 2.34 )
					LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
					LfocusLINE:setRGB( 0.33, 0.33, 0.33 )
					LfocusLINE:setAlpha( 1 )
					LfocusLINE:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LfocusLINE, event )
					else
						LfocusLINE:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setLeftRight( false, true, 8.01, 13.35 )
				self.LfocusLINE:setTopBottom( false, false, -11.67, 12.33 )
				self.LfocusLINE:setRGB( 0.86, 0.58, 0.22 )
				self.LfocusLINE:setAlpha( 1 )
				self.LfocusLINE:setZoom( 60 )
				LfocusLINEFrame2( LfocusLINE, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					Text:setRGB( 0.81, 0.83, 0.76 )
					Text:setAlpha( 1 )
					Text:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 60 )
				TextFrame2( Text, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setLeftRight( true, true, -2.5, 2 )
					LobbyMemberBackingFooter0:setTopBottom( false, false, 11, 14 )
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( true, true, -4.5, 4 )
				self.LobbyMemberBackingFooter0:setTopBottom( false, false, 14, 17 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 60 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local SelectedIconFrame2 = function ( SelectedIcon, event )
					if not event.interrupted then
						SelectedIcon:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
					end
					SelectedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( SelectedIcon, event )
					else
						SelectedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setZoom( 60 )
				SelectedIconFrame2( SelectedIcon, {} )
			end
		},
		Header = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LfocusLINE:completeAnimation()
				self.LfocusLINE:setAlpha( 0 )
				self.clipFinished( LfocusLINE, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 0, 350.18 )
				self.Text:setTopBottom( false, false, -9.23, 14 )
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.Text:setTTF( "fonts/UnitedSansRgMd.ttf" )
				self.clipFinished( Text, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithSelectedIcon",
			condition = function ( menu, element, event )
				return DoesGroupListHaveSelectedIcon( element )
			end
		},
		{
			stateName = "Header",
			condition = function ( menu, element, event )
				return IsGroupListHeader( element )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask0:close()
		self.LobbyMemberBacking0:close()
		self.LobbyMemberBackingFooter0:close()
		self.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

