CoD.PositionDraft_Character = InheritFrom( LUI.UIElement )
CoD.PositionDraft_Character.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	if IsInGame() then
		CoD.PlayerRoleUtility.SetPositionDraftSelectedCharacterIndex( controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_Character )
	self.id = "PositionDraft_Character"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 157 )
	self:setTopBottom( 0, 0, 0, 204 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 156 )
	Background:setTopBottom( 0, 0, 0, 204 )
	Background:setRGB( 0.16, 0.2, 0.2 )
	Background:setAlpha( 0.9 )
	Background:setZoom( 20 )
	Background:setScale( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local Background2 = LUI.UIImage.new()
	Background2:setLeftRight( 0, 0, 0, 156 )
	Background2:setTopBottom( 0, 0, 15, 20 )
	Background2:setRGB( 0.33, 0.95, 0.71 )
	Background2:setAlpha( 0.3 )
	Background2:setZoom( 20 )
	Background2:setScale( 0.85 )
	self:addElement( Background2 )
	self.Background2 = Background2
	
	local highlightbar = LUI.UIImage.new()
	highlightbar:setLeftRight( 0, 0, -24, 180 )
	highlightbar:setTopBottom( 0, 0, -27, 213 )
	highlightbar:setAlpha( 0 )
	highlightbar:setZoom( 20 )
	highlightbar:setScale( 0.95 )
	highlightbar:setImage( RegisterImage( "uie_menu_loadout_frame_highlightblue" ) )
	self:addElement( highlightbar )
	self.highlightbar = highlightbar
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0, 0, -24, 180 )
	highlight:setTopBottom( 0, 0, -27, 213 )
	highlight:setZoom( 20 )
	highlight:setScale( 0.85 )
	highlight:setImage( RegisterImage( "uie_menu_loadout_frame_highlight" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local Portrait = LUI.UIImage.new()
	Portrait:setLeftRight( 0, 0, 1, 154 )
	Portrait:setTopBottom( 0, 0, 9, 156 )
	Portrait:setZoom( 20 )
	Portrait:setScale( 0.85 )
	Portrait:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	Portrait:setShaderVector( 0, 0, 1, 0, 0 )
	Portrait:setShaderVector( 1, 0.3, 0.3, 0, 0 )
	Portrait:setShaderVector( 2, 0, 1, 0, 0 )
	Portrait:setShaderVector( 3, 0, 0.3, 0, 0 )
	Portrait:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Portrait:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Portrait )
	self.Portrait = Portrait
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( 0, 0, 2, 157 )
	Name:setTopBottom( 0, 0, 150, 180 )
	Name:setZoom( 20 )
	Name:setScale( 0.85 )
	Name:setTTF( "fonts/default.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local RecruitedText = LUI.UIText.new()
	RecruitedText:setLeftRight( 0, 0, 2, 157 )
	RecruitedText:setTopBottom( 0, 0, 65, 102 )
	RecruitedText:setAlpha( 0 )
	RecruitedText:setZoom( 20 )
	RecruitedText:setText( Engine.Localize( "MENU_RECRUITED" ) )
	RecruitedText:setTTF( "fonts/default.ttf" )
	RecruitedText:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	RecruitedText:setShaderVector( 0, 0, 0, 0, 0 )
	RecruitedText:setShaderVector( 1, 0, 0, 0, 0 )
	RecruitedText:setShaderVector( 2, 1, 0, 0, 0 )
	RecruitedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RecruitedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RecruitedText )
	self.RecruitedText = RecruitedText
	
	local Light = LUI.UIImage.new()
	Light:setLeftRight( 0, 0, 0, 156 )
	Light:setTopBottom( 0, 0, 7.5, 211.5 )
	Light:setRGB( 1, 1, 0.94 )
	Light:setAlpha( 0 )
	Light:setZoom( 20 )
	Light:setScale( 0.95 )
	self:addElement( Light )
	self.Light = Light
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, -91, 250 )
	Glow:setTopBottom( 0, 0, -82, 268 )
	Glow:setRGB( 1, 1, 0.94 )
	Glow:setAlpha( 0 )
	Glow:setZoom( 20 )
	Glow:setImage( RegisterImage( "uie_menu_loadout_frame_glow1" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.resetProperties = function ()
		Background2:completeAnimation()
		highlight:completeAnimation()
		Name:completeAnimation()
		Portrait:completeAnimation()
		Background:completeAnimation()
		RecruitedText:completeAnimation()
		Glow:completeAnimation()
		Light:completeAnimation()
		highlightbar:completeAnimation()
		Background2:setLeftRight( 0, 0, 0, 156 )
		Background2:setTopBottom( 0, 0, 15, 20 )
		Background2:setAlpha( 0.3 )
		Background2:setScale( 0.85 )
		highlight:setAlpha( 1 )
		highlight:setScale( 0.85 )
		Name:setLeftRight( 0, 0, 2, 157 )
		Name:setTopBottom( 0, 0, 150, 180 )
		Name:setAlpha( 1 )
		Name:setScale( 0.85 )
		Portrait:setRGB( 1, 1, 1 )
		Portrait:setAlpha( 1 )
		Portrait:setScale( 0.85 )
		Background:setRGB( 0.16, 0.2, 0.2 )
		Background:setAlpha( 0.9 )
		Background:setScale( 0.85 )
		RecruitedText:setLeftRight( 0, 0, 2, 157 )
		RecruitedText:setTopBottom( 0, 0, 65, 102 )
		RecruitedText:setRGB( 1, 1, 1 )
		RecruitedText:setAlpha( 0 )
		RecruitedText:setScale( 1 )
		Glow:setAlpha( 0 )
		Glow:setScale( 1 )
		Light:setLeftRight( 0, 0, 0, 156 )
		Light:setTopBottom( 0, 0, 7.5, 211.5 )
		Light:setRGB( 1, 1, 0.94 )
		Light:setAlpha( 0 )
		Light:setScale( 0.95 )
		highlightbar:setAlpha( 0 )
		highlightbar:setScale( 0.95 )
		highlightbar:setImage( RegisterImage( "uie_menu_loadout_frame_highlightblue" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0.07 )
				self.clipFinished( Background2, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setScale( 0.95 )
				self.clipFinished( Background2, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				self.clipFinished( RecruitedText, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Selected = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setScale( 0.9 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setScale( 0.9 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 0 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.9 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setAlpha( 0 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 0.6 )
					Background:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0.6 )
				self.Background:setScale( 0.85 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 15, 20 )
				self.Background2:setScale( 0.85 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					highlight:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setScale( 0.85 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.85 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 156, 186 )
					Name:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				RecruitedTextFrame2( RecruitedText, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 0.6 )
					Background:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0.6 )
				self.Background:setScale( 0.95 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 15, 20 )
					Background2:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setScale( 0.95 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 0 )
					highlight:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 150, 180 )
					Name:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				RecruitedTextFrame2( RecruitedText, {} )
			end,
			Down = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					highlight:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.85 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.85 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 156, 186 )
					Name:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				RecruitedTextFrame2( RecruitedText, {} )
				local LightFrame2 = function ( Light, event )
					if not event.interrupted then
						Light:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Light:setLeftRight( 0, 0, 0, 156 )
					Light:setTopBottom( 0, 0, 0.5, 204.5 )
					Light:setRGB( 1, 1, 0.94 )
					Light:setAlpha( 0.05 )
					Light:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Light, event )
					else
						Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setRGB( 1, 1, 0.94 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				LightFrame2( Light, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end,
			Up = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.95 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					highlight:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 150, 180 )
					Name:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				RecruitedTextFrame2( RecruitedText, {} )
				local LightFrame2 = function ( Light, event )
					if not event.interrupted then
						Light:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Light:setLeftRight( 0, 0, 0, 156 )
					Light:setTopBottom( 0, 0, 0.5, 204.5 )
					Light:setRGB( 1, 1, 0.94 )
					Light:setAlpha( 0 )
					Light:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Light, event )
					else
						Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setRGB( 1, 1, 0.94 )
				self.Light:setAlpha( 0.05 )
				self.Light:setScale( 0.95 )
				LightFrame2( Light, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					Glow:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.Glow:setScale( 1 )
				GlowFrame2( Glow, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setRGB( 0.21, 0.21, 0.21 )
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 0 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setRGB( 0.82, 0.82, 0.82 )
				self.Portrait:setAlpha( 0.2 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0.38 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setLeftRight( 0, 0, 2, 157 )
				self.RecruitedText:setTopBottom( 0, 0, 12, 49 )
				self.RecruitedText:setRGB( 1, 0.44, 0.32 )
				self.RecruitedText:setAlpha( 1 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setAlpha( 0 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setRGB( 0.21, 0.21, 0.21 )
				self.Background:setAlpha( 0.6 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setAlpha( 0 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 0 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setRGB( 0.82, 0.82, 0.82 )
				self.Portrait:setAlpha( 0.2 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 0.38 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setLeftRight( 0, 0, 2, 157 )
				self.RecruitedText:setTopBottom( 0, 0, 12, 49 )
				self.RecruitedText:setRGB( 1, 0.44, 0.32 )
				self.RecruitedText:setAlpha( 1 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, -0.5, 203.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		},
		FrontendSelected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 1 )
				self.highlightbar:setScale( 0.85 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setScale( 0.85 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setAlpha( 1 )
				self.Portrait:setScale( 0.85 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0.3 )
				self.Background2:setScale( 0.95 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 0 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				self.clipFinished( RecruitedText, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Selected = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				self.clipFinished( Background2, {} )
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 1 )
				self.highlightbar:setScale( 0.85 )
				self.clipFinished( highlightbar, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setScale( 0.85 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setAlpha( 1 )
				self.Portrait:setScale( 0.85 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.95 )
				Background2Frame2( Background2, {} )
				local highlightbarFrame2 = function ( highlightbar, event )
					if not event.interrupted then
						highlightbar:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlightbar:setAlpha( 1 )
					highlightbar:setScale( 0.85 )
					highlightbar:setImage( RegisterImage( "uie_menu_loadout_frame_highlightblue" ) )
					if event.interrupted then
						self.clipFinished( highlightbar, event )
					else
						highlightbar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 0 )
				self.highlightbar:setScale( 0.95 )
				self.highlightbar:setImage( RegisterImage( "uie_menu_loadout_frame_highlightblue" ) )
				highlightbarFrame2( highlightbar, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 0 )
					highlight:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Portrait:setAlpha( 1 )
					Portrait:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setAlpha( 1 )
				self.Portrait:setScale( 0.95 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 150, 180 )
					Name:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				RecruitedTextFrame2( RecruitedText, {} )
				local LightFrame2 = function ( Light, event )
					if not event.interrupted then
						Light:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Light:setLeftRight( 0, 0, 0, 156 )
					Light:setTopBottom( 0, 0, 0.5, 204.5 )
					Light:setAlpha( 0 )
					Light:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Light, event )
					else
						Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.95 )
				LightFrame2( Light, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				Background2Frame2( Background2, {} )
				local highlightbarFrame2 = function ( highlightbar, event )
					if not event.interrupted then
						highlightbar:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlightbar:setAlpha( 0 )
					highlightbar:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( highlightbar, event )
					else
						highlightbar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightbar:completeAnimation()
				self.highlightbar:setAlpha( 1 )
				self.highlightbar:setScale( 0.85 )
				highlightbarFrame2( highlightbar, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					highlight:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setScale( 0.85 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Portrait:setAlpha( 1 )
					Portrait:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setAlpha( 1 )
				self.Portrait:setScale( 0.85 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 156, 186 )
					Name:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				RecruitedTextFrame2( RecruitedText, {} )
				local LightFrame2 = function ( Light, event )
					if not event.interrupted then
						Light:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Light:setLeftRight( 0, 0, 0, 156 )
					Light:setTopBottom( 0, 0, 0.5, 204.5 )
					Light:setAlpha( 0 )
					Light:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Light, event )
					else
						Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				LightFrame2( Light, {} )
			end,
			Down = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setScale( 0.95 )
				self.clipFinished( Background2, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setRGB( 1, 1, 0.94 )
				self.Light:setAlpha( 0.05 )
				self.Light:setScale( 0.95 )
				self.clipFinished( Light, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.Glow:setScale( 1 )
				self.clipFinished( Glow, {} )
			end,
			Up = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setScale( 0.95 )
				self.clipFinished( Background2, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.95 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				self.clipFinished( RecruitedText, {} )
				local LightFrame2 = function ( Light, event )
					if not event.interrupted then
						Light:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Light:setLeftRight( 0, 0, 0, 156 )
					Light:setTopBottom( 0, 0, 0.5, 204.5 )
					Light:setRGB( 1, 1, 0.94 )
					Light:setAlpha( 0 )
					Light:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Light, event )
					else
						Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setRGB( 1, 1, 0.94 )
				self.Light:setAlpha( 0.05 )
				self.Light:setScale( 0.95 )
				LightFrame2( Light, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Glow:setAlpha( 0 )
							Glow:setScale( 2.2 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.05 )
							Glow:setScale( 1.66 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.25 )
						Glow:setScale( 1.3 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.2 )
				self.Glow:setScale( 1 )
				GlowFrame2( Glow, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				self.clipFinished( Background, {} )
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				self.clipFinished( Background2, {} )
				highlight:completeAnimation()
				self.highlight:setScale( 0.85 )
				self.clipFinished( highlight, {} )
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.85 )
				self.clipFinished( Portrait, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				self.clipFinished( Name, {} )
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				self.clipFinished( RecruitedText, {} )
				Light:completeAnimation()
				self.Light:setLeftRight( 0, 0, 0, 156 )
				self.Light:setTopBottom( 0, 0, 0.5, 204.5 )
				self.Light:setAlpha( 0 )
				self.Light:setScale( 0.85 )
				self.clipFinished( Light, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.85 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.85 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					highlight:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				self.highlight:setScale( 0.85 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.85 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 156, 186 )
					Name:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 150, 180 )
				self.Name:setScale( 0.85 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.85 )
				RecruitedTextFrame2( RecruitedText, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setScale( 0.95 )
				BackgroundFrame2( Background, {} )
				local Background2Frame2 = function ( Background2, event )
					if not event.interrupted then
						Background2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Background2:setLeftRight( 0, 0, 0, 156 )
					Background2:setTopBottom( 0, 0, 5, 10 )
					Background2:setAlpha( 0 )
					Background2:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Background2, event )
					else
						Background2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background2:completeAnimation()
				self.Background2:setLeftRight( 0, 0, 0, 156 )
				self.Background2:setTopBottom( 0, 0, 5, 10 )
				self.Background2:setAlpha( 0 )
				self.Background2:setScale( 0.95 )
				Background2Frame2( Background2, {} )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlight:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setScale( 0.95 )
				highlightFrame2( highlight, {} )
				local PortraitFrame2 = function ( Portrait, event )
					if not event.interrupted then
						Portrait:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Portrait:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Portrait, event )
					else
						Portrait:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Portrait:completeAnimation()
				self.Portrait:setScale( 0.95 )
				PortraitFrame2( Portrait, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Name:setLeftRight( 0, 0, 2, 157 )
					Name:setTopBottom( 0, 0, 150, 180 )
					Name:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 2, 157 )
				self.Name:setTopBottom( 0, 0, 156, 186 )
				self.Name:setScale( 0.95 )
				NameFrame2( Name, {} )
				local RecruitedTextFrame2 = function ( RecruitedText, event )
					if not event.interrupted then
						RecruitedText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					RecruitedText:setScale( 0.85 )
					if event.interrupted then
						self.clipFinished( RecruitedText, event )
					else
						RecruitedText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RecruitedText:completeAnimation()
				self.RecruitedText:setScale( 0.95 )
				RecruitedTextFrame2( RecruitedText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "disabled" )
			end
		},
		{
			stateName = "FrontendSelected",
			condition = function ( menu, element, event )
				return InFrontend() and IsControllerModelValueEqualToSelfModelValue( element, controller, "PositionEditLoadout.SelectedCharacterIndex", "characterIndex" )
			end
		},
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PositionEditLoadout.SelectedCharacterIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PositionEditLoadout.SelectedCharacterIndex"
		} )
	end )
	self:linkToElementModel( self, "characterIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "characterIndex"
		} )
	end )
	self:linkToElementModel( self, "disabled", true, function ( model )
		local element = self
		if IsParamModelEqualTo( model, true ) then
			SetProperty( self, "disabled", true )
		else
			SetProperty( self, "disabled", false )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Portrait:close()
		self.Name:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

