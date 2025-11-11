require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBacking" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )

CoD.LeaderboardRow = InheritFrom( LUI.UIElement )
CoD.LeaderboardRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardRow )
	self.id = "LeaderboardRow"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 1170 )
	self:setTopBottom( 0, 0, 0, 36 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 0, 0 )
	BlackBox:setTopBottom( 0, 1, 2, -2 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.35 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( 0, 1, 0, 0 )
	LobbyMemberBackingMask0:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local LobbyMemberBacking0 = CoD.LobbyMemberBacking.new( menu, controller )
	LobbyMemberBacking0:setLeftRight( 0, 1, 0, 0 )
	LobbyMemberBacking0:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBacking0:setAlpha( 0 )
	self:addElement( LobbyMemberBacking0 )
	self.LobbyMemberBacking0 = LobbyMemberBacking0
	
	local Position = LUI.UIText.new()
	Position:setLeftRight( 0, 0, 9, 131 )
	Position:setTopBottom( 0, 0, 8, 32 )
	Position:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Position:linkToElementModel( self, "rowColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Position:setRGB( modelValue )
		end
	end )
	Position:linkToElementModel( self, "positionUI", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Position:setText( Engine.Localize( modelValue ) )
		end
	end )
	Position:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 116, 168 )
	Rank:setTopBottom( 0, 0, 8, 32 )
	Rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	Rank:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( 0, 0, 168, 198 )
	RankIcon:setTopBottom( 0, 0, 4, 34 )
	RankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( 0, 0, 207, 462 )
	Name:setTopBottom( 0, 0, 8, 32 )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "rowColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setRGB( modelValue )
		end
	end )
	Name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	Name:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Column0 = LUI.UIText.new()
	Column0:setLeftRight( 0, 0, 462, 602 )
	Column0:setTopBottom( 0, 0, 8, 32 )
	Column0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column0:linkToElementModel( self, "column0color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column0:setRGB( modelValue )
		end
	end )
	Column0:linkToElementModel( self, "column0", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = LUI.UIText.new()
	Column1:setLeftRight( 0, 0, 602, 742 )
	Column1:setTopBottom( 0, 0, 8, 32 )
	Column1:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column1:linkToElementModel( self, "column1color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column1:setRGB( modelValue )
		end
	end )
	Column1:linkToElementModel( self, "column1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = LUI.UIText.new()
	Column2:setLeftRight( 0, 0, 743, 883 )
	Column2:setTopBottom( 0, 0, 8, 32 )
	Column2:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column2:linkToElementModel( self, "column2color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column2:setRGB( modelValue )
		end
	end )
	Column2:linkToElementModel( self, "column2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = LUI.UIText.new()
	Column3:setLeftRight( 0, 0, 883, 1023 )
	Column3:setTopBottom( 0, 0, 8, 32 )
	Column3:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column3:linkToElementModel( self, "column3color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column3:setRGB( modelValue )
		end
	end )
	Column3:linkToElementModel( self, "column3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column3:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = LUI.UIText.new()
	Column4:setLeftRight( 0, 0, 1023, 1163 )
	Column4:setTopBottom( 0, 0, 8, 32 )
	Column4:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column4:linkToElementModel( self, "column4color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column4:setRGB( modelValue )
		end
	end )
	Column4:linkToElementModel( self, "column4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Column4:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, -2 )
	LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 15, 19 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	local LobbyMemberBackingFooter00 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter00:setLeftRight( 0, 1, 2, -2 )
	LobbyMemberBackingFooter00:setTopBottom( 0.5, 0.5, -21, -16 )
	LobbyMemberBackingFooter00:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter00 )
	self.LobbyMemberBackingFooter00 = LobbyMemberBackingFooter00
	
	self.Rank:linkToElementModel( self, "rankColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setRGB( modelValue )
		end
	end )
	self.resetProperties = function ()
		LobbyMemberBacking0:completeAnimation()
		LobbyMemberBackingMask0:completeAnimation()
		LobbyMemberBackingFooter0:completeAnimation()
		LobbyMemberBackingFooter00:completeAnimation()
		Name:completeAnimation()
		RankIcon:completeAnimation()
		Rank:completeAnimation()
		LobbyMemberBacking0:setAlpha( 0 )
		LobbyMemberBackingMask0:setAlpha( 0 )
		LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, -2 )
		LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 15, 19 )
		LobbyMemberBackingFooter0:setAlpha( 0 )
		LobbyMemberBackingFooter00:setLeftRight( 0, 1, 2, -2 )
		LobbyMemberBackingFooter00:setTopBottom( 0.5, 0.5, -21, -16 )
		LobbyMemberBackingFooter00:setAlpha( 0 )
		Name:setLeftRight( 0, 0, 207, 462 )
		Name:setTopBottom( 0, 0, 8, 32 )
		RankIcon:setAlpha( 1 )
		Rank:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBacking0, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter00:setTopBottom( 0.5, 0.5, -20.5, -16.5 )
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBacking0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					LobbyMemberBackingFooter00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 148.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBacking0, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 148.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter00:setTopBottom( 0.5, 0.5, -20.5, -16.5 )
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end
		},
		DOA = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 148.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBacking0, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 0 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 0 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setLeftRight( 0, 0, 148.5, 462.5 )
				self.Name:setTopBottom( 0, 0, 7, 31 )
				self.clipFinished( Name, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter00:setTopBottom( 0.5, 0.5, -20.5, -16.5 )
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				self.clipFinished( LobbyMemberBackingFooter00, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 0 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingMask0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBacking0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
					LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
					LobbyMemberBackingFooter0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setLeftRight( 0, 1, 2, 2 )
				self.LobbyMemberBackingFooter0:setTopBottom( 0.5, 0.5, 17, 21 )
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
				local LobbyMemberBackingFooter00Frame2 = function ( LobbyMemberBackingFooter00, event )
					if not event.interrupted then
						LobbyMemberBackingFooter00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LobbyMemberBackingFooter00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter00, event )
					else
						LobbyMemberBackingFooter00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter00:completeAnimation()
				self.LobbyMemberBackingFooter00:setAlpha( 1 )
				LobbyMemberBackingFooter00Frame2( LobbyMemberBackingFooter00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask0:close()
		self.LobbyMemberBacking0:close()
		self.LobbyMemberBackingFooter0:close()
		self.LobbyMemberBackingFooter00:close()
		self.Position:close()
		self.Rank:close()
		self.RankIcon:close()
		self.Name:close()
		self.Column0:close()
		self.Column1:close()
		self.Column2:close()
		self.Column3:close()
		self.Column4:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

