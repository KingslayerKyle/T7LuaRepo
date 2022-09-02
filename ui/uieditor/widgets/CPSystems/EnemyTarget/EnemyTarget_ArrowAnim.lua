-- afd733deb34f5e6cd5e5847bec01840d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.EnemyTarget.EnemyTarget_Arrow" )

CoD.EnemyTarget_ArrowAnim = InheritFrom( LUI.UIElement )
CoD.EnemyTarget_ArrowAnim.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EnemyTarget_ArrowAnim )
	self.id = "EnemyTarget_ArrowAnim"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 50 )
	
	local weakpointNewRedArrow0 = CoD.EnemyTarget_Arrow.new( menu, controller )
	weakpointNewRedArrow0:setLeftRight( true, false, 0, 60 )
	weakpointNewRedArrow0:setTopBottom( true, false, 0, 36 )
	self:addElement( weakpointNewRedArrow0 )
	self.weakpointNewRedArrow0 = weakpointNewRedArrow0
	
	local weakpointNewRedArrow1 = CoD.EnemyTarget_Arrow.new( menu, controller )
	weakpointNewRedArrow1:setLeftRight( true, false, 0, 60 )
	weakpointNewRedArrow1:setTopBottom( true, false, 14, 50 )
	weakpointNewRedArrow1:setAlpha( 0.5 )
	self:addElement( weakpointNewRedArrow1 )
	self.weakpointNewRedArrow1 = weakpointNewRedArrow1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					local weakpointNewRedArrow0Frame3 = function ( weakpointNewRedArrow0, event )
						local weakpointNewRedArrow0Frame4 = function ( weakpointNewRedArrow0, event )
							local weakpointNewRedArrow0Frame5 = function ( weakpointNewRedArrow0, event )
								if not event.interrupted then
									weakpointNewRedArrow0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								weakpointNewRedArrow0:setLeftRight( true, false, 0, 60 )
								weakpointNewRedArrow0:setTopBottom( true, false, 0, 36 )
								weakpointNewRedArrow0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( weakpointNewRedArrow0, event )
								else
									weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								weakpointNewRedArrow0Frame5( weakpointNewRedArrow0, event )
								return 
							else
								weakpointNewRedArrow0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								weakpointNewRedArrow0:setTopBottom( true, false, -16, 20 )
								weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow0Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewRedArrow0Frame4( weakpointNewRedArrow0, event )
							return 
						else
							weakpointNewRedArrow0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							weakpointNewRedArrow0:setTopBottom( true, false, 29, 65 )
							weakpointNewRedArrow0:setAlpha( 0 )
							weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow0Frame3( weakpointNewRedArrow0, event )
						return 
					else
						weakpointNewRedArrow0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow0:setTopBottom( true, false, 14, 50 )
						weakpointNewRedArrow0:setAlpha( 0.5 )
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow0Frame3 )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setLeftRight( true, false, 0, 60 )
				self.weakpointNewRedArrow0:setTopBottom( true, false, 0, 36 )
				self.weakpointNewRedArrow0:setAlpha( 1 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow1Frame2 = function ( weakpointNewRedArrow1, event )
					local weakpointNewRedArrow1Frame3 = function ( weakpointNewRedArrow1, event )
						local weakpointNewRedArrow1Frame4 = function ( weakpointNewRedArrow1, event )
							local weakpointNewRedArrow1Frame5 = function ( weakpointNewRedArrow1, event )
								if not event.interrupted then
									weakpointNewRedArrow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								weakpointNewRedArrow1:setLeftRight( true, false, 0, 60 )
								weakpointNewRedArrow1:setTopBottom( true, false, 14, 50 )
								weakpointNewRedArrow1:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( weakpointNewRedArrow1, event )
								else
									weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								weakpointNewRedArrow1Frame5( weakpointNewRedArrow1, event )
								return 
							else
								weakpointNewRedArrow1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								weakpointNewRedArrow1:setTopBottom( true, false, 0, 36 )
								weakpointNewRedArrow1:setAlpha( 1 )
								weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewRedArrow1Frame4( weakpointNewRedArrow1, event )
							return 
						else
							weakpointNewRedArrow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							weakpointNewRedArrow1:setTopBottom( true, false, -16, 20 )
							weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow1Frame3( weakpointNewRedArrow1, event )
						return 
					else
						weakpointNewRedArrow1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow1:setTopBottom( true, false, 29, 65 )
						weakpointNewRedArrow1:setAlpha( 0 )
						weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame3 )
					end
				end
				
				weakpointNewRedArrow1:completeAnimation()
				self.weakpointNewRedArrow1:setLeftRight( true, false, 0, 60 )
				self.weakpointNewRedArrow1:setTopBottom( true, false, 14, 50 )
				self.weakpointNewRedArrow1:setAlpha( 0.5 )
				weakpointNewRedArrow1Frame2( weakpointNewRedArrow1, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Null = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewRedArrow0:close()
		element.weakpointNewRedArrow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

