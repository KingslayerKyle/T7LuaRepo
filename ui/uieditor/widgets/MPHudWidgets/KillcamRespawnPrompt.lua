-- b73d155881561bfb909e78ab029825da
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.KillcamRespawnPrompt = InheritFrom( LUI.UIElement )
CoD.KillcamRespawnPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KillcamRespawnPrompt )
	self.id = "KillcamRespawnPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 342 )
	self:setTopBottom( true, false, 0, 30 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local RespawnPrompt = LUI.UIText.new()
	RespawnPrompt:setLeftRight( false, false, -171, 171 )
	RespawnPrompt:setTopBottom( true, false, 0, 30 )
	RespawnPrompt:setText( Engine.Localize( "PLATFORM_PRESS_TO_RESPAWN" ) )
	RespawnPrompt:setTTF( "fonts/default.ttf" )
	RespawnPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RespawnPrompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( RespawnPrompt, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 4 )
	end )
	self:addElement( RespawnPrompt )
	self.RespawnPrompt = RespawnPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				RespawnPrompt:completeAnimation()
				self.RespawnPrompt:setAlpha( 1 )
				self.clipFinished( RespawnPrompt, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )

				RespawnPrompt:completeAnimation()
				self.RespawnPrompt:setAlpha( 0 )
				self.clipFinished( RespawnPrompt, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f5_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f5_local0 then
					f5_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
				end
				return f5_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

