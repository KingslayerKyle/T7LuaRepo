require( "ui.uieditor.widgets.Notifications.Perks.Notification_Perks" )

CoD.NotificationPerksContainer = InheritFrom( LUI.UIElement )
CoD.NotificationPerksContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationPerksContainer )
	self.id = "NotificationPerksContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 170 )
	self.anyChildUsesUpdateState = true
	
	local Perks = CoD.Notification_Perks.new( menu, controller )
	Perks:setLeftRight( false, true, -500, 0 )
	Perks:setTopBottom( false, true, -170, 0 )
	Perks:setAlpha( 0 )
	Perks:setYRot( -20 )
	Perks:registerEventHandler( "hud_boot", function ( element, event )
		local f2_local0 = nil
		if IsInPrematchPeriod() then
			PlayClip( self, "hud_start", controller )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	Perks:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f3_local0 = Perks
		if IsParamModelEqualToString( model, "show_perk_notification" ) and not IsInPrematchPeriod() and HasPerksInAnySlot( controller ) then
			PlayClip( self, "hud_start", controller )
		end
	end )
	Perks:mergeStateConditions( {
		{
			stateName = "Perk0",
			condition = function ( menu, element, event )
				local f4_local0 = HasPerksInSlot0( controller )
				if f4_local0 then
					if not HasPerksInSlot1( controller ) then
						f4_local0 = not HasPerksInSlot2( controller )
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "Perk0_Perk1_Perk2",
			condition = function ( menu, element, event )
				local f5_local0 = HasPerksInSlot0( controller )
				if f5_local0 then
					f5_local0 = HasPerksInSlot1( controller )
					if f5_local0 then
						f5_local0 = HasPerksInSlot2( controller )
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "Perk0_Perk1",
			condition = function ( menu, element, event )
				local f6_local0 = HasPerksInSlot0( controller )
				if f6_local0 then
					f6_local0 = HasPerksInSlot1( controller )
					if f6_local0 then
						f6_local0 = not HasPerksInSlot2( controller )
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "Perk0_Perk2",
			condition = function ( menu, element, event )
				local f7_local0 = HasPerksInSlot0( controller )
				if f7_local0 then
					if not HasPerksInSlot1( controller ) then
						f7_local0 = HasPerksInSlot2( controller )
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "Perk1",
			condition = function ( menu, element, event )
				local f8_local0
				if not HasPerksInSlot0( controller ) then
					f8_local0 = HasPerksInSlot1( controller )
					if f8_local0 then
						f8_local0 = not HasPerksInSlot2( controller )
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Perk1_Perk2",
			condition = function ( menu, element, event )
				local f9_local0
				if not HasPerksInSlot0( controller ) then
					f9_local0 = HasPerksInSlot1( controller )
					if f9_local0 then
						f9_local0 = HasPerksInSlot2( controller )
					end
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Perk2",
			condition = function ( menu, element, event )
				local f10_local0
				if not HasPerksInSlot0( controller ) and not HasPerksInSlot1( controller ) then
					f10_local0 = HasPerksInSlot2( controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk0_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk0_count"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk1_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk1_count"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk2_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk2_count"
		} )
	end )
	self:addElement( Perks )
	self.Perks = Perks
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Perks:completeAnimation()
				self.Perks:setAlpha( 0 )
				self.Perks:setZoom( 0 )
				self.clipFinished( Perks, {} )
			end,
			hud_start = function ()
				self:setupElementClipCounter( 1 )
				local PerksFrame2 = function ( Perks, event )
					local PerksFrame3 = function ( Perks, event )
						local PerksFrame4 = function ( Perks, event )
							if not event.interrupted then
								Perks:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Bounce )
							end
							Perks:setAlpha( 0 )
							Perks:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( Perks, event )
							else
								Perks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PerksFrame4( Perks, event )
							return 
						else
							Perks:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							Perks:registerEventHandler( "transition_complete_keyframe", PerksFrame4 )
						end
					end
					
					if event.interrupted then
						PerksFrame3( Perks, event )
						return 
					else
						Perks:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						Perks:setAlpha( 1 )
						Perks:registerEventHandler( "transition_complete_keyframe", PerksFrame3 )
					end
				end
				
				Perks:completeAnimation()
				self.Perks:setAlpha( 0 )
				self.Perks:setZoom( 0 )
				PerksFrame2( Perks, {} )
			end,
			hud_stop = function ()
				self:setupElementClipCounter( 1 )
				local PerksFrame2 = function ( Perks, event )
					if not event.interrupted then
						Perks:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					Perks:setAlpha( 0 )
					Perks:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Perks, event )
					else
						Perks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Perks:completeAnimation()
				self.Perks:setAlpha( 1 )
				self.Perks:setZoom( 0 )
				PerksFrame2( Perks, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Perks:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

