-- b4eed7bd4687a8ee8910ba601282494d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIconItem" )
require( "ui.uieditor.widgets.EndGameFlow.OutcomeFactionIconItemForCodCaster" )

CoD.OutcomeFactionIcon = InheritFrom( LUI.UIElement )
CoD.OutcomeFactionIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.OutcomeFactionIcon )
	self.id = "OutcomeFactionIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 390 )
	self:setTopBottom( true, false, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local OutcomeFactionIconItem = CoD.OutcomeFactionIconItem.new( menu, controller )
	OutcomeFactionIconItem:setLeftRight( true, false, 0, 152.46 )
	OutcomeFactionIconItem:setTopBottom( true, false, 5, 144.56 )
	self:addElement( OutcomeFactionIconItem )
	self.OutcomeFactionIconItem = OutcomeFactionIconItem
	
	local OutcomeFactionIconItemForCodCaster = CoD.OutcomeFactionIconItemForCodCaster.new( menu, controller )
	OutcomeFactionIconItemForCodCaster:setLeftRight( true, false, -69.54, 152.46 )
	OutcomeFactionIconItemForCodCaster:setTopBottom( true, false, 5, 145 )
	OutcomeFactionIconItemForCodCaster:setAlpha( 0 )
	self:addElement( OutcomeFactionIconItemForCodCaster )
	self.OutcomeFactionIconItemForCodCaster = OutcomeFactionIconItemForCodCaster
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				OutcomeFactionIconItem:completeAnimation()
				self.OutcomeFactionIconItem:setAlpha( 1 )
				self.clipFinished( OutcomeFactionIconItem, {} )

				OutcomeFactionIconItemForCodCaster:completeAnimation()
				self.OutcomeFactionIconItemForCodCaster:setAlpha( 0 )
				self.clipFinished( OutcomeFactionIconItemForCodCaster, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				OutcomeFactionIconItem:completeAnimation()
				self.OutcomeFactionIconItem:setAlpha( 0 )
				self.clipFinished( OutcomeFactionIconItem, {} )

				OutcomeFactionIconItemForCodCaster:completeAnimation()
				self.OutcomeFactionIconItemForCodCaster:setAlpha( 1 )
				self.clipFinished( OutcomeFactionIconItemForCodCaster, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OutcomeFactionIconItem:close()
		element.OutcomeFactionIconItemForCodCaster:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
