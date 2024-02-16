-- 2eb005587e2e89d2649a86a6377f90ea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPack" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffInGame" )

CoD.BubbleGumPackInGame = InheritFrom( LUI.UIElement )
CoD.BubbleGumPackInGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumPackInGame )
	self.id = "BubbleGumPackInGame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 368 )
	self:setTopBottom( true, false, 0, 149 )
	self.anyChildUsesUpdateState = true
	
	local BubbleGumPack = CoD.BubbleGumPack.new( menu, controller )
	BubbleGumPack:setLeftRight( true, false, 0, 368 )
	BubbleGumPack:setTopBottom( true, false, 0, 149 )
	BubbleGumPack.BubbleGumBuffs:setWidgetType( CoD.BubbleGumBuffInGame )
	BubbleGumPack:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BubbleGumPack )
	self.BubbleGumPack = BubbleGumPack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BubbleGumPack:completeAnimation()
				self.BubbleGumPack:setAlpha( 0 )
				self.clipFinished( BubbleGumPack, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BubbleGumPack:completeAnimation()
				self.BubbleGumPack:setAlpha( 1 )
				self.clipFinished( BubbleGumPack, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
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
	BubbleGumPack.id = "BubbleGumPack"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumPack:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
