-- e9c2bed699f02fdeb24bc92b9d32e495
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

CoD.systemOverlay_Layout_ArenaNewSeasonText = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_ArenaNewSeasonText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_ArenaNewSeasonText )
	self.id = "systemOverlay_Layout_ArenaNewSeasonText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 795 )
	self:setTopBottom( true, false, 0, 50 )
	
	local SeasonStartDesc = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	SeasonStartDesc:setLeftRight( true, false, 0, 795 )
	SeasonStartDesc:setTopBottom( true, false, 30, 50 )
	SeasonStartDesc:setAlpha( 0 )
	SeasonStartDesc:subscribeToGlobalModel( controller, "ArenaSeasonMonths", "currentSeasonMonth", function ( model )
		local currentSeasonMonth = Engine.GetModelValue( model )
		if currentSeasonMonth then
			SeasonStartDesc.text:setText( LocalizeIntoString( "MENU_ARENA_SEASON_START_DESC", currentSeasonMonth ) )
		end
	end )
	self:addElement( SeasonStartDesc )
	self.SeasonStartDesc = SeasonStartDesc
	
	local BonusStarsDesc = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	BonusStarsDesc:setLeftRight( true, false, 0, 795 )
	BonusStarsDesc:setTopBottom( true, false, 30, 50 )
	BonusStarsDesc:setAlpha( 0 )
	BonusStarsDesc:subscribeToGlobalModel( controller, "ArenaSeasonMonths", "previousSeasonMonth", function ( model )
		local previousSeasonMonth = Engine.GetModelValue( model )
		if previousSeasonMonth then
			BonusStarsDesc.text:setText( LocalizeIntoString( "MENU_ARENA_BONUS_STARS_DESC", previousSeasonMonth ) )
		end
	end )
	self:addElement( BonusStarsDesc )
	self.BonusStarsDesc = BonusStarsDesc
	
	local SeasonFinaleDesc = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	SeasonFinaleDesc:setLeftRight( true, false, 0, 795 )
	SeasonFinaleDesc:setTopBottom( true, false, 30, 50 )
	SeasonFinaleDesc:subscribeToGlobalModel( controller, "ArenaSeasonMonths", "previousSeasonMonth", function ( model )
		local previousSeasonMonth = Engine.GetModelValue( model )
		if previousSeasonMonth then
			SeasonFinaleDesc.text:setText( LocalizeIntoString( "MENU_ARENA_SEASON_FINALE_DESC", previousSeasonMonth ) )
		end
	end )
	self:addElement( SeasonFinaleDesc )
	self.SeasonFinaleDesc = SeasonFinaleDesc
	
	local CurrentSeasonTitle = LUI.UITightText.new()
	CurrentSeasonTitle:setLeftRight( true, false, 0, 44 )
	CurrentSeasonTitle:setTopBottom( true, false, 0, 30 )
	CurrentSeasonTitle:setAlpha( 0 )
	CurrentSeasonTitle:setTTF( "fonts/escom.ttf" )
	CurrentSeasonTitle:subscribeToGlobalModel( controller, "ArenaSeasonMonths", "currentSeasonMonth", function ( model )
		local currentSeasonMonth = Engine.GetModelValue( model )
		if currentSeasonMonth then
			CurrentSeasonTitle:setText( LocalizeIntoString( "MENU_ARENA_SEASON_CAPS", ConvertToUpperString( currentSeasonMonth ) ) )
		end
	end )
	self:addElement( CurrentSeasonTitle )
	self.CurrentSeasonTitle = CurrentSeasonTitle
	
	local PreviousSeasonTitle = LUI.UITightText.new()
	PreviousSeasonTitle:setLeftRight( true, false, 0, 103 )
	PreviousSeasonTitle:setTopBottom( true, false, 0, 30 )
	PreviousSeasonTitle:setTTF( "fonts/escom.ttf" )
	PreviousSeasonTitle:subscribeToGlobalModel( controller, "ArenaSeasonMonths", "previousSeasonMonth", function ( model )
		local previousSeasonMonth = Engine.GetModelValue( model )
		if previousSeasonMonth then
			PreviousSeasonTitle:setText( LocalizeIntoString( "MENU_ARENA_SEASON_FINALE_CAPS", ConvertToUpperString( previousSeasonMonth ) ) )
		end
	end )
	self:addElement( PreviousSeasonTitle )
	self.PreviousSeasonTitle = PreviousSeasonTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SeasonStartDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				SeasonStartDesc:setAlpha( 0 )
				SeasonStartDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				BonusStarsDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				BonusStarsDesc:setAlpha( 0 )
				BonusStarsDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 0 )
				self.clipFinished( SeasonFinaleDesc, {} )

				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 0 )
				self.clipFinished( CurrentSeasonTitle, {} )

				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 0 )
				self.clipFinished( PreviousSeasonTitle, {} )
			end
		},
		SeasonFinale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SeasonStartDesc:completeAnimation()
				self.SeasonStartDesc:setAlpha( 0 )
				self.clipFinished( SeasonStartDesc, {} )

				BonusStarsDesc:completeAnimation()
				self.BonusStarsDesc:setAlpha( 0 )
				self.clipFinished( BonusStarsDesc, {} )
				local SeasonFinaleDescFrame2 = function ( SeasonFinaleDesc, event )
					if not event.interrupted then
						SeasonFinaleDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					SeasonFinaleDesc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SeasonFinaleDesc, event )
					else
						SeasonFinaleDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 0 )
				SeasonFinaleDescFrame2( SeasonFinaleDesc, {} )

				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 0 )
				self.clipFinished( CurrentSeasonTitle, {} )
				local PreviousSeasonTitleFrame2 = function ( PreviousSeasonTitle, event )
					if not event.interrupted then
						PreviousSeasonTitle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousSeasonTitle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PreviousSeasonTitle, event )
					else
						PreviousSeasonTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 0 )
				PreviousSeasonTitleFrame2( PreviousSeasonTitle, {} )
			end,
			BonusStars = function ()
				self:setupElementClipCounter( 5 )

				SeasonStartDesc:completeAnimation()
				self.SeasonStartDesc:setAlpha( 0 )
				self.clipFinished( SeasonStartDesc, {} )

				BonusStarsDesc:completeAnimation()
				self.BonusStarsDesc:setAlpha( 0 )
				self.clipFinished( BonusStarsDesc, {} )
				local SeasonFinaleDescFrame2 = function ( SeasonFinaleDesc, event )
					if not event.interrupted then
						SeasonFinaleDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					SeasonFinaleDesc:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SeasonFinaleDesc, event )
					else
						SeasonFinaleDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 1 )
				SeasonFinaleDescFrame2( SeasonFinaleDesc, {} )

				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 0 )
				self.clipFinished( CurrentSeasonTitle, {} )
				local PreviousSeasonTitleFrame2 = function ( PreviousSeasonTitle, event )
					if not event.interrupted then
						PreviousSeasonTitle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					PreviousSeasonTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PreviousSeasonTitle, event )
					else
						PreviousSeasonTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 1 )
				PreviousSeasonTitleFrame2( PreviousSeasonTitle, {} )
			end
		},
		BonusStars = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SeasonStartDesc:completeAnimation()
				self.SeasonStartDesc:setAlpha( 0 )
				self.clipFinished( SeasonStartDesc, {} )
				local BonusStarsDescFrame2 = function ( BonusStarsDesc, event )
					if not event.interrupted then
						BonusStarsDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					BonusStarsDesc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BonusStarsDesc, event )
					else
						BonusStarsDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BonusStarsDesc:completeAnimation()
				self.BonusStarsDesc:setAlpha( 0 )
				BonusStarsDescFrame2( BonusStarsDesc, {} )

				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 0 )
				self.clipFinished( SeasonFinaleDesc, {} )
				local CurrentSeasonTitleFrame2 = function ( CurrentSeasonTitle, event )
					if not event.interrupted then
						CurrentSeasonTitle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentSeasonTitle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CurrentSeasonTitle, event )
					else
						CurrentSeasonTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 0 )
				CurrentSeasonTitleFrame2( CurrentSeasonTitle, {} )

				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 0 )
				self.clipFinished( PreviousSeasonTitle, {} )
			end,
			SeasonStart = function ()
				self:setupElementClipCounter( 5 )

				SeasonStartDesc:completeAnimation()
				self.SeasonStartDesc:setAlpha( 0 )
				self.clipFinished( SeasonStartDesc, {} )
				local BonusStarsDescFrame2 = function ( BonusStarsDesc, event )
					if not event.interrupted then
						BonusStarsDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					BonusStarsDesc:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BonusStarsDesc, event )
					else
						BonusStarsDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BonusStarsDesc:completeAnimation()
				self.BonusStarsDesc:setAlpha( 1 )
				BonusStarsDescFrame2( BonusStarsDesc, {} )

				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 0 )
				self.clipFinished( SeasonFinaleDesc, {} )
				local CurrentSeasonTitleFrame2 = function ( CurrentSeasonTitle, event )
					if not event.interrupted then
						CurrentSeasonTitle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentSeasonTitle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CurrentSeasonTitle, event )
					else
						CurrentSeasonTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 1 )
				CurrentSeasonTitleFrame2( CurrentSeasonTitle, {} )

				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 0 )
				self.clipFinished( PreviousSeasonTitle, {} )
			end
		},
		SeasonStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local SeasonStartDescFrame2 = function ( SeasonStartDesc, event )
					if not event.interrupted then
						SeasonStartDesc:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					SeasonStartDesc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SeasonStartDesc, event )
					else
						SeasonStartDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SeasonStartDesc:completeAnimation()
				self.SeasonStartDesc:setAlpha( 0 )
				SeasonStartDescFrame2( SeasonStartDesc, {} )

				BonusStarsDesc:completeAnimation()
				self.BonusStarsDesc:setAlpha( 0 )
				self.clipFinished( BonusStarsDesc, {} )

				SeasonFinaleDesc:completeAnimation()
				self.SeasonFinaleDesc:setAlpha( 0 )
				self.clipFinished( SeasonFinaleDesc, {} )
				local CurrentSeasonTitleFrame2 = function ( CurrentSeasonTitle, event )
					if not event.interrupted then
						CurrentSeasonTitle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					CurrentSeasonTitle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CurrentSeasonTitle, event )
					else
						CurrentSeasonTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CurrentSeasonTitle:completeAnimation()
				self.CurrentSeasonTitle:setAlpha( 0 )
				CurrentSeasonTitleFrame2( CurrentSeasonTitle, {} )

				PreviousSeasonTitle:completeAnimation()
				self.PreviousSeasonTitle:setAlpha( 0 )
				self.clipFinished( PreviousSeasonTitle, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SeasonStartDesc:close()
		element.BonusStarsDesc:close()
		element.SeasonFinaleDesc:close()
		element.CurrentSeasonTitle:close()
		element.PreviousSeasonTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

