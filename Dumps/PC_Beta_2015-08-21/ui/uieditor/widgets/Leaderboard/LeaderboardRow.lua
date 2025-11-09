require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBacking" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

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
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, 0, 780 )
	Line:setTopBottom( true, false, 22, 26 )
	Line:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 0, 0 )
	LobbyMemberBackingMask0:setTopBottom( true, true, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local LobbyMemberBacking0 = CoD.LobbyMemberBacking.new( menu, controller )
	LobbyMemberBacking0:setLeftRight( true, true, 0, 0 )
	LobbyMemberBacking0:setTopBottom( true, true, 0, 0 )
	LobbyMemberBacking0:setAlpha( 0 )
	self:addElement( LobbyMemberBacking0 )
	self.LobbyMemberBacking0 = LobbyMemberBacking0
	
	local Position = LUI.UIText.new()
	Position:setLeftRight( true, false, 6, 99 )
	Position:setTopBottom( true, false, 4.5, 20.5 )
	Position:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Position:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Position:linkToElementModel( self, "rowColor", true, function ( model )
		local rowColor = Engine.GetModelValue( model )
		if rowColor then
			Position:setRGB( rowColor )
		end
	end )
	Position:linkToElementModel( self, "position", true, function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			Position:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 95, 117 )
	Rank:setTopBottom( true, false, 4.5, 20.5 )
	Rank:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "rowColor", true, function ( model )
		local rowColor = Engine.GetModelValue( model )
		if rowColor then
			Rank:setRGB( rowColor )
		end
	end )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			Rank:setText( Engine.Localize( rank ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 111.72, 131.72 )
	RankIcon:setTopBottom( true, false, 2.5, 22.5 )
	RankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			RankIcon:setImage( RegisterImage( rankIcon ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 138, 308 )
	Name:setTopBottom( true, false, 4.5, 20.5 )
	Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "rowColor", true, function ( model )
		local rowColor = Engine.GetModelValue( model )
		if rowColor then
			Name:setRGB( rowColor )
		end
	end )
	Name:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Column0 = LUI.UIText.new()
	Column0:setLeftRight( true, false, 307, 424 )
	Column0:setTopBottom( true, false, 4.5, 20.5 )
	Column0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column0:linkToElementModel( self, "column0color", true, function ( model )
		local column0color = Engine.GetModelValue( model )
		if column0color then
			Column0:setRGB( column0color )
		end
	end )
	Column0:linkToElementModel( self, "column0", true, function ( model )
		local column0 = Engine.GetModelValue( model )
		if column0 then
			Column0:setText( Engine.Localize( column0 ) )
		end
	end )
	self:addElement( Column0 )
	self.Column0 = Column0
	
	local Column1 = LUI.UIText.new()
	Column1:setLeftRight( true, false, 391, 512 )
	Column1:setTopBottom( true, false, 4.5, 20.5 )
	Column1:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column1:linkToElementModel( self, "column1color", true, function ( model )
		local column1color = Engine.GetModelValue( model )
		if column1color then
			Column1:setRGB( column1color )
		end
	end )
	Column1:linkToElementModel( self, "column1", true, function ( model )
		local column1 = Engine.GetModelValue( model )
		if column1 then
			Column1:setText( Engine.Localize( column1 ) )
		end
	end )
	self:addElement( Column1 )
	self.Column1 = Column1
	
	local Column2 = LUI.UIText.new()
	Column2:setLeftRight( true, false, 493, 600 )
	Column2:setTopBottom( true, false, 4.5, 20.5 )
	Column2:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column2:linkToElementModel( self, "column2color", true, function ( model )
		local column2color = Engine.GetModelValue( model )
		if column2color then
			Column2:setRGB( column2color )
		end
	end )
	Column2:linkToElementModel( self, "column2", true, function ( model )
		local column2 = Engine.GetModelValue( model )
		if column2 then
			Column2:setText( Engine.Localize( column2 ) )
		end
	end )
	self:addElement( Column2 )
	self.Column2 = Column2
	
	local Column3 = LUI.UIText.new()
	Column3:setLeftRight( true, false, 583, 688 )
	Column3:setTopBottom( true, false, 4.5, 20.5 )
	Column3:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column3:linkToElementModel( self, "column3color", true, function ( model )
		local column3color = Engine.GetModelValue( model )
		if column3color then
			Column3:setRGB( column3color )
		end
	end )
	Column3:linkToElementModel( self, "column3", true, function ( model )
		local column3 = Engine.GetModelValue( model )
		if column3 then
			Column3:setText( Engine.Localize( column3 ) )
		end
	end )
	self:addElement( Column3 )
	self.Column3 = Column3
	
	local Column4 = LUI.UIText.new()
	Column4:setLeftRight( true, false, 675, 775 )
	Column4:setTopBottom( true, false, 4.5, 20.5 )
	Column4:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Column4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Column4:linkToElementModel( self, "column4color", true, function ( model )
		local column4color = Engine.GetModelValue( model )
		if column4color then
			Column4:setRGB( column4color )
		end
	end )
	Column4:linkToElementModel( self, "column4", true, function ( model )
		local column4 = Engine.GetModelValue( model )
		if column4 then
			Column4:setText( Engine.Localize( column4 ) )
		end
	end )
	self:addElement( Column4 )
	self.Column4 = Column4
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2, 2 )
	LobbyMemberBackingFooter0:setTopBottom( false, false, 10, 13 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				self.LobbyMemberBacking0:setZoom( 0 )
				self.clipFinished( LobbyMemberBacking0, {} )
				Position:completeAnimation()
				self.Position:setAlpha( 1 )
				self.Position:setZoom( 0 )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setAlpha( 1 )
				self.Rank:setZoom( 0 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setAlpha( 1 )
				self.RankIcon:setZoom( 0 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setAlpha( 1 )
				self.Name:setZoom( 0 )
				self.clipFinished( Name, {} )
				Column0:completeAnimation()
				self.Column0:setAlpha( 1 )
				self.Column0:setZoom( 0 )
				self.clipFinished( Column0, {} )
				Column1:completeAnimation()
				self.Column1:setAlpha( 1 )
				self.Column1:setZoom( 0 )
				self.clipFinished( Column1, {} )
				Column2:completeAnimation()
				self.Column2:setAlpha( 1 )
				self.Column2:setZoom( 0 )
				self.clipFinished( Column2, {} )
				Column3:completeAnimation()
				self.Column3:setAlpha( 1 )
				self.Column3:setZoom( 0 )
				self.clipFinished( Column3, {} )
				Column4:completeAnimation()
				self.Column4:setAlpha( 1 )
				self.Column4:setZoom( 0 )
				self.clipFinished( Column4, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 50 )
				self.clipFinished( LobbyMemberBackingMask0, {} )
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 50 )
				self.clipFinished( LobbyMemberBacking0, {} )
				Position:completeAnimation()
				self.Position:setZoom( 50 )
				self.clipFinished( Position, {} )
				Rank:completeAnimation()
				self.Rank:setZoom( 50 )
				self.clipFinished( Rank, {} )
				RankIcon:completeAnimation()
				self.RankIcon:setZoom( 50 )
				self.clipFinished( RankIcon, {} )
				Name:completeAnimation()
				self.Name:setZoom( 50 )
				self.clipFinished( Name, {} )
				Column0:completeAnimation()
				self.Column0:setZoom( 50 )
				self.clipFinished( Column0, {} )
				Column1:completeAnimation()
				self.Column1:setZoom( 50 )
				self.clipFinished( Column1, {} )
				Column2:completeAnimation()
				self.Column2:setZoom( 50 )
				self.clipFinished( Column2, {} )
				Column3:completeAnimation()
				self.Column3:setZoom( 50 )
				self.clipFinished( Column3, {} )
				Column4:completeAnimation()
				self.Column4:setZoom( 50 )
				self.clipFinished( Column4, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setAlpha( 1 )
					LobbyMemberBackingMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 0 )
				self.LobbyMemberBackingMask0:setZoom( 0 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setAlpha( 1 )
					LobbyMemberBacking0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 0 )
				self.LobbyMemberBacking0:setZoom( 0 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local PositionFrame2 = function ( Position, event )
					if not event.interrupted then
						Position:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Position:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Position, event )
					else
						Position:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Position:completeAnimation()
				self.Position:setZoom( 0 )
				PositionFrame2( Position, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Rank:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setZoom( 0 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					RankIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setZoom( 0 )
				RankIconFrame2( RankIcon, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Name:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setZoom( 0 )
				NameFrame2( Name, {} )
				local Column0Frame2 = function ( Column0, event )
					if not event.interrupted then
						Column0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Column0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Column0, event )
					else
						Column0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column0:completeAnimation()
				self.Column0:setZoom( 0 )
				Column0Frame2( Column0, {} )
				local Column1Frame2 = function ( Column1, event )
					if not event.interrupted then
						Column1:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Column1:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Column1, event )
					else
						Column1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column1:completeAnimation()
				self.Column1:setZoom( 0 )
				Column1Frame2( Column1, {} )
				local Column2Frame2 = function ( Column2, event )
					if not event.interrupted then
						Column2:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Column2:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Column2, event )
					else
						Column2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column2:completeAnimation()
				self.Column2:setZoom( 0 )
				Column2Frame2( Column2, {} )
				local Column3Frame2 = function ( Column3, event )
					if not event.interrupted then
						Column3:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Column3:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Column3, event )
					else
						Column3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column3:completeAnimation()
				self.Column3:setZoom( 0 )
				Column3Frame2( Column3, {} )
				local Column4Frame2 = function ( Column4, event )
					if not event.interrupted then
						Column4:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Column4:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( Column4, event )
					else
						Column4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column4:completeAnimation()
				self.Column4:setZoom( 0 )
				Column4Frame2( Column4, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
				local LobbyMemberBackingMask0Frame2 = function ( LobbyMemberBackingMask0, event )
					if not event.interrupted then
						LobbyMemberBackingMask0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingMask0:setAlpha( 0 )
					LobbyMemberBackingMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingMask0, event )
					else
						LobbyMemberBackingMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingMask0:completeAnimation()
				self.LobbyMemberBackingMask0:setAlpha( 1 )
				self.LobbyMemberBackingMask0:setZoom( 50 )
				LobbyMemberBackingMask0Frame2( LobbyMemberBackingMask0, {} )
				local LobbyMemberBacking0Frame2 = function ( LobbyMemberBacking0, event )
					if not event.interrupted then
						LobbyMemberBacking0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBacking0:setAlpha( 0 )
					LobbyMemberBacking0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBacking0, event )
					else
						LobbyMemberBacking0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBacking0:completeAnimation()
				self.LobbyMemberBacking0:setAlpha( 1 )
				self.LobbyMemberBacking0:setZoom( 50 )
				LobbyMemberBacking0Frame2( LobbyMemberBacking0, {} )
				local PositionFrame2 = function ( Position, event )
					if not event.interrupted then
						Position:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Position:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Position, event )
					else
						Position:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Position:completeAnimation()
				self.Position:setZoom( 50 )
				PositionFrame2( Position, {} )
				local RankFrame2 = function ( Rank, event )
					if not event.interrupted then
						Rank:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Rank:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Rank, event )
					else
						Rank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Rank:completeAnimation()
				self.Rank:setZoom( 50 )
				RankFrame2( Rank, {} )
				local RankIconFrame2 = function ( RankIcon, event )
					if not event.interrupted then
						RankIcon:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					RankIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( RankIcon, event )
					else
						RankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RankIcon:completeAnimation()
				self.RankIcon:setZoom( 50 )
				RankIconFrame2( RankIcon, {} )
				local NameFrame2 = function ( Name, event )
					if not event.interrupted then
						Name:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Name:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Name, event )
					else
						Name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Name:completeAnimation()
				self.Name:setZoom( 50 )
				NameFrame2( Name, {} )
				local Column0Frame2 = function ( Column0, event )
					if not event.interrupted then
						Column0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Column0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Column0, event )
					else
						Column0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column0:completeAnimation()
				self.Column0:setZoom( 50 )
				Column0Frame2( Column0, {} )
				local Column1Frame2 = function ( Column1, event )
					if not event.interrupted then
						Column1:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Column1:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Column1, event )
					else
						Column1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column1:completeAnimation()
				self.Column1:setZoom( 50 )
				Column1Frame2( Column1, {} )
				local Column2Frame2 = function ( Column2, event )
					if not event.interrupted then
						Column2:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Column2:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Column2, event )
					else
						Column2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column2:completeAnimation()
				self.Column2:setZoom( 50 )
				Column2Frame2( Column2, {} )
				local Column3Frame2 = function ( Column3, event )
					if not event.interrupted then
						Column3:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Column3:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Column3, event )
					else
						Column3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column3:completeAnimation()
				self.Column3:setZoom( 50 )
				Column3Frame2( Column3, {} )
				local Column4Frame2 = function ( Column4, event )
					if not event.interrupted then
						Column4:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					Column4:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Column4, event )
					else
						Column4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Column4:completeAnimation()
				self.Column4:setZoom( 50 )
				Column4Frame2( Column4, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberBackingMask0:close()
		element.LobbyMemberBacking0:close()
		element.LobbyMemberBackingFooter0:close()
		element.Position:close()
		element.Rank:close()
		element.RankIcon:close()
		element.Name:close()
		element.Column0:close()
		element.Column1:close()
		element.Column2:close()
		element.Column3:close()
		element.Column4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

