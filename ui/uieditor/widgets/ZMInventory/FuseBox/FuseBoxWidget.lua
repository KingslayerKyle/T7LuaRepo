-- 0f9263fb1a8c3eabe93170582ebb46ab
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseWidget" )

CoD.FuseBoxWidget = InheritFrom( LUI.UIElement )
CoD.FuseBoxWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FuseBoxWidget )
	self.id = "FuseBoxWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local FuseBoxBg = LUI.UIImage.new()
	FuseBoxBg:setLeftRight( true, false, -38.56, 160.29 )
	FuseBoxBg:setTopBottom( true, false, -44.72, 209.72 )
	FuseBoxBg:setAlpha( 0 )
	FuseBoxBg:setImage( RegisterImage( "uie_t7_base_quest_fuse" ) )
	self:addElement( FuseBoxBg )
	self.FuseBoxBg = FuseBoxBg
	
	local FuseWidget1 = CoD.FuseWidget.new( menu, controller )
	FuseWidget1:setLeftRight( true, false, 13.5, 50.5 )
	FuseWidget1:setTopBottom( true, false, 36, 125 )
	FuseWidget1:setScale( 0.95 )
	FuseWidget1:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_1" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_1" )
			end
		}
	} )
	FuseWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FuseWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	FuseWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_01" ), function ( model )
		menu:updateElementState( FuseWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_01"
		} )
	end )
	FuseWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_02" ), function ( model )
		menu:updateElementState( FuseWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_02"
		} )
	end )
	FuseWidget1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_03" ), function ( model )
		menu:updateElementState( FuseWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_03"
		} )
	end )
	self:addElement( FuseWidget1 )
	self.FuseWidget1 = FuseWidget1
	
	local FuseWidget2 = CoD.FuseWidget.new( menu, controller )
	FuseWidget2:setLeftRight( true, false, 43.5, 84.5 )
	FuseWidget2:setTopBottom( true, false, 36, 125 )
	FuseWidget2:setScale( 0.95 )
	FuseWidget2:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_2" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_2" )
			end
		}
	} )
	FuseWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FuseWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	FuseWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_01" ), function ( model )
		menu:updateElementState( FuseWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_01"
		} )
	end )
	FuseWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_02" ), function ( model )
		menu:updateElementState( FuseWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_02"
		} )
	end )
	FuseWidget2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_03" ), function ( model )
		menu:updateElementState( FuseWidget2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_03"
		} )
	end )
	self:addElement( FuseWidget2 )
	self.FuseWidget2 = FuseWidget2
	
	local FuseWidget3 = CoD.FuseWidget.new( menu, controller )
	FuseWidget3:setLeftRight( true, false, 79.5, 112.5 )
	FuseWidget3:setTopBottom( true, false, 36, 125 )
	FuseWidget3:setScale( 0.95 )
	FuseWidget3:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_3" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return FuseBoxVisible( controller, "ZOD_CRAFTABLE_POLICE_BOX_FUSE_3" )
			end
		}
	} )
	FuseWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FuseWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	FuseWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_01" ), function ( model )
		menu:updateElementState( FuseWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_01"
		} )
	end )
	FuseWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_02" ), function ( model )
		menu:updateElementState( FuseWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_02"
		} )
	end )
	FuseWidget3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.police_box_fuse_03" ), function ( model )
		menu:updateElementState( FuseWidget3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.police_box_fuse_03"
		} )
	end )
	self:addElement( FuseWidget3 )
	self.FuseWidget3 = FuseWidget3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FuseBoxBg:completeAnimation()
				self.FuseBoxBg:setAlpha( 0 )
				self.clipFinished( FuseBoxBg, {} )
				FuseWidget1:completeAnimation()
				self.FuseWidget1:setAlpha( 0 )
				self.clipFinished( FuseWidget1, {} )
				FuseWidget2:completeAnimation()
				self.FuseWidget2:setAlpha( 0 )
				self.clipFinished( FuseWidget2, {} )
				FuseWidget3:completeAnimation()
				self.FuseWidget3:setAlpha( 0 )
				self.clipFinished( FuseWidget3, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local FuseBoxBgFrame2 = function ( FuseBoxBg, event )
					local FuseBoxBgFrame3 = function ( FuseBoxBg, event )
						local FuseBoxBgFrame4 = function ( FuseBoxBg, event )
							if not event.interrupted then
								FuseBoxBg:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
							end
							FuseBoxBg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FuseBoxBg, event )
							else
								FuseBoxBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FuseBoxBgFrame4( FuseBoxBg, event )
							return 
						else
							FuseBoxBg:beginAnimation( "keyframe", 2710, false, false, CoD.TweenType.Linear )
							FuseBoxBg:registerEventHandler( "transition_complete_keyframe", FuseBoxBgFrame4 )
						end
					end
					
					if event.interrupted then
						FuseBoxBgFrame3( FuseBoxBg, event )
						return 
					else
						FuseBoxBg:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						FuseBoxBg:setAlpha( 1 )
						FuseBoxBg:registerEventHandler( "transition_complete_keyframe", FuseBoxBgFrame3 )
					end
				end
				
				FuseBoxBg:completeAnimation()
				self.FuseBoxBg:setAlpha( 0 )
				FuseBoxBgFrame2( FuseBoxBg, {} )
				FuseWidget1:completeAnimation()
				self.FuseWidget1:setAlpha( 1 )
				self.clipFinished( FuseWidget1, {} )
				FuseWidget2:completeAnimation()
				self.FuseWidget2:setAlpha( 1 )
				self.clipFinished( FuseWidget2, {} )
				FuseWidget3:completeAnimation()
				self.FuseWidget3:setAlpha( 1 )
				self.clipFinished( FuseWidget3, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FuseBoxBg:completeAnimation()
				self.FuseBoxBg:setAlpha( 0 )
				self.clipFinished( FuseBoxBg, {} )
				FuseWidget1:completeAnimation()
				self.FuseWidget1:setAlpha( 1 )
				self.clipFinished( FuseWidget1, {} )
				FuseWidget2:completeAnimation()
				self.FuseWidget2:setAlpha( 1 )
				self.clipFinished( FuseWidget2, {} )
				FuseWidget3:completeAnimation()
				self.FuseWidget3:setAlpha( 1 )
				self.clipFinished( FuseWidget3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowFuseBoxWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_fuses" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_fuses"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FuseWidget1:close()
		element.FuseWidget2:close()
		element.FuseWidget3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

