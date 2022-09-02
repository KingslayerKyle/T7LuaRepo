-- 05a12285b1cd5b57caf70df55405eebb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryStalingrad.PodControlPieceWidget" )

CoD.PodControlWidget = InheritFrom( LUI.UIElement )
CoD.PodControlWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PodControlWidget )
	self.id = "PodControlWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 232 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 46.54, 148.64 )
	bg:setTopBottom( true, false, 55.96, 185.91 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_podcontrol_dlc3" ) )
	self:addElement( bg )
	self.bg = bg
	
	local PodControlPieceWidget = CoD.PodControlPieceWidget.new( menu, controller )
	PodControlPieceWidget:setLeftRight( true, false, 48.64, 147.64 )
	PodControlPieceWidget:setTopBottom( true, false, 73.44, 170.42 )
	PodControlPieceWidget:subscribeToGlobalModel( controller, "ZMStalingradInventory", "piece_cylinder", function ( model )
		local pieceCylinder = Engine.GetModelValue( model )
		if pieceCylinder then
			PodControlPieceWidget.PieceImageNewGreen:setImage( RegisterImage( StalingradCylinderImage( "_new", pieceCylinder ) ) )
		end
	end )
	PodControlPieceWidget:subscribeToGlobalModel( controller, "ZMStalingradInventory", "piece_cylinder", function ( model )
		local pieceCylinder = Engine.GetModelValue( model )
		if pieceCylinder then
			PodControlPieceWidget.PieceImage:setImage( RegisterImage( StalingradCylinderImage( "", pieceCylinder ) ) )
		end
	end )
	self:addElement( PodControlPieceWidget )
	self.PodControlPieceWidget = PodControlPieceWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				PodControlPieceWidget:completeAnimation()
				self.PodControlPieceWidget:setAlpha( 0 )
				self.clipFinished( PodControlPieceWidget, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							bg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2680, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				PodControlPieceWidget:completeAnimation()
				self.PodControlPieceWidget:setLeftRight( true, false, 45.64, 144.64 )
				self.PodControlPieceWidget:setTopBottom( true, false, 75.44, 172.42 )
				self.PodControlPieceWidget:setAlpha( 1 )
				self.PodControlPieceWidget:setScale( 0.68 )
				self.clipFinished( PodControlPieceWidget, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				PodControlPieceWidget:completeAnimation()
				self.PodControlPieceWidget:setAlpha( 1 )
				self.clipFinished( PodControlPieceWidget, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_cylinder" )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_cylinder" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_cylinder"
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
		element.PodControlPieceWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

