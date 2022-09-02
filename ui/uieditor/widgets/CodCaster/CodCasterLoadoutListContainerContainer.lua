-- 9cdf233bc547f1a3e935fbf1ad879a32
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutListContainer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItem" )

CoD.CodCasterLoadoutListContainerContainer = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutListContainerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutListContainerContainer )
	self.id = "CodCasterLoadoutListContainerContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 721 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterLoadoutListContainer = CoD.CodCasterLoadoutListContainer.new( menu, controller )
	CodCasterLoadoutListContainer:setLeftRight( true, false, -100, 1081 )
	CodCasterLoadoutListContainer:setTopBottom( true, false, 0, 92 )
	self:addElement( CodCasterLoadoutListContainer )
	self.CodCasterLoadoutListContainer = CodCasterLoadoutListContainer
	
	local PerksAlways = CoD.CodCasterLoadoutItem.new( menu, controller )
	PerksAlways:setLeftRight( true, false, 1, 121 )
	PerksAlways:setTopBottom( true, false, 20, 92 )
	PerksAlways.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutPerks" )
	PerksAlways:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return HasPerksInAnySlot( controller ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_perks", Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ALWAYS )
			end
		}
	} )
	PerksAlways:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" ), function ( model )
		menu:updateElementState( PerksAlways, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.platformUpdate"
		} )
	end )
	PerksAlways:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk0_count" ), function ( model )
		menu:updateElementState( PerksAlways, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk0_count"
		} )
	end )
	PerksAlways:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk1_count" ), function ( model )
		menu:updateElementState( PerksAlways, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk1_count"
		} )
	end )
	PerksAlways:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk2_count" ), function ( model )
		menu:updateElementState( PerksAlways, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk2_count"
		} )
	end )
	PerksAlways:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( PerksAlways, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( PerksAlways )
	self.PerksAlways = PerksAlways
	
	local PerksOnSpawn = CoD.CodCasterLoadoutItem.new( menu, controller )
	PerksOnSpawn:setLeftRight( true, false, 1, 121 )
	PerksOnSpawn:setTopBottom( true, false, 20, 92 )
	PerksOnSpawn.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutPerks" )
	PerksOnSpawn:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( PerksOnSpawn )
	self.PerksOnSpawn = PerksOnSpawn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CodCasterLoadoutListContainer:completeAnimation()
				self.CodCasterLoadoutListContainer:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutListContainer, {} )

				PerksAlways:completeAnimation()
				self.PerksAlways:setAlpha( 1 )
				self.clipFinished( PerksAlways, {} )

				PerksOnSpawn:completeAnimation()
				self.PerksOnSpawn:setAlpha( 0 )
				self.clipFinished( PerksOnSpawn, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 3 )

				local CodCasterLoadoutListContainerFrame2 = function ( CodCasterLoadoutListContainer, event )
					if not event.interrupted then
						CodCasterLoadoutListContainer:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					CodCasterLoadoutListContainer:setLeftRight( true, false, -100, 1043 )
					CodCasterLoadoutListContainer:setTopBottom( true, false, 0, 97 )
					CodCasterLoadoutListContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CodCasterLoadoutListContainer, event )
					else
						CodCasterLoadoutListContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CodCasterLoadoutListContainer:completeAnimation()
				self.CodCasterLoadoutListContainer:setLeftRight( true, false, -100, 0 )
				self.CodCasterLoadoutListContainer:setTopBottom( true, false, 0, 97 )
				self.CodCasterLoadoutListContainer:setAlpha( 1 )
				CodCasterLoadoutListContainerFrame2( CodCasterLoadoutListContainer, {} )

				PerksAlways:completeAnimation()
				self.PerksAlways:setAlpha( 0 )
				self.clipFinished( PerksAlways, {} )

				PerksOnSpawn:completeAnimation()
				self.PerksOnSpawn:setAlpha( 0 )
				self.clipFinished( PerksOnSpawn, {} )
			end,
			ShowPerksOnSpawn = function ()
				self:setupElementClipCounter( 1 )

				local f12_local0 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							if not f15_arg1.interrupted then
								f15_arg0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							end
							f15_arg0:setAlpha( 0 )
							if f15_arg1.interrupted then
								self.clipFinished( f15_arg0, f15_arg1 )
							else
								f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f14_arg1.interrupted then
							f14_local0( f14_arg0, f14_arg1 )
							return 
						else
							f14_arg0:beginAnimation( "keyframe", 2419, false, false, CoD.TweenType.Linear )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						f13_arg0:setAlpha( 1 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				PerksOnSpawn:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				self.PerksOnSpawn:setAlpha( 0 )
				PerksOnSpawn:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CodCasterLoadoutListContainer:completeAnimation()
				self.CodCasterLoadoutListContainer:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutListContainer, {} )

				PerksAlways:completeAnimation()
				self.PerksAlways:setAlpha( 0 )
				self.clipFinished( PerksAlways, {} )

				PerksOnSpawn:completeAnimation()
				self.PerksOnSpawn:setAlpha( 0 )
				self.clipFinished( PerksOnSpawn, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "CodCaster.showLoadout" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showLoadout" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showLoadout"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f19_local0 = self
		if IsParamModelEqualToString( model, "player_spawned" ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_perks", Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ON ) then
			PlayClip( self, "ShowPerksOnSpawn", controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterLoadoutListContainer:close()
		element.PerksAlways:close()
		element.PerksOnSpawn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

