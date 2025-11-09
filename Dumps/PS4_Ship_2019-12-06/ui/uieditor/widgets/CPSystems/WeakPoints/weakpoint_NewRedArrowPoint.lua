require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedArrow" )

CoD.weakpoint_NewRedArrowPoint = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedArrowPoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewRedArrowPoint )
	self.id = "weakpoint_NewRedArrowPoint"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local weakpointNewRedArrow1 = CoD.weakpoint_NewRedArrow.new( menu, controller )
	weakpointNewRedArrow1:setLeftRight( false, false, -20, 20 )
	weakpointNewRedArrow1:setTopBottom( false, false, -18, 6 )
	self:addElement( weakpointNewRedArrow1 )
	self.weakpointNewRedArrow1 = weakpointNewRedArrow1
	
	local weakpointNewRedArrow2 = CoD.weakpoint_NewRedArrow.new( menu, controller )
	weakpointNewRedArrow2:setLeftRight( false, false, -20, 20 )
	weakpointNewRedArrow2:setTopBottom( false, false, -6, 18 )
	weakpointNewRedArrow2:setAlpha( 0.5 )
	self:addElement( weakpointNewRedArrow2 )
	self.weakpointNewRedArrow2 = weakpointNewRedArrow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local weakpointNewRedArrow1Frame2 = function ( weakpointNewRedArrow1, event )
					local weakpointNewRedArrow1Frame3 = function ( weakpointNewRedArrow1, event )
						local weakpointNewRedArrow1Frame4 = function ( weakpointNewRedArrow1, event )
							local weakpointNewRedArrow1Frame5 = function ( weakpointNewRedArrow1, event )
								if not event.interrupted then
									weakpointNewRedArrow1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								end
								weakpointNewRedArrow1:setLeftRight( false, false, -20, 20 )
								weakpointNewRedArrow1:setTopBottom( false, false, -18, 6 )
								weakpointNewRedArrow1:setAlpha( 1 )
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
								weakpointNewRedArrow1:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								weakpointNewRedArrow1:setTopBottom( false, false, -28, -4 )
								weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewRedArrow1Frame4( weakpointNewRedArrow1, event )
							return 
						else
							weakpointNewRedArrow1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							weakpointNewRedArrow1:setTopBottom( false, false, 6, 30 )
							weakpointNewRedArrow1:setAlpha( 0 )
							weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow1Frame3( weakpointNewRedArrow1, event )
						return 
					else
						weakpointNewRedArrow1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow1:setTopBottom( false, false, -6, 18 )
						weakpointNewRedArrow1:setAlpha( 0.5 )
						weakpointNewRedArrow1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow1Frame3 )
					end
				end
				
				weakpointNewRedArrow1:completeAnimation()
				self.weakpointNewRedArrow1:setLeftRight( false, false, -20, 20 )
				self.weakpointNewRedArrow1:setTopBottom( false, false, -18, 6 )
				self.weakpointNewRedArrow1:setAlpha( 1 )
				weakpointNewRedArrow1Frame2( weakpointNewRedArrow1, {} )
				local weakpointNewRedArrow2Frame2 = function ( weakpointNewRedArrow2, event )
					local weakpointNewRedArrow2Frame3 = function ( weakpointNewRedArrow2, event )
						local weakpointNewRedArrow2Frame4 = function ( weakpointNewRedArrow2, event )
							local weakpointNewRedArrow2Frame5 = function ( weakpointNewRedArrow2, event )
								if not event.interrupted then
									weakpointNewRedArrow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								end
								weakpointNewRedArrow2:setLeftRight( false, false, -20, 20 )
								weakpointNewRedArrow2:setTopBottom( false, false, -6, 18 )
								weakpointNewRedArrow2:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( weakpointNewRedArrow2, event )
								else
									weakpointNewRedArrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								weakpointNewRedArrow2Frame5( weakpointNewRedArrow2, event )
								return 
							else
								weakpointNewRedArrow2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								weakpointNewRedArrow2:setTopBottom( false, false, -18, 6 )
								weakpointNewRedArrow2:setAlpha( 1 )
								weakpointNewRedArrow2:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow2Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewRedArrow2Frame4( weakpointNewRedArrow2, event )
							return 
						else
							weakpointNewRedArrow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							weakpointNewRedArrow2:setTopBottom( false, false, -28, -4 )
							weakpointNewRedArrow2:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow2Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow2Frame3( weakpointNewRedArrow2, event )
						return 
					else
						weakpointNewRedArrow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow2:setTopBottom( false, false, 6, 30 )
						weakpointNewRedArrow2:setAlpha( 0 )
						weakpointNewRedArrow2:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow2Frame3 )
					end
				end
				
				weakpointNewRedArrow2:completeAnimation()
				self.weakpointNewRedArrow2:setLeftRight( false, false, -20, 20 )
				self.weakpointNewRedArrow2:setTopBottom( false, false, -6, 18 )
				self.weakpointNewRedArrow2:setAlpha( 0.5 )
				weakpointNewRedArrow2Frame2( weakpointNewRedArrow2, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewRedArrow1:close()
		element.weakpointNewRedArrow2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

