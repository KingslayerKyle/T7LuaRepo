-- eda831cb66b84102b95cd4a793170489
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRTInt" )
require( "ui.uieditor.widgets.CodCaster.CodCasterKillcamWidgetPnlRT" )

CoD.KillcamWidgetPnlRT = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetPnlRT.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetPnlRT )
	self.id = "KillcamWidgetPnlRT"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 80 )
	
	local KillcamWidgetPnlRTInt0 = CoD.KillcamWidgetPnlRTInt.new( menu, controller )
	KillcamWidgetPnlRTInt0:setLeftRight( true, true, 0, 0 )
	KillcamWidgetPnlRTInt0:setTopBottom( false, false, -40, 40 )
	KillcamWidgetPnlRTInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	KillcamWidgetPnlRTInt0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( KillcamWidgetPnlRTInt0 )
	self.KillcamWidgetPnlRTInt0 = KillcamWidgetPnlRTInt0
	
	local CodCasterKillcamWidgetPnlRT = CoD.CodCasterKillcamWidgetPnlRT.new( menu, controller )
	CodCasterKillcamWidgetPnlRT:setLeftRight( true, true, 0, 0 )
	CodCasterKillcamWidgetPnlRT:setTopBottom( true, true, 0, 0 )
	self:addElement( CodCasterKillcamWidgetPnlRT )
	self.CodCasterKillcamWidgetPnlRT = CodCasterKillcamWidgetPnlRT
	
	local FactionColorBar = LUI.UIImage.new()
	FactionColorBar:setLeftRight( true, true, 36, -30 )
	FactionColorBar:setTopBottom( false, false, -40, -35 )
	FactionColorBar:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	self:addElement( FactionColorBar )
	self.FactionColorBar = FactionColorBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CodCasterKillcamWidgetPnlRT:completeAnimation()
				self.CodCasterKillcamWidgetPnlRT:setAlpha( 0 )
				self.clipFinished( CodCasterKillcamWidgetPnlRT, {} )

				FactionColorBar:completeAnimation()
				self.FactionColorBar:setAlpha( 0 )
				self.clipFinished( FactionColorBar, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CodCasterKillcamWidgetPnlRT:completeAnimation()
				self.CodCasterKillcamWidgetPnlRT:setAlpha( 1 )
				self.clipFinished( CodCasterKillcamWidgetPnlRT, {} )

				FactionColorBar:completeAnimation()
				self.FactionColorBar:setAlpha( 1 )
				self.clipFinished( FactionColorBar, {} )
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
		element.KillcamWidgetPnlRTInt0:close()
		element.CodCasterKillcamWidgetPnlRT:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

