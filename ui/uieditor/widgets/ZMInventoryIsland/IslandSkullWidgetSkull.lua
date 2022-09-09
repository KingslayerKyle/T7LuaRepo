-- d358fc1939cb000469996bff7eb0018e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )

CoD.IslandSkullWidgetSkull = InheritFrom( LUI.UIElement )
CoD.IslandSkullWidgetSkull.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IslandSkullWidgetSkull )
	self.id = "IslandSkullWidgetSkull"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 164 )
	self:setTopBottom( true, false, 0, 164 )
	self.anyChildUsesUpdateState = true
	
	local newBacking = LUI.UIImage.new()
	newBacking:setLeftRight( true, true, 0, 0 )
	newBacking:setTopBottom( true, true, 0, 0 )
	newBacking:subscribeToGlobalModel( controller, "ZMIslandInventory", "skull_skull_state", function ( model )
		local skullSkullState = Engine.GetModelValue( model )
		if skullSkullState then
			newBacking:setImage( RegisterImage( GetSkullStateNewImage( skullSkullState ) ) )
		end
	end )
	self:addElement( newBacking )
	self.newBacking = newBacking
	
	local skull = LUI.UIImage.new()
	skull:setLeftRight( true, true, 0, 0 )
	skull:setTopBottom( true, true, 0, 0 )
	skull:subscribeToGlobalModel( controller, "ZMIslandInventory", "skull_skull_state", function ( model )
		local skullSkullState = Engine.GetModelValue( model )
		if skullSkullState then
			skull:setImage( RegisterImage( GetSkullStateImage( skullSkullState ) ) )
		end
	end )
	self:addElement( skull )
	self.skull = skull
	
	local skullTypeW = CoD.onOffImage.new( menu, controller )
	skullTypeW:setLeftRight( true, true, 0, 0 )
	skullTypeW:setTopBottom( true, true, 0, 0 )
	skullTypeW:subscribeToGlobalModel( controller, "ZMIslandInventory", "skull_skull_type", function ( model )
		local skullSkullType = Engine.GetModelValue( model )
		if skullSkullType then
			skullTypeW.image:setImage( RegisterImage( GetSkullTypeImage( skullSkullType ) ) )
		end
	end )
	skullTypeW:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.skull_skull_state", 1 ) and IsModelValueLessThanOrEqualTo( controller, "zmInventory.skull_skull_state", 2 )
			end
		}
	} )
	skullTypeW:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.skull_skull_state" ), function ( model )
		menu:updateElementState( skullTypeW, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.skull_skull_state"
		} )
	end )
	self:addElement( skullTypeW )
	self.skullTypeW = skullTypeW
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				newBacking:completeAnimation()
				self.newBacking:setAlpha( 0 )
				self.clipFinished( newBacking, {} )

				skull:completeAnimation()
				self.skull:setAlpha( 0 )
				self.clipFinished( skull, {} )

				skullTypeW:completeAnimation()
				self.skullTypeW:setAlpha( 0 )
				self.clipFinished( skullTypeW, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				newBacking:completeAnimation()
				self.newBacking:setAlpha( 0 )
				self.clipFinished( newBacking, {} )

				skull:completeAnimation()
				self.skull:setAlpha( 1 )
				self.clipFinished( skull, {} )

				skullTypeW:completeAnimation()
				self.skullTypeW:setAlpha( 1 )
				self.clipFinished( skullTypeW, {} )
			end
		},
		NewNotice = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local newBackingFrame2 = function ( newBacking, event )
					local newBackingFrame3 = function ( newBacking, event )
						local newBackingFrame4 = function ( newBacking, event )
							if not event.interrupted then
								newBacking:beginAnimation( "keyframe", 499, false, false, CoD.TweenType.Linear )
							end
							newBacking:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( newBacking, event )
							else
								newBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							newBackingFrame4( newBacking, event )
							return 
						else
							newBacking:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							newBacking:setAlpha( 1 )
							newBacking:registerEventHandler( "transition_complete_keyframe", newBackingFrame4 )
						end
					end
					
					if event.interrupted then
						newBackingFrame3( newBacking, event )
						return 
					else
						newBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						newBacking:setAlpha( 0.7 )
						newBacking:registerEventHandler( "transition_complete_keyframe", newBackingFrame3 )
					end
				end
				
				newBacking:completeAnimation()
				self.newBacking:setAlpha( 1 )
				newBackingFrame2( newBacking, {} )

				skull:completeAnimation()
				self.skull:setAlpha( 1 )
				self.clipFinished( skull, {} )

				skullTypeW:completeAnimation()
				self.skullTypeW:setAlpha( 1 )
				self.clipFinished( skullTypeW, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "NewNotice",
			condition = function ( menu, element, event )
				return ShowSkullPartsWidget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_skull_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_skull_parts"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.skullTypeW:close()
		element.newBacking:close()
		element.skull:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
