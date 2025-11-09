require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_Internal" )

CoD.SpikeLauncherSpikeCounter = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherSpikeCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherSpikeCounter )
	self.id = "SpikeLauncherSpikeCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.SpikeLuancherSpikeCounter_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 0, 400, 400 )
	internal:setUI3DWindow( 0 )
	internal:subscribeToGlobalModel( controller, "PerController", "spikeLauncherCounter", function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

