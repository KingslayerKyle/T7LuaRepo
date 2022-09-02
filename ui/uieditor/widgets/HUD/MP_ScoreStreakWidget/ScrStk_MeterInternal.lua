-- b5fd3ffb9dc73c40b16ca43f5aa77980
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_CombatEfficiencyPulse" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_MeterKarat" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	local f1_local1, f1_local2, f1_local3, f1_local4 = f1_arg0.CombatEfficiencyPulse:getLocalTopBottom()
	local f1_local5, f1_local6, f1_local7, f1_local8 = f1_arg0:getLocalTopBottom()
	local f1_local9, f1_local10, f1_local11, f1_local12 = f1_arg0.FocusMeterFillWhite:getLocalTopBottom()
	local f1_local13 = f1_local8 + f1_local4 - f1_local3
	f1_arg0.CombatEfficiencyPulse:setTopBottom( true, true, f1_local3 + f1_local13, f1_local4 )
	f1_arg0.Fill:setShaderVector( 2, 0, 0, 0, 0 )
	f1_arg0.FocusMeterFill:setShaderVector( 2, 0, 0, 0, 0 )
	f1_arg0.Fill:subscribeToGlobalModel( f1_arg1, "KillstreakRewards", "momentumPercentage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue ~= nil then
			if modelValue < f1_local0 then
				f1_arg0.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				f1_arg0.FocusMeterFill:setShaderVector( 2, 0, 0, 0, 0 )
				f1_arg0.CombatEfficiencyPulse:setTopBottom( true, true, f1_local3 + f1_local13, f1_local4 )
				f1_arg0.FocusMeterFillWhite:setTopBottom( false, false, f1_local8 / 2 - f1_local8 + 4, f1_local8 / 2 - f1_local8 - 4 )
			end
			if HasPerk( f1_arg1, "specialty_combat_efficiency" ) then
				f1_arg0.CombatEfficiencyPulse:playClip( "ScoreAdded" )
				f1_arg0.FocusMeterFillWhite:playClip( "ScoreAdded" )
			end

			f1_arg0.CombatEfficiencyPulse:completeAnimation()
			f1_arg0.CombatEfficiencyPulse:setTopBottom( true, true, f1_local3 + f1_local13 * (1 - f1_local0), f1_local4 )
			f1_arg0.CombatEfficiencyPulse:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
			f1_arg0.CombatEfficiencyPulse:setTopBottom( true, true, f1_local3 + f1_local13 * (1 - modelValue), f1_local4 )
			f1_arg0.FocusMeterFillWhite:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
			local f2_local1 = f1_local8 / 2 - f1_local8 * modelValue
			f1_arg0.FocusMeterFillWhite:setTopBottom( false, false, f2_local1 + 4, f2_local1 - 4 )
			f1_arg0.Fill:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
			f1_arg0.Fill:setShaderVector( 2, modelValue, 0, 0, 0 )
			f1_arg0.FocusMeterFill:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
			f1_arg0.FocusMeterFill:setShaderVector( 2, modelValue, 0, 0, 0 )
			f1_local0 = modelValue
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "close", function ()
		f1_arg0.Fill:close()
	end )
end

