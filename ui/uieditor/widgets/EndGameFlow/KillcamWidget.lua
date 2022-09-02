-- ccc1f09f7cd6e8372350f919ae5e53e8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Killcam.KillcamHeader" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamPlayerInfo" )

CoD.KillcamWidget = InheritFrom( LUI.UIElement )
CoD.KillcamWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidget )
	self.id = "KillcamWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Header = CoD.KillcamHeader.new( menu, controller )
	Header:setLeftRight( true, true, 0, 0 )
	Header:setTopBottom( true, false, 0, 121 )
	self:addElement( Header )
	self.Header = Header
	
	local KillcamPlayerInfo = CoD.KillcamPlayerInfo.new( menu, controller )
	KillcamPlayerInfo:setLeftRight( false, false, -640, 640 )
	KillcamPlayerInfo:setTopBottom( false, true, -92, -36 )
	self:addElement( KillcamPlayerInfo )
	self.KillcamPlayerInfo = KillcamPlayerInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Header:completeAnimation()
				self.Header:setAlpha( 0 )
				self.clipFinished( Header, {} )

				KillcamPlayerInfo:completeAnimation()
				self.KillcamPlayerInfo:setAlpha( 0 )
				self.clipFinished( KillcamPlayerInfo, {} )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )

				KillcamPlayerInfo:completeAnimation()
				self.KillcamPlayerInfo:setAlpha( 1 )
				self.clipFinished( KillcamPlayerInfo, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f4_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) then
					f4_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
					if f4_local0 then
						if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
							f4_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
						else
							f4_local0 = false
						end
					end
				elseif not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
					f4_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
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
	Header.id = "Header"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Header:close()
		element.KillcamPlayerInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

