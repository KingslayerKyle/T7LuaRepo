require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletion_CroppedImage" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "gain_focus", function ( self, event )
		local model = self:getModel()
		local maxTierModel = Engine.GetModel( model, "maxTier" )
		local currentTierModel = Engine.GetModel( model, "currentTier" )
		local tierXPModel = Engine.GetModel( model, "xp" )
		if maxTierModel and currentTierModel and tierXPModel then
			SetGlobalModelValue( "maxTier", Engine.GetModelValue( maxTierModel ) )
			SetGlobalModelValue( "currentTier", Engine.GetModelValue( currentTierModel ) )
			SetGlobalModelValue( "tierXP", Engine.GetModelValue( tierXPModel ) )
			self:dispatchEventToParent( {
				name = "update_tier_list",
				controller = controller
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
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 112 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 180, 760 )
	Title:setTopBottom( 0, 0, 6, 36 )
	Title:setRGB( 0.93, 0.74, 0.29 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setLetterSpacing( 3 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 180, 760 )
	Description:setTopBottom( 1, 1, -77, -47 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local StatFraction = LUI.UIText.new()
	StatFraction:setLeftRight( 0, 0, 747, 882 )
	StatFraction:setTopBottom( 0, 0, 40, 70 )
	StatFraction:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatFraction:setLetterSpacing( 1 )
	StatFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatFraction )
	self.StatFraction = StatFraction
	
	local Icon = CoD.Challenges_NearCompletion_CroppedImage.new( menu, controller )
	Icon:setLeftRight( 0, 0, 12, 156 )
	Icon:setTopBottom( 0.5, 0.5, -36, 36 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 1, 898 )
	BlackTint:setTopBottom( 0, 0, 1, 111 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.05 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -1, 5 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.StatFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StatFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Icon:linkToElementModel( self, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BlackTint:completeAnimation()
		FocusBarT:setAlpha( 1 )
		FocusBarB:setAlpha( 1 )
		BoxButtonLrgInactive:setAlpha( 0.7 )
		BlackTint:setAlpha( 0.05 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self.resetProperties()
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
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.Icon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.Title:close()
		self.Description:close()
		self.StatFraction:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

