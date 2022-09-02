-- 4dd7046fbc82c1e371644e466ca08326
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.MatchStartWarningContainer" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMenuOccluded" )
end

CoD.MatchStartWarning = InheritFrom( LUI.UIElement )
CoD.MatchStartWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MatchStartWarning )
	self.id = "MatchStartWarning"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local MatchStartWarningContainer0 = CoD.MatchStartWarningContainer.new( menu, controller )
	MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
	MatchStartWarningContainer0:setTopBottom( true, false, 31, 81 )
	self:addElement( MatchStartWarningContainer0 )
	self.MatchStartWarningContainer0 = MatchStartWarningContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				MatchStartWarningContainer0:completeAnimation()
				self.MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
				self.MatchStartWarningContainer0:setTopBottom( true, false, -66, -16 )
				self.MatchStartWarningContainer0:setAlpha( 0 )
				self.clipFinished( MatchStartWarningContainer0, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 1 )

				local MatchStartWarningContainer0Frame2 = function ( MatchStartWarningContainer0, event )
					local MatchStartWarningContainer0Frame3 = function ( MatchStartWarningContainer0, event )
						local MatchStartWarningContainer0Frame4 = function ( MatchStartWarningContainer0, event )
							if not event.interrupted then
								MatchStartWarningContainer0:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
							end
							MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
							MatchStartWarningContainer0:setTopBottom( true, false, 31, 81 )
							MatchStartWarningContainer0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( MatchStartWarningContainer0, event )
							else
								MatchStartWarningContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							MatchStartWarningContainer0Frame4( MatchStartWarningContainer0, event )
							return 
						else
							MatchStartWarningContainer0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
							MatchStartWarningContainer0:setTopBottom( true, false, 25, 75 )
							MatchStartWarningContainer0:registerEventHandler( "transition_complete_keyframe", MatchStartWarningContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						MatchStartWarningContainer0Frame3( MatchStartWarningContainer0, event )
						return 
					else
						MatchStartWarningContainer0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						MatchStartWarningContainer0:setTopBottom( true, false, 46, 96 )
						MatchStartWarningContainer0:setAlpha( 1 )
						MatchStartWarningContainer0:registerEventHandler( "transition_complete_keyframe", MatchStartWarningContainer0Frame3 )
					end
				end
				
				MatchStartWarningContainer0:completeAnimation()
				self.MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
				self.MatchStartWarningContainer0:setTopBottom( true, false, -66, -16 )
				self.MatchStartWarningContainer0:setAlpha( 0 )
				MatchStartWarningContainer0Frame2( MatchStartWarningContainer0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				MatchStartWarningContainer0:completeAnimation()
				self.MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
				self.MatchStartWarningContainer0:setTopBottom( true, false, 31, 81 )
				self.MatchStartWarningContainer0:setAlpha( 1 )
				self.clipFinished( MatchStartWarningContainer0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local MatchStartWarningContainer0Frame2 = function ( MatchStartWarningContainer0, event )
					local MatchStartWarningContainer0Frame3 = function ( MatchStartWarningContainer0, event )
						if not event.interrupted then
							MatchStartWarningContainer0:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
						end
						MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
						MatchStartWarningContainer0:setTopBottom( true, false, -66, -16 )
						MatchStartWarningContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MatchStartWarningContainer0, event )
						else
							MatchStartWarningContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MatchStartWarningContainer0Frame3( MatchStartWarningContainer0, event )
						return 
					else
						MatchStartWarningContainer0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						MatchStartWarningContainer0:setTopBottom( true, false, 45, 95 )
						MatchStartWarningContainer0:registerEventHandler( "transition_complete_keyframe", MatchStartWarningContainer0Frame3 )
					end
				end
				
				MatchStartWarningContainer0:completeAnimation()
				self.MatchStartWarningContainer0:setLeftRight( false, false, -100, 100 )
				self.MatchStartWarningContainer0:setTopBottom( true, false, 31, 81 )
				self.MatchStartWarningContainer0:setAlpha( 1 )
				MatchStartWarningContainer0Frame2( MatchStartWarningContainer0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f12_local0 = IsMultiplayer()
				if f12_local0 then
					f12_local0 = IsGlobalModelValueGreaterThan( controller, "lobbyRoot.lobbyTimeRemaining", 0 )
					if f12_local0 then
						f12_local0 = IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyMenuOccluded" )
					end
				end
				return f12_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTimeRemaining"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMenuOccluded" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMenuOccluded"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MatchStartWarningContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

