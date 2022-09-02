-- b52c9c137d5e35f32744575459899651
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletion_CroppedImage" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = element:getModel()
		local f2_local1 = Engine.GetModel( f2_local0, "maxTier" )
		local f2_local2 = Engine.GetModel( f2_local0, "currentTier" )
		local f2_local3 = Engine.GetModel( f2_local0, "xp" )
		if f2_local1 and f2_local2 and f2_local3 then
			SetGlobalModelValue( "maxTier", Engine.GetModelValue( f2_local1 ) )
			SetGlobalModelValue( "currentTier", Engine.GetModelValue( f2_local2 ) )
			SetGlobalModelValue( "tierXP", Engine.GetModelValue( f2_local3 ) )
			element:dispatchEventToParent( {
				name = "update_tier_list",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_NearCompletionWidget_Long = InheritFrom( LUI.UIElement )
CoD.Challenges_NearCompletionWidget_Long.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_NearCompletionWidget_Long )
	self.id = "Challenges_NearCompletionWidget_Long"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 75 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 120, 507 )
	Title:setTopBottom( true, false, 4, 24 )
	Title:setRGB( 0.93, 0.74, 0.29 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setLetterSpacing( 3 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 120, 507 )
	Description:setTopBottom( false, true, -51, -31 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local StatFraction = LUI.UIText.new()
	StatFraction:setLeftRight( true, false, 498, 588 )
	StatFraction:setTopBottom( true, false, 26.5, 43.5 )
	StatFraction:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatFraction:setLetterSpacing( 1 )
	StatFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatFraction )
	self.StatFraction = StatFraction
	
	local Icon = CoD.Challenges_NearCompletion_CroppedImage.new( menu, controller )
	Icon:setLeftRight( true, false, 8, 104 )
	Icon:setTopBottom( false, false, -24, 24 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 1, 599 )
	BlackTint:setTopBottom( true, false, 1, 74 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -1, 3 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self.Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description:setText( Engine.Localize( description ) )
		end
	end )
	self.StatFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			StatFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	self.Icon:linkToElementModel( self, "iconId", true, function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			Icon.Image:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				self.clipFinished( BlackTint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local BlackTintFrame2 = function ( BlackTint, event )
					if not event.interrupted then
						BlackTint:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackTint:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BlackTint, event )
					else
						BlackTint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.05 )
				BlackTintFrame2( BlackTint, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							if not event.interrupted then
								FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							FocusBarT:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FocusBarT, event )
							else
								FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.5 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 1 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							if not event.interrupted then
								FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							FocusBarB:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FocusBarB, event )
							else
								FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.5 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 1 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local BlackTintFrame2 = function ( BlackTint, event )
					if not event.interrupted then
						BlackTint:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					BlackTint:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( BlackTint, event )
					else
						BlackTint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				BlackTintFrame2( BlackTint, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								if not event.interrupted then
									FocusBarT:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								FocusBarT:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarT, event )
								else
									FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 1 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.5 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FocusBarB, event )
								else
									FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 1 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.5 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.Icon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.Title:close()
		element.Description:close()
		element.StatFraction:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

