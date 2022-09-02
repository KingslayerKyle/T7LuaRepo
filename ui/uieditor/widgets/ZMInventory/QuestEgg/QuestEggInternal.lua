-- a8bd340b6b4f21d41cee64de0130e13a
-- This hash is used for caching, delete to decompile the file again

CoD.QuestEggInternal = InheritFrom( LUI.UIElement )
CoD.QuestEggInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.QuestEggInternal )
	self.id = "QuestEggInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 81 )
	
	local State1 = LUI.UIImage.new()
	State1:setLeftRight( true, false, 0, 81 )
	State1:setTopBottom( true, false, 0, 81 )
	State1:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q1_25" ) )
	self:addElement( State1 )
	self.State1 = State1
	
	local State2 = LUI.UIImage.new()
	State2:setLeftRight( true, false, 1, 82 )
	State2:setTopBottom( true, false, 0, 81 )
	State2:setScale( 1.05 )
	State2:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q1_50" ) )
	self:addElement( State2 )
	self.State2 = State2
	
	local State3 = LUI.UIImage.new()
	State3:setLeftRight( true, false, 1, 83 )
	State3:setTopBottom( true, false, -1, 81 )
	State3:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q1_75" ) )
	self:addElement( State3 )
	self.State3 = State3
	
	local State4 = LUI.UIImage.new()
	State4:setLeftRight( true, false, 0, 85 )
	State4:setTopBottom( true, false, -2.5, 82.5 )
	State4:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q1_100" ) )
	self:addElement( State4 )
	self.State4 = State4
	
	local DefaultEggState = LUI.UIImage.new()
	DefaultEggState:setLeftRight( true, false, 0, 81 )
	DefaultEggState:setTopBottom( true, false, 0, 81 )
	DefaultEggState:setAlpha( 0 )
	DefaultEggState:setImage( RegisterImage( "uie_t7_icon_inventory_egg_q1_default" ) )
	self:addElement( DefaultEggState )
	self.DefaultEggState = DefaultEggState
	
	local MissingImage = LUI.UIImage.new()
	MissingImage:setLeftRight( true, false, 1, 82 )
	MissingImage:setTopBottom( true, false, 0, 81 )
	MissingImage:setAlpha( 0 )
	MissingImage:setImage( RegisterImage( "uie_t7_icon_inventory_egg_disabled" ) )
	self:addElement( MissingImage )
	self.MissingImage = MissingImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end,
			DefaultEgg = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )
				local DefaultEggStateFrame2 = function ( DefaultEggState, event )
					local DefaultEggStateFrame3 = function ( DefaultEggState, event )
						local DefaultEggStateFrame4 = function ( DefaultEggState, event )
							local DefaultEggStateFrame5 = function ( DefaultEggState, event )
								if not event.interrupted then
									DefaultEggState:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								DefaultEggState:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( DefaultEggState, event )
								else
									DefaultEggState:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DefaultEggStateFrame5( DefaultEggState, event )
								return 
							else
								DefaultEggState:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								DefaultEggState:setAlpha( 0 )
								DefaultEggState:registerEventHandler( "transition_complete_keyframe", DefaultEggStateFrame5 )
							end
						end
						
						if event.interrupted then
							DefaultEggStateFrame4( DefaultEggState, event )
							return 
						else
							DefaultEggState:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							DefaultEggState:setAlpha( 1 )
							DefaultEggState:registerEventHandler( "transition_complete_keyframe", DefaultEggStateFrame4 )
						end
					end
					
					if event.interrupted then
						DefaultEggStateFrame3( DefaultEggState, event )
						return 
					else
						DefaultEggState:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						DefaultEggState:setAlpha( 0 )
						DefaultEggState:registerEventHandler( "transition_complete_keyframe", DefaultEggStateFrame3 )
					end
				end
				
				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 1 )
				DefaultEggStateFrame2( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		State1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 1 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		State2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 1 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		State3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 1 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		State4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 1 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		DefaultEgg = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 1 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 0 )
				self.clipFinished( MissingImage, {} )
			end
		},
		Missing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				State1:completeAnimation()
				self.State1:setAlpha( 0 )
				self.clipFinished( State1, {} )

				State2:completeAnimation()
				self.State2:setAlpha( 0 )
				self.clipFinished( State2, {} )

				State3:completeAnimation()
				self.State3:setAlpha( 0 )
				self.clipFinished( State3, {} )

				State4:completeAnimation()
				self.State4:setAlpha( 0 )
				self.clipFinished( State4, {} )

				DefaultEggState:completeAnimation()
				self.DefaultEggState:setAlpha( 0 )
				self.clipFinished( DefaultEggState, {} )

				MissingImage:completeAnimation()
				self.MissingImage:setAlpha( 1 )
				self.clipFinished( MissingImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "State1",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_1_CHARGE" )
			end
		},
		{
			stateName = "State2",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_2_CHARGES" )
			end
		},
		{
			stateName = "State3",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_3_CHARGES" )
			end
		},
		{
			stateName = "State4",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_4_CHARGES" )
			end
		},
		{
			stateName = "DefaultEgg",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_ACQUIRED" )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return QuestEggInState( controller, "UI_EGG_STATE_MISSING" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_egg_state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_egg_state"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_sword_quest_completed_level_1" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_sword_quest_completed_level_1"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

