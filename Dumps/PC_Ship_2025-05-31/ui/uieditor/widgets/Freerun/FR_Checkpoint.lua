require( "ui.uieditor.widgets.Freerun.FR_Checkpoint_Internal" )

CoD.FR_Checkpoint = InheritFrom( LUI.UIElement )
CoD.FR_Checkpoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FR_Checkpoint )
	self.id = "FR_Checkpoint"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 151 )
	self.anyChildUsesUpdateState = true
	
	local FRCheckpointInternal = CoD.FR_Checkpoint_Internal.new( menu, controller )
	FRCheckpointInternal:setLeftRight( true, false, -210, -27 )
	FRCheckpointInternal:setTopBottom( true, false, 23.81, 99.19 )
	FRCheckpointInternal:setYRot( 27 )
	FRCheckpointInternal:subscribeToGlobalModel( controller, "FreeRun", "timer", function ( model )
		FRCheckpointInternal:setModel( model, controller )
	end )
	self:addElement( FRCheckpointInternal )
	self.FRCheckpointInternal = FRCheckpointInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FRCheckpointInternal:completeAnimation()
				self.FRCheckpointInternal:setAlpha( 1 )
				self.clipFinished( FRCheckpointInternal, {} )
			end,
			Checkpoint = function ()
				self:setupElementClipCounter( 1 )
				local FRCheckpointInternalFrame2 = function ( FRCheckpointInternal, event )
					local FRCheckpointInternalFrame3 = function ( FRCheckpointInternal, event )
						local FRCheckpointInternalFrame4 = function ( FRCheckpointInternal, event )
							if not event.interrupted then
								FRCheckpointInternal:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							FRCheckpointInternal:setLeftRight( true, false, -210, -27 )
							FRCheckpointInternal:setTopBottom( true, false, 23.81, 99.19 )
							FRCheckpointInternal:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FRCheckpointInternal, event )
							else
								FRCheckpointInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FRCheckpointInternalFrame4( FRCheckpointInternal, event )
							return 
						else
							FRCheckpointInternal:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
							FRCheckpointInternal:registerEventHandler( "transition_complete_keyframe", FRCheckpointInternalFrame4 )
						end
					end
					
					if event.interrupted then
						FRCheckpointInternalFrame3( FRCheckpointInternal, event )
						return 
					else
						FRCheckpointInternal:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						FRCheckpointInternal:setLeftRight( true, false, 43, 226 )
						FRCheckpointInternal:setTopBottom( true, false, 37.81, 113.19 )
						FRCheckpointInternal:setAlpha( 1 )
						FRCheckpointInternal:registerEventHandler( "transition_complete_keyframe", FRCheckpointInternalFrame3 )
					end
				end
				
				FRCheckpointInternal:completeAnimation()
				self.FRCheckpointInternal:setLeftRight( true, false, -210, -27 )
				self.FRCheckpointInternal:setTopBottom( true, false, 23.81, 99.19 )
				self.FRCheckpointInternal:setAlpha( 0 )
				FRCheckpointInternalFrame2( FRCheckpointInternal, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FRCheckpointInternal:completeAnimation()
				self.FRCheckpointInternal:setAlpha( 0 )
				self.clipFinished( FRCheckpointInternal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsModelValueEqualTo( controller, "FreeRun.runState", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.runState"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "FreeRun.timer.timeAdjustment", function ( model )
		local f11_local0 = self
		if IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 ) and IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 ) and ShouldShowFreerunTimeClips( controller ) then
			PlayClip( self, "More", controller )
		elseif IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 ) and not IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 ) and ShouldShowFreerunTimeClips( controller ) then
			PlayClip( self, "Less", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "FreeRun.freeRunInfo.activeCheckpoint", function ( model )
		local f12_local0 = self
		if IsModelValueGreaterThan( controller, "FreeRun.freeRunInfo.activeCheckpoint", 0 ) and IsModelValueEqualTo( controller, "FreeRun.runState", 1 ) then
			PlayClip( self, "Checkpoint", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRCheckpointInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

