-- 758de66eafebc9b77d8f4d0c61a98ff0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.TacticalMode.ClampedShooterWidget_Internal" )

CoD.ClampedShooterWidget = InheritFrom( LUI.UIElement )
CoD.ClampedShooterWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ClampedShooterWidget )
	self.id = "ClampedShooterWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	
	local internal = CoD.ClampedShooterWidget_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal.arrow:setRGB( 0.57, 0.59, 0.65 )
	internal:linkToElementModel( self, "alpha", true, function ( model )
		local alpha = Engine.GetModelValue( model )
		if alpha then
			internal:setAlpha( alpha )
		end
	end )
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				internal:completeAnimation()

				internal.archetypeImage:completeAnimation()
				self.internal.archetypeImage:setRGB( 0.64, 0.65, 0.67 )
				self.clipFinished( internal, {} )
			end,
			Shooting = function ()
				self:setupElementClipCounter( 1 )

				local internalFrame2 = function ( internal, event )
					local internalFrame3 = function ( internal, event )
						local internalFrame4 = function ( internal, event )
							local internalFrame5 = function ( internal, event )
								local internalFrame6 = function ( internal, event )
									if not event.interrupted then
										internal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										internal.archetypeImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									internal.archetypeImage:setRGB( 1, 0.31, 0.2 )
									if event.interrupted then
										self.clipFinished( internal, event )
									else
										internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									internalFrame6( internal, event )
									return 
								else
									internal:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									internal:registerEventHandler( "transition_complete_keyframe", internalFrame6 )
								end
							end
							
							if event.interrupted then
								internalFrame5( internal, event )
								return 
							else
								internal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								internal.archetypeImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								internal.archetypeImage:setRGB( 0.76, 0.79, 0.87 )
								internal:registerEventHandler( "transition_complete_keyframe", internalFrame5 )
							end
						end
						
						if event.interrupted then
							internalFrame4( internal, event )
							return 
						else
							internal:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							internal:registerEventHandler( "transition_complete_keyframe", internalFrame4 )
						end
					end
					
					if event.interrupted then
						internalFrame3( internal, event )
						return 
					else
						internal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						internal.archetypeImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						internal.archetypeImage:setRGB( 1, 0.31, 0.2 )
						internal:registerEventHandler( "transition_complete_keyframe", internalFrame3 )
					end
				end
				
				internal:completeAnimation()

				internal.archetypeImage:completeAnimation()
				self.internal.archetypeImage:setRGB( 0.76, 0.79, 0.87 )
				internalFrame2( internal, {} )

				self.nextClip = "Shooting"
			end
		},
		Shooting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local internalFrame2 = function ( internal, event )
					local internalFrame3 = function ( internal, event )
						if not event.interrupted then
							internal:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							internal.archetypeImage:beginAnimation( "subkeyframe", 400, false, false, CoD.TweenType.Linear )
						end
						internal.archetypeImage:setRGB( 0.64, 0.65, 0.67 )
						if event.interrupted then
							self.clipFinished( internal, event )
						else
							internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						internalFrame3( internal, event )
						return 
					else
						internal:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						internal:registerEventHandler( "transition_complete_keyframe", internalFrame3 )
					end
				end
				
				internal:completeAnimation()

				internal.archetypeImage:completeAnimation()
				self.internal.archetypeImage:setRGB( 1, 0.31, 0.2 )
				internalFrame2( internal, {} )

				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local internalFrame2 = function ( internal, event )
					if not event.interrupted then
						internal:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						internal.archetypeImage:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
					end
					internal.archetypeImage:setRGB( 0.76, 0.79, 0.87 )
					if event.interrupted then
						self.clipFinished( internal, event )
					else
						internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				internal:completeAnimation()

				internal.archetypeImage:completeAnimation()
				self.internal.archetypeImage:setRGB( 1, 0.31, 0.2 )
				internalFrame2( internal, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Shooting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "shootingAtPlayer" )
			end
		}
	} )
	self:linkToElementModel( self, "shootingAtPlayer", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "shootingAtPlayer"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
