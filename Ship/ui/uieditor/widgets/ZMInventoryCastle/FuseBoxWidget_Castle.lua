-- 1acea085a45e2a7fda346445f51a6f34
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryCastle.FuseWidget_Castle" )

CoD.FuseBoxWidget_Castle = InheritFrom( LUI.UIElement )
CoD.FuseBoxWidget_Castle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FuseBoxWidget_Castle )
	self.id = "FuseBoxWidget_Castle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 65 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -63, 102 )
	bg:setTopBottom( true, false, -46, 199 )
	bg:setAlpha( 0 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_fuse_dlc" ) )
	self:addElement( bg )
	self.bg = bg
	
	local FuseWidgetCastle = CoD.FuseWidget_Castle.new( menu, controller )
	FuseWidgetCastle:setLeftRight( true, false, 4.5, 60.5 )
	FuseWidgetCastle:setTopBottom( true, false, 21, 140 )
	FuseWidgetCastle:setScale( 0.95 )
	self:addElement( FuseWidgetCastle )
	self.FuseWidgetCastle = FuseWidgetCastle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				FuseWidgetCastle:completeAnimation()
				self.FuseWidgetCastle:setAlpha( 0 )
				self.clipFinished( FuseWidgetCastle, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				FuseWidgetCastle:completeAnimation()
				self.FuseWidgetCastle:setLeftRight( true, false, -24.5, 31.5 )
				self.FuseWidgetCastle:setTopBottom( true, false, 21, 140 )
				self.FuseWidgetCastle:setAlpha( 1 )
				self.clipFinished( FuseWidgetCastle, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				FuseWidgetCastle:completeAnimation()
				self.FuseWidgetCastle:setAlpha( 1 )
				self.clipFinished( FuseWidgetCastle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowSprayerWidget( controller )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_sprayer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_sprayer"
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
		element.FuseWidgetCastle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
