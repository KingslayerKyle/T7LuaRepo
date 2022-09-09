-- 75e4c7b676a80baa02d6db0e7b053aff
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Console.Console" )
require( "ui.uieditor.widgets.HUD.safeframe_playercard" )

CoD.T7Hud_SafeAreaContainer_Front = InheritFrom( LUI.UIElement )
CoD.T7Hud_SafeAreaContainer_Front.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T7Hud_SafeAreaContainer_Front )
	self.id = "T7Hud_SafeAreaContainer_Front"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Console = CoD.Console.new( menu, controller )
	Console:setLeftRight( true, false, 39, 809 )
	Console:setTopBottom( false, true, -326, -186 )
	Console:setXRot( 15 )
	Console:setYRot( 40 )
	self:addElement( Console )
	self.Console = Console
	
	local safeframeplayercard = CoD.safeframe_playercard.new( menu, controller )
	safeframeplayercard:setLeftRight( true, true, 0, 0 )
	safeframeplayercard:setTopBottom( true, true, 0, 0 )
	safeframeplayercard:setAlpha( 0.9 )
	self:addElement( safeframeplayercard )
	self.safeframeplayercard = safeframeplayercard
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Console:completeAnimation()
				self.Console:setAlpha( 1 )
				self.clipFinished( Console, {} )
			end
		},
		MPSplitscreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Console:completeAnimation()
				self.Console:setAlpha( 0 )
				self.clipFinished( Console, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "MPSplitscreen",
			condition = function ( menu, element, event )
				return IsMultiplayer() and IsSplitscreenAndInGame( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Console:close()
		element.safeframeplayercard:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