CoD.ScrStk_MeterInternal = InheritFrom( LUI.UIElement )
CoD.ScrStk_MeterInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_MeterInternal )
	self.id = "ScrStk_MeterInternal"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 4 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Back = LUI.UIImage.new()
	Back:setLeftRight( false, false, -6, 2 )
	Back:setTopBottom( false, false, -60, 60 )
	Back:setRGB( 0.51, 0.55, 0.64 )
	Back:setAlpha( 0.5 )
	Back:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_meterfill" ) )
	self:addElement( Back )
	self.Back = Back
	
	local Fill = LUI.UIImage.new()
	Fill:setLeftRight( false, false, -6, 2 )
	Fill:setTopBottom( false, false, -60, 60 )
	Fill:setRGB( 0.51, 0.55, 0.64 )
	Fill:setXRot( 180 )
	Fill:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_meterfill" ) )
	Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Fill:setShaderVector( 0, 1, 0, 0, 0 )
	Fill:setShaderVector( 1, 0, 0, 0, 0 )
	Fill:setShaderVector( 2, 1, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FocusMeterBack = LUI.UIImage.new()
	FocusMeterBack:setLeftRight( false, false, -6, 2 )
	FocusMeterBack:setTopBottom( false, false, -60, 60 )
	FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
	FocusMeterBack:setAlpha( 0 )
	FocusMeterBack:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_focusmeterback" ) )
	self:addElement( FocusMeterBack )
	self.FocusMeterBack = FocusMeterBack
	
	local FocusMeterFill = LUI.UIImage.new()
	FocusMeterFill:setLeftRight( false, false, -6, 2 )
	FocusMeterFill:setTopBottom( false, false, 60, -60 )
	FocusMeterFill:setRGB( 0.15, 0.56, 0.88 )
	FocusMeterFill:setAlpha( 0 )
	FocusMeterFill:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_focusmeterfill" ) )
	FocusMeterFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	FocusMeterFill:setShaderVector( 0, 1, 0, 0, 0 )
	FocusMeterFill:setShaderVector( 1, 0, 0, 0, 0 )
	FocusMeterFill:setShaderVector( 2, 1, 0, 0, 0 )
	FocusMeterFill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( FocusMeterFill )
	self.FocusMeterFill = FocusMeterFill
	
	local CombatEfficiencyPulse = CoD.ScrStk_CombatEfficiencyPulse.new( menu, controller )
	CombatEfficiencyPulse:setLeftRight( false, false, -79.5, 75.5 )
	CombatEfficiencyPulse:setTopBottom( true, true, 2, -2 )
	CombatEfficiencyPulse:setAlpha( 0 )
	CombatEfficiencyPulse:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CombatEfficiencyPulse )
	self.CombatEfficiencyPulse = CombatEfficiencyPulse
	
	local FocusMeterFillWhite = CoD.ScrStk_MeterKarat.new( menu, controller )
	FocusMeterFillWhite:setLeftRight( false, false, -6, 2 )
	FocusMeterFillWhite:setTopBottom( false, false, 53, 61 )
	FocusMeterFillWhite:setAlpha( 0 )
	self:addElement( FocusMeterFillWhite )
	self.FocusMeterFillWhite = FocusMeterFillWhite
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Back:completeAnimation()
				self.Back:setAlpha( 0.5 )
				self.clipFinished( Back, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 1 )
				self.clipFinished( Fill, {} )

				FocusMeterBack:completeAnimation()
				self.FocusMeterBack:setAlpha( 0 )
				self.clipFinished( FocusMeterBack, {} )

				FocusMeterFill:completeAnimation()
				self.FocusMeterFill:setAlpha( 0 )
				self.clipFinished( FocusMeterFill, {} )

				CombatEfficiencyPulse:completeAnimation()
				self.CombatEfficiencyPulse:setAlpha( 0 )
				self.clipFinished( CombatEfficiencyPulse, {} )

				FocusMeterFillWhite:completeAnimation()
				self.FocusMeterFillWhite:setAlpha( 0 )
				self.clipFinished( FocusMeterFillWhite, {} )
			end,
			CombatEfficiency = function ()
				self:setupElementClipCounter( 6 )

				local BackFrame2 = function ( Back, event )
					if not event.interrupted then
						Back:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Back:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Back, event )
					else
						Back:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Back:completeAnimation()
				self.Back:setAlpha( 0.5 )
				BackFrame2( Back, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Fill:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 1 )
				FillFrame2( Fill, {} )
				local FocusMeterBackFrame2 = function ( FocusMeterBack, event )
					if not event.interrupted then
						FocusMeterBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
					FocusMeterBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusMeterBack, event )
					else
						FocusMeterBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterBack:completeAnimation()
				self.FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
				self.FocusMeterBack:setAlpha( 0 )
				FocusMeterBackFrame2( FocusMeterBack, {} )
				local FocusMeterFillFrame2 = function ( FocusMeterFill, event )
					if not event.interrupted then
						FocusMeterFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FocusMeterFill:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusMeterFill, event )
					else
						FocusMeterFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterFill:completeAnimation()
				self.FocusMeterFill:setAlpha( 0 )
				FocusMeterFillFrame2( FocusMeterFill, {} )
				local CombatEfficiencyPulseFrame2 = function ( CombatEfficiencyPulse, event )
					if not event.interrupted then
						CombatEfficiencyPulse:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					CombatEfficiencyPulse:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CombatEfficiencyPulse, event )
					else
						CombatEfficiencyPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CombatEfficiencyPulse:completeAnimation()
				self.CombatEfficiencyPulse:setAlpha( 0 )
				CombatEfficiencyPulseFrame2( CombatEfficiencyPulse, {} )
				local FocusMeterFillWhiteFrame2 = function ( FocusMeterFillWhite, event )
					if not event.interrupted then
						FocusMeterFillWhite:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FocusMeterFillWhite:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusMeterFillWhite, event )
					else
						FocusMeterFillWhite:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterFillWhite:completeAnimation()
				self.FocusMeterFillWhite:setAlpha( 0 )
				FocusMeterFillWhiteFrame2( FocusMeterFillWhite, {} )
			end
		},
		CombatEfficiency = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Back:completeAnimation()
				self.Back:setAlpha( 0 )
				self.clipFinished( Back, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )

				FocusMeterBack:completeAnimation()
				self.FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
				self.FocusMeterBack:setAlpha( 0 )
				self.clipFinished( FocusMeterBack, {} )

				FocusMeterFill:completeAnimation()
				self.FocusMeterFill:setAlpha( 1 )
				self.clipFinished( FocusMeterFill, {} )

				CombatEfficiencyPulse:completeAnimation()
				self.CombatEfficiencyPulse:setAlpha( 1 )
				self.clipFinished( CombatEfficiencyPulse, {} )

				FocusMeterFillWhite:completeAnimation()
				self.FocusMeterFillWhite:setAlpha( 1 )
				self.clipFinished( FocusMeterFillWhite, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )

				local BackFrame2 = function ( Back, event )
					if not event.interrupted then
						Back:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Back:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Back, event )
					else
						Back:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Back:completeAnimation()
				self.Back:setAlpha( 0 )
				BackFrame2( Back, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Fill:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				FillFrame2( Fill, {} )
				local FocusMeterBackFrame2 = function ( FocusMeterBack, event )
					if not event.interrupted then
						FocusMeterBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
					FocusMeterBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusMeterBack, event )
					else
						FocusMeterBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterBack:completeAnimation()
				self.FocusMeterBack:setRGB( 0.22, 0.38, 0.52 )
				self.FocusMeterBack:setAlpha( 0 )
				FocusMeterBackFrame2( FocusMeterBack, {} )
				local FocusMeterFillFrame2 = function ( FocusMeterFill, event )
					if not event.interrupted then
						FocusMeterFill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FocusMeterFill:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusMeterFill, event )
					else
						FocusMeterFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterFill:completeAnimation()
				self.FocusMeterFill:setAlpha( 1 )
				FocusMeterFillFrame2( FocusMeterFill, {} )
				local CombatEfficiencyPulseFrame2 = function ( CombatEfficiencyPulse, event )
					if not event.interrupted then
						CombatEfficiencyPulse:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					CombatEfficiencyPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CombatEfficiencyPulse, event )
					else
						CombatEfficiencyPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CombatEfficiencyPulse:completeAnimation()
				self.CombatEfficiencyPulse:setAlpha( 1 )
				CombatEfficiencyPulseFrame2( CombatEfficiencyPulse, {} )
				local FocusMeterFillWhiteFrame2 = function ( FocusMeterFillWhite, event )
					if not event.interrupted then
						FocusMeterFillWhite:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FocusMeterFillWhite:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusMeterFillWhite, event )
					else
						FocusMeterFillWhite:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusMeterFillWhite:completeAnimation()
				self.FocusMeterFillWhite:setAlpha( 1 )
				FocusMeterFillWhiteFrame2( FocusMeterFillWhite, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CombatEfficiency",
			condition = function ( menu, element, event )
				return HasPerk( controller, "specialty_combat_efficiency" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CombatEfficiencyPulse:close()
		element.FocusMeterFillWhite:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

