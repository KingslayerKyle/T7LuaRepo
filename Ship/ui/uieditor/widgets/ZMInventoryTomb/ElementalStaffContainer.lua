-- 259bdbc2400f4c3f78822c4ac32c8543
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.ZMInventoryTomb.ElementalStaffItem" )

CoD.ElementalStaffContainer = InheritFrom( LUI.UIElement )
CoD.ElementalStaffContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ElementalStaffContainer )
	self.id = "ElementalStaffContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 132 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -50, 50 )
	ZmFxSpark20:setTopBottom( false, false, -66, 66 )
	ZmFxSpark20:setScale( 0.9 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local ElementalStaffItem = CoD.ElementalStaffItem.new( menu, controller )
	ElementalStaffItem:setLeftRight( false, false, -50, 50 )
	ElementalStaffItem:setTopBottom( false, false, -66, 66 )
	ElementalStaffItem.UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_water" ) )
	ElementalStaffItem:linkToElementModel( self, nil, false, function ( model )
		ElementalStaffItem:setModel( model, controller )
	end )
	self:addElement( ElementalStaffItem )
	self.ElementalStaffItem = ElementalStaffItem
	
	self.clipsPerState = {
		ScoreboardFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 1 )
				self.clipFinished( ElementalStaffItem, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 1 )
				self.clipFinished( ElementalStaffItem, {} )
			end,
			Found = function ()
				self:setupElementClipCounter( 2 )

				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 2559, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local ElementalStaffItemFrame2 = function ( ElementalStaffItem, event )
					local ElementalStaffItemFrame3 = function ( ElementalStaffItem, event )
						local ElementalStaffItemFrame4 = function ( ElementalStaffItem, event )
							if not event.interrupted then
								ElementalStaffItem:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							ElementalStaffItem:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ElementalStaffItem, event )
							else
								ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElementalStaffItemFrame4( ElementalStaffItem, event )
							return 
						else
							ElementalStaffItem:beginAnimation( "keyframe", 2660, false, false, CoD.TweenType.Linear )
							ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", ElementalStaffItemFrame4 )
						end
					end
					
					if event.interrupted then
						ElementalStaffItemFrame3( ElementalStaffItem, event )
						return 
					else
						ElementalStaffItem:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ElementalStaffItem:setAlpha( 1 )
						ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", ElementalStaffItemFrame3 )
					end
				end
				
				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 0 )
				ElementalStaffItemFrame2( ElementalStaffItem, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				local ElementalStaffItemFrame2 = function ( ElementalStaffItem, event )
					local ElementalStaffItemFrame3 = function ( ElementalStaffItem, event )
						local ElementalStaffItemFrame4 = function ( ElementalStaffItem, event )
							if not event.interrupted then
								ElementalStaffItem:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							ElementalStaffItem:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ElementalStaffItem, event )
							else
								ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElementalStaffItemFrame4( ElementalStaffItem, event )
							return 
						else
							ElementalStaffItem:beginAnimation( "keyframe", 2660, false, false, CoD.TweenType.Linear )
							ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", ElementalStaffItemFrame4 )
						end
					end
					
					if event.interrupted then
						ElementalStaffItemFrame3( ElementalStaffItem, event )
						return 
					else
						ElementalStaffItem:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ElementalStaffItem:setAlpha( 1 )
						ElementalStaffItem:registerEventHandler( "transition_complete_keyframe", ElementalStaffItemFrame3 )
					end
				end
				
				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 0 )
				ElementalStaffItemFrame2( ElementalStaffItem, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 1 )
				self.clipFinished( ElementalStaffItem, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ElementalStaffItem:completeAnimation()
				self.ElementalStaffItem:setAlpha( 1 )
				self.clipFinished( ElementalStaffItem, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "visible", 1 )
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
	self:linkToElementModel( self, "visible", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
		element.ElementalStaffItem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
